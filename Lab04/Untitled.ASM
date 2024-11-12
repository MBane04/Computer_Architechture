	MOV AL,2	;x = 2
	MOV BL,4	;y = 4

	PUSH AL		;AL
	PUSH BL 	;AL BL
	
	POP AL  	;BL
	POP BL 		;

	END