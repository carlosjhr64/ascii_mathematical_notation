module AsciiMathematicalNotation
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
end
