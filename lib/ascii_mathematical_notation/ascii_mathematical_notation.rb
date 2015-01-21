module AsciiMathematicalNotation

  ENCODING = 'ASCII-8BIT' # Vim is not UTF-8
  DEFINITIONS ||= {}
  ARRAYS      ||= {}

  def self.filename(key)
    File.join(USERSPACE.datadir, key.to_s)+'.yml'
  end

  def self.definitions
    AsciiMathematicalNotation.filename(:definitions)
  end

end

USERSPACE = UserSpace.new( {
  :appname  => 'ascii_mathematical_notation',
  :xdgbases => ['DATA'] } )
unless USERSPACE.version == AsciiMathematicalNotation::VERSION
  _=AsciiMathematicalNotation.definitions
  File.rename(_,_+'.bak') if File.exist?(_)
  USERSPACE.install
end

BINDING = binding()
