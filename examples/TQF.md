# MathFoundations124:
## Heron's formula, Archimedes' function, and the TQF

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

### Triple Quad Formula(TQF)
```
(Qa+Qb+Qc)=2(Qa^2+Qb^2+Qc^2)
```

### Archimedes' function
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

### Archimedes' formula
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

### TQF quadratic equation
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

### Quadratic Compatibility Theorem
Did I look ahead?  Maybe.  :smirk:
Exer 124.2:  Show when two coupled quadratics has a solution:
```
(x-a)^2=A,(x-b)^2=B <=?=> :Archimedes(A,B,(a-b)^2)=0 # Prove this

[(x-a)^2]=A,[(x-b)^2]=B                   # Given
[x^2-2xa+a^2]=A,[x^2-2xb+b^2]=B           # binomial2
[x²-2xa+a²]=A,[x²-2xb+b²]=B               # superscript
x²-2xa+a²-A=0,x²-2xb+b²-B=0
x²-2xa+a²-A=x²-2xb+b²-B
  -2xa+a²-A=  -2xb+b²-B
  -2xa+a²-A   +2xb-b²+B = 0
+2xb -2xa +a² -b² +B -A =0                # rearranged
(+2xb-2xa)+(a²-b²)+(B-A)=0                # Grouped
(+2xb-2xa)+(a-b)(a+b)+(B-A)=0             # Difference of squares
2(b-a)x+(a-b)(a+b)+(B-A)=0                # Factoring
-2(a-b)x+(a-b)(a+b)-(A-B)=0               # Sorting terms
-2x+(a+b)-(A-B)/(a-b)=0                   # Divide by a-b
2x=(a+b)-(A-B)/(a-b)

x = ½(a+b) - ½(A-B)/(a-b)                 # OK, this matches MF124 video.

(x-a)²=A                                  # One of the givens
((½(a+b)-½(A-B)/(a-b))-a)²=A              # Plug previous result back in
(½b-½a-½(A-B)/(a-b))²=A                   # (1/2)a - a
¼(b-a-(A-B)/(a-b))²=A
(b-a-(A-B)/(a-b))²=4A
(-(a-b)-(A-B)/(a-b))²=4A
(-(a-b)²-(A-B))²=4A(a-b)²
u:=(a-b)²,v:=(A-B)
(-u-v)²=4Au
((-u)(-u)+(-u)(-v)+(-v)(-u)+(-v)(-v))=4Au
u²+2uv+v²=4Au                             # ...perplexed by the square of a negative. :))
u²+2u(A-B)+(A-B)²=4Au
+u² +2u(A-B) -4Au +(A-B)² =0
+u² +2uA-2uB -4Au +(A-B)² =0
+u² -2uA-2uB      +(A-B)² =0
+u² -2u(A+B)      +(A-B)² =0
+u² -2u(A+B)   +A²-2AB+B² =0
+u² -2u(A+B)   +A²+2AB+B² =4AB            # Wow, only b/c I know where I'm going!
+u² -2u(A+B)   +(A+B)²    =4AB
(u-(A+B))²=4AB

((a-b)²-(A+B))²=4AB                       # Substitute "u" back in and done!

# I don't see a shorter path to this result, ouch!
```

### Heron's formula
#### Triangle defined by lengths
For triangle with lengths a,b,c:
```
s:=(1/2)(a+b+c)
s:=½(a+b+c) # fractions
:Area = :Sqrt(s(s-a)(s-b)(s-c))
:Area = :√(s(s-a)(s-b)(s-c)) # math
```
Example:
```
:Area(4,5,7)
  s=(4+5+7)/2
  s=(8/1)                             # rational
  √((8/1)((8/1)-4)((8/1)-5)((8/1)-7))
  √((8/1)(4/1)(3/1)(1/1))             # compute
  √((8/1)*(4/1)*(3/1)*(1/1))          # gsub('(?-mix:\)\()', ')*(')
  √(96/1)                             # compute
  √(((2^5)*(3))/(1))                  # prime_division
  4√6                                 # b/c I'm smart? No, well alright...
  √(2^5*3)
  √(2^4*2*3)
  √((2^2)*(2^2)*2*3)
  √(4*4*2*3)
  4√(2*3)
  4"√6"
```
#### Triangle defined by vertices
```
:Quadrance([a,b],[c,d])::(a-c)^2+(c-d)^2
:Length(X,Y):::Sqrt(:Quadrance(X,Y))
```
A short digression here.
Notice we have `x:::Function(y)`.
We need to ensure that the language does not rely on "Look Aheads".
That is, word(token) recognition stops once we have a valid word recognized.
We should not have to look ahead to the next character to disambiguate.
I have allowed an exception for `:` as in `:word` which has a regex of `:\w+`.
This is needed because at times we'll need to use more than one letter for a word.
So for `x:::Function(y)`, we read `x` recognized, `:` check ahead,
`::` recognized as `defined as`,
`:` check ahead, `:F`, `:Fu`,... `:Function\b`, `:Function` token recognized...
So ':::' can never be valid word, else the above becomes ambiguous.

