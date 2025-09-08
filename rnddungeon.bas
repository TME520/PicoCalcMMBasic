dim rooms$(25)
dim player(3)
dim fightoccurred

player(0)=100
player(1)=10
player(2)=0
fightoccurred=0

rooms$(1)="You are at the entrance    of  the dungeon. There is a dark    hallway  to the North."
rooms$(2)="A dimly lit room with a     strange odor. Is there a Kobold     here?"
rooms$(3)="This room is filled with    rubble. It smells musty in here."
rooms$(4)="There is something sticky    on the floor. You get an uneasy    feeling."
rooms$(5)="A room filled with    shimmer ing light. You hear something    move behind you."
rooms$(6)="A narrow hallway. The air    is cold here. You feel a presence    watching you."
rooms$(7)="An empty room, quiet,   but you sense danger nearby".
rooms$(8)="This room has a low   ceiling, and you can barely move. Is   there a treasure here?"
rooms$(9)="You enter a damp chamber ,   and water sloshes underfoot."
rooms$(10)="A room filled with   strange symbols on the walls. You   feel disoriented."
rooms$(11)="A dusty chamber with a   large, broken table in the center."
rooms$(12)="The massive stone doors   that once blocked the exits are now   cracked open."
rooms$(13)="A dark and cramped room.   You hear something skittering in the   shadows."
rooms$(14)="A room full of bones.   You feel an eerie chill in the air."
rooms$(15)="This room is filled with   smoke, and you can barely see the   path ahead."
rooms$(16)="You see a treasure chest   here, unfortunately it is empty..."
rooms$(17)="A room with strange,   glowing mushrooms. The air feels   charged with magic."
rooms$(18)="A cold stone chamber   with a single, high window. It is   eerily quiet."
rooms$(19)="You walk into a room   with a large, intricate symbol on the   floor."
rooms$(20)="This room is filled with   garbage and smells like feet."
rooms$(21)="A room filled with cages   , but they are empty."
rooms$(22)="A small room with a   spider lurking in the corner."
rooms$(23)="A grand hall with high   ceilings. You hear footsteps behind   you."
rooms$(24)="This room is filled with   treasure, unfortunately it is an   illusion!"
rooms$(25)="You see the exit. You've   made it out of the dungeon alive!"

currentroom=1

do while action$<>"q"
  print:print "----------"
  ?"You are in room "; currentroom
loop