.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

tmp DWORD ?

.code
main PROC

	mov ecx,30
	mov eax,1
	mov ebx,1
	call writedec
	call crlf
	call writedec
	call crlf

L1:
	mov tmp,ebx
	mov ebx,eax
	add eax,tmp
	call writedec
	call crlf
	loop L1

	exit
	
main ENDP

END main