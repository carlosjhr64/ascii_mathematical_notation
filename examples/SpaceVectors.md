# FamousMathProbs13b
## The rotation problem and Hamilton's discovery of quaternions (II)

Notes from njwildberger's YouTube
[video](http://www.youtube.com/all_comments?v=0_XoZc-A1HU).

    Q{a,b,c} # Q as normally defined, Rational Numbers.
    a^2 :: aa
      V{v} :: v=(x,y,z) # Vector Space.
      # Q as defined in this block only.
      Q[v] :: a^2 + b^2 + b^2 # Quadrance.
      V{v1,v2,v3}
        (x1,y1,z1) := v1; (x2,y2,z2) := v2; (x3,y3,z3) := v3
        # Pythagoras.
        Q[v1] + Q[v2] =? Q[v1-v2]
           (x1^2 + y1^2 + z1^2) + (x2^2 + y2^2 + z2^2) =?
           =? (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2
           =? x2^2 - 2(x2x1) + x1^2 + y2^2 - 2(y2y1) + y1^2 + z2^2 - 2(z2z1) + z1^2
           =? (x1^2 + y1^2 + z1^2) + (x2^2 + y2^2 + z2^2) - 2(x2x1) - 2(y2y1) - 2(z2z1)
           =? (x1^2 + y1^2 + z1^2) + (x2^2 + y2^2 + z2^2) - 2(x2x1 + y2y1 + z2z1)
             0 =? x2x1 + y2y1 + z2z1
             0 =? x1x2 + y1y2 + z1z2 # Numbers commute.
        v1.v2 :: x1x2 + y1y2 + z1z2 # Dot product, inner product, bilear form.
        v1.v2=0 <==> Q[v1]+Q[v2]=Q[v1-v2] # By Pythagoras.
        v1*v2 :: (y1z2-y2z1, z1x2-z2x1, x1y2-x2y1) # Cross product.
        v3=v1*v2 ?=> v3.v1=0, v3v2=0 # Theorem.
          v3.v1 = (y1z2-y2z1, z1x2-z2x1, x1y2-x2y1).(x1,y1,z1) # Substitution.
          = (y1z2-y2z1)x1 + (z1x2-z2x1)y1 + (x1y2-x2y1)z1
          = y1z2x1 - y2z1x1 + z1x2y1 - z2x1y1 + x1y2z1 - x2y1z1
          = x1y1z2 - x1y2z1 + x2y1z1 - x1y1z2 + x1y2z1 - x2y1z1
          = (x1y1z2 - x1y1z2) + (x1y2z1 - x1y2z1) + (x2y1z1 - x2y1z1)
          = (0) + (0) + (0)
          v3.v1 = 0
          ...  # Likewise for v3.v2
        v3=v1*v2 ==> v3.v1=0, v3v2=0 # By theorem.
        V{v,u,w,z}
          O := (0,0,0)
          V{O} # By definition of Vector Space.
          v*(u*w) + u*(w*v) + w*(v*u) =? O
            (v1,v2,v3):=v, (u1,u2,y3):=u, (w1,w2,w3):=w
            # Case v*(u*w):
            v*(u*w) = v*(u*w) # A=A is True!
            =(v1,v2,v3)((u1,u2,u3)*(w1,w2,w3))
            =(v1,v2,v3)(u2w3-u3w2, u1w3-u3w1, u1w2-u2w1)
            =(v2(u1w2-u2w1)-v3(u1w3-u3w1),v1(u1w2-u2w1)-v3(u2w3-u3w2),v1(u1w3-u3w1)-v2(u2w3-u3w2))
            =(v2u1w2-v2u2w1-v3u1w3+v3u3w1,v1u1w2-v1u2w1-v3u2w3+v3u3w2,v1u1w3-v1u3w1-v2u2w3+v2u3w2)
            # Case u*(w*v):
            # v->u,u->w,w->v
            =(u2w1v2-u2w2v1-u3w1v3+u3w3v1,u1w1v2-u1w2v1-u3w2v3+u3w3v2,u1w1v3-u1w3v1-u2w2v3+u2w3v2)
            # Case w*(v*u):
            # u->w,w->v,v->u
            =(w2v1u2-w2v2u1-w3v1u3+w3v3u1,w1v1u2-w1v2u1-w3v2u3+w3v3u2,w1v1u3-w1v3u1-w2v2u3+w2v3u2)
            # Case w*(v*u):
            # w->v,v->u,u->w
            =(v2u1w2-v2u2w1-v3u1w3+v3u3w1,v1u1w2-v1u2w1-v3u2w3+v3u3w2,v1u1w3-v1u3w1-v2u2w3+v2u3w2)
            v*(u*w) + u*(w*v) + w*(v*u) =
            =(u2w1v2-u2w2v1-u3w1v3+u3w3v1,u1w1v2-u1w2v1-u3w2v3+u3w3v2,u1w1v3-u1w3v1-u2w2v3+u2w3v2)
            +(w2v1u2-w2v2u1-w3v1u3+w3v3u1,w1v1u2-w1v2u1-w3v2u3+w3v3u2,w1v1u3-w1v3u1-w2v2u3+w2v3u2)
            +(v2u1w2-v2u2w1-v3u1w3+v3u3w1,v1u1w2-v1u2w1-v3u2w3+v3u3w2,v1u1w3-v1u3w1-v2u2w3+v2u3w2)
            # Consider the first term:
            (v*(u*w) + u*(w*v) + w*(v*u))[1] =
            = u2w1v2-u2w2v1-u3w1v3+u3w3v1 +
            + w2v1u2-w2v2u1-w3v1u3+w3v3u1 +
            + v2u1w2-v2u2w1-v3u1w3+v3u3w1
            # Sorting...
            = u2v2w1-u2v1w2-u3v3w1+u3v1w3 +
            + u2v1w2-u1v2w2-u3v1w3+u1v3w3 +
            + u1v2w2-u2v2w1-u1v3w3+u3v3w1
            # Grouping...
            =
            + u1v2w2 - u1v2w2
            + u1v3w3 - u1v3w3
            + u2v1w2 - u2v1w2
            + u2v2w1 - u2v2w1
            + u3v1w3 - u3v1w3
            + u3v3w1 - u3v3w1
            = 0
            # By symmetry likewise
            (v*(u*w) + u*(w*v) + w*(v*u))[2] = 0
            (v*(u*w) + u*(w*v) + w*(v*u))[3] = 0
            # Therefore...
            v*(u*w) + u*(w*v) + w*(v*u) = (0,0,0)
            v*(u*w) + u*(w*v) + w*(v*u) = O
          Q[v*w] =? Q[v]Q[w] - (v.w)^2
            Q[v*w] = Q[v*w] # A=A is true
            = Q[(v1,v2,v3)*(w1,w2,w3)]
            = Q[(v2w3-v3w2, v1w3-v3w1, v1w2-v2w2)]
            = (v2w3-v3w2)^2 + (v1w3-v3w1)^2 + (v1w2-v2w2)^2
            = (v2w3)^2 - 2(v2w3v3w2) + (v3w2)^2
            + (v1w3)^2 - 2(v1w3v3w1) + (v3w1)^2
            + (v1w2)^2 - 2(v1w2v2w1) + (v2w1)^2
            ###############
            Q[v*w] =
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            - 2(v1v3w1w3)
            - 2(v1v2w1w2)
            - 2(v2v3w2w3)
            ###############
            Q[v]Q[w] = Q[v]Q[w]
            = (v1^2 + v2^2 + v3^2)(w1^2 + w2^2 + w3^2)
            = (v1w1)^2 + (v1w2)^2 + (v1w3)^2
            + (v2w1)^2 + (v2w2)^2 + (v2w3)^2
            + (v3w1)^2 + (v3w2)^2 + (v3w3)^2
            (v.w)^2 = (v.w)^2
            = ((v1,v2,v3).(w1,w2,w3))^2
            = (v1w1+v2w2+v3w3)^2
            = (v1w1)^2 + v1w1v2w2 + v1w1v3w3
            + (v2w2)^2 + v2w2v1w1 + v2w2v3w3
            + (v3w3)^2 + v3w3v1w1 + v3w3v2w2
            Q[v]Q[w]-(v.w)^2=
            = (v1w1)^2 + (v1w2)^2 + (v1w3)^2
            + (v2w1)^2 + (v2w2)^2 + (v2w3)^2
            + (v3w1)^2 + (v3w2)^2 + (v3w3)^2
            - (v1w1)^2 - v1w1v2w2 - v1w1v3w3
            - (v2w2)^2 - v2w2v1w1 - v2w2v3w3
            - (v3w3)^2 - v3w3v1w1 - v3w3v2w2
            = 
            + (v1w1)^2
            - (v1w1)^2
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w2)^2
            - (v2w2)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            + (v3w3)^2
            - (v3w3)^2
            - v1w1v2w2
            - v1w1v3w3
            - v2w2v1w1
            - v2w2v3w3
            - v3w3v1w1
            - v3w3v2w2
            =
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            - v1v2w1w2
            - v1v3w1w3
            - v1v2w1w2
            - v2v3w2w3
            - v3v1w1w3
            - v2v3v2w3
            =
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            - v1v2w1w2
            - v1v2w1w2
            - v1v3w1w3
            - v1v3w1w3
            - v2v3w2w3
            - v2v3v2w3
            ###############
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            - 2(v1v2w1w2)
            - 2(v1v3w1w3)
            - 2(v2v3w2w3)
            ###############
            # Compared to #
            ###############
            Q[v*w] =
            + (v1w2)^2
            + (v1w3)^2
            + (v2w1)^2
            + (v2w3)^2
            + (v3w1)^2
            + (v3w2)^2
            - 2(v1v3w1w3)
            - 2(v1v2w1w2)
            - 2(v2v3w2w3)
            ###############
            Q[v*w] = Q[v]Q[w]-(v.w)^2
            # We can now take this result to the parent block.
          Q[v*w] = Q[v]Q[w]-(v.w)^2
          (u*v).(w*t) =? (u.w)(v.t) - (u.t)(v.w)
            u*v = (u2v3-u3v2,u1v3-u3v1,u1v2-u2v1)
            w*t = (w2t3-w3t2,w1t3-w3t1,w1t2-w2t1)
            (u*v).(w*t) =
            = (u2v3-u3v2)(w2t3-w3t2) + (u1v3-u3v1)(w1t3-w3t1) + (u1v2-u2v1)(w1t2-w2t1)
            (x,y,z):=u, (a,b,c):=v, (p,q,r):=w, (i,j,k):=t
            (u*v).(w*t) =
            = (yc-zb)(qk-rj) + (xc-za)(pk-ri) + (xb-ya)(pj-qi)
            = (y*c-z*b)*(q*k-r*j)+(x*c-z*a)(p*k-r*i)+(x*b-y*a)(p*j-q*i)
            # OK, wolfram did this one for us...
            =-ajpy-akpz+iaqy+iarz+bjpx+bjrz-bkqz-ibqx-cjry+ckpx+ckqy-icrx
            # Convert it back!
            =
            - v1t2w1u2
            - v1t3w1u3
            + t1v1w2u2
            + t1v1w3u3
            + v2t2w1u1
            + v2t2w3u3
            - v2t3w2u3
            - t1v2w2u1
            - v3t2w3u2
            + v3t3w1u1
            + v3t3w2u2
            - t1v3w3u1
            =
            + t1v1w2u2
            + t1v1w3u3
            + v2t2w1u1
            + v2t2w3u3
            + v3t3w1u1
            + v3t3w2u2
            - v1t2w1u2
            - v1t3w1u3
            - v2t3w2u3
            - t1v2w2u1
            - v3t2w3u2
            - t1v3w3u1
            # sorted and commuted
            #######################
            (u*v).(w*t) =
            + u1v2w1t2
            + u1v3w1t3
            + u2v1w2t1
            + u2v3w2t3
            + u3v1w3t1
            + u3v2w3t2
            - u1v2w2t2
            - u1v3w3t1
            - u2v1w1t2
            - u2v3w3t2
            - u3v1w1t3
            - u3v2w2t3
            #######################
            (u.w)(v.t) - (u.t)(v.w) =
            = (u1w1+u2w2+u3w3)(v1t1+v2t2+v3t3) - (u1t1+u2t2+u3t3)(v1w1+v2w2+v3w3)
            # substituting for wolfram again!
            (x,y,z):=u, (a,b,c):=v, (p,q,r):=w, (i,j,k):=t
            = (x*p+y*q+z*r)*(a*i+b*j+c*k)-(x*i+y*j+z*k)*(a*p+b*q+c*r)
            # Wolfram gives:
            =aiqy+airz-ajpy-akpz-biqx+bjpx+bjrz-bkqz-cirx-cjry+ckpx+ckqy
            # Convert it back!
            =
            + v1t1w2u2
            + v1t1w3u3
            - v1t2w1u2
            - v1t3w1u3
            - v2t1w2u1
            + v2t2w1u1
            + v2t2w3u3
            - v2t3w2u3
            - v3t1w3u1
            - v3t2w3u2
            + v3t3w1u1
            + v3t3w2u2
            # sorted and commuted
            #######################
            (u.w)(v.t) - (u.t)(v.w) =
            + u1v2w1t2
            + u1v3w1t3
            + u2v1w2t1
            + u2v3w2t3
            + u3v1w3t1
            + u3v2w3t2
            - u1v2w1t1
            - u1v3w3t1
            - u2v1w1t2
            - u2v3w3t2
            - u3v1w1t3
            - u3v2w2t3
            #######################
            # Compared to
            #######################
            (u*v).(w*t) =
            + u1v2w1t2
            + u1v3w1t3
            + u2v1w2t1
            + u2v3w2t3
            + u3v1w3t1
            + u3v2w3t2
            - u1v2w2t2
            - u1v3w3t1
            - u2v1w1t2
            - u2v3w3t2
            - u3v1w1t3
            - u3v2w2t3
            #######################
            # The terms match.  Therefore:
            (u*v).(w*t) = (u.w)(v.t) - (u.t)(v.w)
            # And we can take it down to the parent block.
          (u*v).(w*t) = (u.w)(v.t) - (u.t)(v.w)

See [Notation](../Notation.md).
