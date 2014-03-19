module ASCII_MATHEMATICAL_NOTATION
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
end
