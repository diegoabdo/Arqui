%include 'stdio32.asm'

SECTION .data
    num1    db 0
    num2    db 0
    sum     db 0

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
    add     al, [num2]  
    mov     [sum], al  

    mov     eax, msg3
    call    printStr
    mov     eax, [sum]
    call    printInt
    call    printStrln

SECTION .data
msg1    db  'Ingrese el primer número: ', 0
msg2    db  'Ingrese el segundo número: ', 0
msg3    db  'El resultado de la suma es: ', 0

