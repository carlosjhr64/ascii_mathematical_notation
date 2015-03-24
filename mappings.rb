#!/usr/bin/env ruby

module MathematicalAlphanumericSymbols
  S=MathematicalAlphanumericSymbols

  LATIN = [
  'A𝐀𝐴𝑨𝖠𝗔𝘈𝘼𝒜𝓐𝔄𝕬𝙰𝔸', 'B𝐁𝐵𝑩𝖡𝗕𝘉𝘽ℬ𝓑𝔅𝕭𝙱𝔹', 'C𝐂𝐶𝑪𝖢𝗖𝘊𝘾𝒞𝓒ℭ𝕮𝙲ℂ',
  'D𝐃𝐷𝑫𝖣𝗗𝘋𝘿𝒟𝓓𝔇𝕯𝙳𝔻', 'E𝐄𝐸𝑬𝖤𝗘𝘌𝙀ℰ𝓔𝔈𝕰𝙴𝔼', 'F𝐅𝐹𝑭𝖥𝗙𝘍𝙁ℱ𝓕𝔉𝕱𝙵𝔽',
  'G𝐆𝐺𝑮𝖦𝗚𝘎𝙂𝒢𝓖𝔊𝕲𝙶𝔾', 'H𝐇𝐻𝑯𝖧𝗛𝘏𝙃ℋ𝓗ℌ𝕳𝙷ℍ', 'I𝐈𝐼𝑰𝖨𝗜𝘐𝙄ℐ𝓘ℑ𝕴𝙸𝕀',
  'J𝐉𝐽𝑱𝖩𝗝𝘑𝙅𝒥𝓙𝔍𝕵𝙹𝕁', 'K𝐊𝐾𝑲𝖪𝗞𝘒𝙆𝒦𝓚𝔎𝕶𝙺𝕂', 'L𝐋𝐿𝑳𝖫𝗟𝘓𝙇ℒ𝓛𝔏𝕷𝙻𝕃',
  'M𝐌𝑀𝑴𝖬𝗠𝘔𝙈ℳ𝓜𝔐𝕸𝙼𝕄', 'N𝐍𝑁𝑵𝖭𝗡𝘕𝙉𝒩𝓝𝔑𝕹𝙽ℕ', 'O𝐎𝑂𝑶𝖮𝗢𝘖𝙊𝒪𝓞𝔒𝕺𝙾𝕆',
  'P𝐏𝑃𝑷𝖯𝗣𝘗𝙋𝒫𝓟𝔓𝕻𝙿ℙ', 'Q𝐐𝑄𝑸𝖰𝗤𝘘𝙌𝒬𝓠𝔔𝕼𝚀ℚ', 'R𝐑𝑅𝑹𝖱𝗥𝘙𝙍ℛ𝓡ℜ𝕽𝚁ℝ',
  'S𝐒𝑆𝑺𝖲𝗦𝘚𝙎𝒮𝓢𝔖𝕾𝚂𝕊', 'T𝐓𝑇𝑻𝖳𝗧𝘛𝙏𝒯𝓣𝔗𝕿𝚃𝕋', 'U𝐔𝑈𝑼𝖴𝗨𝘜𝙐𝒰𝓤𝔘𝖀𝚄𝕌',
  'V𝐕𝑉𝑽𝖵𝗩𝘝𝙑𝒱𝓥𝔙𝖁𝚅𝕍', 'W𝐖𝑊𝑾𝖶𝗪𝘞𝙒𝒲𝓦𝔚𝖂𝚆𝕎', 'X𝐗𝑋𝑿𝖷𝗫𝘟𝙓𝒳𝓧𝔛𝖃𝚇𝕏',
  'Y𝐘𝑌𝒀𝖸𝗬𝘠𝙔𝒴𝓨𝔜𝖄𝚈𝕐', 'Z𝐙𝑍𝒁𝖹𝗭𝘡𝙕𝒵𝓩ℨ𝖅𝚉ℤ', 'a𝐚𝑎𝒂𝖺𝗮𝘢𝙖𝒶𝓪𝔞𝖆𝚊𝕒',
  'b𝐛𝑏𝒃𝖻𝗯𝘣𝙗𝒷𝓫𝔟𝖇𝚋𝕓', 'c𝐜𝑐𝒄𝖼𝗰𝘤𝙘𝒸𝓬𝔠𝖈𝚌𝕔', 'd𝐝𝑑𝒅𝖽𝗱𝘥𝙙𝒹𝓭𝔡𝖉𝚍𝕕',
  'e𝐞𝑒𝒆𝖾𝗲𝘦𝙚ℯ𝓮𝔢𝖊𝚎𝕖', 'f𝐟𝑓𝒇𝖿𝗳𝘧𝙛𝒻𝓯𝔣𝖋𝚏𝕗', 'g𝐠𝑔𝒈𝗀𝗴𝘨𝙜ℊ𝓰𝔤𝖌𝚐𝕘',
  'h𝐡ℎ𝒉𝗁𝗵𝘩𝙝𝒽𝓱𝔥𝖍𝚑𝕙', 'i𝐢𝑖𝒊𝗂𝗶𝘪𝙞𝒾𝓲𝔦𝖎𝚒𝕚', 'j𝐣𝑗𝒋𝗃𝗷𝘫𝙟𝒿𝓳𝔧𝖏𝚓𝕛',
  'k𝐤𝑘𝒌𝗄𝗸𝘬𝙠𝓀𝓴𝔨𝖐𝚔𝕜', 'l𝐥𝑙𝒍𝗅𝗹𝘭𝙡𝓁𝓵𝔩𝖑𝚕𝕝', 'm𝐦𝑚𝒎𝗆𝗺𝘮𝙢𝓂𝓶𝔪𝖒𝚖𝕞',
  'n𝐧𝑛𝒏𝗇𝗻𝘯𝙣𝓃𝓷𝔫𝖓𝚗𝕟', 'o𝐨𝑜𝒐𝗈𝗼𝘰𝙤ℴ𝓸𝔬𝖔𝚘𝕠', 'p𝐩𝑝𝒑𝗉𝗽𝘱𝙥𝓅𝓹𝔭𝖕𝚙𝕡',
  'q𝐪𝑞𝒒𝗊𝗾𝘲𝙦𝓆𝓺𝔮𝖖𝚚𝕢', 'r𝐫𝑟𝒓𝗋𝗿𝘳𝙧𝓇𝓻𝔯𝖗𝚛𝕣', 's𝐬𝑠𝒔𝗌𝘀𝘴𝙨𝓈𝓼𝔰𝖘𝚜𝕤',
  't𝐭𝑡𝒕𝗍𝘁𝘵𝙩𝓉𝓽𝔱𝖙𝚝𝕥', 'u𝐮𝑢𝒖𝗎𝘂𝘶𝙪𝓊𝓾𝔲𝖚𝚞𝕦', 'v𝐯𝑣𝒗𝗏𝘃𝘷𝙫𝓋𝓿𝔳𝖛𝚟𝕧',
  'w𝐰𝑤𝒘𝗐𝘄𝘸𝙬𝓌𝔀𝔴𝖜𝚠𝕨', 'x𝐱𝑥𝒙𝗑𝘅𝘹𝙭𝓍𝔁𝔵𝖝𝚡𝕩', 'y𝐲𝑦𝒚𝗒𝘆𝘺𝙮𝓎𝔂𝔶𝖞𝚢𝕪',
  'z𝐳𝑧𝒛𝗓𝘇𝘻𝙯𝓏𝔃𝔷𝖟𝚣𝕫']

  GREEK = [
  'Α𝚨𝛢𝜜𝝖𝞐', 'Β𝚩𝛣𝜝𝝗𝞑', 'Γ𝚪𝛤𝜞𝝘𝞒', 'Δ𝚫𝛥𝜟𝝙𝞓',
  'Ε𝚬𝛦𝜠𝝚𝞔', 'Ζ𝚭𝛧𝜡𝝛𝞕', 'Η𝚮𝛨𝜢𝝜𝞖', 'Θ𝚯𝛩𝜣𝝝𝞗',
  'Ι𝚰𝛪𝜤𝝞𝞘', 'Κ𝚱𝛫𝜥𝝟𝞙', 'Λ𝚲𝛬𝜦𝝠𝞚', 'Μ𝚳𝛭𝜧𝝡𝞛',
  'Ν𝚴𝛮𝜨𝝢𝞜', 'Ξ𝚵𝛯𝜩𝝣𝞝', 'Ο𝚶𝛰𝜪𝝤𝞞', 'Π𝚷𝛱𝜫𝝥𝞟',
  'Ρ𝚸𝛲𝜬𝝦𝞠', 'ϴ𝚹𝛳𝜭𝝧𝞡', 'Σ𝚺𝛴𝜮𝝨𝞢', 'Τ𝚻𝛵𝜯𝝩𝞣',
  'Υ𝚼𝛶𝜰𝝪𝞤', 'Φ𝚽𝛷𝜱𝝫𝞥', 'Χ𝚾𝛸𝜲𝝬𝞦', 'Ψ𝚿𝛹𝜳𝝭𝞧',
  'Ω𝛀𝛺𝜴𝝮𝞨', '∇𝛁𝛻𝜵𝝯𝞩', 'α𝛂𝛼𝜶𝝰𝞪', 'β𝛃𝛽𝜷𝝱𝞫',
  'γ𝛄𝛾𝜸𝝲𝞬', 'δ𝛅𝛿𝜹𝝳𝞭', 'ε𝛆𝜀𝜺𝝴𝞮', 'ζ𝛇𝜁𝜻𝝵𝞯',
  'η𝛈𝜂𝜼𝝶𝞰', 'θ𝛉𝜃𝜽𝝷𝞱', 'ι𝛊𝜄𝜾𝝸𝞲', 'κ𝛋𝜅𝜿𝝹𝞳',
  'λ𝛌𝜆𝝀𝝺𝞴', 'μ𝛍𝜇𝝁𝝻𝞵', 'ν𝛎𝜈𝝂𝝼𝞶', 'ξ𝛏𝜉𝝃𝝽𝞷',
  'ο𝛐𝜊𝝄𝝾𝞸', 'π𝛑𝜋𝝅𝝿𝞹', 'ρ𝛒𝜌𝝆𝞀𝞺', 'ς𝛓𝜍𝝇𝞁𝞻',
  'σ𝛔𝜎𝝈𝞂𝞼', 'τ𝛕𝜏𝝉𝞃𝞽', 'υ𝛖𝜐𝝊𝞄𝞾', 'φ𝛗𝜑𝝋𝞅𝞿',
  'χ𝛘𝜒𝝌𝞆𝟀', 'ψ𝛙𝜓𝝍𝞇𝟁', 'ω𝛚𝜔𝝎𝞈𝟂', '∂𝛛𝜕𝝏𝞉𝟃',
  'ϵ𝛜𝜖𝝐𝞊𝟄', 'ϑ𝛝𝜗𝝑𝞋𝟅', 'ϰ𝛞𝜘𝝒𝞌𝟆', 'ϕ𝛟𝜙𝝓𝞍𝟇',
  'ϱ𝛠𝜚𝝔𝞎𝟈', 'ϖ𝛡𝜛𝝕𝞏𝟉']

  DIGITS = [
  '0𝟎𝟘𝟢𝟬𝟶', '1𝟏𝟙𝟣𝟭𝟷', '2𝟐𝟚𝟤𝟮𝟸', '3𝟑𝟛𝟥𝟯𝟹', '4𝟒𝟜𝟦𝟰𝟺',
  '5𝟓𝟝𝟧𝟱𝟻', '6𝟔𝟞𝟨𝟲𝟼', '7𝟕𝟟𝟩𝟳𝟽', '8𝟖𝟠𝟪𝟴𝟾', '9𝟗𝟡𝟫𝟵𝟿',
  ]

  GL = 'ΑAαaΒBβbΓGγgΔDδdΕEεeΖZζzΗHηhΘCθ' +
       'cΙIιiΚKκkΛLλlΜMμmΝNνnΞJξjΟOοoΠP' +
       'πpΡRρrϴUςuΣSσsΤTτtΥYυyΦFφfΧXχxΨ' +
       'WψwΩQωq∇V∂v'
  Gl = 'ϵeϑcϰxϕfϱrϖp'

  #      0    1    2     3    4     5     6      7    8     9   10    11   12   13
  A = [':', '[', '(', '[(', '"', '["', '("', '[("', '`', '[`', '$', '[$', "'", '{']
  Z = [ '', ']', ')', ')]',  '',  ']',  ')',  ')]',  '',  ']',  '',  ']',  '', '}']
  X  = '^|'

  BOLD             = 1
  ITALIC           = 2
  BOLD_ITALIC      = 3
  SANS             = 4
  BOLD_SANS        = 5
  ITALIC_SANS      = 6
  BOLD_ITALIC_SANS = 7
  SCRIPT           = 8
  BOLD_SCRIPT      = 9
  FRAKTUR          = 10
  BOLD_FRAKTUR     = 11
  MONO             = 12
  DOUBLE           = 13

  def self.esc0(l)
    A[0]+l+Z[0]
  end

  def self.esc(l,i)
    S.esc0(A[i]+l+Z[i])
  end

  def self.bold(l)
    S.esc(l,BOLD)
  end
  def self.italic(l)
    S.esc(l,ITALIC)
  end
  def self.bold_italic(l)
    S.esc(l,BOLD_ITALIC)
  end
  def self.sans(l)
    S.esc(l,SANS)
  end
  def self.bold_sans(l)
    S.esc(l,BOLD_SANS)
  end
  def self.italic_sans(l)
    S.esc(l,ITALIC_SANS)
  end
  def self.bold_italic_sans(l)
    S.esc(l,BOLD_ITALIC_SANS)
  end
  def self.script(l)
    S.esc(l,SCRIPT)
  end
  def self.bold_script(l)
    S.esc(l,BOLD_SCRIPT)
  end
  def self.fraktur(l)
    S.esc(l,FRAKTUR)
  end
  def self.bold_fraktur(l)
    S.esc(l,BOLD_FRAKTUR)
  end
  def self.mono(l)
    S.esc(l,MONO)
  end
  def self.double(l)
    S.esc(l,DOUBLE)
  end

  def self.digits
    DIGITS.each do |digit|
      c = digit.chars
      d = c[0]
      yield S.bold(d),      c[1] # bold
      yield S.double(d),    c[2] # double
      yield S.sans(d),      c[3] # sans
      yield S.bold_sans(d), c[4] # sans-bold
      yield S.mono(d),      c[5] # mono
    end
  end

  def self.latin
    LATIN.each do |letter|
      c = letter.chars
      1.upto(13) do |i|
        yield S.esc(c[0],i), c[i]
      end
    end
  end

  def self.greek
    GREEK.each do |letter|
      c = letter.chars
      if i = GL.index(c[0])
        l = GL[i+1]
      elsif i = Gl.index(c[0])
        l = X[0]+Gl[i+1]
      else
        raise "Ooops!"
      end
      l0 = S.esc0(l)
      yield l0,                     c[0]
      yield S.bold(l0),             c[1]
      yield S.italic(l0),           c[2]
      yield S.bold_italic(l0),      c[3]
      yield S.bold_sans(l0),        c[4]
      yield S.bold_italic_sans(l0), c[5]
    end
  end

  def self.extras
    ['iı𝚤','jȷ𝚥'].each do |letter|
      l = X[1]+letter[0]
      yield S.esc0(l),   letter[1]
      yield S.italic(l), letter[2]
    end
    ['FϜ𝟊','fϝ𝟋'].each do |letter|
      l = X[1]+letter[0]
      yield S.esc0(l),   letter[1]
      yield S.bold(l), letter[2]
    end
  end

  def self.pour
    S.digits{|*_| yield _}
    S.latin{|*_|  yield _}
    S.greek{|*_|  yield _}
    S.extras{|*_| yield _}
  end

  def self.duplicates?
    seen = {}
    S.pour do |k,v|
      if seen[k]
        $stderr.puts k
        return true
      end
      seen[k]=true
    end
    return false
  end

  def self.dump
    S.pour{|*_| puts _.join("\t")}
  end
end
if __FILE__ == $0
  raise "Duplicates" if MathematicalAlphanumericSymbols.duplicates?
  MathematicalAlphanumericSymbols.dump
end
