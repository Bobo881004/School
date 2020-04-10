.386

Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib

.data
freqTable DWORD 256 DUP(0)
aString BYTE "ABC",0 
;aString BYTE 80 DUP(0),0THE QUICK BROWN FOX JUMPED OVER THE LAZY DOGS BACK
str1 BYTE "*** Constructing a Frequency Table *** (DEMO)",0
;, 0dh,0ah,0dh,oah "Enter between 1 and 80 characters: "
str2 BYTE ": ",0
Get_frequencies PROTO, 
	pString:PTR BYTE, 
	pTable:PTR BYTE 

.code
main PROC
	call clrscr
	mov edx ,OFFSET str1
	call WriteString
	call crlf

	INVOKE Get_frequencies , ADDR aString , ADDR freqTable
	call DisplayTable
    exit
main ENDP
Get_frequencies PROC USES eax ebx ecx edi esi,
	pString:PTR BYTE, 
	pTable:PTR BYTE

		mov edi , pString
		INVOKE Str_length , pString
		mov ecx , eax
	L1:
		mov esi , 0
		mov eax , 1
		mov ebx , 0
		mov bl,[edi]
		add esi , ebx
		inc pTable[esi]
		inc edi 
	Loop L1

	ret
Get_frequencies ENDP

 DisplayTable PROC USES eax ebx ecx edi 
		mov edi , freqTable
		mov bl , 0
		mov ecx , 256
	L1:
		.if(freqTable[edi] > 0)
			mov al,bl
			call WriteChar
			mov edx , OFFSET str2
			call WriteString
			mov eax , freqTable[edi]
			call WriteDec
			call crlf
			mov eax , 0 
		.endif
		inc bl
		inc edi
	Loop L1
DisplayTable ENDP 
END main
; .386

; Include \masm32\include\Irvine32.inc
; Includelib \masm32\lib\Irvine32.lib 
; includelib \masm32\lib\Kernel32.lib
; includelib \masm32\lib\User32.lib

; .data

; str1 byte " ",0
; semicoma byte " : ",0
; ascii byte 128 DUP(0)
; cal proto,
; 	str123:ptr byte

; .code
; main proc
; 	call clrscr
; 	invoke cal,addr str1

; 	mov ecx,128
; 	mov ebx,0

; 	mov esi,0

; 	L1:
; 		.if(ascii[esi] > 0)
; 			mov al,bl
; 			call writechar
; 			mov edx,offset semicoma
; 			call writestring
; 			mov al,ascii[esi]
; 			call writedec
; 			call crlf
; 		.endif
; 		inc esi
; 		inc ebx
; 	loop L1

;     exit

; main endp


; cal proc,
; 	str123:ptr byte

; 	invoke str_length,str123
; 	mov ecx,eax
; 	mov esi,0

; 	L2:
; 		mov ebx,0
; 		mov edi,0
; 		mov bl,str1[esi]
; 		add edi,ebx
; 		add ascii[edi],1
; 		inc esi
; 	loop L2

; 	ret
; cal endp

; end main