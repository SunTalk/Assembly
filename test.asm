.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data

var1 SBYTE -4,-2,3,1
var2 WORD 1000h,2000h,3000h,4000h
var3 SWORD -16,-42
var4 DWORD 1,2,3,4,5

.code
main PROC

	mov eax,0
	call writeint
	call DumpRegs

	mov al,6789
	call DumpRegs
	
	mov al,bx
	call DumpRegs
	
	mov bh,ch
	call DumpRegs

	mov cx,bh
	call DumpRegs

	mov dx,cl
	call DumpRegs

	exit
	
main ENDP

END main