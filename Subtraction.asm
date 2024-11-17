section .text
global _start
_start:

mov ax,5678h
mov bx,5678h
sub ax,bx


mov eax,1
mov ebx,0
int 80h
