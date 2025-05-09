; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .bss
    array3: resw 10

section .data
    array1: db 27, 35, 46, 14, 17, 29, 37, 104, 135, 124
    array2: db 15, 38, 44, 20, 17, 33, 78, 143, 132, 16

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp
    ; TODO: Traversing array1 and array2 and putting the result in array3
    mov ecx, 10;Contorul
    xor edx, edx
    mov edi, array1
    mov esi, array2
    mov edx, array3
loop_add_arr_3:
    xor eax, eax

    mov al, [edi]
    xor ebx, ebx
    mov bl, [esi]
    mul bl
    mov [edx], ax
    dec ecx
    cmp ecx, 0
        je end_first_stage
    inc edi
    inc esi
    add edx, 2
    jmp loop_add_arr_3

end_first_stage:
    PRINTF32 `The array that results from the product of the corresponding elements in array1 and array2 is:\n\x0`
    ; TODO: Traversing array3 and displaying its elements
    mov ecx, 10
    xor edx, edx
    mov edx, array3
    xor eax, eax
loop_print:
    movzx eax, word[edx]
    push eax
    PRINTF32 `%u\n\x0`, eax
    dec ecx
    add edx, 2
    cmp ecx, 0
        jne loop_print
    jmp ending

ending:
    leave
    ret
