%include "io.inc"
section .data
L6  dd L4 ,L9 ,L4  ,L5  ,L8  ,L4  ,L7  ,L4  ,L4  ,L4  ,L5
result dd 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    push -2
    call fun
    pop DWORD [result]
    xor eax, eax
    ret
fun:push ebp
    mov ebp,esp
    cmp DWORD [ebp+8], 11
    ja L4
    mov eax, DWORD [ebp+8]
    sal eax,2
    add eax, L6
    mov eax, DWORD [eax]
    jmp eax
    
L9:mov DWORD [ebp+8],17
    jmp L10
L5:mov DWORD [ebp+8],14
L8:add DWORD [ebp+8],1
    jmp L10
L7:sal DWORD [ebp+8],3 
    jmp L11
L4:mov eax, -5
    jmp L11
L10:mov eax, DWORD [ebp+8]
L11:pop ebp
     ret


    
    
    