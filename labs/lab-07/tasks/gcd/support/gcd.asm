%include "printf32.asm"

section .text

extern printf
global main
main:
    ; input values (eax, edx): the 2 numbers to compute the gcd for
    mov eax, 20
    mov edx, 30

    push eax
    push edx

gcd:
    neg eax
    je gcd_end

swap_values:
    neg eax
    push eax
    push edx
    pop eax
    pop edx

subtract_values:
    push eax
    sub eax,edx
    pop edx
    cmp eax, 0
        jl neg_eax
    ;jg subtract_values
continue_prog:
    cmp eax, 0
        je print
    jmp subtract_values

neg_eax:
    neg eax
    jmp continue_prog

gcd_end:
    add eax,edx
    jne print
    inc eax

print:

    ; TODO 1: solve the 'Segmentation fault!' error

    ; TODO 2: print the result in the form of: "gdc(eax, edx)=7" with PRINTF32 macro
    ; output value in eax
    PRINTF32 `%u\n\x0`, edx
    pop edx
    pop eax
    ret
