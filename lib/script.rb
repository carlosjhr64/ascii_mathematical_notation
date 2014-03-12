# encoding: utf-8
require 'digest/rmd160'
require 'json'

class String
  def indentation
    /^\s*/.match(self)[0]
  end

  def comment!(c=caller[0][/`.*'/][1..-2])
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

# This allows one to reload the script
# without definition complaints.
GREEK ||= Array.new
n = 0
GREEK[n] = ['Epsilon', 'ε']; n+=1
GREEK[n] = ['Omicron', 'ο']; n+=1
GREEK[n] = ['Upsilon', 'υ']; n+=1
GREEK[n] = ['Alpha',   'α']; n+=1
GREEK[n] = ['Gamma',   'γ']; n+=1
GREEK[n] = ['Delta',   'δ']; n+=1
GREEK[n] = ['Theta',   'θ']; n+=1
GREEK[n] = ['Lamba',   'λ']; n+=1
GREEK[n] = ['Sigma',   'σ']; n+=1
GREEK[n] = ['Omega',   'ω']; n+=1
GREEK[n] = ['Beta',    'β']; n+=1
GREEK[n] = ['Zeta',    'ζ']; n+=1
GREEK[n] = ['Iota',    'ι']; n+=1
GREEK[n] = ['Kapa',    'κ']; n+=1
GREEK[n] = ['Eta',     'η']; n+=1
GREEK[n] = ['Rho',     'ρ']; n+=1
GREEK[n] = ['Tau',     'τ']; n+=1
GREEK[n] = ['Phi',     'φ']; n+=1
GREEK[n] = ['Chi',     'χ']; n+=1
GREEK[n] = ['Psi',     'ψ']; n+=1
GREEK[n] = ['Mu',      'μ']; n+=1
GREEK[n] = ['Nu',      'ν']; n+=1
GREEK[n] = ['Xi',      'ξ']; n+=1
GREEK[n] = ['Pi',      'π']; n+=1
GREEK[n] = ['EPSILON', 'Ε']; n+=1
GREEK[n] = ['OMICRON', 'Ο']; n+=1
GREEK[n] = ['UPSILON', 'Υ']; n+=1
GREEK[n] = ['ALPHA',   'Α']; n+=1
GREEK[n] = ['GAMMA',   'Γ']; n+=1
GREEK[n] = ['DELTA',   'Δ']; n+=1
GREEK[n] = ['THETA',   'Θ']; n+=1
GREEK[n] = ['KAPPA',   'Κ']; n+=1
GREEK[n] = ['LAMBA',   'Λ']; n+=1
GREEK[n] = ['SIGMA',   'Σ']; n+=1
GREEK[n] = ['OMEGA',   'Ω']; n+=1
GREEK[n] = ['BETA',    'Β']; n+=1
GREEK[n] = ['ZETA',    'Ζ']; n+=1
GREEK[n] = ['IOTA',    'Ι']; n+=1
GREEK[n] = ['ETA',     'Η']; n+=1
GREEK[n] = ['RHO',     'Ρ']; n+=1
GREEK[n] = ['TAU',     'Τ']; n+=1
GREEK[n] = ['PHI',     'Φ']; n+=1
GREEK[n] = ['CHI',     'Χ']; n+=1
GREEK[n] = ['PSI',     'Ψ']; n+=1
GREEK[n] = ['MU',      'Μ']; n+=1
GREEK[n] = ['NU',      'Ν']; n+=1
GREEK[n] = ['XI',      'Ξ']; n+=1
GREEK[n] = ['PI',      'Π']; n+=1

def greek(p='([:"]|\b)')
  n    = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.transform!(GREEK,p)
  line.comment!
  $curbuf.append(n, line)
end

A3X ||= Array.new
n = 0
# a1,a2,a3 -> a,b,c
A3X[n] = ['a1','x']; n+=1
A3X[n] = ['a2','y']; n+=1
A3X[n] = ['a3','z']; n+=1
# b1,b2,b3 -> u,v,w
A3X[n] = ['b1','u']; n+=1
A3X[n] = ['b2','v']; n+=1
A3X[n] = ['b3','w']; n+=1
# c1,c2,c3 -> r,s,t
A3X[n] = ['c1','r']; n+=1
A3X[n] = ['c2','s']; n+=1
A3X[n] = ['c3','t']; n+=1
# d1,d2,d3 -> r,s,t
A3X[n] = ['d1','o']; n+=1
A3X[n] = ['d2','p']; n+=1
A3X[n] = ['d3','q']; n+=1
# e1,e2,e3 -> r,s,t
A3X[n] = ['e1','l']; n+=1
A3X[n] = ['e2','m']; n+=1
A3X[n] = ['e3','n']; n+=1
# f1,f2,f3 -> j,k,l
A3X[n] = ['f1','i']; n+=1
A3X[n] = ['f2','j']; n+=1
A3X[n] = ['f3','k']; n+=1

def a3x
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.transform!(A3X)
  line.comment!
  $curbuf.append(n, line)
end

def x3a
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  line.transform!(A3X.map{|a,b| [b,a]})
  line.comment!
  $curbuf.append(n, line)
end

DEFINE ||= {}
VIMDEF ||= File.join(ENV['HOME'], '.vimdef')

def save
  File.open(VIMDEF, 'w'){|f| f.puts DEFINE.to_json}
end

def read
  JSON.parse(File.read(VIMDEF)).each{|k,v| DEFINE[k.to_sym]=v}
end

def by(key)
  pat, sub = DEFINE[key]
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
  line.comment!
  $curbuf.append(n, indentation+line)
end

def digest
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  indentation = line.indentation
  d = Digest::RMD160.base64digest(line.strip)
  $curbuf.append(n, indentation+"# #{d}")
end

def cl
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  line = line.split(/\s+/).map{|w| w[1..-1]+w[0]}.join(' ')
  line.comment!
  $curbuf.append(n, indentation+line)
end

def cr
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  line = line.split(/\s+/).map{|w| w[-1]+w[0..-2]}.join(' ')
  line.comment!
  $curbuf.append(n, indentation+line)
end

def list
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  $curbuf.append(n, indentation+'# list')
  n+=1
  line = line.split(/\s+/).each do |word|
    $curbuf.append(n, indentation+word)
    n+=1
  end
end

def wsort
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  line = line.split(/\s+/).sort.join(' ')
  line.comment!
  $curbuf.append(n, indentation+line)
end

def csort
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  line = line.split(/\s+/).map{|w| w.chars.sort.join }.join(' ')
  line.comment!
  $curbuf.append(n, indentation+line)
end

def tr(set1, set2)
  n = $curbuf.line_number
  line = String.new($curbuf[n])
  line.uncomment!
  indentation = line.indentation
  line.strip!
  0.upto(line.length-1) do |n|
    c = line[n]
    if i=set1.index(c)
      if b = set2[i]
        line[n] = b
       else
        line[n] = ' '
      end
    end
  end
  line.comment!("tr #{set1} #{set2}")
  $curbuf.append(n, indentation+line)
end
