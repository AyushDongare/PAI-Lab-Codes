section .data
    first db "Ayush", 0         
    middle db "Sujit", 0      
    last db "Dongare", 0      
    fullname db 30 dup(0)     

section .bss
    
    first resb 10
    middle resb 10
    last resb 10

section .text
    global _start

_start:
    
    mov esi, first
    mov edi, fullname
concatenate_first:
    mov al, [esi]
    cmp al, 0                
    je middle_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_first

middle_name:
    
    mov esi, middle
concatenate_middle:
    mov al, [esi]
    cmp al, 0                
    je last_name
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_middle

last_name:
        mov esi, last
concatenate_last:
    mov al, [esi]
    cmp al, 0     
    je done
    mov [edi], al
    inc esi
    inc edi
    jmp concatenate_last

done:
    mov eax, 4               
    mov ebx, 1               
    mov edx, 30             
    mov ecx, fullname       
    int 0x80

   
    mov eax, 1               
    xor ebx, ebx             
    int 0x80