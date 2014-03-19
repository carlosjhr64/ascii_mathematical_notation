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
USERSPACE = USER_SPACE::UserSpace.new( {
  :appname  => 'ascii_mathematical_notation',
  :xdgbases => ['DATA'] } )
USERSPACE.install unless USERSPACE.version == ASCII_MATHEMATICAL_NOTATION::VERSION

extend ASCII_MATHEMATICAL_NOTATION::Methods
def_load # We start with the default definitions file loaded!
