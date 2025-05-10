section .data
    magic_number equ 42

    ; DO NOT ADD NEW GLOBALS
    raw_password dd 43, 6, 10, 4242, 82, 982, 165, 424242, 12, 8484, 4242424242, 42
    raw_password_len equ 13
    final_password times 13 dd 0
    fmt db "%d ", 0

section .text
extern printf
global main

; ------------------------
; FUNCȚIA filter
; ------------------------
filter:
    push ebp
    mov ebp, esp

    mov esi, [ebp + 8]   ; src_array
    mov ecx, [ebp + 12]  ; src_array_len
    mov edi, [ebp + 16]  ; dest_array
    xor eax, eax         ; eax = counter

.loop:
    cmp ecx, 0
    je .done

    mov edx, [esi]       ; edx = element curent
    mov ebx, magic_number
    cdq
    idiv ebx             ; edx = rest

    cmp edx, 0
    jne .skip

    mov ebx, [esi]       ; REG → MEM → REG
    mov [edi], ebx       ; scriere corectă
    add edi, 4
    inc eax              ; am adăugat un element

.skip:
    add esi, 4
    dec ecx
    jmp .loop

.done:
    pop ebp
    ret

; ------------------------
; FUNCȚIA main
; ------------------------
main:
    push ebp
    mov ebp, esp

    ; Apelăm filter(raw_password, raw_password_len, final_password)
    push final_password
    push raw_password_len
    push raw_password
    call filter
    add esp, 12

    ; eax = lungimea rezultatului
    mov ecx, eax
    mov esi, final_password

.print_loop:
    cmp ecx, 0
    je .end

    push dword [esi]
    push fmt
    call printf
    add esp, 8

    add esi, 4
    dec ecx
    jmp .print_loop

.end:
    leave
    ret
