# encoding: utf-8
require 'digest/rmd160'
require 'json'

class String
  def indentation
    /^\s*/.match(self)[0]
  end

  def fuse!
    self.gsub!(/\s+/,'')
  end

  def crack!
    self.gsub!(/\b(\W)/,' \1')
    self.gsub!(/(\W)\b/,'\1 ')
  end

  def comment!(c=caller[0][/`.*'/][1..-2])
    self << " # #{c}"
  end

  def uncomment!
    self.sub!(/\s*#.*$/, '')
  end

  def transform!(map, p='', q='')
    map.each do |pat, sub|
      rgx = Regexp.new(p+pat+q)
      self.gsub!(rgx, sub)
    end
    self
  end
end

FRACTIONS ||= Array.new
n = 0
FRACTIONS[n] = ['\(1\/4\)', '¼']; n+=1
FRACTIONS[n] = ['\(1\/2\)', '½']; n+=1
FRACTIONS[n] = ['\(3\/4\)', '¾']; n+=1
FRACTIONS[n] = ['\(1\/7\)', '⅐']; n+=1
FRACTIONS[n] = ['\(1\/9\)', '⅑']; n+=1
FRACTIONS[n] = ['\(1\/10\)', '⅒']; n+=1
FRACTIONS[n] = ['\(1\/3\)', '⅓']; n+=1
FRACTIONS[n] = ['\(2\/3\)', '⅔']; n+=1
FRACTIONS[n] = ['\(1\/5\)', '⅕']; n+=1
FRACTIONS[n] = ['\(2\/5\)', '⅖']; n+=1
FRACTIONS[n] = ['\(3\/5\)', '⅗']; n+=1
FRACTIONS[n] = ['\(4\/5\)', '⅘']; n+=1
FRACTIONS[n] = ['\(1\/6\)', '⅙']; n+=1
FRACTIONS[n] = ['\(5\/6\)', '⅚']; n+=1
FRACTIONS[n] = ['\(1\/8\)', '⅛']; n+=1
FRACTIONS[n] = ['\(3\/8\)', '⅜']; n+=1
FRACTIONS[n] = ['\(5\/8\)', '⅝']; n+=1
FRACTIONS[n] = ['\(7\/8\)', '⅞']; n+=1
FRACTIONS.sort!{|a,b| b.first.length<=>a.first.length}

MATH ||= Array.new
n=0
MATH[n] = ['<=>', '⇔']; n+=1
MATH[n] = ['<->', '↔']; n+=1
MATH[n] = ['==>', '⇒']; n+=1
MATH[n] = ['-->', '→']; n+=1
MATH[n] = ['<--', '←']; n+=1
MATH[n] = ['<==', '⇐']; n+=1
MATH[n] = [':\.', '∴']; n+=1
MATH[n] = ['\.:', '∵']; n+=1
MATH[n] = ['\([10]/0\)', '∞']; n+=1
MATH[n] = ['!==', '≢']; n+=1
MATH[n] = ['==', '≡']; n+=1
MATH[n] = ['<=', '≤']; n+=1
MATH[n] = ['>=', '≥']; n+=1
MATH[n] = [':=', '≜']; n+=1
MATH[n] = ['~=', '≈']; n+=1
MATH[n] = ['!=', '≠']; n+=1
MATH[n] = ['<=<', '⊆']; n+=1
MATH[n] = ['<<<', '⊂']; n+=1
MATH[n] = ['>=>', '⊇']; n+=1
MATH[n] = ['>>>', '⊃']; n+=1
MATH[n] = ['\(\+\)', '⊕']; n+=1
MATH[n] = [':ContourIntegral:', '∮']; n+=1
MATH[n] = [':Sq(ua)?r(eRroo)?t:', '√']; n+=1
MATH[n] = ['\(\+\/?\-\)', '±']; n+=1
MATH[n] = ['\.\.\.', '⋯']; n+=1
MATH[n] = ['"\'', '‴']; n+=1
MATH[n] = ['""', '⁗']; n+=1
MATH[n] = [':Natural:', 'ℕ']; n+=1
MATH[n] = [':Integer:', 'ℤ']; n+=1
MATH[n] = [':Rational:', 'ℚ']; n+=1
MATH[n] = [':Real:', 'ℝ']; n+=1
MATH[n] = [':Complex:', 'ℂ']; n+=1
MATH[n] = [':Quaternions:', 'ℍ']; n+=1
MATH[n] = [':Integral:', '∫']; n+=1
#MATH[n] = ['=/([\daehijklmnoprstvx])\b', '=_\1']; n+=1
MATH.sort!{|a,b| b.first.length<=>a.first.length}

SUP ||= Array.new
n=0
SUP[n] = ['\^2(\D|\b)', '²\1']; n+=1
SUP[n] = ['\^3(\D|\b)', '³\1']; n+=1
SUP[n] = ['\^0(\D|\b)', '⁰\1']; n+=1
SUP[n] = ['\^1(\D|\b)', 'ⁱ\1']; n+=1
SUP[n] = ['\^4(\D|\b)', '⁴\1']; n+=1
SUP[n] = ['\^5(\D|\b)', '⁵\1']; n+=1
SUP[n] = ['\^6(\D|\b)', '⁶\1']; n+=1
SUP[n] = ['\^7(\D|\b)', '⁷\1']; n+=1
SUP[n] = ['\^8(\D|\b)', '⁸\1']; n+=1
SUP[n] = ['\^9(\D|\b)', '⁹\1']; n+=1
SUP[n] = ['\^a', 'ᵃ']; n+=1
SUP[n] = ['\^b', 'ᵇ']; n+=1
SUP[n] = ['\^c', 'ᶜ']; n+=1
SUP[n] = ['\^d', 'ᵈ']; n+=1
SUP[n] = ['\^e', 'ᵉ']; n+=1
SUP[n] = ['\^f', 'ᶠ']; n+=1
SUP[n] = ['\^g', 'ᵍ']; n+=1
SUP[n] = ['\^h', 'ʰ']; n+=1
SUP[n] = ['\^i', 'ⁱ']; n+=1
SUP[n] = ['\^j', 'ʲ']; n+=1
SUP[n] = ['\^k', 'ᵏ']; n+=1
SUP[n] = ['\^l', 'ˡ']; n+=1
SUP[n] = ['\^m', 'ᵐ']; n+=1
SUP[n] = ['\^n', 'ⁿ']; n+=1
SUP[n] = ['\^o', 'ᵒ']; n+=1
SUP[n] = ['\^p', 'ᵖ']; n+=1
SUP[n] = ['\^r', 'ʳ']; n+=1
SUP[n] = ['\^s', 'ˢ']; n+=1
SUP[n] = ['\^t', 'ᵗ']; n+=1
SUP[n] = ['\^u', 'ᵘ']; n+=1
SUP[n] = ['\^v', 'ᵛ']; n+=1
SUP[n] = ['\^w', 'ʷ']; n+=1
SUP[n] = ['\^x', 'ˣ']; n+=1
SUP[n] = ['\^y', 'ʸ']; n+=1
SUP[n] = ['\^z', 'ᶻ']; n+=1
SUP[n] = ['\^n', 'ⁿ']; n+=1
SUP[n] = ['\^k', 'ᵏ']; n+=1
SUP.sort!{|a,b| b.first.length<=>a.first.length}

SUB ||= Array.new
n=0
SUB[n] = ['([A-Z]|[a-z])0', '\1₀']; n+=1
SUB[n] = ['([A-Z]|[a-z])1', '\1₁']; n+=1
SUB[n] = ['([A-Z]|[a-z])2', '\1₂']; n+=1
SUB[n] = ['([A-Z]|[a-z])3', '\1₃']; n+=1
SUB[n] = ['([A-Z]|[a-z])4', '\1₄']; n+=1
SUB[n] = ['([A-Z]|[a-z])5', '\1₅']; n+=1
SUB[n] = ['([A-Z]|[a-z])6', '\1₆']; n+=1
SUB[n] = ['([A-Z]|[a-z])7', '\1₇']; n+=1
SUB[n] = ['([A-Z]|[a-z])8', '\1₈']; n+=1
SUB[n] = ['([A-Z]|[a-z])9', '\1₉']; n+=1
SUB[n] = ['_0', '₀']; n+=1
SUB[n] = ['_1', '₁']; n+=1
SUB[n] = ['_2', '₂']; n+=1
SUB[n] = ['_3', '₃']; n+=1
SUB[n] = ['_4', '₄']; n+=1
SUB[n] = ['_5', '₅']; n+=1
SUB[n] = ['_6', '₆']; n+=1
SUB[n] = ['_7', '₇']; n+=1
SUB[n] = ['_8', '₈']; n+=1
SUB[n] = ['_9', '₉']; n+=1
SUB[n] = ['_a', 'ₐ']; n+=1
SUB[n] = ['_e', 'ₑ']; n+=1
SUB[n] = ['_h', 'ₕ']; n+=1
SUB[n] = ['_i', 'ᵢ']; n+=1
SUB[n] = ['_j', 'ⱼ']; n+=1
SUB[n] = ['_k', 'ₖ']; n+=1
SUB[n] = ['_l', 'ₗ']; n+=1
SUB[n] = ['_m', 'ₘ']; n+=1
SUB[n] = ['_n', 'ₙ']; n+=1
SUB[n] = ['_o', 'ₒ']; n+=1
SUB[n] = ['_p', 'ₚ']; n+=1
SUB[n] = ['_r', 'ᵣ']; n+=1
SUB[n] = ['_s', 'ₛ']; n+=1
SUB[n] = ['_t', 'ᵤ']; n+=1
SUB[n] = ['_v', 'ᵥ']; n+=1
SUB[n] = ['_x', 'ₓ']; n+=1
SUB.sort!{|a,b| b.first.length<=>a.first.length}

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
GREEK.sort!{|a,b| b.first.length<=>a.first.length}

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
A2X.sort!{|a,b| b.first.length<=>a.first.length}

ARRAY_NAMES ||= Hash.new{|h,k| k.first.to_s+'...'}
%w(FRACTIONS MATH SUP SUB GREEK A2X).each{|n| ARRAY_NAMES[eval(n)]=n}

def _line
  String.new($curbuf[$curbuf.line_number])
end

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
      comment = "#{c} #{ARRAY_NAMES[set1]}"
      set1 = set1.map{|a,b| [b,a]} if i
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

def save(f=VIMDEF1)
  File.open(f, 'w'){|fh| fh.puts DEFINE.to_json}
end

def read(f=[VIMDEF0, VIMDEF1])
  [*f].each do |fn|
    if File.exist?(fn)
      JSON.parse(File.read(fn)).each{|k,v| DEFINE[k.to_sym]=v}
    end
  end
end

def by(key)
  pat, sub = DEFINE[key.to_sym]
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

def define(key=nil, pat=nil, sub=nil)
  dummy='#'; nope=nil
  if key.nil? and pat.nil? and sub.nil?
    dummy, key, pat, sub, nope = _line.strip.split(/\s+/)
  end
  raise "Need key, pat, and sub" unless key and pat and sub and !nope and dummy=='#'
  DEFINE[key.to_sym] = [pat, sub]
  _append("define(:#{key}, '#{pat}', '#{sub}')")
end

def wolframize
  _wut do |line|
    line.fuse!
    2.times do
      line.gsub!(/\)\(/, ')*(')
      line.gsub!(/([a-z]\d*)([a-z])/, '\1*\2')
    end
    'wolframize'
  end
end

def digest
  _wut do |line|
    Digest::RMD160.base64digest(line)
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

def fuse
  _wut do |line|
    line.fuse!
  end
end

def crack
  _wut do |line|
    line.crack!
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
