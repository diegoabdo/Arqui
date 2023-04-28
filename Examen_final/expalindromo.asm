section .data
    msg db "Ingrese una cadena: ", 0
    msg_pal db "Es un palindromo", 0
    msg_no_pal db "No es un palindromo", 0
    input_buffer times 32 db 0

section .text
    global _start

; Función principal
_start:
    ; Imprimir mensaje para ingresar una cadena
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 18
    int 0x80

    ; Leer la cadena ingresada
    mov eax, 3
    mov ebx, 0
    mov ecx, input_buffer
    mov edx, 32
    int 0x80

    ; Determinar si la cadena es un palindromo
    push input_buffer ; Pushear la dirección de la cadena en la pila
    call strPalindromo ; 

    ; Imprimir mensaje de si es un palindromo o no
    mov eax, 4
    mov ebx, 1
    cmp byte [input_buffer], 10 ; Verificar si se ingresó una cadena vacía
    jz .empty_input
    cmp byte [input_buffer], 0 ; Verificar si se ingresó una cadena vacía
    jz .empty_input
    cmp byte [input_buffer], ' ' ; Verificar si se ingresó solo un espacio
    jz .empty_input
    cmp byte [input_buffer+1], 10 ; Verificar si se ingresó solo un salto de línea

    jz .empty_input
    cmp eax, 1
    je .es_palindromo
    mov ecx, msg_no_pal
    mov edx, 16
    jmp .print_message
.es_palindromo:
    mov ecx, msg_pal
    mov edx, 13
.print_message:    jz .empty_input
    cmp byte [input_buffer+1], 0 ; Verificar si se ingresó solo un salto de línea
    mov eax, 4
    mov ebx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
    
    
strPalindromo:
    push ebp
    mov ebp, esp
    sub esp, 16

    ; Obtener la longitud de la cadena
    mov esi, [ebp+8]
    call strLen
    mov ecx, eax ; Guardar la longitud en el contador

    ; Calcular el índice del medio de la cadena
    shr ecx, 1 ; Dividir la longitud por 2
    mov esi, ecx
    inc esi ;
    xor eax, eax ; Inicializar el registro de retorno
.check_palindromo:
    cmp ecx, esi ; Compara el índice actual con el índice del medio
    jbe .end_palindromo_check ; Si hemos llegado al medio de la cadena, salir del
Llamada a la función strPalindromo
