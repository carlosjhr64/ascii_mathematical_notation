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
A(√8,√17,√13)
s:=½(√8+√17+√13)
√(s(s-√8)(s-√17)(s-√13)) # Heron's formula
√(½(√8+√17+√13)(½(√8+√17+√13)-√8)(½(√8+√17+√13)-√17)(½(√8+√17+√13)-√13)) # gsub('(?-mix:s)', '½(√8+√17+√13)')
√(½(√8+√17+√13)½(-√8+√17+√13)½(√8-√17+√13)½(√8+√17-√13))
```
The above matches the video prior to the aproximately 5 computation.  Lets confirm:
```
a = Math.sqrt(8)
2.8284271247461903 # run
b = Math.sqrt(17)
4.123105625617661 # run
c = Math.sqrt(13)
3.605551275463989 # run
s = (a+b+c)/2.0
5.2785420129139204 # run
Math.sqrt(s*(s-a)*(s-b)*(s-c))
5.000000000000003 # run
```
With calculators and computers this process has become easy, but
lets see what this used to look like when it was done "by hand":
```
a, b, c = 2.83, 4.12, 3.61 # Maybe we were happy with 3 significant figures
sum = a+b+c = 10.56 # We carry an extra figure for calculations
s = sum/2.0 = 5.28
s-a = 2.45
s-b = 1.16
s-c = 1.67
5.28*2.45*1.16*1.67 =~ 25.06
Math.sqrt(25.06) =~ 5.01 # We might suspect it's really five
```
From a practical point of view, I think this is fine.
In the field, that's what measurements look like.
The video is actually very funny because it totally sets up this very practical formula into being ridiculous by
tricking us into doing something like calculating (√2)(√2) to be aproximately 2 maybe.
But as the video goes on to explain, Heron's formula is the wrong tool for the problem.
Nonetheless, I'll show you can still calculate the area for this problem using Heron's formula exactly.
It's just a horrendous amount of work!
```
√(½(√8+√17+√13)½(-√8+√17+√13)½(√8-√17+√13)½(√8+√17-√13)) # result when we surrendered it to a calculator above
√(½(a+b+c)½(-a+b+c)½(a-b+c)½(a+b-c))                     # substituting a,b,c back in
¼√((a+b+c)(-a+b+c)(a-b+c)(a+b-c))
u,v,w:=-a,-b,-c
¼√((a+b+c)(u+b+c)(a+v+c)(a+b+w))
¼√([(a+b+c)(u+b+c)][(a+v+c)(a+b+w)])
¼√([au+bb+cc+ab+bc+cu+ac+bu+cb][aa+vb+cw+ab+vw+ca+aw+va+cb]) # :ppxpp
¼√([+au+bb+cc+ab+bc+cu+ac+bu+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb])
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb]) # gsub('(?-mix:(\w)u)', 'u\1')
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+cw+ab+vw+ca+aw+va+cb]) # gsub('(?-mix:(\w)v)', 'v\1')
¼√([+ua+bb+cc+ab+bc+uc+ac+ub+cb][+aa+vb+wc+ab+wv+ca+wa+va+cb]) # gsub('(?-mix:(\w)w)', 'w\1')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa+vb+wc+ab+wv+ca+wa+va+cb]) # gsub('(?-mix:\+u)', '-a')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb+wc+ab+wv+ca+wa-ba+cb]) # gsub('(?-mix:\+v)', '-b')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb-cc+ab-cv+ca-ca-ba+cb]) # gsub('(?-mix:\+w)', '-c')
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+cb][+aa-bb-cc+ab+cb+ca-ca-ba+cb]) # -cv => +cb
¼√([-aa+bb+cc+ab+bc-ac+ac-ab+bc][+aa-bb-cc+ab+bc+ac-ac-ab+bc]) # csort
¼√((-aa+bb+cc+ab+bc-ac+ac-ab+bc)(+aa-bb-cc+ab+bc+ac-ac-ab+bc))
¼√((-aa+ab-ab+ac-ac+bb+bc+bc+cc)(+aa+ab-ab+ac-ac-bb+bc+bc-cc)) # tsort
¼√((-aa+0+0+bb+bc+bc+cc)(+aa+0+0-bb+bc+bc-cc)) # :pm
¼√((-aa+bb+bc+bc+cc)(+aa-bb+bc+bc-cc))
¼√((-aa+bb+  2bc+cc)(+aa-bb+  2bc-cc))
¼√((-8 +17+  2bc+13)(+8 -17+  2bc-13))
¼√(( -8+17+13  +2bc)( +8-17-13  +2bc))
¼√(( (22)  +2bc)( (-22)  +2bc)) # compute
¼√( ((2bc)+(22))((2bc)-(22)) )
¼√( (2bc)² - (22)² ) # difference of squares
¼√( (4b²c² - (22)² )
¼√( 4*17*13 - 22*22 )
¼√( (884) - (484) ) # compute
¼√( 884-484 )
¼√( (400) ) # compute
√( (400/16) )
√( ((25/1)) ) # rational (for a while... I was worried)
√( ((((5^2))/(1))) ) # prime_division
√(5^2)
5 # Exactly! :)
```
### Quadrance in the affine plane
```
A1::[a1,b1],A2::[a2,b2]==>:Quadrance(A1,A2)::(a2-a1)^2+(b2-b1)^2
A₁≐[a₁,b₁],A₂≐[a₂,b₂]⇒Q(A₁,A₂)≐(a₂-a₁)²+(b₂-b₁)² # :math
```
In the video, Wildberger makes the case that, to paraphrase in a programmers way,
the following is poor refactoring:
```
:Distance(A1,A2):::Sqrt((a2-a1)^2)+(b2-b1)%2))
:Quadrance(A1,A2):::Distance[A1,A2]^2
```
It's clear that from this point of view, the affine plane A², the proper sequence is:
```
:Quadrance(A1,A2)::(a2-a1)^2+(b2-b1)^2
:Distance(A1,A2):::Sqrt(:Quadrance(A1,A2))

