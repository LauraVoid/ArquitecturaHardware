.386
.model flat, stdcall
option casemap : none
.data
IPHeader byte 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h, 01h
;Comprobar tambien con Header #2 y Header #3
.code
start:
    mov esi,0
    xor bx,bx
L11:mov   ax,word ptr[IPHeader+esi]; AX : AH AL
    xchg  al,ah 
    add esi,1
    add bx,ax
    cmp esi,20
    jne L11
    not bx
    
    xor eax, eax
    ret
    end start