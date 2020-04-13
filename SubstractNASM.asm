%include "io.inc" ;NASM
section .data
BD_dato1 db "01000.00",0
BD_delta db "00005.20",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
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
    lea edi,[BD_dato1] ; dir Result    
    push edi
    call addBD
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
     
fin: mov esp, ebp
     pop ebp
     ret   
;------------------------------------------------

addBD:
    push    ebp
    mov     ebp, esp 
       
L1: mov al, [ esi+ ecx]
    mov bl, [ edx + ecx]
    cmp al, '.'
    je L2
    cmp ah, 0h
    je L3
    add al, 1h  
    mov ah, 0h  
L3: add al, bl
    AAA
    add al, 30h
L2: mov [edi +ecx], al
    dec ecx
    cmp ecx, -1
    jne L1
    
    mov esp, ebp
    pop ebp
ret