	org 	100h

	section	.text

	;print mensaje de entrada
	mov 	DX, mensajeEntrada
	call  	EscribirCadena

	;input de la clave de acceso
	mov 	BP, frase
	call  	LeerCadena

	VerificarClave:
		mov		BL, [clave] ;La clave de acceso esta siendo copiada en el registro BL
		cmp		BL, [BP] ;Se compara el input ingresado en BP con la clave de acceso en BL
		je		Correcto ;Si la comparación da true entonces se mostrará el mensaje de BIENVENIDO
		jmp		Incorrecto ;Si la comparación da false entonces se mostrará el mensaje de INCORRECTO

	Correcto:
		mov		DX, claveCorrecta
		call	EscribirCadena
		jmp		ProgramaTerminado

	Incorrecto:
		mov		DX, claveIncorrecta
		call	EscribirCadena
		jmp		ProgramaTerminado

	ProgramaTerminado:
		int 	20h

	EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

	LeerCadena:
        xor     SI, SI
	while:  
        call    EsperarTecla
        cmp     AL, 0x0D
        je      exit
        mov     [BP+SI], AL
        inc     SI
        jmp     while
	exit:
		mov 	byte [BP+SI], "$"
        ret

	EscribirCadena:
		mov 	AH, 09h
		int 	21h
		ret

	section	.data
	mensajeEntrada		db	"Clave de acceso: ", "$"
	claveCorrecta 		db 	"BIENVENIDO", "$"
	claveIncorrecta		db	"INCORRECTO", "$"
	clave				db	"KRONOS"
	frase times 		20 	db	" "