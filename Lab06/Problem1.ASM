	MOV	AL,2	;Base
	MOV	BL,3	;Power

	MOV	[70],AL	;base stored in 70
	MOV	[71],BL	;power stored in 71
	CALL	30

	HALT

	ORG 30
	MOV	CL,[70]
	MOV	BL,[71]
pow:
	SUB	BL,01
	CMP	BL,0
	JZ	skip
	MUL	CL,AL
	JMP	pow
	
skip:
	MOV	[72],CL	;Store result in location 72
	END

	
	