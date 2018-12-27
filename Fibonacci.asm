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
	
	call readint
	mov ecx,eax
	
	mov eax,0
	mov ebx,1

L1:
	call writedec
	call crlf
	mov tmp,eax
	add eax,ebx
	mov ebx,tmp
	loop L1

	exit
	
main ENDP

END main