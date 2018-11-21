
; This program reverses a string
;Author:  MBadry

org 100h
include 'emu8086.inc'

.data
strExample DB "Assembly",0
strExampleSize = ($ - strExample) - 1  

.code                             
main PROC   
   LEA si,strExample    ;The same as mov si, OFFSET strExample
   call print_string
   putc 0dh 
   putc 0ah
   
   mov cx,strExampleSize
   mov si,0
   L1:
      mov ax,0
      mov al,strExample[si]
      push ax
      inc si 
      loop L1
   
   mov cx,strExampleSize
   mov si,0
   L2:
      pop ax
      mov strExample[si],al
      inc si
      loop L2
   
   mov si, OFFSET strExample
   call print_string
    
    JMP Exit
main ENDP

Exit: ret
DEFINE_PRINT_STRING
END main








