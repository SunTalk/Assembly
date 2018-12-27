.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

;in IDE mod:
;TITLE MASM(test.asm)
;include Irvine32.inc

.data
	
	bigEndian BYTE 12h,34h,56h,78h
	littleEndian DWORD ?

.code
main PROC
	
	mov al , bigEndian+3
	mov BYTE PTR [littleEndian] , al

	mov al , bigEndian+2
	mov BYTE PTR [littleEndian+1] , al

	mov al , bigEndian+1
	mov BYTE PTR [littleEndian+2] , al

	mov al , bigEndian
	mov BYTE PTR [littleEndian+3] , al
	
	mov eax , littleEndian
	call DumpRegs

	exit
	
main ENDP

END main