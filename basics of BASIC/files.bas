open "data.txt" for output as #1
print #1, "Hello, file!"
close #1

open "data.txt" for input as #2
line input #2, a$
?a$
close #2