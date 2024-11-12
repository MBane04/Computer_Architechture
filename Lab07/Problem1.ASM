
	IN	00	;Wait for key press
	PUSH	AL
	POP	BL	;Copy input to BL
	IN	00	;Accept another input
	PUSH	AL
	POP	CL	;Copy input to CL
	SUB	BL,30	;Convert to int, only once since its the numerator

div:
	SUB	CL,30	;convert to int
	CMP	CL,0
	JZ	zero	;if c is 0, interrupt and ask for new input
	DIV	BL,CL
	JMP	skip

zero:
	CALL 50
	JMP	DIV
skip:
	HALT

	ORG	50
	IN	00
	PUSH	AL
	POP	CL
	IRET



	END	;RESULT IS STORED IN BL REGISTER