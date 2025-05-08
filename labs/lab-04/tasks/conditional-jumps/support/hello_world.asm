; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

section .data
    myString: db "Hello, World!", 0
    newString: db "Goodbye, World!", 0
    N: dd 6                         ; N = 6

section .text
    global main
    extern printf

main:
    mov ecx, DWORD [N]              ; ecx will store the value of N
    PRINTF32 `%d\n\x0`, ecx         ; DO NOT REMOVE/MODIFY THIS LINE
start:
    dec ecx
    mov eax, 2
    mov ebx, 1
    cmp eax, ebx
    jg print                        ; TODO1: eax > ebx?

    ret

print:
    PRINTF32 `%s\n\x0`, myString
                                    ; TODO2.2: print "Hello, World!" N times
                                    ; TODO2.1: print "Goodbye, World!"
    cmp ecx, 0
    jne start
PRINTF32 `%s\n\x0`, newString

    ret
