	;Start By Taking in 2 Numbers, convert BL to an int since we're also checking CL in case of division
	IN	00	;Wait for key press
	PUSH	AL
	POP	BL	;Copy input to BL
	IN	00	;Accept another input
	PUSH	AL
	POP	CL	;Copy input to CL
	SUB	BL,30	;Convert to int, only once since its the numerator
	IN	00	;Take in input for operation, a for add, d for div, s for sub, m for mult
	
operation:
	CMP	AL,61	;is it add?
	JZ	add
	CMP	AL,73	;subtract?
	JZ	sub
	CMP	AL,6D	;multiply?
	JZ	mul
	CMP	AL,64	;divide?
	JZ	div
	CALL	70	;interrupt to accept new operation if it's none of the operations
	JMP	operation


add:
	SUB	CL,30
	ADD	BL,CL
	JMP	skip

sub:
	SUB	CL,30
	SUB	BL,CL
	JMP	skip
mul:
	SUB	CL,30
	MUL	BL,CL
	JMP	skip
	

div:
	SUB	CL,30	;convert to int
	CMP	CL,0
	JZ	zero	;if c is 0, interrupt and ask for new input
	DIV	BL,CL
	JMP	skip

zero:
	CALL 60
	JMP	DIV
skip:
	HALT	;RESULT IS STORED IN BL REGISTER

	ORG	60
	IN	00
	PUSH	AL
	POP	CL
	IRET

	ORG	70
	IN	00
	IRET



	END	;RESULT IS STORED IN BL REGISTER