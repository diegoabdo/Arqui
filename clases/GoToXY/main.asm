%inlcude 'stdio32.asm'

SECTION .data
	msg	db	'Arquitectura I!', 0h
	posxy	db	1Bh, '[12;32H', 0h
	strCls	db	1Bh, '[2J' 1Bh, '[3J', 0h
	strFin	db	1Bh, '[24; 1H', 0h

SECTION .text
	global_start

_start:
	mov	eax, strCls
	call	printStr
	mov	eax, posxy
	call	printStr
	mov 	eax, msg
	call	printStr
	mov	eax, strFin
	call	printStr
	call	endP

; HOW TO EXCECUTE PROGRAM
; nasm -f elf32 archive_name.asm -o archive_name.o
; ld -m elf_i386 archive_name.o -o archive_name.e
; ./archive_name

; HOW TO CHECK FOR ERROR
; echo $?
