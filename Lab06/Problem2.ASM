	CLO		; Close Unwanted Windows
	MOV	CL,00
	PUSH	CL
	
	CALL	30

Rep:
	MOV	DL,70
	ADD	DL,CL
	CMP	CL,04	;Have we done this more that amt of elements
	JZ	Skip	;Yes? GTFO
	IN	00	;Wait for key press
	JMP	Convert

	ORG	30
	POP	DL	;Return Adress
	POP	BL	
	JMP	Rep

Convert:
	SUB	AL,30	;Convert from ASCII to the numbers 0-9

	INC	BL	; go to the next array element
	INC	CL
	PUSH	AL
	POP	BL
	MOV	[DL],BL
	JMP	REP
	

Skip:
	PUSH	DL;
	HALT
	



	ORG 70		; 4 elem Arr @ 40
	DB 00
	DB 00
	DB 00
	DB 00
	DB FF

	END
	