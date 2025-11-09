cls
do
  if rnd*320<10 then
    'cls
    colorR=rnd*255
    colorG=rnd*255
    colorB=rnd*255
  endif
  pixel rnd*320,rnd*320,         rgb(colorR,colorG,colorB)
  'pause 10
loop