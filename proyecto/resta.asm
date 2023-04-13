%include 'stdio32.asm'

SECTION .data
    num1    db 0
    num2    db 0
    difference db 0

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

    mov     al, [num1]  ;
    sub     al, [num2]  
    mov     [difference], al   
    

    mov     eax, msg3
    call    printString
    mov     eax, [difference]
    call    printInt
    call    printStrln

    call    exit

SECTION .data
msg1    db  'Ingrese el primer número: ', 0
msg2    db  'Ingrese el segundo número: ', 0
msg3    db  'El resultado de la resta es: ', 0

