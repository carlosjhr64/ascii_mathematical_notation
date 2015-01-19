# Standard Library
require 'digest/rmd160'
require 'yaml'

# Gems
require 'user_space'

# This Gem
require_relative 'ascii_mathematical_notation/version.rb'
USERSPACE = UserSpace.new( {
  :appname  => 'ascii_mathematical_notation',
  :xdgbases => ['DATA'] } )
USERSPACE.install unless USERSPACE.version == AsciiMathematicalNotation::VERSION
require_relative 'ascii_mathematical_notation/ascii_mathematical_notation.rb'
require_relative 'ascii_mathematical_notation/line.rb'
require_relative 'ascii_mathematical_notation/current_line.rb'
require_relative 'ascii_mathematical_notation/methods.rb'

extend AsciiMathematicalNotation::Methods
load # We start with the default definitions file loaded!

# Requires:
#`ruby`
#`vim`

