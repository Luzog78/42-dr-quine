; **************************************************************************** ;
;                                                         :::      ::::::::    ;
;    Colleen.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: luzog78 <luzog78@gmail.com>                +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2026/02/14 19:48:27 by luzog78           #+#    #+#              ;
;                                                     ###   ########.fr        ;
; **************************************************************************** ;

section .data
c_newl:
	db		10, 0
c_quote:
	db		34, 0
source_code:
	db		"; **************************************************************************** ;%n;                                                         :::      ::::::::    ;%n;    Colleen.s                                          :+:      :+:    :+:    ;%n;                                                     +:+ +:+         +:+      ;%n;    By: luzog78 <luzog78@gmail.com>                +#+  +:+       +#+         ;%n;                                                 +#+#+#+#+#+   +#+            ;%n;    Created: 2026/02/14 19:48:27 by luzog78           #+#    #+#              ;%n;                                                     ###   ########.fr        ;%n; **************************************************************************** ;%n%nsection .data%nc_newl:%n	db		10, 0%nc_quote:%n	db		34, 0%nsource_code:%n	db		%q%s%q, 0%n%n%nsection .text%nglobal main%n%n%nstrlen:%n	mov		rax, 0%n	strlen_loop:%n		cmp		byte [rdi], 0	; if ((char) *args[0] == 0)%n		je		strlen_end		;   goto strlen_end%n		inc		rax%n		inc		rdi%n		jmp		strlen_loop%n	strlen_end:%n		ret%n%n%nwrite_quine:%n	mov		r10, rdi%n	mov		r12, rdi%n%n	write_quine_loop:%n		mov		al, byte [r10]%n		cmp		al, 0					; if (*src == 0)%n		je		write_quine_end			;   goto write_quine_end%n		cmp		al, 37					; if (*src == PERCENT)%n		je		write_quine_format		;   goto write_quine_format%n		jmp		write_quine_write		; else goto write_quine_write%n%n		write_quine_format:%n			cmp		byte [r10 + 1], 110	; if (*src == 'n')%n			je		write_quine_newl%n			cmp		byte [r10 + 1], 115	; if (*src == 's')%n			je		write_quine_src%n			cmp		byte [r10 + 1], 113	; if (*src == 'q')%n			je		write_quine_quote%n%n			mov		rax, 1				; write(%n			mov		rdi, 1				; 	1,%n			mov		rsi, r10			; 	src,%n			mov		rdx, 1				; 	1%n			syscall						; )%n			inc		r10%n			jmp		write_quine_write%n%n		write_quine_newl:%n			mov		rax, 1				; write(%n			mov		rdi, 1				; 	1,%n			lea		rsi, [rel c_newl]	; 	NEWL,%n			mov		rdx, 1				; 	1%n			syscall						; )%n			inc		r10%n			jmp		write_quine_loop_continue%n%n		write_quine_quote:%n			mov		rax, 1				; write(%n			mov		rdi, 1				; 	1,%n			lea		rsi, [rel c_quote]	; 	QUOTE,%n			mov		rdx, 1				; 	1%n			syscall						; )%n			inc		r10%n			jmp		write_quine_loop_continue%n%n		write_quine_src:%n			mov		rdi, r12%n			call	strlen%n			mov		rdx, rax			; arg[2] strlen(original_src)%n			mov		rsi, r12			; arg[1] = original_src%n			mov		rdi, 1				; arg[0] = 1%n			mov		rax, 1				; func = write%n			syscall						; write(1, original_src, strlen(original_src))%n			inc		r10%n			jmp		write_quine_loop_continue%n%n		write_quine_write:%n			mov		rax, 1				; write(%n			mov		rdi, 1				; 	1,%n			mov		rsi, r10			; 	src,%n			mov		rdx, 1				; 	1%n			syscall						; )%n%n		write_quine_loop_continue:%n			inc		r10%n			jmp		write_quine_loop%n%n	write_quine_end:%n		xor		rax, rax%n		ret%n%n%nmain:%n	; First quine program!%n	lea		rdi, [rel source_code]%n	call	write_quine%n%n%nsection .note.GNU-stack noalloc noexec nowrite progbits%n", 0


section .text
global main


strlen:
	mov		rax, 0
	strlen_loop:
		cmp		byte [rdi], 0	; if ((char) *args[0] == 0)
		je		strlen_end		;   goto strlen_end
		inc		rax
		inc		rdi
		jmp		strlen_loop
	strlen_end:
		ret


write_quine:
	mov		r10, rdi
	mov		r12, rdi

	write_quine_loop:
		mov		al, byte [r10]
		cmp		al, 0					; if (*src == 0)
		je		write_quine_end			;   goto write_quine_end
		cmp		al, 37					; if (*src == PERCENT)
		je		write_quine_format		;   goto write_quine_format
		jmp		write_quine_write		; else goto write_quine_write

		write_quine_format:
			cmp		byte [r10 + 1], 110	; if (*src == 'n')
			je		write_quine_newl
			cmp		byte [r10 + 1], 115	; if (*src == 's')
			je		write_quine_src
			cmp		byte [r10 + 1], 113	; if (*src == 'q')
			je		write_quine_quote

			mov		rax, 1				; write(
			mov		rdi, 1				; 	1,
			mov		rsi, r10			; 	src,
			mov		rdx, 1				; 	1
			syscall						; )
			inc		r10
			jmp		write_quine_write

		write_quine_newl:
			mov		rax, 1				; write(
			mov		rdi, 1				; 	1,
			lea		rsi, [rel c_newl]	; 	NEWL,
			mov		rdx, 1				; 	1
			syscall						; )
			inc		r10
			jmp		write_quine_loop_continue

		write_quine_quote:
			mov		rax, 1				; write(
			mov		rdi, 1				; 	1,
			lea		rsi, [rel c_quote]	; 	QUOTE,
			mov		rdx, 1				; 	1
			syscall						; )
			inc		r10
			jmp		write_quine_loop_continue

		write_quine_src:
			mov		rdi, r12
			call	strlen
			mov		rdx, rax			; arg[2] strlen(original_src)
			mov		rsi, r12			; arg[1] = original_src
			mov		rdi, 1				; arg[0] = 1
			mov		rax, 1				; func = write
			syscall						; write(1, original_src, strlen(original_src))
			inc		r10
			jmp		write_quine_loop_continue

		write_quine_write:
			mov		rax, 1				; write(
			mov		rdi, 1				; 	1,
			mov		rsi, r10			; 	src,
			mov		rdx, 1				; 	1
			syscall						; )

		write_quine_loop_continue:
			inc		r10
			jmp		write_quine_loop

	write_quine_end:
		xor		rax, rax
		ret


main:
	; First quine program!
	lea		rdi, [rel source_code]
	call	write_quine


section .note.GNU-stack noalloc noexec nowrite progbits
