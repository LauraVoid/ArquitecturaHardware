.386
.model flat, stdcall
option casemap : none
.data
    
.code
start:
    nop
    push 5EABCD78h
    push 7801EF78h
    mov ebp, esp
    
        
    mov ecx, [ebp] ;8h
    add ebp, 4
    mov eax,[ebp] ;8h
    add eax,ecx
    ;mov ecx, [ebp]
   
    xor eax, eax
    ret
    end start
