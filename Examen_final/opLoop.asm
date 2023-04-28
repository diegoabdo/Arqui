section .data
    buffer db 100            ; Reservamos un búfer de 100 bytes para almacenar la entrada
    format db "%s", 0        ; Definimos el formato de la cadena de entrada como "%s"

section .bss
    temp resb 1              ; Reservamos un byte para almacenar cada carácter leído

section .text
    global _start

_start:
    ; Imprimimos el mensaje de entrada
    mov rax, 4                ; Llamada al sistema "write"
    mov rbx, 1                ; Descriptor de archivo 1 (salida estándar)
    mov rcx, message          ; Dirección del mensaje
    mov rdx, message_len      ; Longitud del mensaje
    int 0x80                  ; Llamada al sistema

    ; Leemos la entrada y la almacenamos en el búfer
    mov rax, 0                ; Llamada al sistema "read"
    mov rbx, 0                ; Descriptor de archivo 0 (entrada estándar)
    mov rcx, buffer           ; Dirección del búfer
    mov rdx, 100              ; Longitud máxima de la entrada
    int 0x80                  ; Llamada al sistema

    ; Imprimimos la entrada para verificar que se leyó correctamente
    mov rax, 4                ; Llamada al sistema "write"
    mov rbx, 1                ; Descriptor de archivo 1 (salida estándar)
    mov rcx, buffer           ; Dirección del búfer
    mov rdx, rax              ; Longitud de la entrada leída
    int 0x80                  ; Llamada al sistema

    ; Salimos del programa
    mov eax, 1                ; Llamada al sistema "exit"
    xor ebx, ebx              ; Código de salida 0
    int 0x80                  ; Llamada al sistema

section .data
    message db "Ingrese una cadena: ", 0
    message_len equ $ - message
