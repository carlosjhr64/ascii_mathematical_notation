# FamousMathProbs13c
## The rotation problem and Hamilton's discovery of quaternions III (cont)

Notes on njwildberger's [video](http://www.youtube.com/watch?v=g22jAtg3QAk).

    # My notation is different from the video's.

    # Quick review of Complex Numbers.
    C{u,v} # Given Complex number u and v.
      (u1,u2):=u, (v1,v2):=v # Let there be these variables.
      u^  :: (u1,-u2) # Complex conjugate
      u+v :: (u1+v1, u2+v2)
      u.v :: u1u2 + u2v2
      u|v :: u1v2 - u2v1
      u*v :: (u.v^, u^|v)
      u*v = (u1v1-u2v2, u1v2+u2v1)

    # Quick review of Vector Spaces
    V{v,w}
       (vx,vy,vz):=v; (wx,wy,wz):=w
       v.w :: vxwx + vywy + vzwz
       v*w :: (vywz-wyvz, vzwx-wzvx, vxwy-wxvy)

    H{p,q} # Given Quaternions p,q.
      (pt, px, py, pz) := (pt, pv) := p # Notice Rubism here.
      (qt, qx, qy, qz) := (qt, qv) := q
      ###################################################
      p+q :: (pt+qt,pv+qv) = (pt+qt, px+qx, py+qy, pz+qz)
      ###################################################
      ptqv+qtpv+pv*qv # Consider this expression
        (ptqv)+(qtpv)+(pv*qv)
        (pt(qx,qy,qz))+(qt(px,py,pz))+(pyqz-qypz,pzqx-qzpx,pxqy-qxpy)
        (ptqx,ptqy,ptqz)+(qtpx,qtpy,qtpz))+(pyqz-qypz,pzqx-qzpx,pxqy-qxpy)
        (ptqx+qtpx+pyqz-qypz, ptqy+qtpy+pzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
      ptqv+qtpv+pv*qv = (ptqx+qtpx+pyqz-qypz, ptqy+qtpy+pzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
      ####################################################################################
      p*q :: (ptqt-pv.qv, ptqv+qtpv+pv*qv) = # Rubist continuation here.
      (ptqt-pxqx-pyqy-pzqz, ptqx+qtpx+pyqz-qypz, ptqy+qtpy+pzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
      ####################################################################################

OK, I can show I'm matching the video's formula:

    # :dwwd (\d)([a-z])(\d)([a-z]) -> \2\1\4\3
    (ptqt-pxqx-pyqy-pzqz, ptqx+qtpx+pyqz-qypz, ptqy+qtpy+pzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
    (1t2t-1x2x-1y2y-1z2z, 1t2x+2t1x+1y2z-2y1z, 1t2y+2t1y+1z2x-2z1x, 1t2z+2t1z+1x2y-2x1y) # tr pq 12
    (t1t2-x1x2-y1y2-z1z2, t1x2+t2x1+y1z2-y2z1, t1y2+t2y1+z1x2-z2x1, t1z2+t2z1+x1y2-x2y1) # by :dwwd

Continue...

    H
      I :: (1,0,0,0)
      I*q =
        (1,0,0,0)*(t,x,y,z)
        (1*t-0x-0y-0z, 1x+0t+0z-0y, 1y+0t+0x-0z, 1z+0z+0qy-0qx)
        (t, x, y, z)
        q
      I*q = q
      q*I =
        (t,x,y,z)*(1,0,0,0)
        (t*1-x*0-y*0-z*0, t*0+1*x+y*0-0*z, t*0+1*y+z*0-0*x, t*0+1*z+x*0-0*y)
        (t, x, y, z)
      I*q = q
      O :: (0,0,0,0)
      O*q = O
      q*O = O

See [Notation](../Notation.md).
