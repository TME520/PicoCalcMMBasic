option explicit

settick 0, tick1

settick 1000, tick1

do
  pause 100
loop

sub tick1
  print "tick "; time$
end sub