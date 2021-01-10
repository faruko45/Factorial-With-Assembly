;Faruk Orak 150180058

INDEX 	EQU		6; index value


		AREA firstcode, code, readonly;
		ENTRY
		ALIGN
__main	FUNCTION
		EXPORT __main
		
		LDR		r5, =array	;address of array
		MOVS	r6,	#INDEX	;take the index to r6
		MOVS	r4,#0		;i value
LOOP	CMP		r6,r4		;compare i and index
		BLT		stop		;if index < i, branch to stop
		BL		FACTORIAL	;call factorial function with i
		MOVS	r1,#4		;used for multiplication
		MULS	r1,r4,r1	;for word
		STR		r0,[r5,r1]	;array[i] = factorial(i)
		ADDS	r4,r4,#1	;i++
		B		LOOP	
stop	B		stop	;branch stop
		ALIGN	
		ENDFUNC
			
			ALIGN
FACTORIAL	FUNCTION
			PUSH{r4,r7,lr}		;push r4 to keep n and push r7 to keep n-1 and push lr to return value 
			CMP 	r4,#2		;look for n<2
			BGE		LABEL1		;if 2 > n, then branch label
			MOVS 	r0,#1		;assign 1 to r0
			B		RETURN		;branch to return
LABEL1		MOVS	r7,r4		;keep n value for the current function
			SUBS	r4,r4,#1	;n--
			BL		FACTORIAL	;factorial(n)
			MULS	r0,r7,r0 	;n*factorial(n-1)
RETURN		POP{r4,r7,pc}	 	;pop back to r4,r7 and pc
			ALIGN
			ENDFUNC
		
		
		AREA mydata, data, readwrite
		ALIGN
array	SPACE	(INDEX+1) << 2
array_end
		END