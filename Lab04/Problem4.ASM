	MOV AL,4	; x = 4
	MOV BL,1	; compare to 1


	CALL 47		;doubleEvenNumbers();
	ADD AL,1	;x += 1
	CALL 47		;doubleEvenNumbers();
	HALT	

	ORG 47		;doubleEvenNumbers()
	AND BL,AL	;x & 1
	JZ even		;if(x & 1 == 0), double
	RET

even:
	MUL AL,2	;x *= 2
	MOV BL,1	;Reset B to check again
	RET		;return
	

	END
		
	