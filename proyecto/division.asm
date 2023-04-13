%include 'stdio32.asm'

SECTION .data
    num1 	db 0
    num2 	db 0
    cociente db 0

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
    xor     ah, ah      
    mov     bl, [num2]  
    
    ;Verificar que num2 no sea cero
    cmp     bl, 0
    je      divisionPorCeroError
    
    
    div     bl          
    mov     [cociente], al 

    ; Imprimir el resultado
    mov     eax, msg3
    call    printStr
    mov     eax, [cociente]
    call    printInt
    call    printStrln

    ; Finalizar el programa
    call    exit
    
divisionPorCeroError:
    ; Mostrar mensaje de error
    mov     eax, msg4
    call    printStrln

SECTION .data
msg1    db  'Ingrese el primer número: ', 0
msg2    db  'Ingrese el segundo número: ', 0
msg3    db  'El resultado de la división es: ', 0
msg4    db  'Error: División por cero', 0
