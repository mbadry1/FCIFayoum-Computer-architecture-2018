
; This program copy string1 into string 2
;Author:  MBadry

org 100h
include 'emu8086.inc'

.data
newLine DB 0dh,0ah
string1 DB "Assembly",0
string1Size= ($ - string1)    ;Gets size of string1 by $ notation
string2 DB string1Size DUP(0) 

.code                             
main PROC
    mov si,0 
    mov cx,string1Size
    L1:
        mov al,string1[si]
        mov string2[si],al
        inc si
        loop L1
    
    
    
    ;To make sure the string is copied
    PRINT 'string2 = '
    MOV AH, 0Eh   ;Used to use the print char interrupt
    mov si,0 
    mov cx,string1Size
    L2:
        mov al,string2[si]
        int 10h
        inc si
        loop L2
    
    PUTC newLine[0]    
    PUTC newLine[1]   ;Print new line 
    
    ;To make sure the string is copied using macros
    PRINT 'string2 = '
    mov cx,string1Size
    mov si,0
    L3:
        PUTC string2[si]
        inc si
        loop L3
        
    PUTC newLine[0]    
    PUTC newLine[1]   ;Print new line 
    
	;To make sure the string is copied using procedures
    mov si, OFFSET string2
    PRINT 'string2 = '
    CALL print_string
    
    JMP Exit
main ENDP

Exit: ret
DEFINE_PRINT_STRING
END main








