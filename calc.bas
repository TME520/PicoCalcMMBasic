' PicoCalc CLI Calculator
' Simple command-line calculator
'
' Usage: Enter expressions like: 5 + 3
' Supports: +, -, *, /, (, )
' Commands: CLEAR, EXIT
'
' Created for PicoCalcVibes
' 2025

' Variables
DIM expression$
DIM result
DIM num1, num2
DIM operator$
DIM sp1

' Show title and instructions
GOSUB ShowTitle

' Main calculator loop
DO
    PRINT "Calc> ";
    INPUT expression$
    GOSUB ProcessExpression
LOOP UNTIL expression$ = "EXIT"

' Clean exit
PRINT "Calculator closed."
END

' Show title and usage instructions
ShowTitle:
    CLS
    PRINT "========================================"
    PRINT "         PicoCalc CLI Calculator"
    PRINT "========================================"
    PRINT
    PRINT "Usage:"
    PRINT "  Enter expressions like: 5 + 3"
    PRINT "  Supports: + - * /"
    PRINT
    PRINT "Examples:"
    PRINT "  2 + 3        Result: 5"
    PRINT "  10 * 5       Result: 50"
    PRINT "  20 / 4       Result: 5"
    PRINT "  15.5 - 3.2   Result: 12.3"
    PRINT
    PRINT "Commands:"
    PRINT " CLEAR - Clear screen and show help."
    PRINT " EXIT  - Exit calculator."
    PRINT
    PRINT "========================================"
    PRINT
RETURN

' Process the entered expression
ProcessExpression:
    ' Handle special commands
    IF expression$ = "CLEAR" THEN
        CLS
        GOSUB ShowTitle
        RETURN
    END IF
    
    IF expression$ = "EXIT" THEN
        RETURN
    END IF
    
    ' Parse and calculate simple expressions
    GOSUB ParseExpression
RETURN

' Parse simple expressions (num1 operator num2)
ParseExpression:
    ' Simple parsing - find operator in middle
    sp1 = 0
    
    ' Look for operators
    IF INSTR(expression$, " + ") > 0 THEN
        sp1 = INSTR(expression$, " + ")
        operator$ = "+"
    ELSEIF INSTR(expression$, " - ") > 0 THEN
        sp1 = INSTR(expression$, " - ")
        operator$ = "-"
    ELSEIF INSTR(expression$, " * ") > 0 THEN
        sp1 = INSTR(expression$, " * ")
        operator$ = "*"
    ELSEIF INSTR(expression$, " / ") > 0 THEN
        sp1 = INSTR(expression$, " / ")
        operator$ = "/"
    ELSE
        PRINT "Error: No valid operator found"
        PRINT "Use format: 5 + 3"
        PRINT
        RETURN
    END IF
    
    ' Extract numbers
    num1 = VAL(LEFT$(expression$, sp1 - 1))
    num2 = VAL(MID$(expression$, sp1 + 3))
    
    ' Calculate result
    IF operator$ = "+" THEN
        result = num1 + num2
    ELSEIF operator$ = "-" THEN
        result = num1 - num2
    ELSEIF operator$ = "*" THEN
        result = num1 * num2
    ELSEIF operator$ = "/" THEN
        IF num2 <> 0 THEN
            result = num1 / num2
        ELSE
            PRINT "Error: Division by zero"
            PRINT
            RETURN
        END IF
    ELSE
        PRINT "Error: Unknown operator '"; operator$; "'"
        PRINT "Use: + - * /"
        PRINT
        RETURN
    END IF
    
    PRINT "Result: "; result
    PRINT
RETURN
