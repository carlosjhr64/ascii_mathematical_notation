# Standard Library
require 'digest/rmd160'
require 'yaml'
require 'prime'

# Gems
require 'user_space'

# This Gem
require_relative 'ascii_mathematical_notation/version.rb'
require_relative 'ascii_mathematical_notation/ascii_mathematical_notation.rb'
require_relative 'ascii_mathematical_notation/line.rb'
require_relative 'ascii_mathematical_notation/current_line.rb'
require_relative 'ascii_mathematical_notation/methods.rb'

extend AsciiMathematicalNotation::Methods
load # We start with the default definitions file loaded!

# Requires:
#`ruby`
#`vim`