When obvious from the immediately preceeding context,
we'll allow `F(x):::Fuction(x)` implicitly.

Consider a triangle of vertices A, B, C:
```
A:=[0,0],B:=[2,3],C:=[4,1]
  a:=L(B,C)=:Sqrt((2-3)^2+(4-1)^2)
            √((2-4)²+(3-1)²)
            √((-2)²+(2)²)
            √(4+4)
            √(8)
            √((2*2)*2) # from prime division
            2√2
  b:=L(A,C)=:Sqrt((0-4)^2+(0-1)^2)
            √((0-4)²+(0-1)²)
            √((4)²+(-1)²)
            √(16+1)
            √17
  c:=L(A,B)=:Sqrt((0-2)^2+(0-3)^2)
            √(2²+3²)
            √(4+9)
            √13
  a, b, c = 2√2, √17, √13
```
The last line is a "Ruby-ism".
Area of this example by Heron's formula:
```
A(2√2,√17,√13)
s:=½(2√2+√17+√13)
√(s(s-2√2)(s-√17)(s-√13))
# gsub('s', '½(2√2+√17+√13)')
√(½(2√2+√17+√13)(½(2√2+√17+√13)-2√2)(½(2√2+√17+√13)-√17)(½(2√2+√17+√13)-√13)) # :-O!
√(½(2√2+√17+√13)(½(-2√2+√17+√13))(½(2√2-√17+√13))(½(2√2+√17-√13)))
# its going to be a bit of work...
¼√((2√2+√17+√13)(-2√2+√17+√13)(2√2-√17+√13)(2√2+√17-√13))
¼√((√8+√17+√13)(-√8+√17+√13)(√8-√17+√13)(√8+√17-√13))
a, b, c := √8, √17, √13
u, v, w := -a, -b, -c
¼√([(a+b+c)(u+b+c)][(a+v+c)(a+b+w)])
¼√([au+bb+cc+ab+bc+cu+ac+bu+cb][aa+vb+cw+ab+vw+ca+aw+va+cb]) # :ppxpp
¼√([au+bb+cc+ab+bc+cu+ac+bu+cb][aa+vb+cw+ab+vw+ca+aw+va+cb]) # :ppxpp
¼√([+au+bb+cc+ab+bc+cu+ac+bu+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb])
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb]) # gsub('(?-mix:(\w)u)', 'u\1')
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb]) # gsub('(?-mix:(\w)v)', 'v\1')
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+wc+ab+wv+ca+wa+va+cb]) # gsub('(?-mix:(\w)w)', 'w\1')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa+vb+wc+ab+wv+ca+wa+va+cb]) # gsub('(?-mix:\+u)', '-a')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb+wc+ab+wv+ca+wa-ba+cb]) # gsub('(?-mix:\+v)', '-b')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb-cc+ab-cv+ca-ca-ba+cb]) # gsub('(?-mix:\+w)', '-c')
# notice that from wv we have -cv.
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb-cc+ab+cb+ca-ca-ba+cb]) # -cv => +cb
α, β, κ := aa, bb, cc # just for compactness for now
¼√([-α+bb+cc+ab+bc-ac+ac-ab+cb][+α-bb-cc+ab+cb+ca-ca-ba+cb]) # gsub('(?-mix:aa)', 'α')
¼√([-α+β+cc+ab+bc-ac+ac-ab+cb][+α-β-cc+ab+cb+ca-ca-ba+cb]) # gsub('(?-mix:bb)', 'β')
¼√([-α+β+κ+ab+bc-ac+ac-ab+cb][+α-β-κ+ab+cb+ca-ca-ba+cb]) # gsub('(?-mix:cc)', 'κ')
¼√([-α+β+κ+ab+bc-ac+ac-ab+bc][+α-β-κ+ab+bc+ac-ac-ab+bc]) # csort
¼√(((-α+β+κ)+(ab+bc-ac+ac-ab+bc))((+α-β-κ)+(ab+bc+ac-ac-ab+bc))) # grouping
¼√(((-α+β+κ)+( +ab -ab +bc +ac -ac +bc))((+α-β-κ)+( +ab -ab +ac -ac +bc +bc))) # w-sorting
¼√(((-α+β+κ)+(         +bc         +bc))((+α-β-κ)+(                 +bc +bc))) # cancelations
¼√(((-α+β+κ)+2bc)((+α-β-κ)+2bc))
γ := +α-β-κ
¼√[(-γ+(2bc))(γ+(2bc))]
¼√[((2bc)-γ)((2bc)+γ)]
¼√[(2bc)²+γ²]
```
