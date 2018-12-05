CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE	

command	equ	00
key	equ	01h
stat	equ 02
data	equ	04

		org 1000h
		
		call init
		call scan
		
		cmp al,0ch
		jne f2
f1:		mov al,'c'
		out data,al
		jmp f3
f2:		
		cmp al,0dh
		jne f3
		mov al,'d'
		out data,al

f3:
        hlt


;---------------Display initialization procedure--------
init:	        call busy
		mov al,30h
		out command,al
		call busy
		mov al,0fh
		out command,al
		call busy
		mov al,06h
		out command,al
		call busy
		mov al,02
		out command,al
		call busy
		mov al,01
		out command,al
		call busy
		ret
		




;-----------------display ready procedure------------		
busy:	IN AL,Stat
		test AL,10000000b
		jnz busy
		ret
	
;------------------------keypad scan procedure---------------------	
scan:	IN AL,key					;read from keypad register
		TEST AL,10000000b			;test status flag of keypad register
		JNZ Scan
		AND al,00011111b			;mask the valid bits for code
		OUT key,AL					;get the keypad ready to read another key
		ret
		
CODE	ENDS
	END		