;Faruk Orak 150180058

INDEX 	EQU		6; index value


		AREA firstcode, code, readonly;
		ENTRY
		ALIGN
__main	FUNCTION
		EXPORT __main
		
		LDR	r5, =array	;address of array
		BL	FACTORIAL
stop	B	stop	;branch stop
		ALIGN	
		ENDFUNC

			ALIGN
FACTORIAL	FUNCTION
			PUSH{lr}
			MOVS	r0, #1		;i value
			MOVS 	r1, INDEX	;take index to r1
			STR 	r0, [r5]	;array[0] = 1
			MOVS	r6, #4		;load 4 to r6
LOOP		CMP		r1, r0		;compare i and index
			BLT		RETURN		;if index < i, branch to RETURN label
			SUBS	r3,	r0,	#1	;take i-1 to r3
			MULS	r3,	r6,	r3	;convert it to array index
			LDR		r2, [r5,r3]	;Load array[i-1] to r2
			MULS	r2,	r0, r2	;r2 = array[i-1]*i
			MOVS	r3,	r0		;take r0(i) to r3
			MULS	r3,	r6,	r3	;convert it to array index
			STR		r2, [r5,r3]	;array[i] = result(array[i-1]*i)
			ADDS 	r0,r0,#1	;i++
			B	LOOP			;go LOOP
RETURN		POP{pc}
		ALIGN
		ENDFUNC
		
		AREA mydata, data, readwrite
		ALIGN
array	SPACE	(INDEX+1) << 2
array_end
		END