# Vim-Ruby ASCII Mathematical Notation

## Vim script support for [Notation](Notation.md).

For vim-ruby scripts to work,
one needs to have vim compiled to use ruby.
See [Extending Vim with Ruby](http://www.linux-mag.com/id/1027/).
In vim, the command to run my script is:

    :ruby require 'ascii_mathematical_notation'

## Methods

With my script, all the `String` methods are available to act on the current line.
In addition, my script has the following methods:

* tr
* csort, wsort, and tsort
* digest
* define
* define_array
* load and dump
* show

One can run a method as follows:

    :ruby method
    :ruby method arg1,...

All methods will append to the current line location the transformed string,
with a comment tag.

### String methods

Most all of the [String](http://ruby-doc.org/core-2.1.1/String.html)
methods are available, although maybe not all do anything usefull in our case.
Here's some examples:

    #:ruby capitalize
    hello world
    Hello world # capitalize('')
    Hello worl # chop('')
    HELLO WORL # upcase('')
    HELO WORL # squeeze('')
    HELO WORM # succ('')

    #:ruby gsub(/[EO]/,'*')
    HELO WORM
    H*L* W*RM # gsub('(?-mix:[EO])', '*')

    #:ruby split(/\s+/)
    H*L* W*RM
     # split('(?-mix:\s+)')
    H*L*
    W*RM

The `gsub` method will probably be your most used.

### tr String usage

The `tr` method works a lot like the linux command in its simplest form:

    #:ruby tr 'C', 'c'
    Chocolate
    chocolate # tr 'C' 'c'

    #:ruby tr 'abcdefg', '1234567'
    abcdefg
    1234567 # tr 'abcdefg' '1234567'

    #:ruby tr 'AB', 'BA'
    A=B
    B=A # tr 'AB' 'BA'

### tr Symbol usage

The `tr` method will also take a `Symbol` name for a transform.
For convevience, I packaged some predefined transforms I think are generally usefull:

    #:ruby tr :greek
    This is PI and Pi, THETA and Theta, and OMEAGA and Omega.
    This is Π and π, Θ and θ, and OMEAGA and ω. # greek

    #:ruby tr :fractions
    (3/4) and (1/4) makes one.
    ¾ and ¼ makes one. # fractions

    #:ruby tr :superscript
    a^2 + b^3 = 0
    a² + b³ = 0 # superscript

    #:ruby tr :subscript
    A1 + A2 = A3
    A₁ + A₂ = A₃ # subscript

    #:ruby tr :math
    Rational+{q} :: Natural{n,m}: q=n/m
    ℚ+{q} :: ℕ{n,m}: q=n/m # math

    # You might want to combine two transforms.
    # I'll show how to do that later.
    a := x^2 + y^2
    a := x² + y² # superscript
    a ≜ x² + y² # math

## tr Array usage

`tr` can also take an Array as an argument,
in which case it expects each element to contain a pattern, substitution pair.
For example:

    #:ruby tr [['(\w)(\d)','\2\1'], ['(\d)','\1\1']]
    a3  b57
    33a  55b77 # tr [["(\\w)(\\d)", "\\2\\1"], ["(\\d)", "\\1\\1"]]

The Array can also just be a pattern, substitution pair.

    #:ruby tr ['(\w)(\d)','\2\1']
    a3  b57
    3a  5b7 # tr ["(\\w)(\\d)", "\\2\\1"]

### csort and wsort

`csort` sorts the characters, `wsort` sorts the words:

    #:ruby csort
    zxy bac tqr wvs
    xyz abc qrt svw # csort

    #:ruby wsort
    xyz abc qrt svw
    abc qrt svw xyz # wsort

Can you figure out what `tsort` does?  :)

    #:ruby tsort
    abc*(a-b+c+d-a+b-d-c)*xyz
    abc*(+a-a+b-b+c-c+d-d)*xyz # tsort

## digest

The digest method appends the RMD160 digest of the current line.
This can help in determining if two lines are equal:

    #:ruby digest

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    Jxgi2de/YQF4t6EPW2B+NfgJzRM= # digest

    dafjkJA fjaskjAF 1asjsdgfjlkjlafri AFJJFF
    gx1BzZReswQhxWSRjUqmTsyaKOs= # digest

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    Jxgi2de/YQF4t6EPW2B+NfgJzRM= # digest

## define

The `define` method takes a key name, a pattern, and a substitution from the current line.
This way one can define a `gsub` by a given key name.
The key becomes available for the `tr` method to use.
`define` will essentially echo back the new definition.

    #:ruby define
    commutative (\w)\*(\w) \2*\1
    commutative: (\w)\*(\w) --> \2*\1 # define

    # Now :commutative is available to tr
    #:ruby tr :commutative
    a*b
    b*a # commutative

That was a too simple cummutative transformation.
In general I'll need a more generalized form.
And a way to mark the part of the string to transform.
I'll use double parenthesis:

    #:ruby define
    commutative \(\((\w|\([^()]+\))([+*])(\w|\([^()]+\))\)\) (\3\2\1)
    commutative: \(\((\w|\([^()]+\))([+*])(\w|\([^()]+\))\)\) --> (\3\2\1) # define

    #:ruby tr :commutative
    A*((B*C))*D
    A*(C*B)*D # commutative
    A*(((i+j)*(k+l)))*D
    A*((k+l)*(i+j))*D # commutative

As you can see, the regular expression is a bit messy.
Normally '(.)' matches any one character, but
AsciiMathematicalNotation changes it's meaning to '(\w|\([^()]+\))'.
And changes '(@)' to '([^\s\w(){}\[\]])'
And changes '|' at the begining to '\(\('.
And changes '|' at the end to '\(\('.
We can change the above to the following form:

    #:ruby define
    commutative |(.)(@)(.)| (\3\2\1)
    commutative: |(.)(@)(.)| --> (\3\2\1) # define

    #:ruby tr :commutative
    A*((B*C))*D
    A*(C*B)*D # commutative
    A*(((i+j)*(k+l)))*D
    A*((k+l)*(i+j))*D # commutative

## define_array

The `define_array` method takes a key name and a series of key names.
For example, say you want to use :greek, :subscripts, :superscript, and :math
all in one step:

    # Note that the predefined arrays are not preloaded and
    # they they need to be autoloaded first.

    #:ruby tr :greek
     # greek
    #:ruby tr :subscript
     # subscript
    #:ruby tr :superscript
     # superscript
    #:ruby tr :math
     # math

    # Now you can define :all
    #:ruby define_array :all, :greek, :subscript, :superscript, :math
     # define_array(:all, :greek, :subscript, :superscript, :math)

    #:ruby tr :all
    A0 = Sqrt Pi r^2
    A₀ = √ π r² # all

Once you have defined an Array, it will be available in subsequent vim sessions.
In most `Linux` systems, you should be able to see the Array file for `:all` in:

    ~/.local/share/ascii_mathematical_notation/all.yml

The vim-ruby script only does the intial creation of the Array files.
After that, if you want to modify the array, you should edit the Array file.
The modified Array will be available in a new vim session.

## load and dump

The `dump` method will save the current state of your definitions
into a file in the data directory,
`~/.local/share/ascii_mathematical_notation/definitions.yml` for most `Linux` systems.
You can also specify the file to save to by giving it the filename.

The `load` method will read definitions, again from
`~/.local/share/ascii_mathematical_notation/definitions.yml`.
You can also specify the file to read from by giving it the filename.
The current definitions will be overwritten with those in the file.

Note that when `tr` is given a key name (a Symbol),
it checks first if its in the definitions before checking the Arrays.
So don't define :greek unless you don't need the :greek Array, for example.

## show

The `show` method will append the current definition of the given key:

    #:ruby show :cadd0
    cadd0: \((\w)\+(\w)\) --> (\11+\21,\12+\22) # show

## Preloaded definitions

Preloaded in the definitions are transforms I find useful.
I've have them defined in [examples/Definitions.md](examples/Definitions.md)


## More?

At times this documentation may not be up to the latest changes.
To check all methods available and subtleties of their implementations,
it should be enough to just read:

* [methods.rb](lib/ascii_mathematical_notation/methods.rb)

To see the complete list of Arrays available, and what they do,
see the files in the data directory:

* [data](data)

The `definitions.yml` file contains the definitions, of course.
The `VERSION` file just contains the current version of the software.
The rest should all be Array files.

