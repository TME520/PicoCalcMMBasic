const blk=rgb(black)
const wht=rgb(white)
const ylw=rgb(yellow)
const red=rgb(red)
const grn=rgb(green)
const org=rgb(brown)
const cya=rgb(cyan)

look_r$="(  o_o)"
look_l$="(o_o  )"
happy$="( O O )"
sad$="( T_T )"
angry$="(-_-  )"
bored$="(-___-)"
working$="( @_@ )"
sleep0$="( -.- )"
debug$="( #_# )"
glitch1$="( o_o )"
glitch2$="( O_O )"
glitch3$="( x_x )"

const box_x=10
const box_y=240
const box_w=300
const box_h=70

font 2
color blk,ylw

function ltrim$(s$)
  do while left$(s$,1)=" " and  len(s$)>0
    s$=mid$(s$,2)
  loop
  ltrim$=s$
end function

function rtrim$(s$)
  do while right$(s$,1)=" " and    len(s$)>0
    s$=left$(s$,len(s$)-1)
  loop
  rtrim=s$
end function

function trim$(s$)
  trim$=ltrim$(rtrim$(s$))
end function

sub simulatework()
  local i%,x!
  for i%=1 to 5000
    x!=sqr(i%)*log(i%+1)
  next i%
end sub

sub animatelook()
  local i%
  for i%=1 to 3
    box box_x,box_y,box_w,box_h,1, red     ,ylw
    color blk,ylw
    centertext box_y+25,look_l$
    pause 1000
    box box_x,box_y,box_w,box_h,1, red     ,ylw
    color blk,ylw
    centertext box_y+25,look_r$
    pause 1000
  next i%
end sub

sub showidlefaces()
  local idleface$,r%
  r%=int(rnd*20)
  select case %
    case 0: idleface$=glitch1$
    case 1: idleface$=glitch2$
    case 2: idleface$=glitch3$
    case 3: idleface$=look_l$
    case 4: idleface$=look_r$
    case 5: idleface$=bored$
    case 6: idleface$=sleep0$
    case 7: idleface$=debug$
    case else: idleface$="( -_- )"
  end select
  box box_x,box_y,box_w,box_h,1,red    ,ylw
  color blk,ylw
  centertext box_y+5,"..."
  centertext box_y+25,idleface$
  if showramnext% then
    showramstat box_y+45
  else
    showuptimestat box_y+45
  endif
  showramnext%=not showramnext%
  pause 300
end sub

sub showramstat(y%)
  local freemem%
  freemem%=mm.info(heap)
  centertext y%,"RAM: " +    str$(freemem%) + " bytes"
end sub

sub showuptimestat(y%)
  local uptime%
  uptime%=mm.info(uptime)
  centertext y%, "Uptime: " +    str$(uptime%) + " sec"
end sub

sub centertext(y%,text$)
  local clean$
  clean$=trim$(text$)
  text box_x+(box_w-len(clean$)*8)/2    y%,clean$
end sub

dim tstart!,tend!,busytime!
dim mood$,msg$,msgcolor$
dim idlecounter%
dim showramnext%
dim freemem%,uptime%

idlecounter%=0
showramnext%=1

do
  tstart!=timer
  simulatework()
  tend!=timer
  busytime!=tend!-tstart!
  
  freemem%=mm.info(heap)
  uptime%=mm.info(uptime)
  
  if freemem%<5000 then
    mood$=sad$
    msg$="Running low!"
    msgcolor%=cya
  elseif uptime%>10000 then
    mood$=sleep0$
    msg$="Getting sleepy"
    msgcolor%=org
  elseif busytime!<100 then
    mood$=happy$
    msg$="All chill"
    msgcolor%=grn
  elseif busytime!<300 then
    mood$=working$
    msg$="Working hard"
    msgcolor%=org
  else
    mood$=angry$
    msg$="Overloaded!"
    msgcolor%=red
  endif
  
  animatelook()
  
  box box_x,box_y,box_w,box_h,1,red   ,ylw
  color blk,msgcolor%
  centertext box_y+5,msg$
  color blk,ylw
  centertext box_y+25,mood$
  if showramnext% then
    showramstat box_y+45
  else
    showuptimestat box_y+45
  endif
  showramnext%=not showramnext%
  
  pause 1000
  
  idlecounter%=idlecounter%+1
  if idlecounter%>=5 then
    showidleface()
    idlecounter%=0
  endif
loop