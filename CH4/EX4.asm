.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

firstarray WORD 1,3,5,7,9,11,13
count EQU (LENGTHOF firstarray)
endarray DWORD count DUP (0)
	
.code
main PROC
	
	mov esi,0
	mov ecx,count
	mov eax,0
	mov edi,0

L1:
	mov ax,firstarray[esi]
	mov endarray[edi],eax
	add esi,2
	add edi,4
	loop L1

	call crlf
	mov esi,0
	mov ecx,count
L2:
	mov eax,endarray[esi]
	call writedec
	call crlf
	add esi,4
	loop L2

	call dumpregs

	exit
	
main ENDP

END main