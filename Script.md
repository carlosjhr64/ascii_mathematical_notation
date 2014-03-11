# My VIM Script

For this to work, one needs to have vim compiled to use ruby scripts.
In vim, the comand to run is:

    :ruby load '/path/to/script.rb'

If the script can be found in ./lib/script.rb, then the command is:

    :ruby load './lib/script.rb'

One can also have the script load automatically via the `~/.vimrc` file.
Add the following line your file:

    rubyfile /path/to/script.rb

My script has the followin methods:

* greek
* a2x
* x2a
* define
* by
* wolframize
* digest

## greek

The greek method will swap the names of greek letters to their greek letters of the current
and append it to the next line.

    This is PI, Pi, OMEGA, Omega, THETA, and Theta!
    This is Π, π, Ω, ω, Θ, and θ!

## a2x and x2a

The a2x method will swap as follows:

    a1->x, a2->y, a3->z,
    b1->u, b2->v, b3->w,
    c1->r, c2->s, c3->t,
    d1->o, d2->p, d3->q,
    e1->l, e2->m, e3->n,
    f1->i, f2->j, f3->k.

The x2a reverts.  For example:

    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3)
    (x, y, z) + (u, v, w) = (x+u, y+v, y+w) # a2x
    (a1, a2, a3) + (b1, b2, b3) = (a1+b1, a2+b2, a2+b3) # x2a

Notice that it adds a comment to the line tagging it with the action performed.

## define and by

The define method takes a symbol, a pattern, and a substitution.
This way one can define a `gsub` by a it's key name.
For example, `:ruby define :mult, '(\w)\*(\w)', '\1\2'`
will define :mult to perform `gsub('(\w)\*(\w)', '\1\2')` on the line.
Then `:ruby by :mult` will perform that action.

    # :mult (\w)*(\w) -> \1\2
    A*B
    AB # by :mult

Notice that `define` will append a line with the new definition, and
`by` will appned the tranformed line tagged with the action taken.

## wolframize

The wolframize method will cleanup a line to be passed to
[wolframalpha](http://www.wolframalpha.com).
The following example shows what it does:

    ab + cde (xyz - ijk)
    a*b+c*d*e(x*y*z-i*j*k) # wolframized

## digest

The digest method appends the RMD160 digest of the stripped current line.
This can help in determining if two lines are equal:

    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    # Jxgi2de/YQF4t6EPW2B+NfgJzRM=
    dafjkJA fjaskjAF 1asjsdgfjlkjlafri AFJJFF
    # gx1BzZReswQhxWSRjUqmTsyaKOs=
    dafjkJA fjaskjAF Iasjsdgfjlkjlafri AFJJFF
    # Jxgi2de/YQF4t6EPW2B+NfgJzRM=
