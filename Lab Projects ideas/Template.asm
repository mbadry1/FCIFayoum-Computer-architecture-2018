CODE	SEGMENT
ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE	
command	equ	00h
stat	equ 02h
data	equ	04h
key		equ	01h
org 1000h

;--------Your code here------- 

hlt
;-----------------------------

;-----------Vars--------------
str db "123",0
;-----------------------------



;-----------------------------------------------------  
;Scan PROC
;Scans a kit button from the user into al
;Inputs:   None
;Outputs:  Al - scanned char code
;-----------------------------------------------------	
scan:   IN AL,key					;read from keypad register
        TEST AL,10000000b			;test status flag of keypad register
        JNZ Scan
        AND al,00011111b			;mask the valid bits for code
        OUT key,AL					;get the keypad ready to read another key
        ret
        
;-----------------------------------------------------  
;Busy PROC
;Makes the CPU wait till the kit is ready to take a command
;Inputs:   None
;Outputs:  None
;-----------------------------------------------------		
busy:   IN AL,Stat
        test AL,10000000b
        jnz busy
        ret
        
;-----------------------------------------------------  
;Lcd_init PROC
;LCD screen initialization which makes the screen ready as a one line input with a ;cursor. You can call this method again if you want to clear the LCD screen
;Inputs:   None
;Outputs:  None
;-----------------------------------------------------	
Lcd_init:	
        push ax
        call busy      	    ;Check if KIT is busy
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
		pop ax
		ret
		
;-----------------------------------------------------  
;clear_screen PROC
;Clears the LCD screen. Use it instead of Lcd_init if you are trying to clear the screen.
;Inputs:   None
;Outputs:  None
;-----------------------------------------------------
clear_screen:
              push ax
              call busy           ;Check if KIT is busy
              mov al,01           ;Clear the display
              out command,al      ;Execute the command above.
              call busy           ;Check if KIT is busy
              pop ax
              

CODE	ENDS
END