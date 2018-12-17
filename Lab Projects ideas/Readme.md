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
- Expression calculator and Binary search projects is now filled.


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

| Project title             | Teams registered                         | Count |
| ------------------------- | ---------------------------------------- | ----- |
| **Shape detector**        | ms2102                                   | **1** |
| **Expression calculator** | BroadCast, E.S.M, MASM, aa4086           | **4** |
| **String drawer**         | Strong 🤘, Hackers, Heros, remondahany027 | **4** |
| **Contact list**          | EGO, Violets, Snipers ✌                  | **3** |
| **Binary search**         | RAMD,  A.I.A.M.A.A, ghosts 👻, aaaime     | **4** |



## Teams

| Team        | *BroadCast*               |
| ----------- | ------------------------- |
| **Problem** | **Expression Calculator** |
| **Members** | Tamer Sayed               |
|             | Bahi Mohamed              |
|             | Mohamed Nafeaa            |
|             | Mohamed Sayed             |
|             | Abdelaziz Hamed           |
|             | Mahmoud Ali Kamel         |


| Team        | RAMD                  |
| ----------- | --------------------- |
| **Problem** | **Binary Search**     |
| **Members** | Rahma Hassan Mohammed |
|             | Mariam Gomaa Ali      |
|             | Aya Ahmed Oweis       |
|             | Raghda Mahmoud Oweis  |
|             | Nora Salama Mohammed  |
|             | Doaa Hassan Hussien   |

| Team        | EGO                       |
| ----------- | ------------------------- |
| **Problem** | **Contact List**          |
| **Members** | Kareem Abdeltawab Ahmed   |
|             | Ali Salah                 |
|             | Khaled Kamal              |
|             | Mostafa Mohamed Tawfike   |
|             | Abdelrahman Mostafa Salah |
|             | Essam Ahmed Radwan        |

| Team        | E.S.M                      |
| ----------- | -------------------------- |
| **Problem** | **Expression Calculator**  |
| **Members** | Esraa Ahmed Esmael         |
|             | Shimaa Ezat Mohamed        |
|             | Mohamed Ahmed Mahmoud Nasr |

| Team        | Strong 🤘                      |
| ----------- | ----------------------------- |
| **Problem** | **String Drawer**             |
| **Members** | Omnia Mahmoud Mohamed Ahmed   |
|             | Sherook Mohamed               |
|             | Ahmed Moawad Zaki             |
|             | Abdelrahman Mohamed Noureldin |

| Team        | MASM                      |
| ----------- | ------------------------- |
| **Problem** | **Expression Calculator** |
| **Members** | Mohammed Ali              |
|             | Abdularahman Mohamed      |
|             | Abdularahman Atef         |
|             | Ebraam Ayman              |
|             | Nourhan Tarek             |
|             | Mohamed Eways             |

| Team        | A.I.A.M.A.A              |
| ----------- | ------------------------ |
| **Problem** | **Binary Search**        |
| **Members** | Ashraf AbdElhady Hussin  |
|             | Isalm Ahmed AbdElazim    |
|             | AbduElrhman Magdy Mohmed |
|             | Ahmed Mohmed Elsyed      |
|             | Ahmed Mohmed AbdEslam    |
|             | Mostafa safout           |

| Team        | ghosts 👻          |
| ----------- | ----------------- |
| **Problem** | **Binary Search** |
| **Members** | Kristena Emad     |
|             | Eeren Atef        |
|             | Asmaa Abdelnasser |
|             | Remon Ezzat       |
|             | Ibram Samir       |

| Team        | aaaime                    |
| ----------- | ------------------------- |
| **Problem** | **Binary Search**         |
| **Members** | Ahmed Hegag               |
|             | Ahmed Mohamed Ibrahim     |
|             | Ahmed Mohamoud Abdelazime |
|             | Islam Mohamed             |
|             | Michael Adel              |
|             | Ezzat mohamed             |

| Team        | aa4086                    |
| ----------- | ------------------------- |
| **Problem** | **Expression Calculator** |
| **Members** | Abdelrahman Ahmed         |
|             | Badr eldin Mohamed        |
|             | Hassan Abdelrahman        |
|             | Yomna Hosni Abdelaziz     |
|             | Asmaa Khaled Ahmed        |
|             | Kirolos Gerges Ibrahim    |

| Team        | Violets               |
| ----------- | --------------------- |
| **Problem** | **Contact List**      |
| **Members** | Asmaa Mahmoud Ali     |
|             | Reham Mohamed         |
|             | Reem Osama            |
|             | Esraa Adel            |
|             | Mansour Saleh Mansour |

| Team        | Snipers ✌          |
| ----------- | ------------------ |
| **Problem** | **Contact List**   |
| **Members** | Ahmed Gomaa soFy   |
|             | Ahmed Nour_eldin   |
|             | Khalid abdelrahmn  |
|             | Mostafa Tarek      |
|             | Hussein Mohammed   |
|             | Ahmed Qorany Rabea |

| Team        | Hackers                    |
| ----------- | -------------------------- |
| **Problem** | **String Drawer**          |
| **Members** | Ahmed Mahmoud Saber Khamis |
|             | Tariq Mahmoud Yousef       |
|             | Maaz Ayman Gamal           |
|             | Mahmoud Ezzat Mahmoud      |
|             | Mohammed Ramadan Mohammed  |
|             | Khaled Sherif              |

| Team        | Heros                           |
| ----------- | ------------------------------- |
| **Problem** | **String Drawer**               |
| **Members** | Hossam Mohamed Kotp             |
|             | Abd El-hamed Ahmed Abd El-hamed |
|             | Emad Mohamed Fauk               |
|             | Ahmed Kamal Mabrouk             |
|             | Bassel Mahmoud                  |
|             | Maybour Louis                   |

| Team        | **remondahany027** |
| ----------- | ------------------ |
| **Problem** | **String drawer**  |
| **Members** | Remonda hany       |
|             | Sara sayed         |
|             | Sara gerges        |
|             | Aya ashrey         |
|             | Aya saber          |
|             | Dalia mohsen       |

| Team        | **ms2102**          |
| ----------- | ------------------- |
| **Problem** | **shape detector**  |
| **Members** | Mariam Suleiman     |
|             | Ibram Ayman Farahat |
|             | Mohamed Naser Soufy |
|             | Ahmed Kamal Elsayed |
|             | Mena Karam Khalel   |

