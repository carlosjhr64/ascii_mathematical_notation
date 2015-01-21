module AsciiMathematicalNotation
  module Methods

    def load(fn=AsciiMathematicalNotation.definitions)
      fn = File.expand_path fn
      if File.exist?(fn)
        YAML.load(File.read(fn)).each{|k,v| DEFINITIONS[k.to_sym]=v}
      else
        raise "Does not exist: #{fn}"
      end
      print "load: #{fn.sub(ENV['HOME'],'~')}"
    end

    def dump(fn=AsciiMathematicalNotation.definitions)
      raise "Empty definitions" if DEFINITIONS.empty?
      fn = File.expand_path fn
      File.open(fn, 'w'){|fh| fh.puts YAML.dump(DEFINITIONS)}
      print "dump: #{fn.sub(ENV['HOME'],'~')}"
    end

    def define(sep=/\s+/)
      CurrentLine.new do |line|
        key, pat, sub, nope = line.split(sep).map{|s| s.strip}
        raise "Need key, pat, and sub" unless key and pat and sub and !nope
        DEFINITIONS[key.to_sym] = [pat, sub]
        "#{key.to_s} #{pat} #{sub}"
      end
    end

    def show(key)
      CurrentLine.new do
        a,b = DEFINITIONS[key]
        raise "#{key} not defined." unless a and b
        "#{key} #{a} #{b}"
      end
    end

    def define_array(key, *keys)
      raise "Array size must be more than just 2!" unless keys.length > 2
      raise "Array name and components must be Symbols." if [key,*keys].detect{|k| k.class!=Symbol}
      keys.each{|k| raise "#{k} not defined." unless DEFINITIONS[k]}
      fn = AsciiMathematicalNotation.filename(key)
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
      File.open(fn,'w'){|fh| fh.puts YAML.dump(array)}
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

    def rational
      pat = '(G|D)/(G|SD)'
      pat.gsub!(/G/, '\(SD(OD)*\)')
      pat.gsub!(/S/, '[+\-]?')
      pat.gsub!(/O/, '[+\-*]')
      pat.gsub!(/D/, '\d+')
      rx = Regexp.new pat
      CurrentLine.new do |line|
        post_match, line = line, ''
        while md=rx.match(post_match)
          line << md.pre_match
          rational = eval("Rational #{md[0].sub(/\//,',')}")
          line << "(#{rational})"
          post_match = md.post_match
        end
        line << post_match
        line
      end
    end

    def compute
      expression = '((BSD)|(R))(O((R)|(DF)))+'
      rational   = 'R'
      [expression,rational].each do |pat|
        pat.gsub!(/R/, '\((SD)/(SD)\)')
        pat.gsub!(/B/, '(?<![/])')
        pat.gsub!(/F/, '(?![/])')
        pat.gsub!(/O/, '[+\-*]')
        pat.gsub!(/S/, '[+\-]?')
        pat.gsub!(/D/, '\d+')
      end
      rx = Regexp.new expression
      rt = Regexp.new rational
      CurrentLine.new do |line|
        post_match, line = line, ''
        while md=rx.match(post_match)
          line << md.pre_match
          exp = md[0].gsub(rt, 'Rational(\1,\2)')
          line << "(#{eval(exp)})"
          post_match = md.post_match
        end
        line << post_match
        line
      end
    end

    def prime_division(m='*',p='^',o='(',c=')')
      pat = '\((SD)/(SD)\)'
      pat.gsub!(/D/, '\d+')
      pat.gsub!(/S/, '[+\-]?')
      rx = Regexp.new pat
      CurrentLine.new do |line|
        post_match, line = line, ''
        while md=rx.match(post_match)
          line << md.pre_match
          a = md[1].to_i.prime_division.map{|n,e|(e>1)? [o,n,p,e,c].join : [o,n,c].join}.join(m)
          a = '1' if a==''
          b = md[2].to_i.prime_division.map{|n,e|(e>1)? [o,n,p,e,c].join : [o,n,c].join}.join(m)
          b = '1' if b==''
          line << "((#{a})/(#{b}))"
          post_match = md.post_match
        end
        line << post_match
        line
      end
    end

    def run
      CurrentLine.new do |line|
        BINDING.eval(line).to_s
      end
    end

    def method_missing(m, *args)
      CurrentLine.new("#{m}('#{args.join("', '")}')") do |line|
        raise "method missing: #{m}" unless line.respond_to?(m)
        line.method(m).call(*args)
      end
    end

    using Line
    def tr(map1, map2='')
      comment = nil
      if map1.class == Symbol
        comment = ":#{map1}"
        unless array = DEFINITIONS[map1] or array = ARRAYS[map1]
          fn = AsciiMathematicalNotation.filename(map1)
          raise "#{map1} not found." unless File.exist?(fn)
          array = YAML.load File.read fn
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

  end
end
