.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
targetStr BYTE "Johnson,Calvin,goes,to sleep,by,tonight",0

Str_nextword PROTO,
	targe: PTR BYTE,
	delimiter: BYTE
.code
main PROC
	call clrscr
	mov edx, OFFSET targetStr
	call WriteString
	call crlf
	INVOKE Str_nextword, ADDR targetStr, "," 
    
    exit
main ENDP
Str_nextword PROC USES eax edx ecx edi,
	targe: PTR BYTE,
	delimiter: BYTE
	
	mov edi , targe
	INVOKE Str_length,targe
	mov ecx , eax
	mov bl , delimiter
L1:
	mov al,[edi]
	cmp al , bl
	je print
	jmp other
	print:
		inc edi
		mov edx , edi
		call WriteString
		call crlf
	other:
		inc edi
Loop L1

ret
Str_nextword ENDP
END main