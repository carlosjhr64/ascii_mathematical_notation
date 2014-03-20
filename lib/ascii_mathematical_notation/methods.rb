module ASCII_MATHEMATICAL_NOTATION
  module Methods
    def load(fn=ASCII_MATHEMATICAL_NOTATION.definitions)
      if File.exist?(fn)
        JSON.parse(File.read(fn)).each{|k,v| DEFINITIONS[k.to_sym]=v}
      else
        raise "Does not exist: #{fn}"
      end
    end

    def dump(fn=ASCII_MATHEMATICAL_NOTATION.definitions)
      raise "Empty definitions" if DEFINITIONS.empty?
      File.open(fn, 'w'){|fh| fh.puts JSON.pretty_generate(DEFINITIONS)}
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
        if map1.class == String
          comment = "tr '#{map1}' '#{map2}'"
        else
          comment = "tr #{map1}"
        end
      end
      CurrentLine.new(comment){|line| line.transform!(map1, map2)}
    end

    def define(sep=/\s+/)
      CurrentLine.new do |line|
        key, pat, sub, nope = line.split(sep).map{|s| s.strip}
        raise "Need key, pat, and sub" unless key and pat and sub and !nope
        DEFINITIONS[key.to_sym] = [pat, sub]
        "#{key.to_s}: #{pat} --> #{sub}"
      end
    end

    def show(key)
      CurrentLine.new do
        a,b = DEFINITIONS[key]
        raise "#{key} not defined." unless a and b
        "#{key}: #{a} --> #{b}"
      end
    end

    def define_array(key, *keys)
      raise "Array size must be more than just 2!" unless keys.length > 2
      raise "Array name and components must be Symbols." if [key,*keys].detect{|k| k.class!=Symbol}
      keys.each{|k| raise "#{k} not defined." unless DEFINITIONS[k]}
      fn = ASCII_MATHEMATICAL_NOTATION.filename(key)
      #raise "Array #{key} file exists!" if File.exist?(fn)
      raise "#{fn} file exists!" if File.exist?(fn)
      array = keys.inject([]) do |a,k|
        b = DEFINITIONS[k]
        case b.first
        when String then a<<b
        when Array then b.each{|c| a<<c}
        else
          raise "Don't know how to add #{k} to the array."
        end
        a
      end
      File.open(fn,'w'){|fh| fh.puts JSON.pretty_generate(array)}
      ARRAYS[key] = array
      CurrentLine.new("define_array(:#{key}, :#{keys.join(', :')})").append
    end

    def digest
      CurrentLine.new{|line| Digest::RMD160.base64digest(line)}
    end

    def wsort(p=/\s+/, s=' ')
      CurrentLine.new{|line| line.split(p).sort.join(s)}
    end

    def tsort(p=/\s+/, s=' ')
      # rruvxx+rsuvxy+rsvvxx+ssvvxy-rruuxy-rsuuyy-rsuvxy-ssuvyy+rsuuxx+ssuuxy+ ...
      CurrentLine.new do |line|
        if md = /\(((\s*[+\-]?\s*\w+)+)\)/.match(line)
          terms = md[1].gsub(/([+\-]?)\s*(\w+)/){|m|  ($1=='')? $2+'+ ' : $2+$1+' '}
          terms = terms.strip.split(/\s+/).sort.map{|w| w[-1]+w[0..-2]}.join
          line = md.pre_match+'('+terms+')'+md.post_match
        end
        line
      end
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
