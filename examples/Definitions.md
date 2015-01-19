# Definitions

Here are some definitions one can try.

## Fractions

### fadd 
```
(a/b)+(c/d)=(ad+cb)/(bd)
 123 4 5 6   16453 2 36

fadd [(aoa)o(a\2a)] [(\1\6\4\5\3)\2(\3\6)]
fadd [(aoa)o(a\2a)] [(\1\6\4\5\3)\2(\3\6)] # define

[(a/b)+(c/d)]
[(ad+cb)/(bd)] # fadd

[(a/b)-(c/d)]
[(ad-cb)/(bd)] # fadd

[((1+2-3)/(4+7))+((x+y)/(a+b))]
[((1+2-3)(a+b)+(x+y)(4+7))/((4+7)(a+b))] # fadd
```

### fmult
```
(a/b)*(c/d)=(a*c)/(b*d)
 123 4 5 6   145 2 346

fmult [(aoa)o?(a\2a)] [(\1\4\5)\2(\3\4\6)]
fmult [(aoa)o?(a\2a)] [(\1\4\5)\2(\3\4\6)] # define

[(a/b)*(c/d)]
[(a*c)/(b*d)] # fmult

[(a/b)(c/d)]
[(ac)/(bd)] # fmult
```

## Squares

### binomial2
```
(a+b)^2=a^2+2ab+b^2
 123 4  14 2 13 34

binomial2 [(aoa)o2] [\1\42\22\1\3+\3\42]
binomial2 [(aoa)o2] [\1\42\22\1\3+\3\42] # define

[(a+b)^2]
[a^2+2ab+b^2] # binomial2

[(a-b)^2]
[a^2-2ab+b^2] # binomial2
```

### diff2
```
(a^2-b^2)=(a+b)(a-b)
 12  3

diff2 [aoa-a\2a] [(\1-\3)(\1+\3)]
diff2 [aoa-a\2a] [(\1-\3)(\1+\3)] # define

[a^2-b^2]
[(a-2)(a+2)] # diff2
```

### aa
```
a^2=aa
1   11

aa [ao2] [\1\1]
aa [ao2] [\1\1] # define

[a^2]
[aa] # aa

[(a+b)^2]
[(a+b)(a+b)] # aa
```

## Multication of groupings

### pxp
```
(a+b)*(x+y)=(a*x+b*y+a*y+b*x)
 1 2 3 4 5   134 235 135 234

pxp [(a+a)o?(a+a)] [\1\3\4+\2\3\5+\1\3\5+\2\3\4]
pxp [(a+a)o?(a+a)] [\1\3\4+\2\3\5+\1\3\5+\2\3\4] # define

[(a+b)*(x+y)]
[a*x+b*y+a*y+b*x] # pxp

[(a+b)(x+y)]
[ax+by+ay+bx] # pxp
```

### ppxpp
```
(a+b+c)*(x+y+z)=(a*x+b*y+c*z+a*y+b*z+c*x+a*z+b*x+c*y)
 1 2 3 4 5 6 7   145 246 347 146 347 345 147 245 346

ppxpp [(a+a+a)o?(a+a+a)] [\1\4\5+\2\4\6+\3\4\7+\1\4\6+\3\4\7+\3\4\5+\1\4\7+\2\4\5+\3\4\6]
ppxpp [(a+a+a)o?(a+a+a)] [\1\4\5+\2\4\6+\3\4\7+\1\4\6+\3\4\7+\3\4\5+\1\4\7+\2\4\5+\3\4\6] # define

[(a+b+c)*(x+y+z)]
[a*x+b*y+c*z+a*y+c*z+c*x+a*z+b*x+c*y] # ppxpp

[(a+b+c)(x+y+z)]
[ax+by+cz+ay+cz+cx+az+bx+cy] # ppxpp
```

### mxppp
```
(a-b)*(c+d+e+f)=(a*c+a*d+a*e+a*f-b*c-b*d-b*e-b*f)
 1 2 3 4 5 6 7   134+135+136+137-234-235-236-237

mxppp [(a-a)o?(a+a+a+a)] [\1\3\4+\1\3\5+\1\3\6+\1\3\7-\2\3\4-\2\3\5-\2\3\6-\2\3\7]
mxppp [(a-a)o?(a+a+a+a)] [\1\3\4+\1\3\5+\1\3\6+\1\3\7-\2\3\4-\2\3\5-\2\3\6-\2\3\7] # define

[(a-b)*(c+d+e+f)]
[a*c+a*d+a*e+a*f-b*c-b*d-b*e-b*f] # mxppp

[(a-b)(c+d+e+f)]
[ac+ad+ae+af-bc-bd-be-bf] # mxppp
```

