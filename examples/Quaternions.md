# FamousMathProbs13c
## The rotation problem and Hamilton's discovery of quaternions III (cont)
### Notes on njwildberger's [video](http://www.youtube.com/watch?v=g22jAtg3QAk).

    # My notation is different from the video's.

    # Quick review of Complex Numbers.
    C{u,v} # Given Complex number u and v.
      (u1,u2):=u, (v1,v2):=v # Let there be these variables.
      u^  :: (u1,-u2)
      u+v :: (u1+v1, u2+v2)
      u.v :: u1u2 + u2v2
      u|v :: u1v2 - u2v1
      u*v :: (u.v^, u^|v)
      u*v = (u1v1-u2v2, u1v2+u2v1)

    # Quick review of Vector Spaces
    V{v,w}
       (vx,vy,vz):=v; (wx,wy,wz):=w
       v.w :: vxwx + vywy + vzwz
       v*w :: (vywz-vzwy, vxwz-vzwx, vywz-vzwy)

    H{p,q} # Given Quaternions p,q.
      p := (pt, pv) := (pt, px, py, pz) # Notice Rubism here.
      q := (qt, qv) := (qt, qx, qy, qz)
      ###################################################
      p+q :: (pt+qt,pv+qv) = (pt+qt, px+qx, py+qy, pz+qz)
      ###################################################
      ptqv+qtpv+pv*qv =? (ptqx+qtpx+pyqz-qypz, ptqy+qtpy+qzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
        ptqv+qtpv+pv*qv =
        pt(qx,qy,qz)+qt(px,py,pz)+(px,py,pz)*(qx,qy,qz) = # Substitution
        (ptqx,ptqy,ptqz)+(qtpx,qtpy,qtpz)+(pyqz-pzqy,pxqz-pzqx,pxqy-pyqx) =
        (ptqx+qtpx,ptqy+qtpy,ptqz+qtpz)+(pyqz-pzqy,pxqz-pzqx,pxqy-pyqx) =
        (ptqx+qtpx+pyqz-pzqy, ptqy+qtpy+pxqz-pzqx, ptqz+qtpz+pxqy-pyqx)
        # Assertion was true
      ptqv+qtpv+pv*qv = (ptqx+qtpx+pyqz-qypz, ptqy+qtpy+qzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
      ####################################################################################
      p*q :: (ptqt-pv.qv, ptqv+qtpv+pv*qv) = # Rubist continuation here.
      (ptqt-pxqx-pyqy-pzqz, ptqx+qtpx+pyqz-qypz, ptqy+qtpy+qzqx-qzpx, ptqz+qtpz+pxqy-qxpy)
      ####################################################################################

See [Notation](../Notation.md).
