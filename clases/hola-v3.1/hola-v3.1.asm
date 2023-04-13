
SECTION .data
    ; msg to acces memory space
    msg db  'Hola Arquitectura I', 0AH      

SECTION .text
global _start          

_start:
    mov eax, msg        ; eax = msg

    mov edx, eax        ; edx = string lenght
    mov ecx, msg        ; ecx = msg
    mov ebx, 1          ; STDOUT file
    mov eax, 4          ; SYS_WRITE function
    int 80h

    call endP

    call strLen
    
    
; Calc string lenght
strLen:
    ; strLen(eax=cadena) -> eax int n = longitud
    push ebx        ; ebx en pila
    mov eax, ebx    ; set memory dir to ebx

sigChar:                
    cmp byte[eax], 0    
    jz  finLen           
    inc eax             
    jmp sigChar         

finLen:
    sub eax, ebx        
    pop ebx            
    ret                 

; end program
endP:
    mov ebx, 0         
    mov eax, 1          
    int 80h             