### mxm
```
(a-b)*(c-d)=(a*c-a*d-b*c+b*d)
 1 2 3 4 5   134-135-234+235

mxm [(a-a)o?(a-a)] [\1\3\4-\1\3\5-\2\3\4+\2\3\5]
mxm [(a-a)o?(a-a)] [\1\3\4-\1\3\5-\2\3\4+\2\3\5] # define

[(a-b)*(c-d)]
[a*c-a*d-b*c+b*d] # mxm

[(a-b)(c-d)]
[ac-ad-bc+bd] # mxm
```

### mxmmp
```
(a-b)*(c-d-e+f)=(a*c-a*d-a*e+a*f-b*c+b*d+b*e-b*f)
 1 2 3 4 5 6 7   134-135-136+137-234+235+236-237

mxmmp [(a-a)o?(a-a-a+a)] [\1\3\4-\1\3\5-\1\3\6+\1\3\7-\2\3\4+\2\3\5+\2\3\6-\2\3\7]
mxmmp [(a-a)o?(a-a-a+a)] [\1\3\4-\1\3\5-\1\3\6+\1\3\7-\2\3\4+\2\3\5+\2\3\6-\2\3\7] # define

[(a-b)*(c-d-e+f)]
[a*c-a*d-a*e+a*f-b*c+b*d+b*e-b*f] # mxmmp

[(a-b)(c-d-e+f)]
[ac-ad-ae+af-bc+bd+be-bf] # mxmmp
```

## Zeroes

### pm
```
+a-a=+0
 1

# Note: using raw regexp here!
pm [+](\w+|\w*\([^\(\)]+\))[-]\1(?!\w) +0
pm [+](\w+|\w*\([^\(\)]+\))[-]\1(?!\w) +0 # define

+a-a
+0 # pm

qp+abc-abc+xyz+i-i-ijk
qp+0+xyz+0-ijk # pm

qp+(a*b*c)-(a*b*c)+xyz+i-i-ijk
qp+0+xyz+0-ijk # pm

qp+xyz(a+b-c)-xyz(a+b-c)+xyz+i-i-ijk
qp+0+xyz+0-ijk # pm
```

## Vectors And Complex Numbers

### vdot2
```
v.w=v1w1+v2w2
123 1 3  1 3

vdot2 [aoa] [\11\31+\12\32]
vdot2 [aoa] [\11\31+\12\32] # define

[v.w]
[v1w1+v2w2] # vdot2
```
### dot2
```
(a,b).(c,d)=ac+bd
 123 4 5 6  15 36

dot2 [(aoa)o(a\2a)] [\1\5+\3\6]
dot2 [(aoa)o(a\2a)] [\1\5+\3\6] # define

[(a,b).(c,d)]
[ac+bd] # dot2

[((1+2),(3+4)).((ab),(c/d))]
[(1+2)(ab)+(3+4)(c/d)] # dot2
```

### vdet2
```
v|w=v1w2-v2w1
123 1 3  1 3

vdet2 [aoa] [\11\32-\12\31]
vdet2 [aoa] [\11\32-\12\31] # define

[v|w]
[v1w2-v2w1] # vdet2
```

### det2
```
(a,b)|(c,d)=ad-bc
 123 4 5 6  16 35

det2 [(aoa)o(a\2a)] [\1\6-\3\5]
det2 [(aoa)o(a\2a)] [\1\6-\3\5] # define

[(a,b)|(c,d)]
[ad-bc] # det2
```

### vadd2
```
v+w=(v1+w1,v2+w2)
123  1 23  1 23

vadd2 [aoa] [(\11\2\31,\12\2\32)]
vadd2 [aoa] [(\11\2\31,\12\2\32)] # define

[v+w]
[(v1+w1,v2+w2)] # vadd2
```

### add2
```
(a,b)+(c,d)=(a+c,b+d)
 123 4 5 6   1452346

add2 [(aoa)o(a\2a)] [(\1\4\5\2\3\4\6)]
add2 [(aoa)o(a\2a)] [(\1\4\5\2\3\4\6)] # define

[(a,b)+(c,d)]
[(a+c,b+d)] # add2
```

