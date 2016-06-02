TITLE Calculating Modibonacci                   (Assign4.asm)

;Chad Bartley
; This program uses recursion to calculate the
; Nth Modibonacci value

.586
.model flat,C

.code

Modibonacci PROC


	push ebp  
	mov ebp, esp
	sub esp, 4 ;reserve space for local variable
	mov eax, [ebp + 8] ; get N

	;Base case N = 3
	cmp eax, 3
	je N3

	;Base case N = 2
	cmp eax, 2
	je N2

	;Base case N = 1
	cmp eax, 1
	je N1


	L1:

		dec eax ; N - 1
		push eax 
		call Modibonacci ; Alpha recursive call

		add esp, 4 ; counter "push eax"
		mov [ebp - 4], eax ; save eax to local
		mov eax, [ebp + 8] ;Get N
		sub eax, 2 ; N - 2
		push eax

		call Modibonacci ; Beta recursive call

		add esp, 4 ; counter "push eax"
		mov ebx, [ebp - 4] ; get previous local value (N - 1)
		shr eax, 1 ; (N - 2)/2
		add eax, ebx ; (N - 1) + (N - 2)/2
		mov [ebp - 4], eax ;save (N - 1) + (N - 2)/2 to local 
		mov eax, [ebp + 8] ; get N
		sub eax, 3 ;N - 3
		push eax
		

		call Modibonacci ; Gamma recursive call

		add esp, 4
		mov ebx, [ebp - 4] ; put previous value into ebx (N - 1) + (N - 2)/2
		shr eax, 1 ; (N - 3)/ 2
		add eax, ebx ; (N - 1) + (N - 2)/2 + (N - 3)/ 2

		jmp Quit



	N1:

		mov eax, 1 ; First Modibonacci = 1
		jmp Quit

	N2:

		mov eax, 2 ; Second Modibonacci = 2
		jmp Quit

	N3:

		mov eax, 4 ; Third Modibonacci = 4
		jmp Quit

	Quit:

		mov esp, ebp
		pop ebp

		ret		

Modibonacci ENDP
END

