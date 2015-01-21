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
