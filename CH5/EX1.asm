.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

MSG BYTE "Hello Word!" ,0dh,0ah,0

.code
main PROC
	
	mov eax,054h
	call SetTextColor
	mov eax,0
	mov ecx,17
	mov edx, OffSET MSG

L1:
	call SetTextColor
	add eax,11h
	call WriteString
	loop L1

	exit
	
main ENDP

END main