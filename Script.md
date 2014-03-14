# My VIM Script
## Vim script support for [Notation](Notation.md).
### WARNING:
#### THE METHODS PROVIDED ARE NOT FOOL PROOF.
#### YOU MUST VERIFY THEY DO WHAT YOU NEED THEM TO DO.

For vim ruby scripts to work,
one needs to have vim compiled to use ruby scripts.
In vim, the command to run is:

    :ruby load '/path/to/script.rb'

If the script can be found in ./lib/script.rb, then the command is:

    :ruby load './lib/script.rb'

One can also have the script load automatically via the `~/.vimrc` file.
Add the following line your `~/.vimrc` file:

    rubyfile /path/to/script.rb

# Methods

My script has the following methods:

* associative
* crack and fuse
* define, by, save, read
* digest
* gsub
* list
* pm
* tr and rt (with GREEK, A2X, ...)
* ungroup
* wsort and csort
* wolframize

Once the script is loaded, one can run a method as follows:

    :ruby method
    :ruby method arg1,...

## associative

    #:ruby associative
    (ij-xu-yv-zw)(k)-(r)(iu+jx+yw-vz)-(iv+jy+zu-wx)(s)-(iw+jz+xv-uy)(t)
    (ijk-xuk-yvk-zwk)-(riu+rjx+ryw-rvz)-(ivs+jys+zus-wxs)-(iwt+jzt+xvt-uyt) # associative

## crack and fuse

`fuse` removes spaces:

    #:ruby fuse
    a + b + c = d
    a+b+c=d # fuse

`crack` breaks apart tokens:

    #:ruby crack
    a+b+c=d
    a + b + c = d # crack

## by, define, read, and save

The `define` method takes a symbol, a pattern, and a substitution.
This way one can define a `gsub` by a given key name.
For example, `:ruby define :commute, '\((\w)\*(\w)\)', '\2*\1'`
will define `:commute` to perform `gsub('\((\w)\*(\w)\)', '\2*\1')` on a line.
It will append the definition as a comment on the next line.
Then `:ruby by :commute` will perform that action on the current line, and
append the results on the next line.
For example:

    #:ruby define :commute, '\((\w)\*(\w)\)', '\2*\1'
    # define(:commute, '\((\w)\*(\w)\)', '\2*\1')
    #:ruby by :commute
    X*(A*B)*Y
    X*B*A*Y # by commute

The `save` method will save the current state of your definitions
into a file in the working diretory, `./script.json`.
You can also specify the file to save to by giving it the filename.

The `read` method will read definitions from `~/.vim/script.json` and `./script.json`.
You can also specify the file to read from by giving it the filename.

## digest

The digest method appends the RMD160 digest of the stripped current line.
This can help in determining if two lines are equal:

    #:ruby digest

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    Jxgi2de/YQF4t6EPW2B+NfgJzRM= # digest

    dafjkJA fjaskjAF 1asjsdgfjlkjlafri AFJJFF
    gx1BzZReswQhxWSRjUqmTsyaKOs= # digest

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    Jxgi2de/YQF4t6EPW2B+NfgJzRM= # digest

## gsub

`gsub` will run gsub on the current (striped) line with the given arguments.
For example:

    #:ruby gsub 'in ', '*n '
    The rain in spain.
    The ra*n *n spain. # gsub('in ','*n ')

## list

    #:ruby list
    a2b1c3 a3b2c1 a1b3c2
    # list
    a2b1c3
    a3b2c1
    a1b3c2

## pm

    #:ruby pm
    a+b-c-d+e f+g-h -i+h
     +a +b -c -d +e +f +g -h -i +h # pm

## tr and rt

`tr` works a lot like the linux command.
It takes two strings which describes a map from one letter to another.
`rt` reverses the operation.
For example:

    #:ruby tr '123', 'abc'
    x1y2z3
    xaybzc # tr('123','abc')

    #:ruby rt '123', 'abc'
    xaybzc
    x1y2z3 # rt('123','abc')

`tr` can also take an Array as an argument,
in which case it expects each element to contain a pattern, substitution pair.
For example:

    #:ruby tr [['(\w)(\d)','\2\1'], ['(\d)','\1\1']]
    a3  b57
    33a  55b77 # tr ["(\\w)(\\d)", "\\2\\1"]...

## tr and rt A2X

The `A2X` Array will swap as follows:

    a0-> i, a1->x, a2->y, a3->z, a4->e,
    b0-> j, b1->u, b2->v, b3->w, b4->f,
    c0-> k, c1->r, c2->s, c3->t, c4->g,
    d0-> l, d1->o, d2->p, d3->q, d4->h,

For example:

    #:ruby tr A2X
    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3)
    (x, y, z) + (u, v, w) = (x+u, y+v, y+w) # tr A2X

    #:ruby rt A2X
    (x, y, z) + (u, v, w) = (x+u, y+v, y+w)
    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3) # rt A2X

## tr FRACTIONS

    :ruby tr FRACTIONS
    A (1/4) and (3/8)
    A ¼ and ⅜ # tr FRACTIONS

