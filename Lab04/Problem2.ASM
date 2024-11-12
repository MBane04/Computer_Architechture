	MOV AL,C	;x = 12
	MOV BL,5	;y =5
	

	OR AL,BL	; x | y
	MOV [40],AL	; move to 0x40
	MOV AL,C	;x = 12
	
	AND AL,BL	;x && y
	MOV [41],AL	;move to 0x41
	MOV AL,C	;x = 12

	XOR AL,BL	;x ^ y
	MOV [42],AL	;move to 0x42
	MOV AL,C	;x = 12
	
	NOT AL		;~x
	MOV [43],AL	; move to 0x43

	END
	