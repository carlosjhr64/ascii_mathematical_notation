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

      (a*b)*c
      ((a)*(b))*(c)
      ((a0,a1,a2,a3)*(b0,b1,b2,b3))*(c0,c1,c2,c3) # by :H0
      ((i,x,y,z)*(j,u,v,w))*(k,r,s,t) # a2x
      ((ij-xu-yv-zw,iu+jx+yw-vz,iv+jy+zu-wx,iw+jz+xv-uy)*(k,r,s,t)) # by :hmult

      ((ij-xu-yv-zw)(k)-(iu+jx+yw-vz)(r)-(iv+jy+zu-wx)(s)-(iw+jz+xv-uy)(t),
      (ij-xu-yv-zw)(r)+(k)(iu+jx+yw-vz)+(iv+jy+zu-wx)(t)-(s)(iw+jz+xv-uy),
      (ij-xu-yv-zw)(s)+(k)(iv+jy+zu-wx)+(iw+jz+xv-uy)(r)-(t)(iu+jx+yw-vz),
      (ij-xu-yv-zw)(t)+(k)(iw+jz+xv-uy)+(iu+jx+yw-vz)(s)-(r)(iv+jy+zu-wx)) # by :hmult2

      ((ijk-xuk-yvk-zwk)-(iur+jxr+ywr-vzr)-(ivs+jys+zus-wxs)-(iwt+jzt+xvt-uyt), # associative
      (ijr-xur-yvr-zwr)+(kiu+kjx+kyw-kvz)+(ivt+jyt+zut-wxt)-(siw+sjz+sxv-suy), # associative
      (ijs-xus-yvs-zws)+(kiv+kjy+kzu-kwx)+(iwr+jzr+xvr-uyr)-(tiu+tjx+tyw-tvz), # associative
      (ijt-xut-yvt-zwt)+(kiw+kjz+kxv-kuy)+(ius+jxs+yws-vzs)-(riv+rjy+rzu-rwx)) # associative

      (ijk-xuk-yvk-zwk-iur-jxr-ywr+vzr-ivs-jys-zus+wxs-iwt-jzt-xvt+uyt, # ungroup
      ijr-xur-yvr-zwr+kiu+kjx+kyw-kvz+ivt+jyt+zut-wxt-siw-sjz-sxv+suy, # ungroup
      ijs-xus-yvs-zws+kiv+kjy+kzu-kwx+iwr+jzr+xvr-uyr-tiu-tjx-tyw+tvz, # ungroup
      ijt-xut-yvt-zwt+kiw+kjz+kxv-kuy+ius+jxs+yws-vzs-riv-rjy-rzu+rwx) # ungroup

      (ijk-kux-kvy-kwz-iru-jrx-rwy+rvz-isv-jsy-suz+swx-itw-jtz-tvx+tuy, # csort
      ijr-rux-rvy-rwz+iku+jkx+kwy-kvz+itv+jty+tuz-twx-isw-jsz-svx+suy, # csort
      ijs-sux-svy-swz+ikv+jky+kuz-kwx+irw+jrz+rvx-ruy-itu-jtx-twy+tvz, # csort
      ijt-tux-tvy-twz+ikw+jkz+kvx-kuy+isu+jsx+swy-svz-irv-jry-ruz+rwx) # csort

      ( +ijk -kux -kvy -kwz -iru -jrx -rwy +rvz -isv -jsy -suz +swx -itw -jtz -tvx +tuy, # pm
       +ijr -rux -rvy -rwz +iku +jkx +kwy -kvz +itv +jty +tuz -twx -isw -jsz -svx +suy, # pm
       +ijs -sux -svy -swz +ikv +jky +kuz -kwx +irw +jrz +rvx -ruy -itu -jtx -twy +tvz, # pm
       +ijt -tux -tvy -twz +ikw +jkz +kvx -kuy +isu +jsx +swy -svz -irv -jry -ruz +rwx) # pm

      (
      +ijk -kux -kvy -kwz -iru -jrx -rwy +rvz -isv -jsy -suz +swx -itw -jtz -tvx +tuy
      ,
      +ijr -rux -rvy -rwz +iku +jkx +kwy -kvz +itv +jty +tuz -twx -isw -jsz -svx +suy
      ,
      +ijs -sux -svy -swz +ikv +jky +kuz -kwx +irw +jrz +rvx -ruy -itu -jtx -twy +tvz
      ,
      +ijt -tux -tvy -twz +ikw +jkz +kvx -kuy +isu +jsx +swy -svz -irv -jry -ruz +rwx
      )

      (
      +ijk +rvz +swx +tuy -iru -isv -itw -jrx -jsy -jtz -kux -kvy -kwz -rwy -suz -tvx # wsort
      ,
      +ijr +iku +itv +jkx +jty +kwy +suy +tuz -isw -jsz -kvz -rux -rvy -rwz -svx -twx # wsort
      ,
      +ijs +ikv +irw +jky +jrz +kuz +rvx +tvz -itu -jtx -kwx -ruy -sux -svy -swz -twy # wsort
      ,
      +ijt +ikw +isu +jkz +jsx +kvx +rwx +swy -irv -jry -kuy -ruz -svz -tux -tvy -twz # wsort
      )

      (+ijk+rvz+swx+tuy-iru-isv-itw-jrx-jsy-jtz-kux-kvy-kwz-rwy-suz-tvx,+ijr+iku+itv+jkx+jty+kwy+suy+tuz-isw-jsz-kvz-rux-rvy-rwz-svx-twx,+ijs+ikv+irw+jky+jrz+kuz+rvx+tvz-itu-jtx-kwx-ruy-sux-svy-swz-twy,+ijt+ikw+isu+jkz+jsx+kvx+rwx+swy-irv-jry-kuy-ruz-svz-tux-tvy-twz) # squeeze
      # NEIbaZLrm0WZsVs1iKiVMzW6Wm4=

      a*(b*c)
      (a)*((b)*(c))
      (a0,a1,a2,a3)*((b0,b1,b2,b3)*(c0,c1,c2,c3)) # by :H0
      (i,x,y,z)*((j,u,v,w)*(k,r,s,t)) # a2x
      ((i,x,y,z)*(jk-ur-vs-wt,jr+ku+vt-sw,js+kv+wr-tu,jt+kw+us-rv)) # by :hmult

      ((i)(jk-ur-vs-wt)-(x)(jr+ku+vt-sw)-(y)(js+kv+wr-tu)-(z)(jt+kw+us-rv),
      (i)(jr+ku+vt-sw)+(jk-ur-vs-wt)(x)+(y)(jt+kw+us-rv)-(js+kv+wr-tu)(z),
      (i)(js+kv+wr-tu)+(jk-ur-vs-wt)(y)+(z)(jr+ku+vt-sw)-(jt+kw+us-rv)(x),
      (i)(jt+kw+us-rv)+(jk-ur-vs-wt)(z)+(x)(js+kv+wr-tu)-(jr+ku+vt-sw)(y)) # by :hmult2

      ((ijk-iur-ivs-iwt)-(xjr+xku+xvt-xsw)-(yjs+ykv+ywr-ytu)-(zjt+zkw+zus-zrv), # associative
      (ijr+iku+ivt-isw)+(jkx-urx-vsx-wtx)+(yjt+ykw+yus-yrv)-(jsz+kvz+wrz-tuz), # associative
      (ijs+ikv+iwr-itu)+(jky-ury-vsy-wty)+(zjr+zku+zvt-zsw)-(jtx+kwx+usx-rvx), # associative
      (ijt+ikw+ius-irv)+(jkz-urz-vsz-wtz)+(xjs+xkv+xwr-xtu)-(jry+kuy+vty-swy)) # associative

      (ijk-iur-ivs-iwt-xjr-xku-xvt+xsw-yjs-ykv-ywr+ytu-zjt-zkw-zus+zrv, # ungroup
      ijr+iku+ivt-isw+jkx-urx-vsx-wtx+yjt+ykw+yus-yrv-jsz-kvz-wrz+tuz, # ungroup
      ijs+ikv+iwr-itu+jky-ury-vsy-wty+zjr+zku+zvt-zsw-jtx-kwx-usx+rvx, # ungroup
      ijt+ikw+ius-irv+jkz-urz-vsz-wtz+xjs+xkv+xwr-xtu-jry-kuy-vty+swy) # ungroup

      (ijk-iru-isv-itw-jrx-kux-tvx+swx-jsy-kvy-rwy+tuy-jtz-kwz-suz+rvz, # csort
      ijr+iku+itv-isw+jkx-rux-svx-twx+jty+kwy+suy-rvy-jsz-kvz-rwz+tuz, # csort
      ijs+ikv+irw-itu+jky-ruy-svy-twy+jrz+kuz+tvz-swz-jtx-kwx-sux+rvx, # csort
      ijt+ikw+isu-irv+jkz-ruz-svz-twz+jsx+kvx+rwx-tux-jry-kuy-tvy+swy) # csort

      ( +ijk -iru -isv -itw -jrx -kux -tvx +swx -jsy -kvy -rwy +tuy -jtz -kwz -suz +rvz, # pm
       +ijr +iku +itv -isw +jkx -rux -svx -twx +jty +kwy +suy -rvy -jsz -kvz -rwz +tuz, # pm
       +ijs +ikv +irw -itu +jky -ruy -svy -twy +jrz +kuz +tvz -swz -jtx -kwx -sux +rvx, # pm
       +ijt +ikw +isu -irv +jkz -ruz -svz -twz +jsx +kvx +rwx -tux -jry -kuy -tvy +swy) # pm

      (
      +ijk +rvz +swx +tuy -iru -isv -itw -jrx -jsy -jtz -kux -kvy -kwz -rwy -suz -tvx # wsort
      ,
      +ijr +iku +itv +jkx +jty +kwy +suy +tuz -isw -jsz -kvz -rux -rvy -rwz -svx -twx # wsort
      ,
      +ijs +ikv +irw +jky +jrz +kuz +rvx +tvz -itu -jtx -kwx -ruy -sux -svy -swz -twy # wsort
      ,
      +ijt +ikw +isu +jkz +jsx +kvx +rwx +swy -irv -jry -kuy -ruz -svz -tux -tvy -twz # wsort
      )

      (+ijk+rvz+swx+tuy-iru-isv-itw-jrx-jsy-jtz-kux-kvy-kwz-rwy-suz-tvx,+ijr+iku+itv+jkx+jty+kwy+suy+tuz-isw-jsz-kvz-rux-rvy-rwz-svx-twx,+ijs+ikv+irw+jky+jrz+kuz+rvx+tvz-itu-jtx-kwx-ruy-sux-svy-swz-twy,+ijt+ikw+isu+jkz+jsx+kvx+rwx+swy-irv-jry-kuy-ruz-svz-tux-tvy-twz) # squeeze
      # NEIbaZLrm0WZsVs1iKiVMzW6Wm4=

      (a*b)*c = a*(b*c)

:sweat_smile:


See [Notation](../Notation.md).
