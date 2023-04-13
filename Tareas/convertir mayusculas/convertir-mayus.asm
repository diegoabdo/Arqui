
%include	'stdioStr.asm'


SECTION .data
	msg 	db 	'Ingrese texto: ', 0h
	msg2	db	'Texto en Mayusculas es: ', 0h

SECTION .bss
	texto:	resb	50

SECTION .text
	global	_start

_start:
	mov 	eax, msg
	call	printStrln

	mov	eax, 50
	mov	ebx, texto
	call	input

	mov	eax, msg2
	call	printStrln

	mov	eax, texto
	call	strUpcase

	call	exit
