option base 0
randomize timer
framebuffer create
framebuffer write f
const mw=32,mh=9
gold%=0
hp%=100
xp%=0
dim m$(mh-1)
data "################################"
data "#@     #                       #"
data "# ######  ####### ### ### ###  #"
data "#   #     #   ###  #   #   #   #"
data "### # ##  # #      #   #   #   #"
data "#   #  #  # ######### ### ######"
data "#      #    #          #      X#"
data "#   #  #  #            #       #"
data "################################"

for i%=0 to mh-1:read m$(i%):next

' Gold placement
for n%=1 to 4
  do
    x%=int(rnd*mw)
    y%=int(rnd*mh)
    c$=mid$(m$(y%),x%+1,1)
  loop until c$=" "
  m$(y%)=left$(m$(y%),x%)+"$"+                       mid$(m$(y%),x%+2)
next

' Enemies placement
for n%=1 to 2
  do
    x%=int(rnd*mw)
    y%=int(rnd*mh)
    c$=mid$(m$(y%),x%+1,1)
  loop until c$=" "
  m$(y%)=left$(m$(y%),x%)+"*"+       mid$(m$(y%),x%+2)
next

for y%=0 to mh-1
  p%=instr(1,m$(y%),"@")
  if p%>0 then
    px%=p%-1
    py%=y%
    mid$(m$(y%),p%,1)=" "
    exit for
  endif
next

do
  for y%=0 to mh-1
    if y%=py% then
      r$=m$(y%)
      mid$(r$,px%+1,1)="@"
      ?r$
    else
      ?m$(y%)
    endif
  next
  ?""
  ?"WASD - move"
  ?"Q - quit"
  ?"Gold: ";gold%
  ?"HP: ";hp%
  ?"XP: ";xp%
  framebuffer copy f,n
  cls
  k$=""
  do
    k$=ucase$(inkey$)
  loop until k$<>""
  nx%=px%
  ny%=py%
  if k$="W" then
    ny%=py%-1
  elseif k$="S" then
    ny%=py%+1
  elseif k$="A" then
    nx%=px%-1
  elseif k$="D" then
    nx%=px%+1
  elseif k$="Q" then
    exit
  endif
  c$=mid$(m$(ny%),nx%+1,1)
  if c$<>"#" then
    px%=nx%
    py%=ny%
  endif
  if c$="X" then
    cls
    ?"You got out!"
    ?"Gold: ";gold%
    ?"HP: ";hp%
    ?"XP: ";xp%
    framebuffer copy f,n
    exit
  elseif c$="$" then
    ' Found money
    gold%=gold%+10
    xp%=xp%+1
    mid$(m$(ny%),nx%+1,1)=" "
  elseif c$="*" then
    ' Combat
    gold%=gold%+int(rnd*100)
    dmg%=5+int(rnd*6)
    hp%=hp%-dmg%
    xp%=xp%+15
    mid$(m$(ny%),nx%+1,1)="."
    if hp%<=0 then
      cls
      ?"You succumbed to your      wounds!"
      ?"Gold: ";gold%
      ?"XP: ";xp%
      framebuffer copy f,n
      exit
    endif
  endif
loop
