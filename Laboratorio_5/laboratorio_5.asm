org 100h

    section .text
    xor SI, SI
    xor DI, DI
    xor AX, AX
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10
    MOV DL, 20

    call modotexto

    ITERAR:
        call movercursor
        MOV CL, [cadena+SI]
        CMP CL, ' '
        JE siguientefila
        call escribircaracter
        INC SI
        INC DL
        INC DI
        CMP DI, 26d
        JB ITERAR
        jmp esperartecla

    modotexto: 
        MOV AH, 0h
        MOV AL, 03h
        INT 10h
        RET
    movercursor:
        MOV AH, 02h
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 0Ah
        MOV AL, CL
        MOV BH, 0h
        MOV CX, 1h
        INT 10h
        RET
    siguientefila:
        INC DH
        MOV DL, 20
        INT 10h
        RET

    esperartecla:
        MOV AH, 00h
        INT 16h
    exit:
        int 20h

    section .data

    cadena DB 'luis eduardo chavez garcia'