%include "../utils/printf32.asm"

section .data
    mystring db "This is my string", 0
    ;adaugat de mine ce e sub
    fmt_str db "[By pritntf]%s with the length of %d\n", 0

section .text

extern puts
extern printf
global main

main:
    push ebp
    mov ebp, esp

    mov eax, mystring
    xor ecx, ecx
test_one_byte:
    mov bl, byte [eax]
    test bl, bl
    je out
    inc eax
    inc ecx
    jmp test_one_byte

out:
    PRINTF32 `[PRINTF32]: %d\n[printf]: \x0`, ecx

    ;  TODO: print string length using printf
    push ecx
    push mystring
    push fmt_str
    call printf
    add esp, 12
    leave
    ret
