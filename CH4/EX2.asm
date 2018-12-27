.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data

startarr DWORD 10,20,30,40,50,60,70,80
count EQU (LENGTHOF startarr)
endarr DWORD count DUP(0)

.code
main PROC
	
	mov ecx ,count/2
	mov esi,0

L1:
	mov eax,startarr[esi]
	mov endarr[esi+4],eax
	mov eax,startarr[esi+4]
	mov endarr[esi],eax
	add esi,8
	loop L1

	mov esi,0
	mov ecx,count
L2:
	mov eax,startarr[esi]
	call writedec
	call crlf
	add esi,4
	loop L2

	mov esi,0
	mov ecx,count
	call crlf
L3:
	mov eax,endarr[esi]
	call writedec
	call crlf
	add esi,4
	loop L3
	

	exit
	
main ENDP

END main