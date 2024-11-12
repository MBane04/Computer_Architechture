	CLO		; Close Unwanted Windows
	MOV	BL,40
	MOV	CL,00	; Number of elements in the array
	
	JMP	Rep

Rep:
	CMP	CL,04	;Have we done this more that amt of elements
	JZ	Skip	;Yes? GTFO
	IN	00	;Wait for key press
	JNZ	Convert	;No? Ok continue.

Convert:
	SUB	AL,30	;Convert from ASCII to the numbers 0-9
	MOV	[BL],AL	;Mov key input to BL
	INC	BL	; go to the next array eement
	INC	CL
	JMP	REP	

Skip:
	HALT


	ORG 40		; 4 elem Arr @ 40
	DB 00
	DB 00
	DB 00
	DB 00
	DB FF

	END
	