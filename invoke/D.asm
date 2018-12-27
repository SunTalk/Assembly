.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	
	need BYTE ?,0
	intput BYTE "Enter a string: ",0dh,0ah,0
	output BYTE "Output String: ",0dh,0ah,0
	len DWORD 0
	after BYTE ?

remove PROTO,
	use: PTR BYTE

.code
main PROC
	
	mov edx,offset intput
	call writestring
	
	mov ecx,150
	mov edx,offset need
	call readstring
	mov len,eax

	invoke remove,addr need

	mov edx,offset output
	call writestring
	mov edx,offset after
	call writestring
	call crlf

	exit
	
main ENDP

remove PROC,
	use: PTR BYTE
	
	mov esi,use
	mov edi,offset after
	mov ecx,len

	L1:
		mov bl,[esi]
		.if(bl>='a') && (bl<='z') || (bl>='A') && (bl<='Z')
			mov [edi],bl
			add edi,1
		.endif
		add esi,1
	loop L1

	mov bl,0
	mov [edi],bl

	ret
remove ENDP

END main