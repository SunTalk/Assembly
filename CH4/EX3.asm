.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

array DWORD 0,2,5,9,10
count EQU (LENGTHOF array)
tmp DWORD 0

.code
main PROC
	
	mov ecx,count-1
	mov esi,0

L1:
	mov eax,array[esi+4]
	sub eax,array[esi]
	add tmp,eax
	add esi,4
	loop L1

	mov eax,tmp
	call writedec
	call crlf


	exit
	
main ENDP

END main