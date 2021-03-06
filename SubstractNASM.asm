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
    call subtrac  
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
    xor eax, eax
    mov esi, [ebp+16]
    mov edx, [ebp+12]
    mov edi, [ebp+8]
    ;+4 dir call
       
L1: mov al, [ esi+ ecx]
    mov bl, [ edx + ecx]   
    cmp al, '.'
    je L2
    cmp al, bl
    jae L3
    add al, 0ah ;pedir prestado 10 al vecino
    dec ecx
    mov bl, [ edx + ecx]  ;Selecciono el siguiente n�mero del sustraendo
    cmp bl, '.' ;verifica que la siguiente no sea puntico
    jne L80  ;si es puntico no salta
    dec ecx ; decrementa al siguiente
    mov bl, [ edx + ecx]
L80:add bl ,1h  ; Le agrego un 1 al n�mero del sustraendo
    mov [edx +ecx], bl    ; Lo pongo en la variable original
    inc ecx         ;Regresa a la posici�n en la que estaba la resta normal
    mov bl, [ edx + ecx]
    cmp bl, '.' ;verifica que no sea puntico
    jne L79
    inc ecx
    mov bl, [ edx + ecx]  ;Regresa a la posici�n en la que estaba la resta normal
    

L79:mov ah, 0h  ;continua con la resta
L3: sub al, bl
    AAA
    add al, 30h
L2: mov [edi +ecx], al
    dec ecx
    cmp ecx, -1
    jne L1
    
    mov esp, ebp
    pop ebp
ret