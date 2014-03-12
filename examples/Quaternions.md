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
       v*w :: (vywz-vzwy, vxwz-vzwx, vxwy-vywx)

    H{p,q} # Given Quaternions p,q.
      (pt, px, py, pz) := (pt, pv) := p # Notice Rubism here.
      (qt, qx, qy, qz) := (qt, qv) := q
      ###################################################
      p+q :: (pt+qt,pv+qv) = (pt+qt, px+qx, py+qy, pz+qz)
      ###################################################
      ptqv+qtpv+pv*qv # Consider this expression
        ptqv+qtpv+(pv*qv)
        pt(qv)+qt(pv)+(pyqz-pzqy, pxqz-pzqx, pxqy-pyqx)
        pt(qx,qy,qz)+qt(px,py,pz)+(pyqz-pzqy, pxqz-pzqx, pxqy-pyqx)
        (ptqx,ptqy,ptqz)+(qtpx,qtpy,qtpz)+(pyqz-pzqy, pxqz-pzqx, pxqy-pyqx)
        (ptqx+qtpx+pyqz-pzqy, ptqy+qtpy+pxqz-pzqx, ptqz+qtpz+pxqy-pyqx)
      ptqv+qtpv+pv*qv = (ptqx+qtpx+pyqz-pzqy, ptqy+qtpy+pxqz-pzqx, ptqz+qtpz+pxqy-pyqx)
      ####################################################################################
      p*q :: (ptqt-pv.qv, ptqv+qtpv+pv*qv) = # Rubist continuation here.
      (ptqt-pxqx-pyqy-pzqz, ptqx+qtpx+pyqz-pzqy, ptqy+qtpy+pxqz-pzqx, ptqz+qtpz+pxqy-pyqx)
      ####################################################################################

I'm currently not matching one of the videos terms:

    # :dwwd (\d)([a-z])(\d)([a-z]) -> \2\1\4\3
    (ptqt-pxqx-pyqy-pzqz, ptqx+qtpx+pyqz-pzqy, ptqy+qtpy+pxqz-pzqx, ptqz+qtpz+pxqy-pyqx)
    (1t2t-1x2x-1y2y-1z2z, 1t2x+2t1x+1y2z-1z2y, 1t2y+2t1y+1x2z-1z2x, 1t2z+2t1z+1x2y-1y2x) # tr pq 12
    (t1t2-x1x2-y1y2-z1z2, t1x2+t2x1+y1z2-z1y2, t1y2+t2y1+x1z2-z1x2, t1z2+t2z1+x1y2-y1x2) # by :dwwd
    (t1t2-x1x2-y1y2-z1z2, t1x2+t2x1+y1z2-y2z1, t1y2+t2y1+z2x1-x2z1, t1z2+t2z1+x1y2-x2y1) # commutes
    (t1t2-x1x2-y1y2-z1z2, t1x2+t2x1+y1z2-y2z1, t1y2+t2y1+(z2x1-x2z1), t1z2+t2z1+x1y2-x2y1) # :-??

See [Notation](../Notation.md).
