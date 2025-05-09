%include "printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    xor edi, edi
    mov edi, input
    mov ecx, 7
loop_push:
    push dword[edi]
    dec ecx
    cmp ecx, 0
        je finish_push
    add edi, 4
    jmp loop_push
finish_push:
    ; TODO retrieve the elements (pop) from the stack into the output array
mov edi, output
mov ecx, 7
loop_pop:
    pop dword[edi]
    dec ecx
    cmp ecx, 0
        je finish_prog
    add edi, 4
    jmp loop_pop

finish_prog:

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
