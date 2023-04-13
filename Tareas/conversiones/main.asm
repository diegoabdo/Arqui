; CONTROL CENTRAL DE CONVERSIONES


%include '../../utils/stdio32.asm'
%include '../../utils/string32.asm'


SECTION .data
    msg1 db 'Ingrese su entero: ', 0
    msg2 db 'El entero ingresado (cadena) es: ', 0
    msg3 db 'El entero ingresado (entero) es: ', 0

SECTION .text
    global _start

    _start:
        mov eax, msg1
        call printStr
        call input

        push eax

        mov eax, msg2
        call printStr

        pop eax
        mov ebx, eax
        call printStrLn

        mov eax, msg3
        call printStr

        mov eax, ebx
        call stoi
        call printIntLn

        call endP


