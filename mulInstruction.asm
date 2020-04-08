.386
.model flat, stdcall
option casemap : none
.code
start:
    
    xor eax, eax
    xor edx, edx
    xor ecx, ecx
    mov al, 5 
    mov cx, 765
    mul cx
    mov ch,ah
    xor eax, eax
    ret
    end start
