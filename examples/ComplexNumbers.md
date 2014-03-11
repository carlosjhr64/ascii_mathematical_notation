# FamousMathProbs13a
## The rotation problem and Hamilton's discovery of quaternions I

Solution to exercise problem #13.1 from njwildberger's YouTube
[video](http://www.youtube.com/watch?v=uRKZnFAR7yw).

    Q{c1,c2}
      C{c} :: c=(c1,c2) # Complex numbers
      c' :: (c1,-c2) # Conjugate
      C{v,w}
        v.w :: v1w1+v2w2 # Dot Product
        v.w' = v1w1-v2w2
        v|w :: v1w2-v2w1 # Determinant
        v'|w = v1w2+v2w1
        v*w :: (v.w', v'|w) # Multiplication
        v*w = (v1w1-v2w2, v1w2+v2w1)
        v+w :: (v1+w1, v2+w2) # Addition
        v^w :: (v|w)/(v.w) # Turn (or Slope)
        v^w = (v1w2-v2w1)/(v1w1+v2w2)
        C{a,b,c}
          A := a^b # Let A be the turn between a and b.
          B := b^c
          C := c^a

          ### The sum ###
          A+B+C
          (a^b) + (b^c) + (c^a)
          (a|b)/(a.b) + (b|c)/(b.c) + (c|a)/(c.a)
          (a1b2-a2b1)/(a.b) + (b1c2-b2c1)/(b.c) + (c1a2-c2a1)/(c.a)
          (a1b2-a2b1)/(a1b1+a2b2) + (b1c2-b2c1)/(b1c1+b2c2) + (c1a2-c2a1)/(c1a1+c2a2)
          # Going to change variables for terseness.  a1->x, ...
          (xv-yu)/(xu+yv) + (us-vr)/(ur+vs) + (ry-sx)/(rx+sy)

          (x*v-y*u)*(u*r+v*s)*(r*x+s*y)+(u*s-v*r)*(x*u+y*v)*(r*x+s*y)+(r*y-s*x)*(x*u+y*v)*(u*r+v*s)/
          #----------------------------------------------------------------------------------------#
          (xu+yv)*(ur+vs)*(rx+sy)

          # Send the numerator to wolframalpha!
          r^2 u v y^2-r^2 v^2 x y-r s u^2 y^2+r s v^2 x^2+s^2 u^2 x y-s^2 u v x^2
          # 4Oep0plq+JF9cZD83X5mjHP9FLY=

          r^2uvy^2 - r^2v^2xy - rsu^2y^2 + rsv^2x^2 + s^2u^2xy - s^2uvx^2 /
          #---------------------------------------------------------------#
          (xu+yv)*(ur+vs)*(rx+sy)

          ### The product ###
          A*B*C
          (a^b) * (b^c) * (c^a)
          (a|b)/(a.b) * (b|c)/(b.c) * (c|a)/(c.a)
          (a1b2-a2b1)/(a.b) * (b1c2-b2c1)/(b.c) * (c1a2-c2a1)/(c.a)
          (a1b2-a2b1)/(a1b1+a2b2) * (b1c2-b2c1)/(b1c1+b2c2) * (c1a2-c2a1)/(c1a1+c2a2)
          # Going to change variables for terseness.  a1->x, ...
          (xv-yu)/(xu+yv) * (us-vr)/(ur+vs) * (ry-sx)/(rx+sy)

          (x*v-y*u)*(u*s-v*r)*(r*y-s*x)/
          #----------------------------#
          (xu+yv)*(ur+vs)*(rx+sy)

          # Send the numerator to wolframalpha!
          r^2 u v y^2-r^2 v^2 x y-r s u^2 y^2+r s v^2 x^2+s^2 u^2 x y-s^2 u v x^2
          # 4Oep0plq+JF9cZD83X5mjHP9FLY=

          r^2uvy^2 - r^2v^2xy - rsu^2y^2 + rsv^2x^2 + s^2u^2xy - s^2uvx^2 /
          #---------------------------------------------------------------#
          (xu+yv)*(ur+vs)*(rx+sy)

          # By inpection.
          #############################
          A+B+C = A*B*C
          #############################
          # Check the digest!  LOL

[See Notation](../Notation.md)
