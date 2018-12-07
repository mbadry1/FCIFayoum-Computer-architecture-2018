# Lab Projects Ideas

Read the following points carefully:

- Each team should choose one idea from the listed ideas. A secondary project idea should be chosen as well in case the selected project was out of selection.


- A team is formed by 3, 4, 5, or 6 members.
- After choosing your idea, send to me an email with the **team members**, **team name**, **Primary idea**, and **Secondary idea** then wait for a **confirmation** from me.

  - Email: "mma18@fayoum.edu.eg"
- The details email should be sent before **Monday** **"10-12-2018"**.
- Projects ideas should be balanced over all the teams. I might force a team to an idea if there aren't enough teams in it.
- Each project contains a **bonus** task.
- **Copying** code from each others is **forbidden**.


## Announcements

- `Template.asm` file has been added.


## Useful codes for the project

- First and last lines on any kit code:

  - ```assembly
    CODE	SEGMENT
    ASSUME	CS:CODE,DS:CODE,ES:CODE,SS:CODE	
    command	equ	00h
    stat	equ 02h
    data	equ	04h
    key		equ	01h
    org 1000h

    ; Put your code here...

    CODE	ENDS
    END
    ```

- Scan procedure:

  - ```assembly
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
    ```

- Busy procedure:

  - ```assembly
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
    ```

- LCD screen initialization procedure:

  - ```assembly
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
    ```

- Clear screen

  - ```assembly
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
    ```


  ​


## Registered ideas and teams:

| Project title             | Teams registered | Count |
| ------------------------- | ---------------- | ----- |
| **Shape detector**        |                  | **0** |
| **Expression calculator** |                  | **0** |
| **String drawer**         |                  | **0** |
| **Contact list**          |                  | **0** |
| **Binary search**         |                  | **0** |



## Teams

| Team        | *Team name here*        |
| ----------- | ----------------------- |
| **Problem** | ***Problem name here*** |
| **Members** | ***Member name here***  |
|             | ***Member name here***  |
|             | ***Member name here***  |
|             | ***Member name here***  |