## tr and rt GREEK

    #:ruby tr GREEK
    This is PI, Pi, OMEGA, Omega, THETA, and Theta!
    This is Π, π, Ω, ω, Θ, and θ! # tr GREEK

    #:ruby rt GREEK
    This is Π, π, Ω, ω, Θ, and θ!
    This is PI, Pi, OMEGA, Omega, THETA, and Theta! # rt GREEK

## tr MATH

    #:ruby tr MATH
    A<=>B C-->D .: The World is round :. Blows my mind! To (0/0)
    A⇔B C→D ∵ The World is round ∴ Blows my mind! To ∞ # tr MATH

## tr SUP and SUB

    #:ruby tr SUB
    A0 4_3 a^2 K^r
    A₀ 4₃ a^2 K^r # tr SUB

    #:ruby tr SUP
    A0 4_3 a^2 K^r
    A0 4_3 a² Kʳ # tr SUP

You can add arrays like `:ruby tr SUB+SUP`, but
the script won't be able to figure out the names of the arrays:

    #:ruby tr SUP+SUB
    A0 4_3 a^2 K^r
    A₀ 4₃ a² Kʳ # tr ["\\^2(\\D|\\b)", "\u00B2\\1"]...

## ungroup

    #:ruby ungroup
    (a+b-c)-(d+f-e)+(g-h-i)-(j-k-l)
    a+b-c-d-f+e+g-h-i-j+k+l # ungroup

## wsort and csort

`csort` sorts the characters, `wsort` sorts the words:

    #:ruby csort
    zxy bac tqr wvs
    xyz abc qrt svw # csort

    #:ruby wsort
    xyz abc qrt svw
    abc qrt svw xyz # wsort

## wolframize

The wolframize method will cleanup a line to be passed to
[wolframalpha](http://www.wolframalpha.com).
The following example shows what it does:

    #:ruby wolframize
    ab + cde (xyz - ijk)
    wolframize # wolframize

# Included Definitions

I following keys are defined in [script.json](script.json):

* cl and cr
* C0, C1, Cr, and Cx
* Cadd and Cmult
* H0, H1, and Ht
* Hmult and Hmult2
* V0, V1, and Vx

I think defining a set of these keys
should be enough to create any mathematical system
that can be written down.
In fact, the methods above could also be written as a series of `by` transformations.

## cl and cr

For each word in the current line,
`cr` pops the last letter and shifts it back in as the first letter.
The result is appended on the next line.

    #:ruby by :cr
    abc xyz ijk
    cab zxy kij # by cr
    bca yzx jki # by cr
    abc xyz ijk # by cr

For each word in the current line,
`cl` unshifts the first letter and pushes it back in as the last letter.
The result is appended on the next line.  For example:

    #:ruby by :cl
    abc xyz ijk
    bca yzx jki # by cl
    cab zxy kij # by cl
    abc xyz ijk # by cl

One possible use for `cr` and `cl` is to sort like terms for cancellation.
For example:

    abc+bxy-abc-cuv
    abc +bxy -abc -cuv
    bca bxy+ abc- cuv- # by cl
    abc- bca bxy+ cuv- # wsort
    -abc abc +bxy -cuv # by cr
    (-abc abc) +bxy -cuv
    +bxy -cuv
    +bxy-cuv # fuse

## C0, C1, Cr, and Cx

    #:ruby by :C0
    (a)
    (a0,a1) # by C0

    #:ruby by :C1
    (a)
    (a1,a2) # by C1

    #:ruby by :Cr
    (a)
    (ar,ai) # by Cr

    #:ruby by :Cx
    (a)
    (ax,ay) # by Cx

## Cadd and Cmult

    #:ruby by :Cadd
    ((x,y)+(u,v))
    (x+u,y+v) # by Cadd

    #:ruby by :Cmult
    ((x,y)*(u,v))
    (xv-yu,xu+yv) # by Cmult

## H0, H1, and Ht

    #:ruby by :H0
    (a)
    (a0,a1,a2,a3) # by H0

    #:ruby by :H1
    (a)
    (a1,a2,a3,a4) # by H1

    #:ruby by :Ht
    (a)
    (at,ax,ay,az) # by Ht

## Hmult and Hmult2

    #:ruby by :Hmult
    ((i,x,y,z)(j,u,v,w))
    (ij-xu-yv-zw,iu+jx+yw-vz,iv+jy+zu-wx,iw+jz+xv-uy) # by Hmult

    #:ruby by :Hmult2
    ((blah blah, Stuff Here, a+b+c, OK)(Wut, U, Wanna DO, psst))

    ((blah blah)(Wut)-( Stuff Here)( U)-( a+b+c)( Wanna DO)-( OK)( psst),
    (blah blah)( U)+(Wut)( Stuff Here)+( a+b+c)( psst)-( Wanna DO)( OK),
    (blah blah)( Wanna DO)+(Wut)( a+b+c)+( OK)( U)-( psst)( Stuff Here),
    (blah blah)( psst)+(Wut)( OK)+( Stuff Here)( Wanna DO)-( U)( a+b+c)) # by Hmult2
