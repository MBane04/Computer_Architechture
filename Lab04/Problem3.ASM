	MOV AL,5	;x = 5\

	CALL 50		;double()
	ADD AL,1	;x += 1
	CALL 50		;double()
	HALT		;
	

	ORG 50		;
	MUL AL,2	;
	RET

	END