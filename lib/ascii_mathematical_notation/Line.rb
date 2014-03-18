require 'digest/rmd160'
require 'json'

require 'user_space'

module ASCII_MATHEMATICAL_NOTATION
  class Line < String
    def initialize(*args)
      super(*args)
    end

    def grgx!(pat, sub)
      rgx = Regexp.new(pat)
      self.gsub!(rgx, sub)
    end

    def transform!(map1, map2)
      case map1
      when Array
        case map1.first
        when Array  then map1.each{|pat, sub| grgx!(pat, sub)}
        when String then grgx!(*map1)
        else
          raise "Don't know how to tr array of #{map1.class}."
        end
      when String
        raise "incomplete mapping" unless map1.length==map2.length
        0.upto(self.length-1) do |n|
          c = self[n]
          if i=map1.index(c)
            self[n] = map2[i]
          end
        end
      else
        raise "Don't know how to tr #{map1.class}."
      end
      self
    end
  end

  class CurrentLine
    def append(line='')
      $curbuf.append(@line_number, @indentation+line+@comment)
      @line_number += 1
      @comment = ''
    end

    def initialize(comment=caller[1][/`.*'/][1..-2])
      @comment     = (comment)? '# ' + comment : ''
      @line_number = $curbuf.line_number
  
      line1       = Line.new($curbuf[@line_number])
      @indentation = /^\s*/.match(line1)[0]

      if block_given?
        line1.sub!(/#.*$/, '')
        line1.strip!
        line2  = yield(line1)
        case line2
        when Array
          append('') # Top Comment Line
          line2.each{|line| append(line)}
        when Line, String
          append(line2)
        else
          raise 'Did not get a Line'
        end
      end
    end
  end

  def self.filename(key)
    File.join(DATADIR, key.to_s)+'.json'
  end
  DATADIR     ||= './data' # TODO
  VIMDEF      ||= ASCII_MATHEMATICAL_NOTATION.filename('definitions')
  DEFINITIONS ||= {}
  ARRAYS      ||= {}

  module Methods
    def read(fn=VIMDEF)
      if File.exist?(fn)
         # TODO allow overwritting?
        JSON.parse(File.read(fn)).each{|k,v| DEFINITIONS[k.to_sym]=v}
      else
        raise "Does not exist: #{fn}"
      end
    end

    def save(f=VIMDEF)
      raise "Empty definitions" if DEFINITIONS.empty?
      File.open(f, 'w'){|fh| fh.puts JSON.pretty_generate(DEFINITIONS)}
    end

    def tr(map1, map2='')
      comment = nil
      if map1.class == Symbol
        comment = map1.to_s
        unless array = DEFINITIONS[map1] or array = ARRAYS[map1]
          fn = ASCII_MATHEMATICAL_NOTATION.filename(map1)
          raise "#{map1} not found." unless File.exist?(fn)
          array = JSON.parse File.read fn
          DEFINITIONS[map1] = array
        end
        map1 = array
      else
        comment = "tr '#{map1}' '#{map2}'"
      end
      CurrentLine.new(comment){|line| line.transform!(map1, map2)}
    end

    def define(key=nil, pat=nil, sub=nil)
      dummy='#'; nope=nil
      if key.nil? and pat.nil? and sub.nil?
        dummy, key, pat, sub, nope = _line.strip.split(/\s+/)
      end
      raise "Need key, pat, and sub" unless key and pat and sub and !nope and dummy=='#'
      DEFINITIONS[key.to_sym] = [pat, sub]
      CurrentLine.new("define(:#{key}, '#{pat}', '#{sub}')").append
    end
    def undefine(key)
      DEFINITIONS.delete(key)
      CurrentLine.new("undefine(:#{key})").append
    end

    def define_array(key, *keys)
      raise "Array size must be more than just 2!" unless keys.length > 2
      raise "Array name and components must be Symbols." if [key,*keys].detect{|k| k.class!=Symbol}
      keys.each{|k| raise "#{k} not defined." unless DEFINITIONS[k]}
      fn = ASCII_MATHEMATICAL_NOTATION.filename(key)
      raise "Array #{key} exists!" if File.exist?(fn)
      array = keys.inject([]){|a,k| a << DEFINITIONS[k]}
      File.open(fn,'w'){|fh| fh.puts JSON.pretty_generate(array)}
      ARRAYS[k] = array
      CurrentLine.new("define_array(:#{key}, :#{keys.join(', :')})").append
    end
    def undefine_array(key)
      ARRAYS.delete(key)
      CurrentLine.new("undefine_array(:#{key})").append
    end

    def digest
      CurrentLine.new{|line| Digest::RMD160.base64digest(line)}
    end

    def wsort(s=/\s+/)
      CurrentLine.new{|line| line.split(s).sort.join(' ')}
    end

    def csort(type=/^\w/)
      CurrentLine.new{|line|
        line.split(/\b/).map{|word| (word=~type)? word.chars.sort.join : word }.join
      }
    end

    def method_missing(m, *args)
      CurrentLine.new("#{m}('#{args.join("', '")}')") do |line|
        raise "method missing: #{m}" unless line.respond_to?(m)
        line.method(m).call(*args)
      end
    end
  end
end
extend ASCII_MATHEMATICAL_NOTATION::Methods
read # We start with the default definitions file loaded!
