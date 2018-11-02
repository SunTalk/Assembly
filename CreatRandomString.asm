.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

str_count = 20
str_size = 10
tab = 9
.data

aString BYTE str_size dup(0),0

.code
main PROC
	
	mov ecx,str_count
	call Randomize

L1:
	mov eax,str_size
	mov esi, offset aString
	call CreateRandomString

	mov edx,offset aString
	call WriteString
	mov al,tab
	call WriteChar

	loop L1

CreateRandomString PROC
	push ecx
	mov ecx,eax
L1:
	mov eax,26
	call Randomrange
	add eax,'A'
	mov [esi],al
	inc esi
	loop L1

	pop ecx
	ret
	CreateRandomString ENDP

	exit
	
main ENDP

END main