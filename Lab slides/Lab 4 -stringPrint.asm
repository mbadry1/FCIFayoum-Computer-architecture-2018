
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
include 'emu8086.inc'
       
.data
greeting2 DB "Welcome to the Encryption Demo program "
          DB "created by Kip Irvine.",0dh,0ah,0h
str DB "string",0

.code
LEA SI, greeting2
CALL print_string 

LEA SI, str
CALL print_string
   
   
DEFINE_PRINT_STRING
ret




