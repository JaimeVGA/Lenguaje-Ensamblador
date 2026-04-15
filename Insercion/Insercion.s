	.file	"Insercion.c"
	.text
	.type	insercion, @function
insercion:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	$1, -24(%rbp)
	jmp	.L2
.L6:
	movq	-24(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -16(%rbp)
	jmp	.L3
.L5:
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	-16(%rbp), %rdx
	addq	$1, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movq	(%rax), %rax
	movq	%rax, (%rdx)
	subq	$1, -16(%rbp)
.L3:
	cmpq	$0, -16(%rbp)
	js	.L4
	movq	-16(%rbp), %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jl	.L5
.L4:
	movq	-16(%rbp), %rax
	addq	$1, %rax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, (%rdx)
	addq	$1, -24(%rbp)
.L2:
	movq	-24(%rbp), %rax
	cmpq	-48(%rbp), %rax
	jl	.L6
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	insercion, .-insercion
	.type	esta_ordenado, @function
esta_ordenado:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	$1, -8(%rbp)
	jmp	.L8
.L11:
	movq	-8(%rbp), %rax
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	cmpq	%rax, %rdx
	jle	.L9
	movl	$0, %eax
	jmp	.L10
.L9:
	addq	$1, -8(%rbp)
.L8:
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jl	.L11
	movl	$1, %eax
.L10:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	esta_ordenado, .-esta_ordenado
	.type	segundos, @function
segundos:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movq	%rdx, %rdi
	movq	%r8, %rdi
	movq	%rsi, -16(%rbp)
	movq	%rdi, -8(%rbp)
	movq	%rdx, -32(%rbp)
	movq	%rcx, -24(%rbp)
	movq	-32(%rbp), %rdx
	movq	-16(%rbp), %rax
	subq	%rax, %rdx
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	subq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	segundos, .-segundos
	.section	.rodata
	.align 8
.LC1:
	.string	"Cuantos numeros deseas generar: "
.LC2:
	.string	"%ld"
.LC3:
	.string	"Valor de n invalido."
.LC4:
	.string	"No se pudo reservar memoria."
	.align 8
.LC5:
	.string	"Tiempo de ordenamiento: %.9f s\n"
.LC6:
	.string	"SI"
.LC7:
	.string	"NO"
.LC8:
	.string	"Arreglo ordenado: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.L15
	movq	-72(%rbp), %rax
	testq	%rax, %rax
	jg	.L16
.L15:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L23
.L16:
	movq	-72(%rbp), %rax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L18
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L23
.L18:
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	$0, -64(%rbp)
	jmp	.L19
.L20:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$703680405, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$14, %edx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$100001, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movq	-64(%rbp), %rax
	leaq	0(,%rax,8), %rcx
	movq	-56(%rbp), %rax
	addq	%rax, %rcx
	movslq	%edx, %rax
	movq	%rax, (%rcx)
	addq	$1, -64(%rbp)
.L19:
	movq	-72(%rbp), %rax
	cmpq	%rax, -64(%rbp)
	jl	.L20
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-72(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	insercion
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$1, %edi
	call	clock_gettime@PLT
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	-48(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movq	%rdx, %rcx
	movq	%rax, %rdx
	call	segundos
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	-72(%rbp), %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	esta_ordenado
	testl	%eax, %eax
	je	.L21
	leaq	.LC6(%rip), %rax
	jmp	.L22
.L21:
	leaq	.LC7(%rip), %rax
.L22:
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L23:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
