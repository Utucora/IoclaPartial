; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    N: dd 5      ; N-th fibonacci number to calculate

section .text
    global main
    extern printf

main:
    mov ecx, DWORD [N]       ; we want to find the N-th fibonacci number; N = ECX = 7
    ; TODO: calculate the N-th fibonacci number (f(0) = 0, f(1) = 1)
    cmp ecx, 0
        je print
    cmp ecx, 1
        je print
    mov eax, 1 ;F(i-2)
    mov ebx, 1 ;F(i-1)
    mov esi, 2 ;Contor
calculate:
    inc esi
    xor edx, edx
    add edx, ebx
    add edx, eax
    cmp esi, ecx
        je print_2
    mov eax, ebx
    mov ebx, edx
    jmp calculate

print:
    PRINTF32 `%d\n\x0`, ecx  ; DO NOT REMOVE/MODIFY THIS LINE
    ret

print_2:
    PRINTF32 `%d\n\x0`, edx  ; DO NOT REMOVE/MODIFY THIS LINE
    ret