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

A2X ||= Array.new
n = 0
# a0,a1,a2,a3,a4 -> i,x,y,z,e
A2X[n] = ['a0','i']; n+=1
A2X[n] = ['a1','x']; n+=1
A2X[n] = ['a2','y']; n+=1
A2X[n] = ['a3','z']; n+=1
A2X[n] = ['a4','e']; n+=1
# b0,b1,b2,b3,b4 -> j,u,v,w,f
A2X[n] = ['b0','j']; n+=1
A2X[n] = ['b1','u']; n+=1
A2X[n] = ['b2','v']; n+=1
A2X[n] = ['b3','w']; n+=1
A2X[n] = ['b4','f']; n+=1
# c0,c1,c2,c3,c4 -> k,r,s,t,g
A2X[n] = ['c0','k']; n+=1
A2X[n] = ['c1','r']; n+=1
A2X[n] = ['c2','s']; n+=1
A2X[n] = ['c3','t']; n+=1
A2X[n] = ['c4','g']; n+=1
# d0,d1,d2,d3,d4 -> l,r,s,t,h
A2X[n] = ['d0','l']; n+=1
A2X[n] = ['d1','o']; n+=1
A2X[n] = ['d2','p']; n+=1
A2X[n] = ['d3','q']; n+=1
A2X[n] = ['d4','h']; n+=1

def _nli
  n = $curbuf.line_number
  l = String.new($curbuf[n])
  i = l.indentation
  l.uncomment!
  l.strip!
  return n,l,i
end

def _append(c)
  n,l,i = _nli
  $curbuf.append(n, i.chop.comment!(c))
end

def _wut
  n,l,i = _nli
  l, c = yield(l)
  c = caller[0][/`.*'/][1..-2] if c.nil?
  if l.class == Array
    $curbuf.append(n, i.chop.comment!(c))
    l.each{|l| n+=1; $curbuf.append(n, i+l)}
  else
    l.comment!(c)
    $curbuf.append(n, i+l)
  end
end

def tr(set1, set2='', i=false, c='tr')
  _wut do |line|
    comment = nil
    if set1.class == Array
      set1 = set1.map{|a,b| [b,a]} if i
      comment = "#{c} #{set1[0][0]}->#{set1[0][1]},..."
      line.transform!(set1,set2)
    else
      comment = "#{c}('#{set1}','#{set2}')"
      set1,set2=set2,set1 if i
      # regular tr
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
    end
    [line, comment]
  end
end

def rt(set1, set2='')
  tr(set1, set2, true, 'rt')
end

DEFINE ||= {}
VIMDEF0 ||= './script.json'
VIMDEF1 ||= File.join(ENV['HOME'], '.vim', 'script.json')

def save
  File.open(VIMDEF1, 'w'){|f| f.puts DEFINE.to_json}
end

def read
  [VIMDEF0, VIMDEF1].each do |fn|
    if File.exist?(fn)
      JSON.parse(File.read(fn)).each{|k,v| DEFINE[k.to_sym]=v}
    end
  end
end

def by(key)
  pat, sub = DEFINE[key]
  _wut do |line|
    if  pat
      rgx = Regexp.new(pat)
      line.gsub!(rgx, sub)
      [line, "by #{key}"]
    else
      [line, "Error: #{key} not defined"]
    end
  end
end

def define(key, pat, sub)
  DEFINE[key] = [pat, sub]
  _append("define(:#{key}, '#{pat}', '#{sub}')")
end

def wolframize
  _wut do |line|
    line.gsub!(/\s+/,'')
    line.gsub!(/\)\(/, ')*(')
    line.gsub!(/([a-z]\d*)([a-z])/, '\1*\2')
    line.gsub!(/([a-z]\d*)([a-z])/, '\1*\2')
    'wolframize'
  end
end

def digest
  _wut do |line|
    Digest::RMD160.base64digest(line)
  end
end

def cl
  _wut do |line|
    line.split(/\s+/).map{|w| w[1..-1]+w[0]}.join(' ')
  end
end

def cr
  _wut do |line|
    line.split(/\s+/).map{|w| w[-1]+w[0..-2]}.join(' ')
  end
end

def list
  _wut do |line|
    [line.split(/\s+/), 'list']
  end
end

def wsort
  _wut do |line|
    line.split(/\s+/).sort.join(' ')
  end
end

def csort
  _wut do |line|
    line.split(/\b/).map{|w| (w=~/^\w/)? w.chars.sort.join : w }.join
  end
end

def pm
  _wut do |line|
    line.gsub!(/\s*([+-])?\s*(\w+)\b/) do |m|
      m.gsub!(/\s+/,'')
      (m=~/^[+-]/)? ' '+m : ' +'+m
    end
  end
end

def squeeze
  _wut do |line|
    line.gsub!(/\s+/,'')
  end
end

def spread
  _wut do |line|
    line.gsub!(/\b(\W)/,' \1')
    line.gsub!(/(\W)\b/,'\1 ')
  end
end

def ungroup
  _wut do |line|
    line.gsub!(/(.?)\(([^()]*)\)/) do |m|
      a,b = $1,$2
      case a
      when nil
        b
      when '-'
        b.gsub!(/[-+]/){|s| (s=='+')? '-' : '+'}
        a+b
      else
        a+b
      end
    end
  end
end

def associative
  _wut do |line|
    line.gsub!(/(\([^()]+\))\((\w)\)/) do |m|
      a,b = $1,$2
      a.gsub(/(\w)\b/,"\\1#{b}")
    end
    line.gsub!(/\((\w)\)(\([^()]+\))/) do |m|
      a,b = $1,$2
      b.gsub(/\b(\w)/,"#{a}\\1")
    end
    line
  end
end

def gsub(a,b)
  _wut do |line|
    [line.gsub!(a,b), "gsub('#{a}','#{b}')"]
  end
end
