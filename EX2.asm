.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

myBytes BYTE 10h,20h,30h,40h
myWords WORD 2000h
myString BYTE "ABCDE"


.code
main PROC

	mov eax, LENGTHOF myString
	call dumpRegs
	mov eax, type myString
	call dumpRegs

	exit
	
main ENDP

END main