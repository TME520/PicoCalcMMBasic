dim rooms$(25)
dim player(3)
dim fightoccurred

player(0)=100
player(1)=10
player(2)=0
fightoccurred=0

rooms$(1)="You are at the entrance           of  the dungeon. There is a   dark         hallway  to the North."
rooms$(2)="A dimly lit room with a            strange odor. Is there a   Kobold          here?"
rooms$(3)="This room is filled with           rubble. It smells musty in     here."
rooms$(4)="There is something sticky           on the floor. You get an    uneasy        feeling."
rooms$(5)="A room filled with           shimmer ing light. You hear   something         move behind you."
rooms$(6)="A narrow hallway. The air           is cold here. You feel a      presence      watching you."
rooms$(7)="An empty room, quiet,          but you sense danger nearby."
rooms$(8)="This room has a low          ceiling, and you can barely move.  Is         there a treasure here?"
rooms$(9)="You enter a damp chamber ,          and water sloshes  underfoot."
rooms$(10)="A room filled with          strange symbols on the walls. You          feel disoriented."
rooms$(11)="A dusty chamber with a          large, broken table in the     center."
rooms$(12)="The massive stone doors          that once blocked the exits  are     now     cracked open."
rooms$(13)="A dark and cramped room.          You hear something skittering    in     the   shadows."
rooms$(14)="A room full of bones.          You feel an eerie chill in the     air."
rooms$(15)="This room is filled with          smoke, and you can barely see     the      path ahead."
rooms$(16)="You see a treasure chest          here, unfortunately it is       empty..."
rooms$(17)="A room with strange,          glowing mushrooms. The air feels          charged with magic."
rooms$(18)="A cold stone chamber          with a single, high window. It is          eerily quiet."
rooms$(19)="You walk into a room          with a large, intricate symbol on     the      floor."
rooms$(20)="This room is filled with          garbage and smells like  feet."
rooms$(21)="A room filled with cages          , but they are empty."
rooms$(22)="A small room with a          spider lurking in the corner."
rooms$(23)="A grand hall with high          ceilings. You hear footsteps     behind      you."
rooms$(24)="This room is filled with          treasure, unfortunately it is    an       illusion!"
rooms$(25)="You see the exit. You've          made it out of the dungeon      alive!"

currentroom=1

do while action$<>"q"
  print:print "----------"
  ?"You are in room "; currentroom
  ?rooms$(currentroom)
  ?"Health: ";player(0);" Strength:         ";player(1)
  ?"Inventory: ";player(2)
  if currentroom=25 then
    end
  endif
  ?"What will you do? n/s/e/w/q"
  input action$
  if action$="q" then
    ?"You dash towards the exit."
    end
  elseif action$="n" then
    if currentroom>5 then
      currentroom=currentroom-5
    else
      ?"Cannot move North"
    endif
  elseif action$="s" then
    if currentroom<21 then
      currentroom=currentroom+5
    else
      ?"Cannot move South"
    endif
  elseif action$="e" then
    if currentroom<24 then
      currentroom=currentroom+1
    else
      ?"Cannot move East"
    endif
  elseif action$="w" then
    if currentroom>1 then
      currentroom=currentroom-1
    else
      ?"Cannot move West"
    endif
  endif
  ismonster=int(rnd*100)+1
  if ismonster<31 then
    monster=int(rnd*3)+1
    if monster=1 then
      ?"A goblin appears!"
    elseif monster=2 then
      ?"An orc attacks!"
    else
      ?"A kobold sneaks up on you!"
    endif
    ?"Fight (f) or Run (r)?"
    input fightrun$
    if fightrun$="f" then
      roll_d20=int(rnd*20)+1
      attack=roll_d20+player(1)
      if attack>17 then
        ?"You defeated the monster!"
        player(0)=player(0)-10
        player(1)=player(1)+.25
      else
        ?"The monster defeats you!"
        player(0)=player(0)-20
        player(1)=player(1)+.1
      endif
      fightoccurred=1
    elseif fightrun$="r" then
      ?"You ran away."
      currentroom=currentroom-1
      fightoccured=1
    else
      ?"Invalid action..."
    endif
  else
    ?"You are alone in this room"
    fightoccurred=0
  endif
  istrap=int(rnd*100)+1
  if istrap<11 then
    whattrap=int(rnd*3)+1
    if whattrap=1 then
      traptype$="Poison dart trap"
    elseif whattrap=2 then
      traptype$="Pit trap"
    else
      traptype$="Exploding rune  trap"
    endif
    roll_d20=int(rnd*20)+1
    resolvetrap=roll_d20+player(1)
    if resolvetrap>17 then
      ?"You found a ";traptype$
      ?"You avoided it"
      player(1)=player(1)+.25
    elseif resolvetrap<18 then
      ?"A ";traptype$;" got you..."
      player(0)=player(0)-10
      player(1)=player(1)+.1
      fightoccurred=1
    endif
  endif
  if fightoccurred=0 and    player(0)<100 then
    player(0)=player(0)+1
    ?"You rest & regain 1 Health"
  endif
  if player(0)<=0 then
    ?"You died, game over..."
    end
  endif
  istreasure=int(rnd*100)+1
  if istreasure<21 then
    ?"Treasure found!"
    player(2)=player(2)+1 
  endif
loop