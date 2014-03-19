# Mathematical Notation in ASCII

* github   https://www.github.com/carlosjhr64/ascii_mathematical_notation
* rubygems https://rubygems.org/gems/ascii_mathematical_notation

TODO: I have not published the gem yet, but it'll be there eventually.

## Description

Write your math using plain ASCII text files with Vim-Ruby.

## Dual projects

This project as essentially become two.
One is to figure out how to easily type out mathematics in a regular kerboard as
ASCII plain text.
The other is to write a vim-ruby script to support writting such texts.

* [Notation, current version](Notation.md)
* [Vim-Ruby Script](Script.md)

## Install

    sudo gem install ascii_mathematical_notation

## Motivation

This is a continuation of the work I started in
[YNot2Day's NOTATION](http://web.archive.org/web/20050101044904/http://ynot2day.com/TEMPLATES/PROJECTS/MATHEMATICS/THEORY/NOTATION),
the last snapshot found in the Internet Archive Wayback Machine copied here as Notation.html.

Consider [Weierstrass](http://en.wikipedia.org/wiki/Karl_Weierstrass)
formal definition of continuity written in the notation described in YNot2Day:

    CONTINOUS{f(x=x0)} = {e=/0}({d=/0}: f{x}(|x-x0|\=d =/ |f(x)-f(x0)|\=e)

The above has the same meaning as:

    f(x) is continuous at x=x0 if for all e>0
    there exists d>0 such that for every x in the domain of f,
    |x-x0|<d implies |f(x)-f(x0)|<e.

I will now not worry about html issues and will add semantics,
so I'll write it as:

    Continous{f(x=x0)} :: {e>0}({d>0}: f{x}(|x-x0|<d ==> |f(x)-f(x0)|<e)

The :: is logically equivalent to <==>, but
with the added semantic that this is to be treated as a definition.
Here's is one for Arithmetic:

    N{z}(N{n}!: z = 0n)

which is read as:

    For all positive (and hence non-zero) integers z,
    there is no positive integer n such that 0*n is z.

See also [ASCIIMathML](http://www1.chapman.edu/~jipsen/mathml/asciimath.html).
