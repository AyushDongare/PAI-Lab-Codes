section .data
msg db 'Enter name: ',10
msglen: equ $-msg
msg1 db 'Enter roll number: ',10
msg1len: equ $-msg1
msg2 db 'Enter division: ',10
msg2len: equ $-msg2
msg3 db 'Name is: '
msg3len: equ $-msg3
msg4 db 'Roll number is: '
msg4len: equ $-msg4
msg5 db 'Division is: '
msg5len: equ $-msg5

section .bss
first resb 255
second resb 255
third resb 255

%macro RW 4
mov eax, %1
mov ebx, %2
mov ecx, %3
mov edx, %4
int 80h
%endmacro

section .text 
global _start
_start:
RW 4,1,msg,msglen
RW 3,0,first,255

RW 4,1,msg1,msg1len
RW 3,0,second,255

RW 4,1,msg2,msg2len
RW 3,0,third,255

RW 4,1,msg3,msg3len
RW 4,1,first,255

RW 4,1,msg4,msg4len
RW 4,1,second,255

RW 4,1,msg5,msg5len
RW 4,1,third,255

mov eax,1
mov ebx,0
int 80h