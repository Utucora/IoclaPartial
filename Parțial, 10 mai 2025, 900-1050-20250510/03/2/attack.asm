section .data
	; WARNING! You must not define any new global variables.
	attack_location db "Ardhalis", 0
	read_fmt db "%d%d", 0

section .text
extern broadcast
extern scanf
global main

main:
	push ebp
	mov ebp, esp

	; Rezervăm loc pentru struct info pe stivă (12 octeți)
	sub esp, 12        ; [ebp-12] = month, [ebp-8] = day, [ebp-4] = location ptr

	; -----------------------
	; Citim luna și ziua
	; scanf("%d%d", &month, &day)
	; -----------------------
	lea eax, [ebp-12]  ; &month
	push eax
	lea eax, [ebp-8]   ; &day
	push eax
	push read_fmt
	call scanf
	add esp, 12        ; curățăm cei 3 parametri

	; -----------------------
	; Setăm câmpul .location
	; -----------------------
	mov eax, attack_location
	mov [ebp-4], eax   ; info.location = &attack_location

	; -----------------------
	; Apelăm broadcast(&info)
	; -----------------------
	lea eax, [ebp-12]  ; adresa structurii info
	push eax
	call broadcast
	add esp, 4

	leave
	ret
