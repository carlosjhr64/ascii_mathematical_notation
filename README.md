## Mathematical Notation in ASCII

This is a continuation of the work started by
[YNot2Day's NOTATION](http://web.archive.org/web/20050101044904/http://ynot2day.com/TEMPLATES/PROJECTS/MATHEMATICS/THEORY/NOTATION),
the last snapshot found in the Internet Archive Wayback Machine copied here as Notation.html.

## Motivation

Consider [Weierstrass](http://en.wikipedia.org/wiki/Karl_Weierstrass)
formal definition of continuity written in the notation described in YNot2Day:

    CONTINOUS{f(x=x0)} = {e=/0}({d=/0}: f{x}(|x-x0|\=d =/ |f(x)-f(x0)|\=e)

The above has the same meaning as:

    f(x) is continuous at x=x0 if for all e>0
    there exists d>0 such that for every x in the domain of f,
    |x-x0|<d implies |f(x)-f(x0)|<e.

We will not worry about html issues and will add semantics,
so we will write it as:

    Continous{f==x0} :: {e>0}({d>0}: f{x}(|x-x0|<d ==> |f(x)-f(x0)|<e)

The :: is logically equivalent to <==>, but
with the added semantic that this is to be treated as a definition.
Here's is one for Arithmetic:

    N{z}(N{n}!: z == 0n)

which is read as:

    For all positive (and hence non-zero) integers z,
    there is no positive integer n such that 0*n is z.

It's my opinion that the standard mathematical notation is a form of "short hand", and
that we can do much better.
And that the notation should be parseable by a computer
not so much so that the computer may do mathematics but
to ensure the statement is meaninful.
For instance "N{z}" to the computer might mean "z = 1 + rand(1000)".
That is, it picks some number to assign to z, and
proceeds to see if it can make sense of the rest of the statement.
Or we could try a direct translation to into Ruby code:

    # For all intergers greater than zero, twice that integer is greater.
    # Z{n>0}(2*n>n)
    (Z=[-3,-2,-1,0,1,2,3]).select{|n| n>0}.inject(true){|b, n| b and (2*n > n)} #=> true

The problem is that it's easy to write nonsense and 
fall under the illusion that one has written something.

See also [ASCIIMathML](http://www1.chapman.edu/~jipsen/mathml/asciimath.html).
