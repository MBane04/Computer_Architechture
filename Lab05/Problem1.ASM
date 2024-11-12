	CLO		; Close Unwanted Windows
	MOV	BL,40

Rep:
	IN	00	;Wait for key press
	CMP	AL,0D	;Was it enter (OD Ascii?)
	JNZ	Store	;No? Ok continue.
	JZ	Skip	; Yes? GTFO

Store:
	MOV	[BL],AL	;Mov key input to BL
	INC	BL	; go to the next array eement
	JMP	Rep	;jump to rep

Skip:	
	HALT

	ORG	40	;Array starts at 40
	DB	00	;Declare 15 elements
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	00
	DB	FF	;Declare a terminator at the end


	END