; SPDX-License-Identifier: BSD-3-Clause

%include "printf32.asm"

extern printf

section .bss:
	; the structure for a student
	struc student_t
		name:   resb	10	; char[10] - student name
		id_course:	resd	1	; integer - the id of the course where a student is assigned
		check:	resd	1	; "bool" - check if the student is assigned to any course
	endstruc

    ; the structure for a course
	struc course_t
		id:	resd	1	; id bautura = index in courses (the list of courses)
		name_course:   resb	15	; char[10] - the name of the course
	endstruc

section .data
    unassigned:		db "Student unassigned :(", 0
	v_students_count:    dd 5
    v_courses_count:    dd 3

    students:
		istruc student_t
			at name,	db "Vlad", 0
			at id_course,		dd 0
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Andrew", 0
			at id_course,		dd 1
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Kim", 0
			at id_course,		dd 1
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "George", 0
			at id_course,		dd 2
			at check,	dd 1
		iend

		istruc student_t
			at name,	db "Kate", 0
			at id_course,		dd 0
			at check,	dd 0
		iend

    courses:
		istruc course_t
			at id,	dd 0
			at name_course,	db "Assembly", 0
		iend

		istruc course_t
			at id,	dd 1
			at name_course,	db "Linear Algebra", 0
		iend

		istruc course_t
			at id,   dd 2
			at name_course,	db "Physics", 0
		iend

section .text
global main

main:
	push ebp
	mov ebp, esp
	PRINTF32 `The students list is:\n\x0`
	; TODO: Print the list of students and the courses where they are assigned
	mov esi, students;Pointer catre vectorul de studenti
	mov ecx, [v_students_count]

loop_student:
	mov eax, [esi+14]
	cmp eax, 0
		je unassigned_student
	mov eax, [esi+10] ;Id course
	mov edi, courses
	mov ebx, [v_courses_count]

find_course:
	;Verificam daca [edi + 0] == id
	cmp eax, [edi]
		je print_student
	add edi, 19
	dec ebx
	cmp ebx, 0
		jge	find_course
	jmp unassigned_student


unassigned_student:
	push unassigned
	push esi
	PRINTF32 `%s - %s\n\x0`, esi, unassigned
	dec ecx
	cmp ecx, 0
		jle endprog
	add esi, 18
	jmp loop_student
 
 print_student:
	add edi, 4
	push edi;Course name
	push esi;Pointer la students
	PRINTF32 `%s - %s\n\x0`, esi, edi
	jmp next_student

next_student:
	dec ecx
	cmp ecx, 0
		jle endprog
	add esi, 18
	jmp loop_student
	
endprog:
	
	leave
    ret
