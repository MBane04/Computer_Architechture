	CLO		; Close Unwanted Windows
	MOV	AL,00
	MOV	BL,40
	MOV	CL,50	; Adress of arr2
	MOV	DL,04	; Number of elements in array2 -1
	ADD	AL,CL	;
	ADD	AL,DL	;number of the last address in array2


REP:
	CMP	DL,0	; When DL is Negative, we're out of elements
	JNS	Reverse
	JS	Skip	

Reverse:
	MOV	CL,[BL]	;Move the Value in BL to CL
	MOV	[AL],CL	;Move CL to the location AL points to
	INC	BL	;Go forward an element
	DEC	AL	;Go back an element
	DEC	DL	;Decrement DL to make sure we don't go over
	JMP	REP	;

Skip:
	HALT


	ORG 40		; 5 elem Arr @ 40
	DB 0A
	DB 9F
	DB B0
	DB 0B
	DB DA
	DB FF

	ORG 50		; 5 elem Arr @ 50
	DB 00
	DB 00
	DB 00
	DB 00
	DB 00
	DB FF

	END
	