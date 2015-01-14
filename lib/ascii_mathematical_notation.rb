# Standard Library
require 'digest/rmd160'
require 'json'

# Gems
require 'user_space'

# This Gem
require_relative 'ascii_mathematical_notation/version.rb'
require_relative 'ascii_mathematical_notation/ascii_mathematical_notation.rb'
require_relative 'ascii_mathematical_notation/line.rb'
require_relative 'ascii_mathematical_notation/current_line.rb'
require_relative 'ascii_mathematical_notation/methods.rb'

# OK, everything is there, now ensure installation.
USERSPACE = UserSpace.new( {
  :appname  => 'ascii_mathematical_notation',
  :xdgbases => ['DATA'] } )
USERSPACE.install unless USERSPACE.version == AsciiMathematicalNotation::VERSION

extend AsciiMathematicalNotation::Methods
load # We start with the default definitions file loaded!
