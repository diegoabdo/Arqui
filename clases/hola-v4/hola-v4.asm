
%include        'stdio32.asm'

SECTION .data
        msg1    db      'Hola Arquitectura II!', 0Ah, 0h
        msg2    db      'Reutilizando funciones...', 0Ah, 0h

SECTION .text
        global  _start

_start:
        mov     eax, msg1
        call    printStr

        mov     eax, msg2
        call    printStr

        call    endP

