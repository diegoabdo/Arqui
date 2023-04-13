


;  ---------- funcion longitud de cadena-------
strlen:
	push 	ebx
	mov 	ebx, eax
siguiente:
	cmp	byte[eax], 0
	jz	finConteo
	inc	eax
	jmp	siguiente

	finConteo:
	sub	eax, ebx
	pop	ebx
	ret

;--------Despligue en pantalla------
printStr:
	push 	edx
	push	ecx
	push	ebx
	push	eax
	
	call	strlen
	mov 	edx, eax
	pop	eax
	mov	ecx, eax
	mov	ebx, 1
	mov	eax, 4
	int	80h

	pop	ebx
	pop 	ecx
	pop 	edx
	ret

;------Despligue con salto de linea-----
printStrln:
	call	printStr

	push	eax
	mov	eax, 0Ah
	push	eax
	mov	eax, esp
	call	printStr
	pop 	eax
	pop	eax
	ret

;------InputStr(cadena)-----
InputStr:
	push 	edx
	push	ecx
	push	ebx
	push	eax


	mov	edx, eax
	mov	ecx, ebx
	mov	ebx, 0
	mov	eax, 3
	int	80h


	pop 	eax
	pop	ebx
	pop	ecx
	pop 	edx
	ret

;------InputInt(cadena)-----
printInt:
	push	edx
	push	ecx
	push	ebx
	push	eax

cicloDiv:

	inc	ecx
	mov 	esi, 10
	mov	edx, 0
	idiv	esi
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	cicloDiv

cicloPrint:

	dec	ecx
	mov	eax, esp
	call 	printStr
	pop	eax
	cmp	ecx, 0
	jnz	cicloPrint

	mov	eax, 03
	push	eax
	mov	eax, esp
	call	printStr
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret


;------InputInt(cadena)-----
;void printIntln(cadnea)
printIntln:
	push	edx
	push	ecx
	push	ebx
	push	eax

cicloDiv2:

	inc	ecx
	mov 	esi, 10
	mov	edx, 0
	idiv	esi
	add	edx, 48
	push	edx
	cmp	eax, 0
	jnz	cicloDiv2

cicloPrint2:

	dec	ecx
	mov	eax, esp
	call 	printStr
	pop	eax
	cmp	ecx, 0
	jnz	cicloPrint2

	mov	eax, 03
	push	eax
	mov	eax, esp
	call	printStrln
	int	80h

	pop	eax
	pop	ebx
	pop	ecx
	pop	edx
	ret
	

   
;--Salida del programa
exit:

	mov	ebx, 0
	mov	eax, 1
	int	80h


parseInt:
    xor     eax, eax    
    xor     ebx, ebx     
    jmp     .start       

.loop:
    mov     al, [esi]   
    cmp     al, 0       
    je      .done        
    sub     al, '0'      
    imul    ebx, 10      
    add     eax, ebx     
    inc     esi         
    jmp     .loop       

.start:
    jmp     .loop        

.done:
    ret                   

