# MathFoundations124:
## Heron's formal, Archimedes' function, and the TQF

Notes on njwildberger's [video](https://www.youtube.com/watch?v=iMWEiPuFhBQ).

Most have heard of "Pythagora's Theorem", which stablishes a relationship among the sides of a right triangle.
But the "Triple Quad Formula" stablishes a relationship among three points on a line.
The following is an analysis of the relationship among three points and the conditions for colinearity and orthogonality.
Except for some change of variables, it closely follows the video.

The Quadrance between two points on a line:
```
:Rat{a,b},A::[a],B::[b]
  Q(A,B)::a^2+b^2
```

I'll use a convention that when a number follows a letter,
the number is just an enumeration label.
Thus:
```
3A1B2 :: 3*(A1)*(B2)
```

Given three points on a line:
```
:Rat{a,b,c},A::[a],B::[b],C::[c]
  Qa :: Q(B,C)
  Qb :: Q(A,C)
  Qc :: Q(A,B)
```

Triple Quad Formula(TQF):
```
(Qa+Qb+Qc)=2(Qa^2+Qb^2+Qc^2)
```

Archimedes' function:
```
:Archimedes(Qa,Qb,Qc) :: (Qa+Qb+Qc)^2-2(Qa^2+Qb^2+Qc^2) = 4QaQb-(Qa+Qb-Qc)^2
```

Theorem:
```
:Rat{a,b,c}:a+b=c,A:=a^2,B:=b^2,C:=c^2==>:Archimedes(A,B,C)=0
```
Proof:
```
a+b=c                 # Given
(a+b)^2=c^2           # Square both sides
[(a+b)^2]=c^2         # Prep
[a^2+2ab+b^2]=c^2     # binomial2
A+2ab+B=C             # Simple substitutions
A+B-C=-2ab            # Collecting like terms on each side
(A+B-C)^2=(-2ab)^2    # Square both sides
(A+B-C)^2=4(a^2)(b^2)
(A+B-C)^2=4AB         # Simple substitutions
4AB-(A+B-C)^2=0       # Rearragement of terms, this is Archimedes asymetric form.
:Achimides(A,B,C)=0
```

Theorem:
```
:Rat{a,b,c},A:=a^2,B:=b^2,C:=c^2
==>:Archimdedes(A,B,C)=(+a+b+c)(+a+b-c)(+a-b+c)(-a+b+c)
```
Proof:
```
:Archimededes(A,B,C)
4AB-(A+B-C)^2                         # Asymmetric form
4(a^2)(b^2)-(a^2+b^2-c^2)^2           # Simple substition
4(a²)(b²)-(a²+b²-c²)²                 # superscript
4a²b²-(a²+b²-c²)²
(2ab)²-(a²+b²-c²)²                    # Collecting squares
((2ab)-(a²+b²-c²))((2ab)+(a²+b²-c²))  # Difference of squares
(2ab-a²-b²+c²)(2ab+a²+b²-c²)
(+c²-a²+2ab-b²)(+a²+2ab+b²-c²)        # Rearranged
(c²-(a-2ab+b²))((a²+2ab+b²)-c²)       # Grouped
(c²-(a-b)²)((a+b)²-c²)                # Well... obviously!
(c-(a-b))(c+(a-b))((a+b)-c)((a+b)+c)  # Difference of squares
(c-a+b)(c+a-b)(a+b-c)(a+b+c)
(a+b+c)(a+b-c)(c+a-b)(c-a+b)          # Rearraged groupings
(+a+b+c)(+a+b-c)(+a-b+c)(-a+b+c)      # Sorted variables in groups and explicit signs
```

OK, so let's plug someone's [book](http://www.amazon.com/Divine-Proportions-Rational-Trigonometry-Universal/dp/097574920X).
:smile:

Exer 124.1: Show that TQF can be expressed as a quadratic equation in one of its terms:
```
:Archimedes(A,B,C)=0
(A+B+C)^2-2(AA+BB+CC)=0                                 # Using symetric form
[(A+B+C)^2]-2(AA+BB+CC)=0
[(A+B+C)(A+B+C)]-2(AA+BB+CC)=0                          # ww
[AA+BB+CC+AB+BC+CA+AC+BA+CB]-2(AA+BB+CC)=0              # ppxpp
+AA +BB +CC +AB +BC +CA +AC +BA +CB -2AA -2BB -2CC =0
+AA +BB +CC +AB +BC +AC +AC +AB +BC -2AA -2BB -2CC =0   # csort
+AA +AB +AB +AC +AC +BB +BC +BC +CC -2AA -2BB -2CC =0   # wsort
    +AB +AB +AC +AC     +BC +BC     - AA - BB - CC =0   # Cancellations
       +2AB    +2AC        +2BC     - AA - BB - CC =0   # Collections
       -2AB    -2AC        -2BC     + AA + BB + CC =0   # Reverse signs
+AA -2AB -2AC +BB -2BC +CC =0                           # Rearranged
AA-(2AB+2AC)+(BB-2BC+CC)=0                              # Grouped
A^2-(2AB+2AC)+(B-C)^2=0                                 # Squares
A^2-2(B+C)A+(B-C)^2=0                                   # Factoring
A²-2(B+C)A+(B-C)²=0                                     # superscript
```
I chose to work with A, B, and C instead of Q1, Q2, and Q3 as shown in the video for compactness.
Note that the three terms are completely symmetric, and
if A,B,C is Q3,Q1,Q2, then as in the video you get the equation:
```
Q3^2 - 2(Q1+Q2)Q3 + (Q1-Q2)^2 = 0
Q3² - 2(Q1+Q2)Q3 + (Q1-Q2)² = 0 # superscript
Q₃² - 2(Q₁+Q₂)Q₃ + (Q₁-Q₂)² = 0 # subscript
```

Quadratic Compatibility Theorem.
Did I look ahead?  Maybe.  :smirk:
Exer 124.2:  Show when two coupled quadratics has a solution:
```
(x-a)^2=A,(x-b)^2=B <=?=> :Archimedes(A,B,(a-b)^2)=0   # Prove this

[(x-a)^2]=A,[(x-b)^2]=B                                # Given
[x^2-2xa+a^2]=A,[x^2-2xb+b^2]=B                        # binomial2
[x²-2xa+a²]=A,[x²-2xb+b²]=B                            # superscript
x²-2xa+a²-A=0,x²-2xb+b²-B=0
x²-2xa+a²-A=x²-2xb+b²-B
  -2xa+a²-A=  -2xb+b²-B
  -2xa+a²-A   +2xb-b²+B = 0
+2xb -2xa +a² -b² +B -A =0                             # rearranged
(+2xb-2xa)+(a²-b²)+(B-A)=0                             # Grouped
(+2xb-2xa)+(a-b)(a+b)+(B-A)=0                          # Difference of squares
2(b-a)x+(a-b)(a+b)+(B-A)=0                             # Factoring
-2(a-b)x+(a-b)(a+b)-(A-B)=0                            # Sorting terms
-2x+(a+b)-(A-B)/(a-b)=0                                # Divide by a-b
2x=(a+b)-(A-B)/(a-b)

x = ½(a+b) - ½(A-B)/(a-b)                              # OK, this matches MF124 video.

# TODO: Plug this back in?
(x-a)^2=A
```
