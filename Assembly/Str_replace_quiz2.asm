.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

Str_replace PROTO, 
	pString:PTR BYTE, ; pointer to string 
	cString:PTR BYTE,   ; clean string 
	delimiter:BYTE ; delimiter to find
.data 
	msg0 BYTE "The Clean string after removing the delimiter is: ",0dh,0ah,0 
	msg1 BYTE "Number of Delimiter(s) found in the string are: ",0 
	testStr BYTE "ABC\DE\FGHIJK\LM",0 
	aStr BYTE 80 DUP(0),0 
	cleanstr BYTE 80 DUP(0),0
.code 
main PROC 
	call clrscr
	; call Clrscr 
	; mov ecx,SIZEOF aStr - 1 
	; mov edx,OFFSET aStr 
	mov edx , OFFSET msg0
	call writeString
	call crlf
	INVOKE Str_replace, ADDR testStr, ADDR cleanstr, "\" 

main ENDP

Str_replace PROC USES eax ebx ecx edi esi ,
	pString:PTR BYTE, ; pointer to string 
	cString:PTR BYTE,   ; clean string 
	delimiter:BYTE ; delimiter to find

	mov edi , pString;testStr
	mov esi , cString
	INVOKE Str_length , pString
	mov ecx , eax
L1:
	mov al , [edi]
	mov bl , delimiter
	cmp al , bl
	je thesame
	jmp other
	thesame:
		mov bl , " "
		mov [esi] , bl
		inc edi
		inc esi
	other:
		mov bl , [edi]
		mov [esi] , bl
		inc edi
		inc esi
Loop L1
	
	mov esi , cString;testStr
	mov edx , esi
	call writeString
	call crlf
ret
Str_replace ENDP
END main