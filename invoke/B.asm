.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	
	intput BYTE "Enter an alphabet: ",0dh,0ah,0
	output1 BYTE " is a vowel." ,0dh,0ah,0
	output2 BYTE " is a consonant." ,0dh,0ah,0
	check BYTE "aeiouAEIOU" ,0dh,0ah,0
	char BYTE ?

alphabet proto,
	use: PTR BYTE,
	target: BYTE

.code
main PROC
	
	mov edx,offset intput
	call writestring
	call crlf
	call readchar
	mov char,al
	call writechar

	mov eax,0
	invoke alphabet,addr check,char

	.if (eax == 1)
		mov edx,offset output1
	.else
		mov edx,offset output2
	.endif

	call writestring
	call crlf

	exit
	
main ENDP

alphabet proc,
	use: PTR BYTE,
	target: BYTE

	mov bl,target
	mov esi,use
	mov ecx,10

	L1:
		cmp [esi],bl
		je thesame
		jmp other

		thesame:
			mov eax,1
		other:
			add esi,1
	loop L1
	ret

alphabet ENDP

END main