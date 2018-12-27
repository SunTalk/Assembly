.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

Str_remove PROTO,
pStart: PTR BYTE,
nChars: DWORD

.data
target BYTE "abcxxxxdefghijklmop",0

.code
main PROC
	
	INVOKE Str_remove, ADDR [target+3],4
	mov edx, OFFSET target
	call WriteString
	call crlf

	INVOKE Str_remove, ADDR [target+2],19
	mov edx, OFFSET target
	call WriteString
	call crlf

	exit
	
main ENDP

Str_remove PROC

	pStart: PTR BYTE,
	nChars: PTR DWORD
	
	INVOKE Str_length,pStart
	mov ecx,eax
	.IF nChars <= ecx
		sub ecx,nChars
	.ENDIF

	mov esi,pStart
	add esi,nChars
	mov edi,pStart

	cld
	rep movsb
	mov BYTE PTR [edi],0

	Exit_proc:
		ret

Str_remove ENDP

END main