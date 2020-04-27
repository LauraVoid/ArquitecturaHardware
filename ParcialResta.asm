%include "io.inc" ;NASM
section .data
BD_dato1 db "01000.00",0
BD_delta db "00005.10",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; 
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    
    lea esi,[BD_dato1]
    push esi ;0x402000
    call length 
    add esp,4
    ;mov ecx, 8
    lea esi,[BD_dato1] ; dir OpeA
    push esi
    lea edx,[BD_delta] ; dir opeB
    push edx
    lea edi,[BD_dato1]    
    push edi
    push ecx    ;len del numero
    mov ecx, 5
L6: 
    call subtrac
    loop L6
    xor   eax,eax
    ret  ;CMAIN
     
 ;-----------------------------------------------  
 ; length  input: direcci?n base del array en la pila
 ;         output; tama?o del array en ECX 
length:
    push    ebp
    mov     ebp, esp
    mov     edi,[ebp+8]
    xor ecx,ecx
Lini:mov al, [edi + ecx]
     cmp al,0
     je fin
     inc ecx
     jmp Lini
     
fin: dec ecx
     mov esp, ebp
     pop ebp
     ret   
;------------------------------------------------

subtrac:
    
    push    ebp
    mov     ebp, esp
    push ecx
    xor eax, eax
    mov esi, [ebp+20]
    mov edx, [ebp+16]
    mov edi, [ebp+12]
    ;+4 dir call
    mov ecx, [ebp+8]
L1: mov al, [ esi+ ecx]
    mov bl, [ edx + ecx]   
    cmp al, '.'
    je L2
    add al, ah
    xor ah, ah
    cmp al, bl
    jge L3
    add al, 0ah
    mov ah, 0fh 
L3: sub al, bl
    AAS ;pedir prestado al vecino
    add al, 30h
L2: mov [edi +ecx], al  ;Lo guarda en la variable original  
    dec ecx
    cmp ecx, -1
    jne L1
    mov esp, ebp
    pop ebp
    ret 