%include "../utils/printf32.asm"

section .data
    mystring db "This is my string", 0
    fmt_str db "[before]: %s\n[after]: ", 0
    reversed times 256 db 0

section .text



extern puts
extern printf
global main


reverse_string:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ecx, [ebp + 12]
    add eax, ecx
    dec eax
    mov edx, [ebp + 16]
    dec edx

copy_one_byte:
    mov bl, byte[eax]
    mov byte[edx], bl
    dec eax
    inc edx
    loopnz copy_one_byte

    ;inc edx
    mov byte [edx], 0
    leave
    ret



main:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte

out:
    push mystring
    push fmt_str
    call printf
    add esp, 8

    ; TODO: print reverse string
    mov ecx, 18
    push reversed
    push ecx     
    push mystring
    call reverse_string
    add esp, 12
    push reversed
    call puts
    add esp, 4
    leave
    ret
