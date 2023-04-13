
%include        'stdio32.asm'

SECTION .data
        msg1    db      'Hola Arquitectura II!', 0h
        msg2    db      'Reutilizando funciones...', 0h
        msg3    db      'Es todo por hoy...', 0h

SECTION .text
        global  _start

_start:
        mov     eax, msg1
        call    printStrLn

        mov     eax, msg2
        call    printStrLn

        call    endP

