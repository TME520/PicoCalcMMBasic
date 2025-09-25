option explicit

const black=rgb(0,0,0)
const white=rgb(255,255,255)
const blue=rgb(0,0,255)
const green=rgb(0,255,0)
const red=rgb(255,0,0)
const yellow=rgb(255,255,0)
const lilac=rgb(255,128,255)
const brown=rgb(255,128,0)
const fuchsia=rgb(255,64,255)
const rust=rgb(255,64,0)
const magenta=rgb(255,0,255)
const cyan=rgb(0,255,255)
const cerulean=rgb(0,128,255)
const midgreen=rgb(0,128,0)
const cobalt=rgb(0,64,255)
const myrtle=rgb(0,64,0)

const col_bg=black
const col_panel=rust
const col_title=lilac
const col_btn=blue
const col_btn_border=cobalt
const col_btn_focus=cerulean
const col_text=green
const col_shadow=midgreen

const scr_w=mm.hres
const scr_h=mm.vres
const pad=8

dim integer focus%=0
dim integer running%=1

cls rgb(255,0,0)
pause 1000
cls rgb(0,255,0)
pause 1000
cls rgb(0,0,255)
pause 1000

cls col_bg
drawwindow "My App",20,20,scr_w-40,                                                  scr_h-40
renderui focus%

do while running%
  handlekeys focus%,running%
  pause 10
loop
end

sub drawwindow(t$,x,y,w,h)
  box x,y,w,h,1,col_panel,1
  box x,y,w,22,1,black,1
  line x,y+22,x+w,y+22,1,white
  text x+pad,y+4,t$,"L",1,1,                  col_title,                black
end sub

sub renderui(focus%)
  local x,y,w,h
  x=20:y=20:w=scr_w-40:h=scr_h-40
  box x+1,y+23,w-2,h-24,1,col_panel,                                      1
  
  text x+pad,y+30,"Meh","L",1,1,                                       col_text,          col_panel
  
  local bw,bh,gap,bx1,bx2,by
  bw=100:bh=28:gap=16
  by=y+80
  bx1=x+w/2-bw-gap/2
  bx2=x+w/2+gap/2
  
  drawbutton "OK",bx1,by,bw,bh,                       (focus%=0)
  drawbutton "Quit",bx2,by,bw,bh,                                                (focus%=1)
end sub

sub drawbutton(lbl$,x,y,w,h,isfocus)
  local fill,border,textc
  if isfocus then
    fill=col_btn_focus
    border=white
    textc=white
  else
    fill=col_btn
    border=col_btn_border
    textc=col_text
  endif
  box x,y,w,h,1,fill,1
  box x,y,w,h,1,border
  line x,y+h,x+w,y+h,1,col_shadow
  line x+w,y,x+w,y+h,1,col_shadow
  local tx,ty
  tx=x+(w-40)\2
  ty=y+(h-10)\2
  text tx,ty,lbl$,"L",1,1,textc,fill
end sub

sub handlekeys(byref focus%, byref                        running%)
  local k$
  k$=inkey$
  if k$="" then
    exit sub
  else
    ?k$
  endif
  select case k$
    case chr$(27)
      running%=0
    case chr$(13)
      if focus%=0 then
        beepok
      else
        running%=0
      endif
    case chr$(28)
      focus%=0
      renderui focus%
    case chr$(29)
      focus%=1
      renderui focus%    
  end select
end sub

sub beepok
  local x,y
  x=20:y=20
  text x+8,y+56,"OK","L",1,1,orange,                                    col_panel
end sub