### cmult
```
v*w=(v.w',v'|w)
123

cmult [ao?a] [(\1.\3',\1'|\3)]
cmult [ao?a] [(\1.\3',\1'|\3)] # define

[v*w]
[(v.w',v'|w)] # cmult

[vw]
[(v.w',v'|w)] # cmult
```

### cmult2
```
(a,b)*(c,d)=(a*c-b*d,a*d+b*c)
 123 4 5 6  (145-3462146+345)

cmult2 [(aoa)o?(a\2a)] [(\1\4\5-\3\4\6\2\1\4\6+\3\4\5)]
cmult2 [(aoa)o?(a\2a)] [(\1\4\5-\3\4\6\2\1\4\6+\3\4\5)] # define

[(a,b)*(c,d)]
[(a*c-b*d,a*d+b*c)] # cmult2

[(a,b)(c,d)]
[(ac-bd,ad+bc)] # cmult2
```

### cturn
```
v^w=(v|w)/(v.w)
123  1 3   1 3

cturn [aoa] [(\1|\3)/(\1.\3)]
cturn [aoa] [(\1|\3)/(\1.\3)] # define

[v^w]
[(v|w)/(v.w)] # cturn
```

### vdot3
```
v.w=v1w1+v2w2+v3w3
123 1 3  1 3  1 3

vdot3 [aoa] [\11\31+\12\32+\13\33]
vdot3 [aoa] [\11\31+\12\32+\13\33] # define

[a.b]
[a1b1+a2b2+a3b3] # vdot3
```

### dot3
```
(a,b,c).(d,e,f)=ad+be+cf
 123 4 5 6 7 8  16 37 48

dot3 [(aoa\2a)o(a\2a\2a)] [\1\6+\3\7+\4\8]
dot3 [(aoa\2a)o(a\2a\2a)] [\1\6+\3\7+\4\8] # define

[(a,b,c).(d,e,f)]
[ad+be+cf] # dot3
```

### dotxyz
```
v.w=vxwx+vywy+vzwz
123 1x3x+1y3y+1z3z

dotxyz [aoa] [\1x\3x+\1y\3y+\1z\3z]
dotxyz [aoa] [\1x\3x+\1y\3y+\1z\3z] # define

[v.w]
[vxwx+vywy+vzwz] # dotxyz
```

### dotvxyz
```
v1.v2=x1x2+y1y2+z1z2
12  3

# Note: raw regexp
dotvxyz \[([^\W\d]+)(\d+)\.\1(\d+)\] [x\2x\3+y\2y\3+z\2z\3]
dotvxyz \[([^\W\d]+)(\d+)\.\1(\d+)\] [x\2x\3+y\2y\3+z\2z\3] # define

[V4.V7]
[x4x7+y4y7+z4z7] # dotvxyz
```

### vcross
```
v*w=(v2w3-w2v3,v3w1-w3v1,v1w2-w1v2) # Cross Product
123

vcross [aoa] [\12\33-\32\13,\13\31-\33\11,\11\32-\31\12]
vcross [aoa] [\12\33-\32\13,\13\31-\33\11,\11\32-\31\12] # define

[v*w]
[v2w3-w2v3,v3w1-w3v1,v1w2-w1v2] # vcross
```

### cross
```
(a,b,c)*(d,e,f)=(bf-ec,cd-fa,ae-db)
 123 4 5 6 7 8  (38-74246-81217-63)

cross [(aoa\2a)o(a\2a\2a)] [(\3\8-\7\4\2\4\6-\8\1\2\1\7-\6\3)]
cross [(aoa\2a)o(a\2a\2a)] [(\3\8-\7\4\2\4\6-\8\1\2\1\7-\6\3)] # define

[(a,b,c)*(d,e,f)]
[(bf-ec,cd-fa,ae-db)] # cross
```

### crossxyz
```
v1*v2=(y1z2-y2z1,z1x2-z2x1,x1y2-x2y1)
12  3

Note: raw regexp
crossxyz \[([^\W\d]+)(\d+)[*]\1(\d+)\] [(y\2z\3-y\3z\2,z\2x\3-z\3x\2,x\2y\3-x\3y\2)]
crossxyz \[([^\W\d]+)(\d+)[*]\1(\d+)\] [(y\2z\3-y\3z\2,z\2x\3-z\3x\2,x\2y\3-x\3y\2)] # define

[v1*v2]
[(y1z2-y2z1,z1x2-z2x1,x1y2-x2y1)] # crossxyz
```
