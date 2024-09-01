	.file	1 "mips.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=32
	.module	nooddspreg
	.module	arch=r2000
	.abicalls
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"w\000"
	.align	2
$LC1:
	.ascii	"File not found\000"
	.align	2
$LC2:
	.ascii	"%d\012\000"
	.align	2
$LC3:
	.ascii	"%lf \000"
	.text
	.align	2
	.globl	write_output
	.set	nomips16
	.set	nomicromips
	.ent	write_output
	.type	write_output, @function
write_output:
	.frame	$sp,56,$31		# vars= 0, regs= 8/0, args= 16, gp= 8
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$21,44($sp)
	move	$21,$5
	lw	$5,%got($LC0)($28)
	lw	$25,%call16(fopen64)($28)
	.cprestore	16
	sw	$18,32($sp)
	sw	$31,52($sp)
	sw	$22,48($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	addiu	$5,$5,%lo($LC0)
	.reloc	1f,R_MIPS_JALR,fopen64
1:	jalr	$25
	move	$18,$6

	lw	$28,16($sp)
	beq	$2,$0,$L10
	move	$6,$18

	lw	$5,%got($LC2)($28)
	lw	$25,%call16(fprintf)($28)
	addiu	$5,$5,%lo($LC2)
	move	$4,$2
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	move	$17,$2

	lw	$28,16($sp)
	blez	$18,$L3
	move	$20,$0

	lw	$19,%got($LC3)($28)
	nop
	addiu	$19,$19,%lo($LC3)
$L4:
	move	$16,$0
$L5:
	lw	$3,0($21)
	sll	$7,$16,3
	addu	$3,$3,$7
	lw	$25,%call16(fprintf)($28)
	lw	$7,4($3)
	lw	$6,0($3)
	move	$5,$19
	move	$4,$17
	move	$22,$16
	.reloc	1f,R_MIPS_JALR,fprintf
1:	jalr	$25
	addiu	$16,$16,1

	lw	$28,16($sp)
	bne	$18,$16,$L5
	move	$5,$17

	lw	$25,%call16(fputc)($28)
	nop
	.reloc	1f,R_MIPS_JALR,fputc
1:	jalr	$25
	li	$4,10			# 0xa

	addiu	$21,$21,4
	lw	$28,16($sp)
	beq	$20,$22,$L3
	addiu	$2,$20,1

	b	$L4
	move	$20,$2

$L3:
	lw	$25,%call16(fclose)($28)
	move	$4,$17
$L8:
	lw	$31,52($sp)
	lw	$22,48($sp)
	lw	$21,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	jr	$25
	addiu	$sp,$sp,56

$L10:
	lw	$4,%got($LC1)($28)
	lw	$25,%call16(puts)($28)
	b	$L8
	addiu	$4,$4,%lo($LC1)

	.set	macro
	.set	reorder
	.end	write_output
	.size	write_output, .-write_output
	.align	2
	.globl	inverse_gauss_jordan
	.set	nomips16
	.set	nomicromips
	.ent	inverse_gauss_jordan
	.type	inverse_gauss_jordan, @function
inverse_gauss_jordan:
	.frame	$sp,48,$31		# vars= 0, regs= 6/0, args= 16, gp= 8
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-48
	.cprestore	16
	sw	$18,32($sp)
	sw	$31,44($sp)
	sw	$20,40($sp)
	sw	$19,36($sp)
	sw	$17,28($sp)
	sw	$16,24($sp)
	blez	$5,$L12
	sll	$18,$5,2

	move	$19,$5
	move	$16,$4
	sll	$9,$5,4
	move	$10,$4
	move	$7,$0
$L19:
	lw	$5,0($10)
	sll	$8,$7,3
	addu	$2,$5,$8
	lwc1	$f2,4($2)
	addu	$3,$5,$9
	lwc1	$f3,0($2)
	move	$2,$5
$L13:
	lwc1	$f0,4($2)
	addiu	$2,$2,8
	lwc1	$f1,-8($2)
	nop
	div.d	$f0,$f0,$f2
	swc1	$f0,-4($2)
	bne	$3,$2,$L13
	swc1	$f1,-8($2)

	move	$12,$4
	move	$11,$0
$L15:
	beq	$7,$11,$L32
	addiu	$2,$11,1

	lw	$2,0($12)
	move	$3,$5
	addu	$6,$2,$8
	lwc1	$f4,4($6)
	nop
	lwc1	$f5,0($6)
	addu	$6,$2,$9
$L17:
	lwc1	$f2,4($3)
	lwc1	$f0,4($2)
	lwc1	$f3,0($3)
	lwc1	$f1,0($2)
	mul.d	$f2,$f4,$f2
	addiu	$2,$2,8
	addiu	$3,$3,8
	sub.d	$f0,$f0,$f2
	swc1	$f0,-4($2)
	bne	$6,$2,$L17
	swc1	$f1,-8($2)

	addiu	$2,$11,1
$L32:
	beq	$19,$2,$L30
	addiu	$12,$12,4

	b	$L15
	move	$11,$2

$L30:
	addiu	$2,$7,1
	beq	$7,$11,$L31
	addiu	$10,$10,4

	b	$L19
	move	$7,$2

$L31:
	lw	$25,%call16(malloc)($28)
	nop
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	move	$20,$2
	sll	$19,$19,3
	move	$17,$2
	addu	$18,$2,$18
$L21:
	lw	$25,%call16(malloc)($28)
	nop
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	move	$4,$19

	lw	$28,16($sp)
	lw	$5,0($16)
	lw	$25,%call16(memcpy)($28)
	sw	$2,0($17)
	move	$4,$2
	move	$6,$19
	addu	$5,$5,$19
	.reloc	1f,R_MIPS_JALR,memcpy
1:	jalr	$25
	addiu	$17,$17,4

	lw	$28,16($sp)
	bne	$18,$17,$L21
	addiu	$16,$16,4

	lw	$31,44($sp)
	lw	$19,36($sp)
	lw	$18,32($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	move	$2,$20
	lw	$20,40($sp)
	jr	$31
	addiu	$sp,$sp,48

$L12:
	lw	$31,44($sp)
	lw	$20,40($sp)
	lw	$19,36($sp)
	lw	$17,28($sp)
	lw	$16,24($sp)
	move	$4,$18
	lw	$25,%call16(malloc)($28)
	lw	$18,32($sp)
	.reloc	1f,R_MIPS_JALR,malloc
1:	jr	$25
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
	.end	inverse_gauss_jordan
	.size	inverse_gauss_jordan, .-inverse_gauss_jordan
	.section	.rodata.str1.4
	.align	2
$LC4:
	.ascii	"r\000"
	.align	2
$LC5:
	.ascii	"../input.txt\000"
	.align	2
$LC6:
	.ascii	"%d\000"
	.align	2
$LC7:
	.ascii	"%lf\000"
	.align	2
$LC9:
	.ascii	"../output/mips.txt\000"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,80,$31		# vars= 8, regs= 10/2, args= 16, gp= 8
	.mask	0xc0ff0000,-12
	.fmask	0x00300000,-8
	.set	noreorder
	.cpload	$25
	.set	nomacro
	lw	$5,%got($LC4)($28)
	lw	$4,%got($LC5)($28)
	addiu	$sp,$sp,-80
	lw	$25,%call16(fopen64)($28)
	addiu	$5,$5,%lo($LC4)
	.cprestore	16
	sw	$31,68($sp)
	sw	$fp,64($sp)
	sw	$23,60($sp)
	sw	$22,56($sp)
	sw	$21,52($sp)
	sw	$20,48($sp)
	sw	$19,44($sp)
	sw	$18,40($sp)
	sw	$17,36($sp)
	sw	$16,32($sp)
	swc1	$f20,76($sp)
	swc1	$f21,72($sp)
	.reloc	1f,R_MIPS_JALR,fopen64
1:	jalr	$25
	addiu	$4,$4,%lo($LC5)

	lw	$28,16($sp)
	beq	$2,$0,$L54
	addiu	$6,$sp,24

	lw	$5,%got($LC6)($28)
	lw	$25,%call16(__isoc99_fscanf)($28)
	addiu	$5,$5,%lo($LC6)
	move	$4,$2
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	move	$18,$2

	lw	$28,16($sp)
	lw	$fp,24($sp)
	lw	$25,%call16(malloc)($28)
	nop
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	sll	$4,$fp,2

	lw	$28,16($sp)
	blez	$fp,$L44
	move	$20,$2

	lw	$2,%got($LC8)($28)
	lw	$19,%got($LC7)($28)
	lwc1	$f20,%lo($LC8+4)($2)
	move	$22,$20
	lwc1	$f21,%lo($LC8)($2)
	move	$21,$0
	addiu	$19,$19,%lo($LC7)
$L45:
	lw	$25,%call16(malloc)($28)
	nop
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	sll	$4,$fp,4

	move	$16,$2
	lw	$28,16($sp)
	move	$23,$2
	sw	$2,0($22)
	move	$17,$0
$L39:
	lw	$25,%call16(__isoc99_fscanf)($28)
	move	$6,$23
	move	$5,$19
	.reloc	1f,R_MIPS_JALR,__isoc99_fscanf
1:	jalr	$25
	move	$4,$18

	lw	$fp,24($sp)
	addiu	$17,$17,1
	slt	$2,$17,$fp
	lw	$28,16($sp)
	bne	$2,$0,$L39
	addiu	$23,$23,8

	sll	$6,$fp,1
	slt	$2,$fp,$6
	beq	$2,$0,$L40
	sll	$2,$fp,3

	addu	$4,$fp,$21
	addu	$2,$16,$2
	move	$3,$fp
$L43:
	beq	$4,$3,$L55
	addiu	$3,$3,1

	slt	$5,$3,$6
	sw	$0,4($2)
	sw	$0,0($2)
	bne	$5,$0,$L43
	addiu	$2,$2,8

$L40:
	addiu	$21,$21,1
	slt	$2,$21,$fp
	beq	$2,$0,$L44
	nop

$L56:
	b	$L45
	addiu	$22,$22,4

$L55:
	addiu	$3,$4,1
	slt	$5,$3,$6
	swc1	$f20,4($2)
	swc1	$f21,0($2)
	bne	$5,$0,$L43
	addiu	$2,$2,8

	addiu	$21,$21,1
	slt	$2,$21,$fp
	bne	$2,$0,$L56
	nop

$L44:
	lw	$25,%call16(fclose)($28)
	nop
	.reloc	1f,R_MIPS_JALR,fclose
1:	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	lw	$17,24($sp)
	lw	$25,%call16(malloc)($28)
	sll	$18,$17,2
	.reloc	1f,R_MIPS_JALR,malloc
1:	jalr	$25
	move	$4,$18

	lw	$28,16($sp)
	blez	$17,$L38
	nop

	move	$16,$2
	sll	$19,$17,3
	addu	$18,$2,$18
$L48:
	lw	$25,%call16(calloc)($28)
	li	$5,1			# 0x1
	.reloc	1f,R_MIPS_JALR,calloc
1:	jalr	$25
	move	$4,$19

	addiu	$16,$16,4
	lw	$28,16($sp)
	bne	$16,$18,$L48
	sw	$2,-4($16)

$L38:
	lw	$25,%got(inverse_gauss_jordan)($28)
	move	$5,$17
	.reloc	1f,R_MIPS_JALR,inverse_gauss_jordan
1:	jalr	$25
	move	$4,$20

	lw	$28,16($sp)
	move	$6,$17
	lw	$4,%got($LC9)($28)
	lw	$25,%got(write_output)($28)
	move	$5,$2
	addiu	$4,$4,%lo($LC9)
	.reloc	1f,R_MIPS_JALR,write_output
1:	jalr	$25
	move	$16,$2

	lw	$2,24($sp)
	lw	$28,16($sp)
	blez	$2,$L35
	move	$17,$0

$L49:
	lw	$25,%call16(free)($28)
	lw	$4,0($20)
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	addiu	$17,$17,1

	lw	$28,16($sp)
	lw	$4,0($16)
	lw	$25,%call16(free)($28)
	nop
	.reloc	1f,R_MIPS_JALR,free
1:	jalr	$25
	addiu	$20,$20,4

	lw	$3,24($sp)
	lw	$28,16($sp)
	slt	$3,$17,$3
	bne	$3,$0,$L49
	addiu	$16,$16,4

$L35:
	lwc1	$f20,76($sp)
	lw	$31,68($sp)
	lw	$fp,64($sp)
	lw	$23,60($sp)
	lw	$22,56($sp)
	lw	$21,52($sp)
	lw	$20,48($sp)
	lw	$19,44($sp)
	lw	$18,40($sp)
	lw	$17,36($sp)
	lw	$16,32($sp)
	lwc1	$f21,72($sp)
	move	$2,$0
	jr	$31
	addiu	$sp,$sp,80

$L54:
	lw	$4,%got($LC1)($28)
	lw	$25,%call16(puts)($28)
	nop
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	addiu	$4,$4,%lo($LC1)

	b	$L35
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
$LC8:
	.word	1072693248
	.word	0
	.ident	"GCC: (Debian 14.2.0-1) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
