.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

Str_nextWord PROTO,
pString:PTR BYTE,
delimiter:BYTE

.data
testStr BYTE "Johnson,Calvin,goes,to sleep,by,tonight",0
.data

.code
main PROC
	
	mov edx,OFFSET testStr
	call WriteString
	call crlf

	mov esi, OFFSET testStr
	L1: INVOKE Str_nextword, esi, ","
		jnz Exit_prog
		mov esi, eax 
		mov edx, eax
		call WriteString
		call crlf
		jmp L1

	Exit_prog:
		exit
	
main ENDP

Str_nextWord PROC,
	pString:PTR BYTE,
	delimiter:BYTE
	
	mov al, delimiter
	mov esi, pString
	cld
	L1:
		lodsb
		cmp al, 0
		je L3
		cmp al,delimiter
		jne L1
	L2:
		mov BYTE PTR [esi-1], 0
		mov eax, esi
		Jmp Exit_proc
	L3:
		or al,1
	Exit_proc:
		ret

Str_nextWord ENDP

END main