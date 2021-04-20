        org     100h

        section .text

        mov     byte    [200h], 4Ch
        mov     byte    [201h], 45h
        mov     byte    [202h], 43h
        mov     byte    [203h], 47h

; Direccionamiento directo o absoluto
        mov     AX, [200h]

; Direccionamiento indirecto por registro
        mov     BX, 201h
        mov     CX, [BX]

; Direccionamiento indirecto base mas indice 
        mov     SI, 1h
        mov     DX, [BX+SI]

; Direccionamiento relativo por registro
        mov     DI, [BX+2h]

        int     20h