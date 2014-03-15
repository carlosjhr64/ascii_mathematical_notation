# The Logic Game

The `Logic Game` is like...
given a `String`(a sentence), and
using only a given set of `String` transformations,
derive at a target `String`, such as `T`.

In this example I'll define the transforms as I go along, but
keep in mind that these transforms are supposed to be prexisting in some system.

    # Defining Tautology
    (w=w) :: T
    # Tautology \((\w)=\1\) T
    # define(:Tautology, '\((\w)=\1\)', 'T')
    # Testing Tautology
    (B=B)
    T # by Tautology

    # Defining Hypothetical Syllogism
    (u==>v,v==>w) :: (u==>w)
    # Hypothetical \((\w)==>(\w),\2==>(\w)\) (\1==>\3)
    # define(:Hypothetical, '\((\w)==>(\w),\2==>(\w)\)', '(\1==>\3)')
    # Testing Hypothetical Syllogism
    (A==>B,B==>C)
    (A==>C) # by Hypothetical

    # Defining a first Axiom
    (A==>C) :: T
    # Axiom1 \(A==>C\) T
    # define(:Axiom1, '\(A==>C\)', 'T')
    # Testing Axiom1
    (A==>C)
    T # by Axiom1

    # OK, I've defined enough for the following simple game.
    # Show the following to be true (a tautology):
    (A==>B,B==>C)
    (A==>C) # by Hypothetical
    T # by Axiom1

See [Notation](../Notation.md)
