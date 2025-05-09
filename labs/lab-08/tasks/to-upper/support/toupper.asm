section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghij", 0

section .text

extern printf
global main

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    xor eax, eax
    mov eax, [ebp+8]
looping:
    cmp byte[eax], 0
        je ending
    cmp byte[eax], 97
        jge bigger_than_a
    jmp loop_next

bigger_than_a:
    cmp byte[eax], 122
        jle is_lower
    jmp loop_next

is_lower:
    sub byte[eax], 32
    jmp loop_next

loop_next:
    inc eax
    jmp looping


ending:
    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
