%include 'stdio32.asm'

SECTION .data
    num1    db 0
    num2    db 0
    product dw 0

SECTION .text
global  _start

_start:
    mov     eax, msg1
    call    printStr

    lea     eax, [num1]
    mov     ebx, 2     
    call    readInt

    mov     eax, msg2
    call    printStr

    lea     eax, [num2]
    mov     ebx, 2   
    call    readInt

    mov     al, [num1] 
    cbw                 ; Extiende al a ax para que sea de 16 bits

    mov     ah, 0       ; Limpia el registro ah para evitar problemas con la multiplicación
    mov     bl, [num2]   ; Carga el valor de [num2] en el registro bl
    cbw                 ; Extiende bl a bx para que sea de 16 bits
    imul    ax, bx      ; Multiplica ax y bx, guarda el resultado en ax
    mov     [product], ax   

    mov     eax, msg3
    call    printStr
    mov     eax, [product]
    call    printInt
    call    printStrln

    call    exit

SECTION .data
msg1    db  'Ingrese el primer número: ', 0
msg2    db  'Ingrese el segundo número: ', 0
msg3    db  'El resultado de la multiplicación es: ', 0

