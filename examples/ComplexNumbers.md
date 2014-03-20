# FamousMathProbs13a
## The rotation problem and Hamilton's discovery of quaternions I

Solution to exercise problem #13.1 from njwildberger's YouTube
[video](http://www.youtube.com/watch?v=uRKZnFAR7yw).

```
Q{c1,c2}
  C{c} :: c=(c1,c2) # Complex numbers
  c' :: (c1,-c2) # Conjugate
  C{v,w}
    (v1,v2) := v
    (w1,w2) := w
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
      (a^b)+(b^c)+(c^a) # A,B,C
      ((a|b)/(a.b))+((b|c)/(b.c))+((c|a)/(c.a)) # Turn
      ((a|b)(b.c)+(b|c)(a.b))/((a.b)(b.c))+((c|a)/(c.a)) # Adding Fractions
      # For the second fadd, I'll need a change of variables.
      u := (a|b)(b.c)+(b|c)(a.b)
        u \(a\|b\)\(b\.c\)\+\(b\|c\)\(a\.b\) u
        u: \(a\|b\)\(b\.c\)\+\(b\|c\)\(a\.b\) --> u # define
      v := (a.b)(b.c)
        v \(a\.b\)\(b\.c\) v
        v: \(a\.b\)\(b\.c\) --> v # define
      ((a|b)(b.c)+(b|c)(a.b))/((a.b)(b.c))+((c|a)/(c.a)) # "
      (u)/((a.b)(b.c))+((c|a)/(c.a)) # u
      (u)/(v)+((c|a)/(c.a)) # v
      ((u)/(v))+((c|a)/(c.a)) # Grouping for fadd
      ((u)(c.a)+(c|a)(v))/((v)(c.a)) # fadd
      u := (a|b)(b.c)+(b|c)(a.b)
        u u (a|b)(b.c)+(b|c)(a.b)
        u: u --> (a|b)(b.c)+(b|c)(a.b) # define
      v := (a.b)(b.c)
        v v (a.b)(b.c)
        v: v --> (a.b)(b.c) # define
      ((u)(c.a)+(c|a)(v))/((v)(c.a)) # "
      (((a|b)(b.c)+(b|c)(a.b))(c.a)+(c|a)(v))/((v)(c.a)) # u
      (((a|b)(b.c)+(b|c)(a.b))(c.a)+(c|a)((a.b)(b.c)))/(((a.b)(b.c))(c.a)) # v
      # Next we'll manually invoke associativity
      (((a|b)(b.c)(c.a)+(b|c)(a.b)(c.a))+((c|a)(a.b)(b.c)))/(((a.b)(b.c))(c.a)) # v
      # And manually remove un-needed groupings
      ((a|b)(b.c)(c.a)+(b|c)(a.b)(c.a)+(c|a)(a.b)(b.c))/((a.b)(b.c)(c.a))

      # And write numerator over denomenator
      ((a|b)(b.c)(c.a)+(b|c)(a.b)(c.a)+(c|a)(a.b)(b.c)) /
      #-------------------------------------------------#
      ((a.b)(b.c)(c.a))
      # We might have to expand this out.  :((

      ### The product ###
      A*B*C
      (a^b)*(b^c)*(c^a) # A,B,C
      ((a|b)/(a.b))*((b|c)/(b.c))*((c|a)/(c.a)) # cturn0
      (((a|b)(b|c))/((a.b)(b.c)))*((c|a)/(c.a)) # fmult
      # For the second fmult, I'll need a change of variables.
      u := (a|b)(b|c)
        u \(a\|b\)\(b\|c\) u
        u: \(a\|b\)\(b\|c\) --> u # define
      v := (a.b)(b.c)
        v \(a\.b\)\(b\.c\) v
        v: \(a\.b\)\(b\.c\) --> v # define
      (((a|b)(b|c))/((a.b)(b.c)))*((c|a)/(c.a)) # "
      ((u)/((a.b)(b.c)))*((c|a)/(c.a)) # u
      ((u)/(v))*((c|a)/(c.a)) # v
      (((u)(c|a))/((v)(c.a))) # fmult
      u := (a|b)(b|c)
        u u (a|b)(b|c)
        u: u --> (a|b)(b|c) # define
      v := (a.b)(b.c)
        v v (a.b)(b.c)
        v: v --> (a.b)(b.c) # define
      (((u)(c|a))/((v)(c.a))) # "
      ((((a|b)(b|c))(c|a))/((v)(c.a))) # u
      ((((a|b)(b|c))(c|a))/(((a.b)(b.c))(c.a))) # v
      # Manually removing un-needed groupings
      (a|b)(b|c)(c|a)/((a.b)(b.c)(c.a))

      # Numerator over denominator
      (a|b)(b|c)(c|a) /
      #---------------#
      ((a.b)(b.c)(c.a))

      # Notice that to show A+B+C=A*B*C, it's enough to show that
      # ((a|b)(b.c)(c.a)+(b|c)(a.b)(c.a)+(c|a)(a.b)(b.c)) = (a|b)(b|c)(c|a)

      # Consider:
      ((a|b)(b.c)(c.a)+(b|c)(a.b)(c.a)+(c|a)(a.b)(b.c))
      ((a|b)(b1c1+b2c2)(c1a1+c2a2)+(b|c)(a1b1+a2b2)(c1a1+c2a2)+(c|a)(a1b1+a2b2)(b1c1+b2c2)) # cdot0
      ((a1b2-a2b1)(b1c1+b2c2)(c1a1+c2a2)+(b1c2-b2c1)(a1b1+a2b2)(c1a1+c2a2)+(c1a2-c2a1)(a1b1+a2b2)(b1c1+b2c2)) # cdet0

      # To make this more manageable, we'll do a a2x variable change.  See the a2x Array file.
      ((a1b2-a2b1)(b1c1+b2c2)(c1a1+c2a2)+(b1c2-b2c1)(a1b1+a2b2)(c1a1+c2a2)+(c1a2-c2a1)(a1b1+a2b2)(b1c1+b2c2)) # "
      ((xv-yu)(ur+vs)(rx+sy)+(us-vr)(xu+yv)(rx+sy)+(ry-sx)(xu+yv)(ur+vs)) # a2x
      ((xv-yu)(urrx+ursy+vsrx+vssy)+(us-vr)(xurx+xusy+yvrx+yvsy)+(ry-sx)(xuur+xuvs+yvur+yvvs)) # pxp
      ((xvurrx+xvursy+xvvsrx+xvvssy-yuurrx-yuursy-yuvsrx-yuvssy)+(usxurx+usxusy+usyvrx+usyvsy-vrxurx-vrxusy-vryvrx-vryvsy)+(ryxuur+ryxuvs+ryyvur+ryyvvs-sxxuur-sxxuvs-sxyvur-sxyvvs)) # mxppp
      # Remove un-needed groupings
      xvurrx+xvursy+xvvsrx+xvvssy-yuurrx-yuursy-yuvsrx-yuvssy+usxurx+usxusy+usyvrx+usyvsy-vrxurx-vrxusy-vryvrx-vryvsy+ryxuur+ryxuvs+ryyvur+ryyvvs-sxxuur-sxxuvs-sxyvur-sxyvvs
      rruvxx+rsuvxy+rsvvxx+ssvvxy-rruuxy-rsuuyy-rsuvxy-ssuvyy+rsuuxx+ssuuxy+rsuvxy+ssuvyy-rruvxx-rsuvxy-rrvvxy-rsvvyy+rruuxy+rsuvxy+rruvyy+rsvvyy-rsuuxx-ssuvxx-rsuvxy-ssvvxy # csort
      (rruvxx+rsuvxy+rsvvxx+ssvvxy-rruuxy-rsuuyy-rsuvxy-ssuvyy+rsuuxx+ssuuxy+rsuvxy+ssuvyy-rruvxx-rsuvxy-rrvvxy-rsvvyy+rruuxy+rsuvxy+rruvyy+rsvvyy-rsuuxx-ssuvxx-rsuvxy-ssvvxy) # Grouping fo tsort
      (+rruuxy-rruuxy+rruvxx-rruvxx+rruvyy-rrvvxy+rsuuxx-rsuuxx-rsuuyy+rsuvxy+rsuvxy+rsuvxy-rsuvxy-rsuvxy-rsuvxy+rsvvxx+rsvvyy-rsvvyy+ssuuxy-ssuvxx+ssuvyy-ssuvyy+ssvvxy-ssvvxy) # tsort
      (+0+0+rruvyy-rrvvxy+0-rsuuyy+rsuvxy+rsuvxy+0-rsuvxy-rsuvxy+rsvvxx+0+ssuuxy-ssuvxx+0+0) # cancellations
      (+rruvyy-rrvvxy-rsuuyy+rsuvxy+rsuvxy-rsuvxy-rsuvxy+rsvvxx+ssuuxy-ssuvxx) # trivial simplification
      (+rruvyy-rrvvxy-rsuuyy+rsuvxy-rsuvxy+rsvvxx+ssuuxy-ssuvxx) # cancellations
      (+rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx) # cancellations
      rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx # trivial simplification

      #########################################
      rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx
      bXkkU64x3rgJpGW0RPJGOlOvMtM= # digest
      #########################################

      # Consider:
      (a|b)(b|c)(c|a)
      (a1b2-a2b1)(b1c2-b2c1)(c1a2-c2a1) # cdet0
      (xv-yu)(us-vr)(ry-sx) # a2x
      (xvus-xvvr-yuus+yuvr)(ry-sx) # mxm
      (ry-sx)(xvus-xvvr-yuus+yuvr) # simple commute
      (ryxvus-ryxvvr-ryyuus+ryyuvr-sxxvus+sxxvvr+sxyuus-sxyuvr) # mxmmp
      (rsuvxy-rrvvxy-rsuuyy+rruvyy-ssuvxx+rsvvxx+ssuuxy-rsuvxy) # csort
      (+rruvyy-rrvvxy-rsuuyy+rsuvxy-rsuvxy+rsvvxx+ssuuxy-ssuvxx) # tsort
      (+rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx) # cancellations
      rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx # trivial simplification

      #########################################
      rruvyy-rrvvxy-rsuuyy+rsvvxx+ssuuxy-ssuvxx
      bXkkU64x3rgJpGW0RPJGOlOvMtM= # digest
      #########################################

      ########## THEREFORE!!! ###########
      A+B+C=A*B*C
      (a^b)+(b^c)+(c^a)=(a^b)*(b^c)*(c^a) 
      ###################################

[See Notation](../Notation.md)
