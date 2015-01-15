module AsciiMathematicalNotation
  def self.filename(key)
    File.join(USERSPACE.datadir, key.to_s)+'.yml'
  end
  def self.definitions
    AsciiMathematicalNotation.filename(:definitions)
  end
  DEFINITIONS ||= {}
  ARRAYS      ||= {}
end
