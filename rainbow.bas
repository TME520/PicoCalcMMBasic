const two_pi=6.283185307
dim integer w,h,y,col,r,g,b
dim float t,k,phaser,phaseg,phaseb
dim string key$
framebuffer create
framebuffer write f

w=mm.hres
h=mm.vres
t=0
' lines thickness
k=0.020
phaser=0
phaseg=2.094395102
phaseb=4.188790205

cls
play wav "w95.wav"
do
  for y=0 to h-1
    r=int((sin(y*k+t+phaser)+1)*127)
    g=int((sin(y*k+t+phaseg)+1)*127)
    b=int((sin(y*k+t+phaseb)+1)*127)
    col=rgb(r,g,b)
    line 0,y,w-1,y,1,col
  next y
  framebuffer copy f,n
  t=t+0.08
  key$=inkey$
  if key$=chr$(27) then exit do
loop