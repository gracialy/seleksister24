	.file	"x86.c"
	.text
	.def	fscanf;	.scl	3;	.type	32;	.endef
	.seh_proc	fscanf
fscanf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	__mingw_vfscanf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	fprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	fprintf
fprintf:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movq	%r8, 32(%rbp)
	movq	%r9, 40(%rbp)
	leaq	32(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rcx
	movq	24(%rbp), %rdx
	movq	16(%rbp), %rax
	movq	%rcx, %r8
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rax, %rcx
	movq	32(%rbp), %rax
	movq	%rbx, %r8
	movq	%rax, %rdx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "w\0"
.LC1:
	.ascii "File not found\12\0"
.LC2:
	.ascii "%d\12\0"
.LC3:
	.ascii "%lf \0"
.LC4:
	.ascii "\12\0"
	.text
	.globl	write_output
	.def	write_output;	.scl	2;	.type	32;	.endef
	.seh_proc	write_output
write_output:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	16(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L8
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L7
.L8:
	movl	32(%rbp), %edx
	movq	-16(%rbp), %rax
	movl	%edx, %r8d
	leaq	.LC2(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	movl	$0, -4(%rbp)
	jmp	.L10
.L13:
	movl	$0, -8(%rbp)
	jmp	.L11
.L12:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm0
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movapd	%xmm0, %xmm2
	movq	%rdx, %r8
	leaq	.LC3(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addl	$1, -8(%rbp)
.L11:
	movl	-8(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L12
	movq	-16(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movq	%rax, %rcx
	call	fprintf
	addl	$1, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cmpl	32(%rbp), %eax
	jl	.L13
	movq	-16(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	nop
.L7:
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	inverse_gauss_jordan
	.def	inverse_gauss_jordan;	.scl	2;	.type	32;	.endef
	.seh_proc	inverse_gauss_jordan
inverse_gauss_jordan:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$88, %rsp
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movl	%edx, 40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L15
.L23:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L16
.L17:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	divsd	-40(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -8(%rbp)
.L16:
	movl	40(%rbp), %eax
	addl	%eax, %eax
	cmpl	%eax, -8(%rbp)
	jl	.L17
	movl	$0, -12(%rbp)
	jmp	.L18
.L22:
	movl	-4(%rbp), %eax
	cmpl	-12(%rbp), %eax
	je	.L19
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -48(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L20
.L21:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	mulsd	-48(%rbp), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	subsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -16(%rbp)
.L20:
	movl	40(%rbp), %eax
	addl	%eax, %eax
	cmpl	%eax, -16(%rbp)
	jl	.L21
.L19:
	addl	$1, -12(%rbp)
.L18:
	movl	-12(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L22
	addl	$1, -4(%rbp)
.L15:
	movl	-4(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L23
	movl	40(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L24
.L27:
	movl	40(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-32(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rcx
	call	malloc
	movq	%rax, (%rbx)
	movl	$0, -24(%rbp)
	jmp	.L25
.L26:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	32(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	40(%rbp), %ecx
	movl	-24(%rbp), %edx
	addl	%ecx, %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -24(%rbp)
.L25:
	movl	-24(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L26
	addl	$1, -20(%rbp)
.L24:
	movl	-20(%rbp), %eax
	cmpl	40(%rbp), %eax
	jl	.L27
	movq	-32(%rbp), %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC5:
	.ascii "input.txt\0"
.LC6:
	.ascii "output/x86.txt\0"
.LC7:
	.ascii "r\0"
.LC8:
	.ascii "%d\0"
.LC9:
	.ascii "%lf\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$120, %rsp
	.seh_stackalloc	120
	leaq	112(%rsp), %rbp
	.seh_setframe	%rbp, 112
	.seh_endprologue
	call	__main
	leaq	.LC5(%rip), %rax
	movq	%rax, -32(%rbp)
	leaq	.LC6(%rip), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rcx
	call	fopen
	movq	%rax, -48(%rbp)
	cmpq	$0, -48(%rbp)
	jne	.L30
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	jmp	.L46
.L30:
	leaq	-68(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC8(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -56(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L32
.L39:
	movl	-68(%rbp), %eax
	addl	%eax, %eax
	cltq
	salq	$3, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-56(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rcx
	call	malloc
	movq	%rax, (%rbx)
	movl	$0, -8(%rbp)
	jmp	.L33
.L34:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, %r8
	leaq	.LC9(%rip), %rdx
	movq	%rax, %rcx
	call	fscanf
	addl	$1, -8(%rbp)
.L33:
	movl	-68(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L34
	movl	-68(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L35
.L38:
	movl	-68(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, -12(%rbp)
	jne	.L36
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC10(%rip), %xmm0
	movsd	%xmm0, (%rax)
	jmp	.L37
.L36:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
.L37:
	addl	$1, -12(%rbp)
.L35:
	movl	-68(%rbp), %eax
	addl	%eax, %eax
	cmpl	%eax, -12(%rbp)
	jl	.L38
	addl	$1, -4(%rbp)
.L32:
	movl	-68(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L39
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	call	fclose
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rcx
	call	malloc
	movq	%rax, -64(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L40
.L43:
	movl	-68(%rbp), %eax
	cltq
	salq	$3, %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	leaq	0(,%rdx,8), %rcx
	movq	-64(%rbp), %rdx
	leaq	(%rcx,%rdx), %rbx
	movq	%rax, %rcx
	call	malloc
	movq	%rax, (%rbx)
	movl	$0, -20(%rbp)
	jmp	.L41
.L42:
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -20(%rbp)
.L41:
	movl	-68(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L42
	addl	$1, -16(%rbp)
.L40:
	movl	-68(%rbp), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L43
	movl	-68(%rbp), %edx
	movq	-56(%rbp), %rax
	movq	%rax, %rcx
	call	inverse_gauss_jordan
	movq	%rax, -64(%rbp)
	movl	-68(%rbp), %ecx
	movq	-64(%rbp), %rdx
	movq	-40(%rbp), %rax
	movl	%ecx, %r8d
	movq	%rax, %rcx
	call	write_output
	movl	$0, -24(%rbp)
	jmp	.L44
.L45:
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	movl	-24(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rcx
	call	free
	addl	$1, -24(%rbp)
.L44:
	movl	-68(%rbp), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L45
	movl	$0, %eax
.L46:
	addq	$120, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.ident	"GCC: (MinGW-W64 x86_64-msvcrt-posix-seh, built by Brecht Sanders) 13.1.0"
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
