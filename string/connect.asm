.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

Str_connect PROTO,
source:PTR BYTE,
target:PTR BYTE

.data
	targetStr BYTE "123456789",0
	sourceStr BYTE "987654321",0
	len DWORD ?
.code
main PROC
	
	INVOKE Str_connect, ADDR targetStr, ADDR sourceStr
	mov edx,OFFSET targetStr
	call WriteString
	call crlf

	exit
	
main ENDP

Str_connect PROC,
	target:PTR BYTE,
	source:PTR BYTE
	
	INVOKE Str_length,target
	mov len,eax
	INVOKE Str_length,source
	mov ecx,eax
	add ecx,1

	mov esi, source
	mov edi, target
	add edi, len
	cld
	rep movsb 
	ret

Str_connect ENDP

END main