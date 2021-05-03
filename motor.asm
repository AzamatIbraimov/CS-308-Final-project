
	MOV TMOD, #50H			
	SETB TR1					

	MOV DPL, #LOW(LEDcodes)		


	MOV DPH, #HIGH(LEDcodes)	

	CLR P3.4					
	CLR P3.3		
again:
			
	CALL setDirection			
	MOV A, TL1				
	CJNE A, #10, skip			
	CALL clearTimer	
skip:			
	MOVC A, @A+DPTR			
							

	MOV C, F0					
	MOV ACC.7, C			


	MOV P1, A					
							

	JMP again					

setDirection:
	PUSH ACC				

	PUSH 20H					
								

	CLR A						
	MOV 20H, #0					
	MOV C, P2.0					
	MOV ACC.0, C				
	MOV C, F0					
	MOV 0, C				

	CJNE A, 20H, changeDir		


	JMP finish					
changeDir:
	CLR P3.0					
	CLR P3.1					

	CALL clearTimer				
	MOV C, P2.0					
	MOV F0, C					
	MOV P3.0, C					
	CPL C						

	MOV P3.1, C					
							
finish:
	POP 20H						
	POP ACC						
	RET							

clearTimer:
	CLR A						
	CLR TR1						
	MOV TL1, #0					
	SETB TR1					
	RET							

LEDcodes:	
				DB 11000000B, 11111001B, 10100100B, 10110000B, 10011001B, 10010010B, 10000010B, 11111000B, 10000000B, 10010000B
