.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	need BYTE ?
	input BYTE "Enter a line of string: ",0,0ah,0dh
	Vowels BYTE "Vowels: " ,0,0ah,0dh
	Consonants BYTE "Consonants: ",0,0ah,0dh
	Digits BYTE "Digits: " ,0,0ah,0dh
	White BYTE "White spaces: ",0,0ah,0dh
	len DWORD 0
	num1 DWORD 0
	num2 DWORD 0
	num3 DWORD 0
	num4 DWORD 0

check proto,
	use: PTR BYTE

.code
main PROC
	
	mov edx,offset input
	call writestring
	call crlf
	mov edx,offset need
	call readstring
	mov len,eax
	
	invoke check,addr need

	mov edx,offset Vowels
	call writestring
	mov eax,num1
	call writedec
	call crlf

	mov edx,offset Consonants
	call writestring
	mov eax,num2
	call writedec
	call crlf

	mov edx,offset Digits
	call writestring
	mov eax,num3
	call writedec
	call crlf

	mov edx,offset White
	call writestring
	mov eax,num4
	call writedec
	call crlf

	exit
	
main ENDP

check PROC,
	use: PTR BYTE

	mov esi,0
	mov ecx,len

	L1:
		.if( use[esi] == 'a' ) || ( use[esi] =='e') || ( use[esi] =='i') || ( use[esi] =='o') || ( use[esi] =='u') || ( use[esi] =='A') || ( use[esi] =='E') || ( use[esi] =='I') || ( use[esi] =='O') || ( use[esi] =='U')
			add num1,1
		.elseif(use[esi]>='a' ) && ( use[esi]<='z') || (use[esi]>='A') && (use[esi]<='Z')
			add num2,1
		.elseif(use[esi]>='0') && (use[esi]<='9')
			add num3,1
		.elseif(use[esi]==' ')
			add num4,1
		.endif


check ENDP

END main