# encoding: utf-8
require 'digest/rmd160'

class String
  def indentation
    /^\s*/.match(self)[0]
  end

  def comment!(c)
    self << " # #{c}"
  end

  def uncomment!
    self.sub!(/\s*#.*$/, '')
  end

  def transform!(map, p='')
    map.each do |pat, sub|
      rgx = Regexp.new(p+pat+p)
      self.gsub!(rgx, sub)
    end
    self
  end
end

GREEK = [
  ['Epsilon', 'ε'],
  ['Omicron', 'ο'],
  ['Upsilon', 'υ'],
  ['Alpha',   'α'],
  ['Gamma',   'γ'],
  ['Delta',   'δ'],
  ['Theta',   'θ'],
  ['Lamba',   'λ'],
  ['Sigma',   'σ'],
  ['Omega',   'ω'],
  ['Beta',    'β'],
  ['Zeta',    'ζ'],
  ['Iota',    'ι'],
  ['Kapa',    'κ'],
  ['Eta',     'η'],
  ['Rho',     'ρ'],
  ['Tau',     'τ'],
  ['Phi',     'φ'],
  ['Chi',     'χ'],
  ['Psi',     'ψ'],
  ['Mu',      'μ'],
  ['Nu',      'ν'],
  ['Xi',      'ξ'],
  ['Pi',      'π'],
  ['EPSILON', 'Ε'],
  ['OMICRON', 'Ο'],
  ['UPSILON', 'Υ'],
  ['ALPHA',   'Α'],
  ['GAMMA',   'Γ'],
  ['DELTA',   'Δ'],
  ['THETA',   'Θ'],
  ['KAPPA',   'Κ'],
  ['LAMBA',   'Λ'],
  ['SIGMA',   'Σ'],
  ['OMEGA',   'Ω'],
  ['BETA',    'Β'],
  ['ZETA',    'Ζ'],
  ['IOTA',    'Ι'],
  ['ETA',     'Η'],
  ['RHO',     'Ρ'],
  ['TAU',     'Τ'],
  ['PHI',     'Φ'],
  ['CHI',     'Χ'],
  ['PSI',     'Ψ'],
  ['MU',      'Μ'],
  ['NU',      'Ν'],
  ['XI',      'Ξ'],
  ['PI',      'Π'],
].sort{|a,b| b[0]<=>a[0]}.map{|pat, sub| [pat, sub]}

def greek(p='(:|\b)')
  n    = $curbuf.line_number
  line = String.new($curbuf[n])
  line.transform!(GREEK,p)
  $curbuf.append(n, line)
end

A2X = [
  # a1,a2,a3 -> a,b,c
  ['a1','x'],
  ['a2','y'],
  ['a3','z'],
  # b1,b2,b3 -> u,v,w
  ['b1','u'],
  ['b2','v'],
  ['b3','w'],
  # c1,c2,c3 -> r,s,t
  ['c1','r'],
  ['c2','s'],
  ['c3','t'],
  # d1,d2,d3 -> r,s,t
  ['d1','o'],
  ['d2','p'],
  ['d3','q'],
  # e1,e2,e3 -> r,s,t
  ['e1','l'],
  ['e2','m'],
  ['e3','n'],
  # f1,f2,f3 -> j,k,l
  ['f1','i'],
  ['f2','j'],
  ['f3','k'],
]

def a2x
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.transform!(A2X)
  line.comment!('a2x')
  $curbuf.append(n, line)
end

def x2a
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.transform!(A2X.map{|a,b| [b,a]})
  line.comment!('x2a')
  $curbuf.append(n, line)
end

DEFINE = {}
BY = DEFINE

def by(key)
  pat, sub = BY[key]
  rgx = Regexp.new(pat)
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.gsub!(rgx, sub)
  line.comment!("by :#{key}")
  $curbuf.append(n, line)
end

def define(key, pat, sub)
  DEFINE[key] = [pat, sub]
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line = line.indentation.chop
  line.comment!(":#{key} #{pat} -> #{sub}")
  $curbuf.append(n, line)
end

def wolframize
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  line.gsub!(/\s+/,'')
  line.gsub!(/\)\(/, ')*(')
  line.gsub!(/([a-z]\d*)([a-z])/, '\1*\2')
  line.gsub!(/([a-z]\d*)([a-z])/, '\1*\2')
  line.comment!('wolframized')
  $curbuf.append(n, indentation+line)
end

def digest
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  indentation = line.indentation
  d = Digest::RMD160.base64digest(line.strip)
  $curbuf.append(n, indentation+"# #{d}")
end
