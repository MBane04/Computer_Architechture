;Start By Taking in 2 Numbers, convert BL to an int since we're also checking CL in case of division
	IN	00	;Wait for key press
	CALL	A0
	PUSH	AL
	IN	00	;Accept another input
	CALL	A0
	PUSH	AL
	IN	00	;Take in input for operation, a for add, d for div, s for sub, m for mult
	CALL	A0
	PUSH	AL
	
operation:
	POP	AL
	CMP	AL,61	;is it add?
	JZ	add
	CMP	AL,73	;subtract?
	JZ	sub
	CMP	AL,6D	;multiply?
	JZ	mul
	CMP	AL,64	;divide?
	JZ	div
	PUSH	AL
	CALL	90	;interrupt to accept new operation if it's none of the operations
	JMP	operation

add:
	POP	CL
	POP	BL	;take BL and CL off the stack to add
	SUB	BL,30
	SUB	CL,30	;Convert to int
	ADD	BL,CL	;add, result in BL
	JMP	skip

sub:
	POP	CL
	POP	BL	;Always CL - BL
	SUB	BL,30
	SUB	CL,30
	SUB	BL,CL
	JMP	skip
mul:
	POP	CL
	POP	BL
	SUB	BL,30
	SUB	CL,30
	MUL	BL,CL
	JMP	skip
	

div:
	POP	CL
	POP	BL
	PUSH	BL
	PUSH	CL
	CMP	CL,30
	JZ	zero	;if c is 0, interrupt and ask for new input
	SUB	BL,30
	SUB	CL,30
	DIV	BL,CL
	JMP	skip

zero:
	CALL 80
	JMP	div
skip:
	HALT	;RESULT IS STORED IN BL REGISTER

	ORG	80	;division interrupt
	POP	CL
	POP	AL
	IN	00
	CALL	A0
	PUSH	AL
	PUSH	CL
	IRET

	ORG	90	;Invalid operand interrpt
	POP	DL
	POP	AL
	IN	00
	CALL	A0
	PUSH	AL
	PUSH	DL
	IRET

	ORG	A0	;Enter interrupt
	CMP	AL,0D	;Was the input enter?
	JZ	skip
	IRET


	END	;RESULT IS STORED IN BL REGISTER