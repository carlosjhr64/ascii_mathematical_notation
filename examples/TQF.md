# MathFoundations124:
## Heron's formal, Archimedes' function, and the TQF

Notes on njwildberger's [video](https://www.youtube.com/watch?v=iMWEiPuFhBQ).

Most have heard of "Pythagora's Theorem", which stablishes a relationship among the sides of a right triangle.
But the "Triple Quad Formula" stablishes a relationship among three points on a line.
The following is an analysis of the relationship among three points and the conditions for colinearity and orthogonality.
It closely follows the video.

The Quadrance between two points on a line:
```
:Rat{a,b}
A :: [a]
B :: [b]
Q(A,B) :: a^2+b^2
```

I'll use a convention that when a number follows a letter,
the number is just an enumeration label.
Thus 3A1B2 means 3*(A1)*(B2).

Given three points on a line:
```
Rat{a1,a2,a3}
A1 :: [a1]
A2 :: [a2]
A3 :: [a3]
Q1 :: Q(A2,A3)
Q2 :: Q(A1,A3)
Q3 :: Q(A1,A2)
```

Triple Quad Formula(TQF):
```
(Q1+Q2+Q3)=2(Q1^2+Q2^2+Q3^2)
```

Archimedes' function:
```
:Archimedes(Q1,Q2,Q3) :: (Q1+Q2+Q3)^2-2(Q1^2+Q2^2+Q3^2) = 4Q1Q2-(Q1+Q2-Q3)^2
```

Theorem:
```
:Rat{d1,d2,d3}:d1+d2=d3,D1:=d1^2,D2:=d2^2,D3:=d3^2==>:Archimedes(D1,D2,D3)=0
```
Proof:
```
d1 + d2 = d3                     # Given
(d1 + d2)^2 = d3^2               # Square both sides
d1^2 + 2d1d2 + d2^2 = d3^2       # Binomial Expansion
D1 + 2d1d2 + D2 = D3             # Simple substitution
D1 + D2 - D3 = -2d1d2            # Collecting similar terms on each side
(D1 + D2 - D3)^2 = (-2d1d2)^2    # Square both sides
(D1 + D2 - D3)^2 = 4(d1^2)(d2^2) # Squaring the terms on the right side.
(D1 + D2 - D3)^2 = 4D1D2         # Simple substitution
(D1 + D2 - D3)^2 - 4D1D2 = 0     # This is Achimedes asymetric form.
:Archimedes(D1,D2,D3) = 0
```

Theorem:
```
:Rat{d1,d2,d3},D1:=d1^2,D2:=d2^2,D3:=d3^2
==>:Archimdedes(D1,D2,D3)=(+d1+d2+d3)(+d1+d2-d3)(+d1-d2+d3)(-d1+d2+d3)
```
Proof:
```
:Archimededes(D1,D2,D3)
4D1D2-(D1+D2-D3)^2                                                       # Asymmetric form
4(d1^2)(d2^2) - (d1^2 + d2^2 - d3^2)^2                                   # Simple substition
(2d1d2)^2 - (d1^2 + d2^2 - d3^2)^2                                       # Collecting squares
   # We have difference of squares! Let's define a tranform for it.
   diffsquares |(.)\^2\-(.)\^2| ((\1+\2)(\1-\2)) # define
(((2d1d2)^2-(d1^2+d2^2-d3^2)^2))                                         # Transform setup
(((2d1d2)+(d1^2+d2^2-d3^2))((2d1d2)-(d1^2+d2^2-d3^2)))                   # diffsquares
(2d1d2+d1^2+d2^2-d3^2)(2d1d2-d1^2-d2^2+d3^2)                             # Removed unneeded parenthesis
(d1^2 + 2d1d2 + d2^2 - d3^2)(d3^2 - d1^2 + 2d1d2 - d2^2)                 # Rearangement
((d1^2+2d1d2+d2^2) - d3^2)(d3^2 - (d1^2-2d1d2+d2^2))                     # Grouping
  # We now have some binomials.
  binomials |(.)\^2(@)2\1(.)\+\3\^2| ((\1\2\3)^2)                        # define
((((d1)^2+2(d1)(d2)+(d2)^2)) - d3^2)(d3^2 - (((d1)^2-2(d1)(d2)+(d2)^2))) # Setup
((((d1)+(d2))^2) - d3^2)(d3^2 - (((d1)-(d2))^2))                         # binomials
((d1+d2)^2 - d3^2)(d3^2 - (d1-d2)^2)                                     # Cleanup
(((d1+d2)^2-(d3)^2))(((d3)^2-(d1-d2)^2))                                 # Setup for diffsquares
(((d1+d2)+(d3))((d1+d2)-(d3)))(((d3)+(d1-d2))((d3)-(d1-d2)))             # diffsquares
(d1+d2+d3)(d1+d2-d3)(d3+d1-d2)(d3-d1-d2)                                 # Cleanup
(d1+d2+d3)(d1+d2-d3)(d1-d2+d3)(-d1+d2+d3)                                # Rearranging
```

OK, so let's plug someone's [book](http://www.amazon.com/Divine-Proportions-Rational-Trigonometry-Universal/dp/097574920X).
:smile:
