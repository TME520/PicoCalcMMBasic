cls
randomize timer
w=mm.hres:h=mm.vres
bg=rgb(blue)
wh=rgb(white)
dim colors(9)=(rgb(brown),rgb(blue)_
,rgb(pink),rgb(midgreen),rgb(green)_
,rgb(lilac),rgb(fuchsia),rgb(myrtle)_
,rgb(cerulean),rgb(red))
framebuffer create
framebuffer write f
x=int(rnd*w)
y=int(rnd*h)
dx=5:dy=4:sx=53:sz=27
sub chbg()
  pickc: idx=int(rnd*10)
  if bg=colors(idx) goto pickc
  bg=colors(idx)
end sub
do
  if inkey$<>"" then cls:end
  cls rgb(0,0,0)
  rbox x+2,y+2,sx,sz,3,wh
  rbox x,y,sx,sz,3,bg,bg
  text x+3,y+3,"DVD",,3,1,wh,bg
  x=x+dx:y=y+dy
  if x<0 then x=0:dx=-dx:chbg()
  if y<0 then y=0:dy=-dy:chbg()
  if x+sx>=w then x=w-sx:dx=-dx:chbg()
  if y+sz>=h then y=h-sz:dy=-dy:chbg()
  framebuffer wait
  framebuffer copy f,n
loop