Q[A₁,A₂] ≐ (a₂-a₁)²+(b₂-b₁)²
D[A₁,A₂] ≐ √[Q[A₁,A₂]]
# For now, I'll prefer square brackets to group the object acted on by "operators".
# I'll see how that goes.
```
But in practice things don't look this way.
It's just me with a tape measure and maybe a compass.
And without a compass, it's definitely going to be
Heron's formula with numbers of finite precission... right?
### Archimedes' Theorem
Area of a triangle with quadrances Q₁, Q₂, Q₃:
```
16(:area)^2=:Archimedes[Q1,Q2,Q3]
16α²=Α[Q₁,Q₂,Q₃]
# Proof:
:area=:Sqrt[s(s-d1)(s-d2)(s-d3)],s=(1/2)(d1+d2+d3)             # Heron's formula in regular ASCII
α=√[s(s-d₁)(s-d₂)(s-d₃)],s=½(d₁+d₂+d₃)                         # using extended ascii
α²=s(s-d₁)(s-d₂)(s-d₃)
α²=½(d₁+d₂+d₃)(½(d₁+d₂+d₃)-d₁)(½(d₁+d₂+d₃)-d₂)(½(d₁+d₂+d₃)-d₃) # gsub('(?-mix:s)', '½(d₁+d₂+d₃)')
α²=½½½½(d₁+d₂+d₃)(d₂+d₃-d₁)(d₁+d₃-d₂)(d₁+d₂-d₃)
α²=¼²(d₁+d₂+d₃)(d₂+d₃-d₁)(d₁+d₃-d₂)(d₁+d₂-d₃)                  # This matches Archimedes' formula
α²=¼²Α[d₁²,d₂²,d₃²]
16α²=Α[d₁²,d₂²,d₃²]
16α²=Α[Q₁,Q₂,Q₃]                                               # b/c in the Real world, Q is d² :))
```
No denying this this is a very nice theoretical result.
So there's a big triangle in my back yard whose area I want to know
because I'm filling it with concrete.
I'm using Heron's formula!
:laughing:

No, wait...
```
16α² = Α[Q₁,Q₂,Q₃] = 4Q₁Q₂-(Q₁+Q₂-Q₃)²
```
OK, we can use this form.
:relieved:

It's a bit sly to use simple integers to show off this way,
so I'll rework the original problem instead:
```
a, b, c = 2.83, 4.12, 3.61
[2.83, 4.12, 3.61] # run
aa, bb, cc = (a*a).round(3),  (b*b).round(3), (c*c).round(3)
[8.009, 16.974, 13.032] # run
alpha = (4*aa*bb).round(3)
543.779 # run
beta =  (aa+bb-cc).round(3)
11.951 # run
beta2 = (beta*beta).round(3)
142.826 # run
diff = (alpha - beta2).round(3)
400.953 # run
area2 = (diff/16.0).round(3)
25.06 # run
area = Math.sqrt(area2).round(3)
5.006 # run
```
Although Wilderberger has clearly demonstrated his case for theory in the affine plane,
it's not obvious we have an improved practical formula yet.
Let's write out the two methods in Ruby code to see if the case can be made clearer.
```
def herons_area(a,b,c)
  s = (a+b+c)/2.0
  Math.sqrt(s*(s-a)*(s-b)*(s-c))
end

def archimedes_area(a,b,c)
  q1, q2, q3 = a*a, b*b, c*c
  x = q1+q2-q3
  Math.sqrt( (4.0*q1*q2-(x*x))/16.0 )
end
```
Heron's method has two lines of code,
1 root, 1 division, 3 multiplications, 3 subtractions, and 2 additions.

Archimedes' method has three lines of code (one with multiple assignments),
1 root, 1 division, 6 multiplications, 2 subtractions, and 1 addition.

So in practice, given three measured lengths for the side of a triangle, with pencil and paper...
you'd still want to use Heron's formula.
