CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE	

command	equ	00
stat	equ 02
data	equ	04

		org 1000h
		
		call init
		mov si,offset str
start:	mov al,[si]
		cmp al,00
		je L1
		out data,al
		call busy
		inc si
		jmp start
		
L1:		hlt
str		db "Hello World!",00


;---------------Display initialization procedure--------
init:	call busy      	    ;Check if KIT is busy
		mov al,30h          ;8-bits mode, one line & 5x7 dots
		out command,al      ;Execute the command above.
		call busy           ;Check if KIT is busy
		mov al,0fh          ;Turn the display and cursor ON, and set cursor to blink
		out command,al      ;Execute the command above.
		call busy           ;Check if KIT is busy
		mov al,06h          ;cursor is to be moved to right
		out command,al      ;Execute the command above.
		call busy           ;Check if KIT is busy
		mov al,02           ;Return cursor to home
		out command,al      ;Execute the command above.
		call busy           ;Check if KIT is busy
		mov al,01           ;Clear the display
		out command,al      ;Execute the command above.
		call busy           ;Check if KIT is busy
		ret
		




;-----------------display ready procedure------------		
busy:	IN AL,Stat
		test AL,10000000b
		jnz busy
		ret
		
CODE	ENDS
	END		