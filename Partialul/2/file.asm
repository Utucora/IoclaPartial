section .data
    ; Exercise a: Overflow Detection
    coordonates dd 0x70000000, 0x70000000   ; X and Y coordinates
    speed dd 0x20000000                     ; Ship speed
    msg_overflow db "ALERT! Overflow detected in trajectory calculation!", 10, 0
    msg_succes db "Trajectory calculated successfully: X=%d, Y=%d", 10, 0
    
    ; Exercise b: Matrix addressing correction
    matrix dd 10, 20, 30, 40, 50, 60, 70, 80, 90
    format_matrix db "Element at position (%d,%d) is: %d", 10, 0
    
    ; Exercise c: Processing binary messages as ASCII strings
    binary_message dd 0x52415453, 0x50414D5F, 0x00000000
    size dd 3
    decoded_message times 16 db 0
    format_message db "Decoded message: %s", 10, 0
    
    ; Separators for display
    separator db "----------------------------------------", 10, 0
    header_ex1 db "Exercise a: Overflow Detection", 10, 0
    header_ex2 db "Exercise b: Matrix Addressing Correction", 10, 0
    header_ex3 db "Exercise c: Binary Message Processing", 10, 0

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp
    
    ; Exercise a: Overflow Detection
    push header_ex1
    call printf
    add esp, 4
    
    ; TODO a: Add speed to each coordinate, but check for overflow
    mov eax, speed;Viteza
    mov edi, coordonates;Primul numar
    ;Adaugam la eax, pe edi
    add eax, edi
        jo overflow_detected
    ; Jump to the overflow_detected label if it is the case
    add edi, 4
    add eax, edi
        jo overflow_detected
    jmp success

overflow_detected:
    push msg_overflow
    call printf
    add esp, 4

success:
    push msg_succes
    call printf
    add esp, 4

final_ex1:
    push separator
    call printf
    add esp, 4
    
    ; Exercise b: Matrix Addressing Correction
    push header_ex2
    call printf
    add esp, 4
    
    ; Coordinates of the searched element (row 2, column 1)
    mov edi, 1    ; Column
    mov esi, 2    ; Row
    
    ; TODO b: Correct the addressing to get the correct element from the matrix
    ;corectez adresele
    xor esi, esi
    mov esi, 6;ajung pe linia 2(3 daca am indexa de la 1)
    imul esi, 4
    mov eax, matrix
    imul edi, 4
    add eax, edi
    add eax, esi
    xor ebx, ebx
    mov ebx, [eax]
    mov esi, 2
    mov edi, 1
    ; Display the result
    push ebx          ; Element value
    push edi          ; Column
    push esi          ; Row
    push format_matrix
    call printf
    add esp, 16
    
    push separator
    call printf
    add esp, 4
    
    ; Exercise c: Processing Binary Messages as ASCII Strings
    push header_ex3
    call printf
    add esp, 4
    
    ; TODO c: Traverse the int array and extract each byte
    xor ecx, ecx ;voi folosi ecx ca contor pornind de la 0 pana la 7 inclusiv
    ; transforming it into an ASCII character in decoded_message
    
    mov esi, binary_message
    mov edi, decoded_message
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al
    inc edi
    inc esi
    mov al, byte[esi]
    mov [edi], al

    mov ecx, [size]     ; Number of ints
    
    ; Implement the conversion
    
    ; Display the decoded message
    push decoded_message
    push format_message
    call printf
    add esp, 8
    
    push separator
    call printf
    add esp, 4
    
    ; Return 0
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret