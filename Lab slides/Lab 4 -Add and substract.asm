
; This program adds and subtracts 16-bit unsigned
; integers and stores the sum in a variable.
;Author:  MBadry

org 100h
.data
vall DW 100h
val2 DW 400h
val3 DW 200h
finalVal DW ? 

.code
main PROC 
    mov bx,vall
    add bx,val2
    sub bx,val3
    mov finalVal,bx
JMP Exit
main ENDP

Exit: ret
END main





