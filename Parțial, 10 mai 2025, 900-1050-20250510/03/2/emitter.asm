; TODO a: Fix the segfault without modifying main!

section .rodata
	fmt db '%s', 0

section .data
	message db 'Starting machine...', 0, 0

section .text
extern printf
global main

main:
	; Warning! No edits allowed past this point.
	push ebp
	mov ebp, esp
	
	; Adding a newline at the end of the string...
	xor eax, eax
	mov eax, message
	
str_loop:
	mov bl, [eax]
	test bl, bl
	jz out
	
	inc eax
	jmp str_loop
	
out:
	mov byte [eax], 10
	inc eax
	mov byte [eax], 0
	
	; Printing the string
	push message
	push fmt
	call printf
	add esp, 8
	
	leave
	ret

