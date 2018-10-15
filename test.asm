.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data


.code
main PROC

	mov eax,5
	add eax,6
	call DumpRegs
	exit
	
main ENDP

END main