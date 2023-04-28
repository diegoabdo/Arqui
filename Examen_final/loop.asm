section .data
    buffer db 100            ; Reservamos un búfer de 100 bytes para almacenar la entrada
    format db "%s", 0        ; Definimos el formato de la cadena de entrada como "%s"
    add_op db "add", 0       ; Definimos la cadena "add" para sumar operandos
    sub_op db "sub", 0       ; Definimos la cadena "sub" para restar operandos
    mul_op db "mul", 0       ; Definimos la cadena "mul" para multiplicar operandos
    div_op db "div", 0       ; Definimos la cadena "div" para dividir operandos
    mod_op db "mod", 0       ; Definimos la cadena "mod" para calcular el resto de una división
    error_msg db "Operación no soportada", 0   ; Mensaje de error en caso de operación inválida

section .bss
    temp resb 1              ; Reservamos un byte para almacenar cada carácter leído
    operands resb 32         ; Reservamos 32 bytes para almacenar los operandos (8 bytes cada uno)

section .text
    global _start

_start:
    ; Leemos la entrada y la almacenamos en el búfer
    mov eax, 3                ; Llamada al sistema "read"
    mov ebx, 0                ; Descriptor de archivo 0 (entrada estándar)
    mov ecx, buffer           ; Dirección del búfer
    mov edx, 100              ; Longitud máxima de la entrada
    int 0x80                  ; Llamada al sistema

    ; Buscamos el primer espacio en blanco para separar el operador del primer operando
    lea esi, [buffer]         ; Cargamos la dirección del búfer en esi
    mov cl, byte [esi]        ; Cargamos el primer byte del búfer en cl
    cmp cl, 0                 ; Comprobamos si es el fin de la cadena
    je error                  ; Si es el fin de la cadena, saltamos al mensaje de error
    cmp cl, ' '               ; Comprobamos si es un espacio en blanco
    je read_operator          ; Si es un espacio en blanco, saltamos a leer el operador
    inc esi                   ; Si no es un espacio en blanco, avanzamos al siguiente carácter
    jmp read_operand          ; Y saltamos a leer el primer operando

read_operator:
    ; Leemos el operador desde la entrada
    mov ecx, temp             ; Dirección del operador temporal
    mov edx, 1                ; Longitud máxima del operador (1 byte)
    mov ebx, format           ; Formato de entrada ("%s")
    mov eax, 0x80 + 0x06      ; Llamada al sistema "scanf"
    int 0x80                  ; Llamada al sistema
    cmp eax, 1                ; Comprobamos si se leyó un solo argumento (el operador)
    jne error                 ; Si se leyó

read_operand:
    ; Leemos el primer operando desde la entrada
    mov ecx, operands         ; Dirección del primer operando
    mov edx, 8                ; Longitud máxima del operando (8 bytes)
    mov ebx, format           ; Formato de entrada ("%s")
    mov eax, 0x80 + 0x06      ; Llamada al sistema "scanf"
    int 0x80                  ; Llamada al sistema
    cmp eax, 1                ; Comprobamos si se leyó un solo argumento (el primer operando)
    jne error                 ; Si no se leyó un solo argumento, saltamos al mensaje de error

    ; Buscamos el siguiente espacio en blanco para separar el primer operando del segundo operando
    lea esi, [buffer]         ; Cargamos la dirección del búfer en esi
    mov cl, byte [esi]        ; Cargamos el primer byte del búfer en cl
    cmp cl, 0                 ; Comprobamos si es el fin de la cadena
    je end_read               ; Si es el fin de la cadena, saltamos al final de la lectura
    cmp cl, ' '               ; Comprobamos si es un espacio en blanco
    je read_operator          ; Si es un espacio en blanco, saltamos a leer el operador
    inc esi                   ; Si no es un espacio en blanco, avanzamos al siguiente carácter
    jmp read_operand          ; Y volvemos a buscar el siguiente espacio en blanco

error:
    ; Mostramos el mensaje de error y salimos
    mov eax, 4                ; Llamada al sistema "write"
    mov ebx, 2                ; Descriptor de archivo 2 (salida de error)
    mov ecx, error_msg        ; Dirección del mensaje de error
    mov edx, 23               ; Longitud del mensaje de error
    int 0x80                  ; Llamada al sistema
    mov eax, 1                ; Llamada al sistema "exit"
    xor ebx, ebx              ; Código de salida 0
    int 0x80                  ; Llamada al sistema

end_read:
    ; Si llegamos al final de la cadena sin encontrar el segundo operando, hay un error
    mov cl, byte [operands]   ; Cargamos el primer byte del primer operando
    cmp cl, 0                 ; Comprobamos si es el fin de la cadena
    je error                  ; Si es el fin de la cadena, saltamos al mensaje de error

    ; Si llegamos aquí, se leyó el primer operando correctamente pero no se encontró el segundo operando
    mov dword [result], 1     ; Establecemos el código de error en 1 (falta el segundo operando)
    jmp end_program           ; Saltamos al final del programa

