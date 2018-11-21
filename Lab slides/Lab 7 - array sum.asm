
; This program Sums content of a 16 bit array
;Author:  MBadry

org 100h
include 'emu8086.inc'

.data
array DW 0001h,0002h,0003h
arrayCount = ($-array)/2

.code
main PROC
    
    lea si,array
    mov cx, arrayCount
    call ArraySum
    
    call PRINT_NUM_UNS
    JMP Exit
main ENDP
                             
;-----------------------------------------------------  
;ArraySum PROC
;Calculates the sum of an array of 16-bit integers.
;Receives: SI the array offset
;          CX = number of elements in the array
;Returns: AX = sum of the array elements
;-----------------------------------------------------
ArraySum PROC
      push si
      push cx
      mov ax,0
      
      L1:   add ax,[si]
            add si,2
            loop L1
      
      pop si
      pop cx
      ret
ArraySum ENDP 



Exit: ret
DEFINE_PRINT_NUM_UNS
END main
