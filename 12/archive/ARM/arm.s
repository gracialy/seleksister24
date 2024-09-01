	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"arm.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"w\000"
	.align	2
.LC1:
	.ascii	"File not found\000"
	.align	2
.LC2:
	.ascii	"%d\012\000"
	.align	2
.LC3:
	.ascii	"%lf \000"
	.text
	.align	2
	.global	write_output
	.syntax unified
	.arm
	.type	write_output, %function
write_output:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r1, .L8
	ldr	r0, [fp, #-24]
	bl	fopen
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L2
	ldr	r0, .L8+4
	bl	puts
	b	.L1
.L2:
	ldr	r2, [fp, #-32]
	ldr	r1, .L8+8
	ldr	r0, [fp, #-16]
	bl	fprintf
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L7:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	ldr	r1, .L8+12
	ldr	r0, [fp, #-16]
	bl	fprintf
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L5:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L6
	ldr	r1, [fp, #-16]
	mov	r0, #10
	bl	fputc
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L7
	ldr	r0, [fp, #-16]
	bl	fclose
.L1:
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	write_output, .-write_output
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.global	__aeabi_dsub
	.align	2
	.global	inverse_gauss_jordan
	.syntax unified
	.arm
	.type	inverse_gauss_jordan, %function
inverse_gauss_jordan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #60
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L11
.L19:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L12
.L13:
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r4, r2, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L12:
	ldr	r3, [fp, #-76]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	blt	.L13
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L14
.L18:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L15
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L16
.L17:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r4-r5}
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r6, r2, r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	stm	r6, {r2-r3}
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L16:
	ldr	r3, [fp, #-76]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L17
.L15:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L14:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	blt	.L18
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L11:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	blt	.L19
	ldr	r3, [fp, #-76]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L20
.L23:
	ldr	r3, [fp, #-76]
	lsl	r1, r3, #3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-48]
	add	r4, r2, r3
	mov	r0, r1
	bl	malloc
	mov	r3, r0
	str	r3, [r4]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L21
.L22:
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r1, [fp, #-76]
	ldr	r3, [fp, #-44]
	add	r3, r1, r3
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-48]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-44]
	lsl	r2, r2, #3
	add	r1, r1, r2
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L21:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	blt	.L22
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L20:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	blt	.L23
	ldr	r3, [fp, #-48]
	mov	r0, r3
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, lr}
	bx	lr
	.size	inverse_gauss_jordan, .-inverse_gauss_jordan
	.section	.rodata
	.align	2
.LC4:
	.ascii	"../input.txt\000"
	.align	2
.LC5:
	.ascii	"../output/arm.txt\000"
	.align	2
.LC6:
	.ascii	"r\000"
	.align	2
.LC7:
	.ascii	"%d\000"
	.align	2
.LC8:
	.ascii	"%lf\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #52
	ldr	r3, .L43
	str	r3, [fp, #-40]
	ldr	r3, .L43+4
	str	r3, [fp, #-44]
	ldr	r1, .L43+8
	ldr	r0, [fp, #-40]
	bl	fopen
	str	r0, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L26
	ldr	r0, .L43+12
	bl	puts
	mov	r3, #0
	b	.L42
.L26:
	sub	r3, fp, #60
	mov	r2, r3
	ldr	r1, .L43+16
	ldr	r0, [fp, #-48]
	bl	fscanf
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L28
.L35:
	ldr	r3, [fp, #-60]
	lsl	r1, r3, #4
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r4, r2, r3
	mov	r0, r1
	bl	malloc
	mov	r3, r0
	str	r3, [r4]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L29
.L30:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	add	r3, r2, r3
	mov	r2, r3
	ldr	r1, .L43+20
	ldr	r0, [fp, #-48]
	bl	fscanf
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L29:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	blt	.L30
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-24]
	b	.L31
.L34:
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bne	.L32
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	ldr	r3, .L43+24
	stm	r1, {r2-r3}
	b	.L33
.L32:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	mov	r3, #0
	stm	r1, {r2-r3}
.L33:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L31:
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	blt	.L34
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L28:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L35
	ldr	r0, [fp, #-48]
	bl	fclose
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	malloc
	mov	r3, r0
	str	r3, [fp, #-56]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L36
.L39:
	ldr	r3, [fp, #-60]
	lsl	r1, r3, #3
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r4, r2, r3
	mov	r0, r1
	bl	malloc
	mov	r3, r0
	str	r3, [r4]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L37
.L38:
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #3
	add	r1, r2, r3
	mov	r2, #0
	mov	r3, #0
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L37:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	blt	.L38
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L36:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	blt	.L39
	ldr	r3, [fp, #-60]
	mov	r1, r3
	ldr	r0, [fp, #-52]
	bl	inverse_gauss_jordan
	str	r0, [fp, #-56]
	ldr	r3, [fp, #-60]
	mov	r2, r3
	ldr	r1, [fp, #-56]
	ldr	r0, [fp, #-44]
	bl	write_output
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L40
.L41:
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	free
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L40:
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	blt	.L41
	mov	r3, #0
.L42:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC1
	.word	.LC7
	.word	.LC8
	.word	1072693248
	.size	main, .-main
	.ident	"GCC: (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614"
