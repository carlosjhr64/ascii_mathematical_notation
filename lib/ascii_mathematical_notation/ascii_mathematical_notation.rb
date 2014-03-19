module ASCII_MATHEMATICAL_NOTATION
  def self.filename(key)
    File.join(USERSPACE.datadir, key.to_s)+'.json'
  end
  def self.definitions
    ASCII_MATHEMATICAL_NOTATION.filename(:definitions)
  end
  DEFINITIONS ||= {}
  ARRAYS      ||= {}
end
