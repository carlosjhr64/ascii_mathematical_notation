# FamousMathProbs13a
## The rotation problem and Hamilton's discovery of quaternions I
Unfinished solution to exercise problem #13.1 from njwildberger's YouTube
[video](http://www.youtube.com/watch?v=uRKZnFAR7yw).

    # Exer 13.1
    Q{q1,q2}
      C{c} :: c=(c1,c2)
      c' :: (c1,-c2)
      C{v,w}
        # Dot Product
        v.w :: v1w1+v2w2 ==> v.w' = v1w1-v2w2
        # Determinant
        v|w :: v1w2-v2w1 ==> v'|w = v1w2+v2w1
        # Multiplication
        v*w :: (v.w', v'|w) ==> v*w = (v1w1-v2w2, v1w2+v2w1)
        # Addition
        v+w :: (v1+w1, v2+w2)
        # Turn (or Slope)
        v^w :: (v|w)/(v.w) ==> v^w = (v1w2-v2w1)/(v1w1+v2w2)
        C{a,b,c}
          x := a^b
          y := b^c
          z := c^a
          # The sum...
          s := x+y+z
          s = (a^b) + (b^c) + (c^a)
          s = (a|b)/(a.b) + (b|c)/(b.c) + (c|a)/(c.a)
          s = ((a|b)(b.c)(c.a) + (b|c)(a.b)(c.a) + (c|a)(a.b)(b.c)) / ((a.b)(b.c)(c.a))
          # The product..
          t := x*y*z
          t = (a^b) * (b^c) * (c^a)
          t = (a|b)/(a.b) * (b|c)/(b.c) * (c|a)/(c.a)
          t = (a|b)(b|c)(c|a) / ((a.b)(b.c)(c.a))
          # OK, I refuse to expand s and t out!  :laughing:

[See Notation](../Notation.md)
