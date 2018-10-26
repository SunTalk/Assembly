.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

arrayBYTE BYTE 200 DUP (0)
count EQU (LENGTHOF arrayBYTE)
reversearrayBYTE BYTE 200 DUP (0)
N1 DWORD 0
N2 DWORD 0
runvalue DWORD 0
Total DWORD 0
MSG0 BYTE "Enter N1 and N2, Now enter N1",0dh,0ah,0
MSG1 BYTE "Enter N2 Now",0dh,0ah,0
MSG2 BYTE "The reversed Array BYTE is as follows",0dh,0ah,0
MSG3 BYTE "The Total of adding the reversed BYTE array",0dh,0ah,0

.code
main PROC

	mov edx, OFFSET MSG0
	call writestring
	call readint
	mov N1,eax

	mov edx, OFFSET MSG1
	call writestring
	call readint
	mov N2,eax

	mov eax,N2
	sub eax,N1
	mov ecx,eax
	add ecx,1

	mov eax,0
	mov esi,0
	mov eax,N1

L1:
	mov arrayBYTE[esi],al
	add eax,1
	add esi,2
	loop L1

	mov eax,N2
	sub eax,N1
	mov ecx,eax
	add ecx,1

	mov esi,0
	mov edi,ecx
	add edi,ecx
	sub edi,2
	mov eax,0

L2:
	mov al,arrayBYTE[esi]
	mov reversearrayBYTE[edi],al
	add esi,2
	sub edi,2
	loop L2

	mov eax,N2
	sub eax,N1
	mov ecx,eax
	add ecx,1
	mov esi,0
	mov ebx,0
	mov eax,0
	mov edx,OFFSET MSG2
	call writestring

L3:
	mov al,reversearrayBYTE[esi]
	add ebx,eax
	call writedec
	call crlf
	add esi,2
	loop L3

	mov eax,ebx
	mov edx, OFFSET MSG3
	call writestring
	call writeint
	call crlf


	exit
	
main ENDP

END main