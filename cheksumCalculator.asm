.386
.model flat, stdcall
option casemap : none
.data
IPHeader  byte 45h, 00h, 00h, 29h, 36h, 27h, 40h, 00h, 80h, 06h, 0d9h,70h, 0c0h, 0a8h, 01h, 02h, 0dh,  58h, 1ch, 35h
IPHeader1 byte 45h, 00h, 00h, 28h, 14h, 2ch, 40h, 00h, 2fh, 06h, 74h, 7dh ,5bh, 0e4h, 0a6h, 2dh, 0c0h, 0a8h, 00h, 6dh
IPHeader2 byte 45h, 00h, 00h, 34h, 48h, 64h, 40h, 00h, 0fch,06h, 4bh, 028h,0dh, 058h, 1ch, 035h, 0c0h, 0a8h, 01h, 02h
IPHeader3 byte 45h, 00h, 00h, 28h, 17h, 0dah,40h, 00h, 80h, 06h, 5eh, 55h ,0c0h, 0a8h, 01h, 02h, 34h,  72h,  8eh, 84h

;Comprobar tambien con Header #2 y Header #3
.code
start:
    mov esi,0
    xor bx,bx
    xor cx, cx
L11:mov ax,word ptr[IPHeader3+esi]; AX : AH AL
    xchg  al,ah 
    add esi,2
    not ax
    add bx,ax
    jnc L24
    add bx, 1
L24:cmp esi,20
    jne L11    
    not bx    
    xor eax, eax
    ret
    end start