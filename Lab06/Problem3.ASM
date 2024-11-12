	MOV	AL,70	;Array address
	MOV	BL,5	;Array	size
	MOV	CL,60	;
	
	MOV	[CL],AL	;Arr Add. stores at 60
	INC	CL
	MOV	[CL],BL	;Size stored at 61

	
	CALL	30


	ORG 30
	MOV	AL,[60]	;AL Stores current adress
	MOV	BL,00	;Bl is a loop counter
	MOV	CL,[AL]	;CL stores our result, initialized with ARR[0]
	INC	AL
	INC	BL
	

Sum:
	MOV	DL,[AL]	;DL stores our value at index AL temporarily
	ADD	CL,DL
	INC	AL
	INC	BL
	CMP	BL,[61]
	JNZ	Sum
	JZ	Mean

Mean:
	DIV	CL,BL	;Divide Sum by # elements, result stored in CL
	HALT



	ORG	70
	DB	02
	DB	05
	DB	0A
	DB	00
	DB	06
	
	END