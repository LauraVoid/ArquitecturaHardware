.386
.model flat, stdcall
option casemap : none
.data
arrayNumbers DWORD 19,21,20,18,20
.code
start:
    ;write your code here
    xor eax, eax
    mov esi, OFFSET arrayNumbers
    mov ecx, 5
    mov eax, 0
    
L1:
    add eax,DWORD PTR[esi]
    add esi,4
    loop L1
    
    ret
    end start
