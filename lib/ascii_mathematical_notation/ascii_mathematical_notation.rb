module ASCII_MATHEMATICAL_NOTATION
  def self.filename(key)
    File.join(XDG['CACHE'].to_s, key.to_s)+'.json'
  end
  VIMDEF      ||= ASCII_MATHEMATICAL_NOTATION.filename('definitions')
  DEFINITIONS ||= {}
  ARRAYS      ||= {}
end
