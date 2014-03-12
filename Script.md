# My VIM Script
## Vim script support for [Notation](Notation.md).

For this to work, one needs to have vim compiled to use ruby scripts.
In vim, the comand to run is:

    :ruby load '/path/to/script.rb'

If the script can be found in ./lib/script.rb, then the command is:

    :ruby load './lib/script.rb'

One can also have the script load automatically via the `~/.vimrc` file.
Add the following line your file:

    rubyfile /path/to/script.rb

My script has the following methods:

* a3x and x3a
* cl and cr
* define, by, save, read
* digest
* greek
* list
* tr
* wsort and csort
* wolframize

## a3x and x3a

The `a3x` method will swap as follows:

    a1->x, a2->y, a3->z,
    b1->u, b2->v, b3->w,
    c1->r, c2->s, c3->t,
    d1->o, d2->p, d3->q,
    e1->l, e2->m, e3->n,
    f1->i, f2->j, f3->k.

The `x3a` reverts.  For example:

    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3)
    (x, y, z) + (u, v, w) = (x+u, y+v, y+w) # a3x
    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3) # x3a

Notice that it adds a comment to the line tagging it with the action performed.
The `3` in the method's names is due to changing variables from (a1,a2,a3) to (x,y,z).
I plan a `4` version which may take (a0,a1,a2,a3) to (t,x,y,z).

## cl and cr

I'm too lazy at the moment to describe what `cl` and `cr` obviously does:

    abc xyz ijk
    cab zxy kij # cr
    bca yzx jki # cr
    abc xyz ijk # cr

    abc xyz ijk
    bca yzx jki # cl
    cab zxy kij # cl
    abc xyz ijk # cl

    a = +2x2 -xy +5y2
    a = 2x2+ xy- 5y2+ # cl
    a = +2x2 -xy +5y2 # cr

## define, by, save, and read

The define method takes a symbol, a pattern, and a substitution.
This way one can define a `gsub` by a given key name.
For example, `:ruby define :mcom, '\((\w)\*(\w)\)', '\2*\1'`
will define :mcom to perform `gsub('\((\w)\*(\w)\)', '\2*\1')` on the line.
Then `:ruby by :mcom` will perform that action.

    # :mcom \((\w)\*(\w)\) -> \2*\1
    X*(A*B)*Y
    X*B*A*Y # by :mcom

Notice that `define` will append a line with the new definition, and
`by` will append the tranformed line tagged with the action taken.

`save` will save the current definitions into `~/vimdef`.
`read` will read the definitions store in `~/vimdef`.

## digest

The digest method appends the RMD160 digest of the stripped current line.
This can help in determining if two lines are equal:

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    # Jxgi2de/YQF4t6EPW2B+NfgJzRM=
    dafjkJA fjaskjAF 1asjsdgfjlkjlafri AFJJFF
    # gx1BzZReswQhxWSRjUqmTsyaKOs=
    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    # Jxgi2de/YQF4t6EPW2B+NfgJzRM=

## greek

The greek method will swap the names of greek letters to their greek letters in the current line
and append it to the next line.

    This is PI, Pi, OMEGA, Omega, THETA, and Theta!
    This is Π, π, Ω, ω, Θ, and θ! # greek

I know I said in [Notation](Notation.md) that only ASCII characters are allowed.
But greek letters is a really nice feature for an aside.

## list

    a2b1c3 a3b2c1 a1b3c2
    # list
    a2b1c3
    a3b2c1
    a1b3c2

## tr

`tr` works a lot like the linux command.

    x1y2z3
    xaybzc # tr 123 abc


## wsort and cwort

`csort` sorts the characters, `wsort` sorts the words:

    zxy bac tqr wvs
    xyz abc qrt svw # csort
    abc qrt svw xyz # wsort

## wolframize

The wolframize method will cleanup a line to be passed to
[wolframalpha](http://www.wolframalpha.com).
The following example shows what it does:

    ab + cde (xyz - ijk)
    a*b+c*d*e(x*y*z-i*j*k) # wolframize
