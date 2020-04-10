.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
targetStr BYTE "LAST Week of class and preparation ",0 
sourceStr BYTE "Before final exam.",0

Str_concat PROTO,
	target:PTR BYTE,
	source:PTR BYTE
.code
main PROC
	call clrscr

	INVOKE Str_concat, ADDR targetStr, ADDR sourceStr
	mov edx,OFFSET targetStr
	call WriteString
	call crlf

    exit
main ENDP

Str_concat PROC USES eax ecx edi esi,
	target:PTR BYTE,
	source:PTR BYTE
	mov edi,target
	mov esi,source

 	INVOKE Str_length,target
 	mov ecx,eax
L1:
	mov al , [edi]
	add edi , 1
Loop L1
 	

 	mov eax,0
 	INVOKE Str_length,source

 	call WriteInt
 	call crlf
 	mov ecx,eax
 	add ecx,1 ; 吃字串的最尾巴 \0
L2:
	mov al , [esi]
	mov [edi] , al
	inc esi
	inc edi
Loop L2

ret
Str_concat ENDP
END main