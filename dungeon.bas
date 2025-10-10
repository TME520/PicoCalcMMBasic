option base 0
randomize timer
framebuffer create
framebuffer write f
const mw=30,mh=16,nd=8
gold%=0
hp%=100
xp%=0
dim base$(nd-1,mh-1)
dim m$(mh-1)

' Dungeon layouts
' Dungeon 0: Underground caves L1
data "##############################"
data "#@                           #"
data "#####    ##   ####### #    # #"
data "############  ##########   # #"
data "######         #####   ####  #"
data "###       ###   ##   #  ##   #"
data "#####  ####   # ###   #  ### #"
data "#########   ######    ####   #"
data "#####      ########   ###  ###"
data "#####   ##  ###     ###   ####"
data "##     ##        #      #  ###"
data "##  #######   ###  ####    ###"
data "###  #####   ###    ####  ####"
data "##  #####     ###   ##########"
data "#X   ####### ###      ########"
data "##############################"

' Dungeon 1: Underground caves L2
data "##############################"
data "#@                           #"
data "#                            #"
data "#  #      #   ############## #"
data "#             #              #"
data "#  #      #   #              #"
data "#              ######      ###"
data "#  #     #############      ##"
data "#  ################      #####"
data "# #################          #"
data "# ########      ####    ###  #"
data "#                     ##     #"
data "###############             ##"
data "#################     ########"
data "###################X##########"
data "##############################"

' Dungeon 2: Underground caves L3
data "##############################"
data "#############            #####"
data "##########                ####"
data "######        ###    ##    ###"
data "#            ##      #     ###"
data "#                       @    #"
data "##   ##                     ##"
data "#    ###            ##########"
data "###   ###     ################"
data "##     #     #################"
data "#                        X####"
data "###     ###           ########"
data "##    ########  ###    #######"
data "###     ###     ##   #########"
data "#####    ######     ##########"
data "##############################"

' Dungeon 3: Lost crypt
data "##############################"
data "#  #  #  #  #  #  #  #  # @###"
data "#  #  #  #  #  #  #  #  #  ###"
data "# ### ## ## ## ## ## ## #  ###"
data "#                          ###"
data "# ###### ######### ####### ###"
data "# #                      # ###"
data "# #  #                #  # ###"
data "# #                      # ###"
data "# #  #                #  # ###"
data "# #                      # ###"
data "# #  #                #  # ###"
data "# #                      # ###"
data "# ######################## ###"
data "#            X             ###"
data "##############################"

' Dungeon
data "##############################"
data "#@                 #         #"
data "###### ####### #####         #"
data "#   #     #        #         #"
data "#   ## ####### ############  #"
data "#   #   #####             #  #"
data "#   #   #####             #  #"
data "## ### ################# ##  #"
data "#                            #"
data "#  #    #    #    #    #     #"
data "#                         ####"
data "#                          X##"
data "#                         ####"
data "#  #    #    #    #    #     #"
data "#                            #"
data "##############################"

data "##############################"
data "#                            #"
data "#### #                       #"
data "##X  #################      ##"
data "######              #        #"
data "#      #  #  #  #   #        #"
data "#                            #"
data "#                            #"
data "#      #  #  #  #   #        #"
data "#                   #        #"
data "#####################     ####"
data "#                          @##"
data "## ### ### ### ### ##     ####"
data "#   #   #   #   #   #        #"
data "#   #   #   #   #   #        #"
data "##############################"

data "##############################"
data "#   #       #                #"
data "#   #       #             ####"
data "# @ ####### #             #  #"
data "#           #             #  #"
data "##### ##### ##### #########  #"
data "#   # #   # #   # #       #  #"
data "#     #   # #             #  #"
data "#   # #   # #   # #       #  #"
data "##### ## ## ##### #########  #"
data "#                 #   #   ####"
data "#  #  #  #  #  #  # # # # #  #"
data "#                   # # # #  #"
data "#  #  #  #  #  #  # # # #    #"
data "#                 # #   # # X#"
data "##############################"

data "##############################"
data "#  #   #                #    #"
data "#    #   #           # #   # #"
data "# #################### ## ####"
data "#        #           # #     #"
data "#  ## ###### ## ###### # #####"
data "#  ##        #       # #     #"
data "#  ################# # ##### #"
data "#               #    # ##    #"
data "#  ############## #### ## ####"
data "#  #        #     #     #    #"
data "#### ##### ### ####### ##### #"
data "#        #     #     # X#    #"
data "# ################ ####### ###"
data "#                           @#"
data "##############################"

for d%=0 to nd-1
  for i%=0 to mh-1
    read base$(d%,i%)
  next
next

quit%=0
dead%=0
completed%=0

for dungeon%=0 to nd-1
  for i%=0 to mh-1
    m$(i%)=base$(dungeon%,i%)
  next

  ' Gold placement
  for n%=1 to 4
    do
      x%=int(rnd*mw)
      y%=int(rnd*mh)
      c$=mid$(m$(y%),x%+1,1)
    loop until c$=" "
    m$(y%)=left$(m$(y%),           x%)+"$"+mid$(m$(y%),x%+2)
  next

  ' Enemies placement
  for n%=1 to 2
    do
      x%=int(rnd*mw)
      y%=int(rnd*mh)
      c$=mid$(m$(y%),x%+1,1)
    loop until c$=" "
    m$(y%)=left$(m$(y%),           x%)+"*"+mid$(m$(y%),x%+2)
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

  exitFound%=0

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
    ?"Dungeon ";dungeon%+1
    ?"WASD - move"
    ?"[Esc] - quit"
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
    elseif k$=chr$(27) then
      cls
      ?"You flee the dungeon."
      ?"Gold: ";gold%
      ?"HP: ";hp%
      ?"XP: ";xp%
      framebuffer copy f,n
      quit%=1
      exit do
    endif
    c$=mid$(m$(ny%),nx%+1,1)
    if c$<>"#" then
      px%=nx%
      py%=ny%
    endif
    if c$="X" then
      exitFound%=1
      exit do
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
        ?"You succumbed to your                 wounds!"
        ?"Gold: ";gold%
        ?"XP: ";xp%
        framebuffer copy f,n
        dead%=1
        exit do
      endif
    endif
  loop

  if dead% or quit% then exit for

  if exitFound% then
    if dungeon%=nd-1 then
      cls
      ?"You escaped every dungeon!"
      ?"Gold: ";gold%
      ?"HP: ";hp%
      ?"XP: ";xp%
      framebuffer copy f,n
      completed%=1
      exit for
    else
      cls
      ?"Dungeon ";dungeon%+1;"            cleared!"
      ?"Prepare for dungeon            ";dungeon%+2
      ?"[Enter] when ready"
      framebuffer copy f,n
      do
        k$=inkey$
      loop until k$<>""
      cls
    endif
  endif
next

if completed%=0 and quit%=0 and            dead%=0 then
  cls
  ?"Your adventure ends early."
  framebuffer copy f,n
endif
