cls
font 2
text 0,0,"Follow the white  rabbit..."
pause 1000
cls
font 8
fw=mm.info(fontwidth)
fh=mm.info(fontheight)
w=mm.hres
h=mm.vres
nc=w\fw
dim yp(nc-1)
for i=0 to nc-1
  yp(i)=-rnd*h
next
do
  if inkey$<>"" then end
  for i=0 to nc-1
    x=i*fw
    y0=yp(i)
    color 0,0
    box x,y0-4*fh,x+fw-1,y0-3*fh-1,,0
    color rgb(0,120,0),1
    text x,y0-2*fh,chr$(33+rnd*90)
    color rgb(0,200,0),1
    text x,y0-fh,chr$(33+rnd*90)
    color rgb(170,255,170),1
    text x,y,chr$(33+rnd*90)
    yp(i)=y0+fh
    if yp(i)>h then yp(i)=-rnd*h
  next
  pause 1
loop