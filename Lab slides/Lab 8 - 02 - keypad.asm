CODE	SEGMENT
	ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE	


key		equ	01h

		org 1000h
start:	call scan
		int 3
		jmp start
	
	
;------------------------keypad scan procedure---------------------	
scan:	IN AL,key					;read from keypad register
		TEST AL,10000000b			;test status flag of keypad register
		JNZ Scan
		AND al,00011111b			;mask the valid bits for code
		int 3
		OUT key,AL					;get the keypad ready to read another key
		ret
		
CODE	ENDS
	END		