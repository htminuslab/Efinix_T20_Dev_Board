
build/uartEchoDemo.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:
f9000000:	00006197          	auipc	gp,0x6
f9000004:	c3818193          	addi	gp,gp,-968 # f9005c38 <__global_pointer$>
f9000008:	8201ac23          	sw	zero,-1992(gp) # f9005470 <smp_lottery_lock>

f900000c <smp_tyranny>:
f900000c:	f1402573          	csrr	a0,mhartid
f9000010:	02050e63          	beqz	a0,f900004c <init>

f9000014 <smp_slave>:
f9000014:	8381a503          	lw	a0,-1992(gp) # f9005470 <smp_lottery_lock>
f9000018:	fe050ee3          	beqz	a0,f9000014 <smp_slave>
f900001c:	0220000f          	fence	r,r
f9000020:	0000100f          	fence.i
f9000024:	8341a783          	lw	a5,-1996(gp) # f900546c <__bss_start>
f9000028:	00000513          	li	a0,0
f900002c:	00000593          	li	a1,0
f9000030:	00000613          	li	a2,0
f9000034:	00078067          	jr	a5

f9000038 <smp_unlock>:
f9000038:	82a1aa23          	sw	a0,-1996(gp) # f900546c <__bss_start>
f900003c:	0110000f          	fence	w,w
f9000040:	00100513          	li	a0,1
f9000044:	82a1ac23          	sw	a0,-1992(gp) # f9005470 <smp_lottery_lock>
f9000048:	00008067          	ret

f900004c <init>:
f900004c:	00007117          	auipc	sp,0x7
f9000050:	43410113          	addi	sp,sp,1076 # f9007480 <__freertos_irq_stack_top>
f9000054:	00005517          	auipc	a0,0x5
f9000058:	c5850513          	addi	a0,a0,-936 # f9004cac <_data>
f900005c:	00005597          	auipc	a1,0x5
f9000060:	c5058593          	addi	a1,a1,-944 # f9004cac <_data>
f9000064:	83418613          	addi	a2,gp,-1996 # f900546c <__bss_start>
f9000068:	00c5fc63          	bgeu	a1,a2,f9000080 <init+0x34>
f900006c:	00052283          	lw	t0,0(a0)
f9000070:	0055a023          	sw	t0,0(a1)
f9000074:	00450513          	addi	a0,a0,4
f9000078:	00458593          	addi	a1,a1,4
f900007c:	fec5e8e3          	bltu	a1,a2,f900006c <init+0x20>
f9000080:	83418513          	addi	a0,gp,-1996 # f900546c <__bss_start>
f9000084:	84018593          	addi	a1,gp,-1984 # f9005478 <_end>
f9000088:	00b57863          	bgeu	a0,a1,f9000098 <init+0x4c>
f900008c:	00052023          	sw	zero,0(a0)
f9000090:	00450513          	addi	a0,a0,4
f9000094:	feb56ce3          	bltu	a0,a1,f900008c <init+0x40>
f9000098:	0c0000ef          	jal	ra,f9000158 <__libc_init_array>
f900009c:	27c000ef          	jal	ra,f9000318 <main>

f90000a0 <mainDone>:
f90000a0:	0000006f          	j	f90000a0 <mainDone>

f90000a4 <_init>:
f90000a4:	00008067          	ret

Disassembly of section .text:

f90000a8 <strcpy>:
f90000a8:	00b567b3          	or	a5,a0,a1
f90000ac:	0037f793          	andi	a5,a5,3
f90000b0:	08079263          	bnez	a5,f9000134 <strcpy+0x8c>
f90000b4:	0005a703          	lw	a4,0(a1)
f90000b8:	7f7f86b7          	lui	a3,0x7f7f8
f90000bc:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__stack_size+0x7f7f5f7f>
f90000c0:	00d777b3          	and	a5,a4,a3
f90000c4:	00d787b3          	add	a5,a5,a3
f90000c8:	00e7e7b3          	or	a5,a5,a4
f90000cc:	00d7e7b3          	or	a5,a5,a3
f90000d0:	fff00613          	li	a2,-1
f90000d4:	06c79e63          	bne	a5,a2,f9000150 <strcpy+0xa8>
f90000d8:	00050613          	mv	a2,a0
f90000dc:	fff00813          	li	a6,-1
f90000e0:	00460613          	addi	a2,a2,4
f90000e4:	00458593          	addi	a1,a1,4
f90000e8:	fee62e23          	sw	a4,-4(a2)
f90000ec:	0005a703          	lw	a4,0(a1)
f90000f0:	00d777b3          	and	a5,a4,a3
f90000f4:	00d787b3          	add	a5,a5,a3
f90000f8:	00e7e7b3          	or	a5,a5,a4
f90000fc:	00d7e7b3          	or	a5,a5,a3
f9000100:	ff0780e3          	beq	a5,a6,f90000e0 <strcpy+0x38>
f9000104:	0005c783          	lbu	a5,0(a1)
f9000108:	0015c703          	lbu	a4,1(a1)
f900010c:	0025c683          	lbu	a3,2(a1)
f9000110:	00f60023          	sb	a5,0(a2)
f9000114:	00078a63          	beqz	a5,f9000128 <strcpy+0x80>
f9000118:	00e600a3          	sb	a4,1(a2)
f900011c:	00070663          	beqz	a4,f9000128 <strcpy+0x80>
f9000120:	00d60123          	sb	a3,2(a2)
f9000124:	00069463          	bnez	a3,f900012c <strcpy+0x84>
f9000128:	00008067          	ret
f900012c:	000601a3          	sb	zero,3(a2)
f9000130:	00008067          	ret
f9000134:	00050793          	mv	a5,a0
f9000138:	0005c703          	lbu	a4,0(a1)
f900013c:	00178793          	addi	a5,a5,1
f9000140:	00158593          	addi	a1,a1,1
f9000144:	fee78fa3          	sb	a4,-1(a5)
f9000148:	fe0718e3          	bnez	a4,f9000138 <strcpy+0x90>
f900014c:	00008067          	ret
f9000150:	00050613          	mv	a2,a0
f9000154:	fb1ff06f          	j	f9000104 <strcpy+0x5c>

f9000158 <__libc_init_array>:
f9000158:	ff010113          	addi	sp,sp,-16
f900015c:	00812423          	sw	s0,8(sp)
f9000160:	01212023          	sw	s2,0(sp)
f9000164:	00005417          	auipc	s0,0x5
f9000168:	b4840413          	addi	s0,s0,-1208 # f9004cac <_data>
f900016c:	00005917          	auipc	s2,0x5
f9000170:	b4090913          	addi	s2,s2,-1216 # f9004cac <_data>
f9000174:	40890933          	sub	s2,s2,s0
f9000178:	00112623          	sw	ra,12(sp)
f900017c:	00912223          	sw	s1,4(sp)
f9000180:	40295913          	srai	s2,s2,0x2
f9000184:	00090e63          	beqz	s2,f90001a0 <__libc_init_array+0x48>
f9000188:	00000493          	li	s1,0
f900018c:	00042783          	lw	a5,0(s0)
f9000190:	00148493          	addi	s1,s1,1
f9000194:	00440413          	addi	s0,s0,4
f9000198:	000780e7          	jalr	a5
f900019c:	fe9918e3          	bne	s2,s1,f900018c <__libc_init_array+0x34>
f90001a0:	00005417          	auipc	s0,0x5
f90001a4:	b0c40413          	addi	s0,s0,-1268 # f9004cac <_data>
f90001a8:	00005917          	auipc	s2,0x5
f90001ac:	b0490913          	addi	s2,s2,-1276 # f9004cac <_data>
f90001b0:	40890933          	sub	s2,s2,s0
f90001b4:	40295913          	srai	s2,s2,0x2
f90001b8:	00090e63          	beqz	s2,f90001d4 <__libc_init_array+0x7c>
f90001bc:	00000493          	li	s1,0
f90001c0:	00042783          	lw	a5,0(s0)
f90001c4:	00148493          	addi	s1,s1,1
f90001c8:	00440413          	addi	s0,s0,4
f90001cc:	000780e7          	jalr	a5
f90001d0:	fe9918e3          	bne	s2,s1,f90001c0 <__libc_init_array+0x68>
f90001d4:	00c12083          	lw	ra,12(sp)
f90001d8:	00812403          	lw	s0,8(sp)
f90001dc:	00412483          	lw	s1,4(sp)
f90001e0:	00012903          	lw	s2,0(sp)
f90001e4:	01010113          	addi	sp,sp,16
f90001e8:	00008067          	ret

f90001ec <strcat>:
f90001ec:	ff010113          	addi	sp,sp,-16
f90001f0:	00812423          	sw	s0,8(sp)
f90001f4:	00112623          	sw	ra,12(sp)
f90001f8:	00357793          	andi	a5,a0,3
f90001fc:	00050413          	mv	s0,a0
f9000200:	06079663          	bnez	a5,f900026c <strcat+0x80>
f9000204:	00052703          	lw	a4,0(a0)
f9000208:	feff0637          	lui	a2,0xfeff0
f900020c:	eff60613          	addi	a2,a2,-257 # fefefeff <__freertos_irq_stack_top+0x5fe8a7f>
f9000210:	00c707b3          	add	a5,a4,a2
f9000214:	808086b7          	lui	a3,0x80808
f9000218:	fff74713          	not	a4,a4
f900021c:	08068693          	addi	a3,a3,128 # 80808080 <__freertos_irq_stack_top+0x87800c00>
f9000220:	00e7f7b3          	and	a5,a5,a4
f9000224:	00d7f7b3          	and	a5,a5,a3
f9000228:	04079263          	bnez	a5,f900026c <strcat+0x80>
f900022c:	00450513          	addi	a0,a0,4
f9000230:	00052703          	lw	a4,0(a0)
f9000234:	00c707b3          	add	a5,a4,a2
f9000238:	fff74713          	not	a4,a4
f900023c:	00e7f7b3          	and	a5,a5,a4
f9000240:	00d7f7b3          	and	a5,a5,a3
f9000244:	02079463          	bnez	a5,f900026c <strcat+0x80>
f9000248:	00450513          	addi	a0,a0,4
f900024c:	00052703          	lw	a4,0(a0)
f9000250:	00c707b3          	add	a5,a4,a2
f9000254:	fff74713          	not	a4,a4
f9000258:	00e7f7b3          	and	a5,a5,a4
f900025c:	00d7f7b3          	and	a5,a5,a3
f9000260:	fc0786e3          	beqz	a5,f900022c <strcat+0x40>
f9000264:	0080006f          	j	f900026c <strcat+0x80>
f9000268:	00150513          	addi	a0,a0,1
f900026c:	00054783          	lbu	a5,0(a0)
f9000270:	fe079ce3          	bnez	a5,f9000268 <strcat+0x7c>
f9000274:	e35ff0ef          	jal	ra,f90000a8 <strcpy>
f9000278:	00040513          	mv	a0,s0
f900027c:	00c12083          	lw	ra,12(sp)
f9000280:	00812403          	lw	s0,8(sp)
f9000284:	01010113          	addi	sp,sp,16
f9000288:	00008067          	ret

f900028c <strlen>:
f900028c:	00357793          	andi	a5,a0,3
f9000290:	00050713          	mv	a4,a0
f9000294:	04079c63          	bnez	a5,f90002ec <strlen+0x60>
f9000298:	7f7f86b7          	lui	a3,0x7f7f8
f900029c:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__stack_size+0x7f7f5f7f>
f90002a0:	fff00593          	li	a1,-1
f90002a4:	00470713          	addi	a4,a4,4
f90002a8:	ffc72603          	lw	a2,-4(a4)
f90002ac:	00d677b3          	and	a5,a2,a3
f90002b0:	00d787b3          	add	a5,a5,a3
f90002b4:	00c7e7b3          	or	a5,a5,a2
f90002b8:	00d7e7b3          	or	a5,a5,a3
f90002bc:	feb784e3          	beq	a5,a1,f90002a4 <strlen+0x18>
f90002c0:	ffc74683          	lbu	a3,-4(a4)
f90002c4:	40a707b3          	sub	a5,a4,a0
f90002c8:	ffd74603          	lbu	a2,-3(a4)
f90002cc:	ffe74503          	lbu	a0,-2(a4)
f90002d0:	04068063          	beqz	a3,f9000310 <strlen+0x84>
f90002d4:	02060a63          	beqz	a2,f9000308 <strlen+0x7c>
f90002d8:	00a03533          	snez	a0,a0
f90002dc:	00f50533          	add	a0,a0,a5
f90002e0:	ffe50513          	addi	a0,a0,-2
f90002e4:	00008067          	ret
f90002e8:	fa0688e3          	beqz	a3,f9000298 <strlen+0xc>
f90002ec:	00074783          	lbu	a5,0(a4)
f90002f0:	00170713          	addi	a4,a4,1
f90002f4:	00377693          	andi	a3,a4,3
f90002f8:	fe0798e3          	bnez	a5,f90002e8 <strlen+0x5c>
f90002fc:	40a70733          	sub	a4,a4,a0
f9000300:	fff70513          	addi	a0,a4,-1
f9000304:	00008067          	ret
f9000308:	ffd78513          	addi	a0,a5,-3
f900030c:	00008067          	ret
f9000310:	ffc78513          	addi	a0,a5,-4
f9000314:	00008067          	ret

f9000318 <main>:
f9000318:	ff010113          	addi	sp,sp,-16
f900031c:	00112623          	sw	ra,12(sp)
f9000320:	00812423          	sw	s0,8(sp)
f9000324:	00912223          	sw	s1,4(sp)
f9000328:	f80107b7          	lui	a5,0xf8010
f900032c:	06b00713          	li	a4,107
f9000330:	00e7a423          	sw	a4,8(a5) # f8010008 <__freertos_irq_stack_top+0xff008b88>
f9000334:	f9005537          	lui	a0,0xf9005
f9000338:	00700713          	li	a4,7
f900033c:	00e7a623          	sw	a4,12(a5)
f9000340:	cd850513          	addi	a0,a0,-808 # f9004cd8 <__freertos_irq_stack_top+0xffffd858>
f9000344:	150000ef          	jal	ra,f9000494 <bsp_printf>
f9000348:	f9005537          	lui	a0,0xf9005
f900034c:	cfc50513          	addi	a0,a0,-772 # f9004cfc <__freertos_irq_stack_top+0xffffd87c>
f9000350:	144000ef          	jal	ra,f9000494 <bsp_printf>
f9000354:	f8010437          	lui	s0,0xf8010
f9000358:	f90054b7          	lui	s1,0xf9005
f900035c:	00442783          	lw	a5,4(s0) # f8010004 <__freertos_irq_stack_top+0xff008b84>
f9000360:	0187d793          	srli	a5,a5,0x18
f9000364:	fe078ce3          	beqz	a5,f900035c <main+0x44>
f9000368:	00442783          	lw	a5,4(s0)
f900036c:	0187d793          	srli	a5,a5,0x18
f9000370:	fe078ce3          	beqz	a5,f9000368 <main+0x50>
f9000374:	00042583          	lw	a1,0(s0)
f9000378:	d3048513          	addi	a0,s1,-720 # f9004d30 <__freertos_irq_stack_top+0xffffd8b0>
f900037c:	0ff5f593          	andi	a1,a1,255
f9000380:	114000ef          	jal	ra,f9000494 <bsp_printf>
f9000384:	fd9ff06f          	j	f900035c <main+0x44>

f9000388 <itos>:
f9000388:	fe010113          	addi	sp,sp,-32
f900038c:	41f55793          	srai	a5,a0,0x1f
f9000390:	00912a23          	sw	s1,20(sp)
f9000394:	00a7c4b3          	xor	s1,a5,a0
f9000398:	01212823          	sw	s2,16(sp)
f900039c:	01312623          	sw	s3,12(sp)
f90003a0:	01412423          	sw	s4,8(sp)
f90003a4:	01612023          	sw	s6,0(sp)
f90003a8:	00112e23          	sw	ra,28(sp)
f90003ac:	00812c23          	sw	s0,24(sp)
f90003b0:	01512223          	sw	s5,4(sp)
f90003b4:	00050a13          	mv	s4,a0
f90003b8:	00058913          	mv	s2,a1
f90003bc:	40f484b3          	sub	s1,s1,a5
f90003c0:	00000993          	li	s3,0
f90003c4:	00900b13          	li	s6,9
f90003c8:	00a00593          	li	a1,10
f90003cc:	00048513          	mv	a0,s1
f90003d0:	3f5010ef          	jal	ra,f9001fc4 <__modsi3>
f90003d4:	00198413          	addi	s0,s3,1
f90003d8:	03050513          	addi	a0,a0,48
f90003dc:	00890ab3          	add	s5,s2,s0
f90003e0:	feaa8fa3          	sb	a0,-1(s5)
f90003e4:	00a00593          	li	a1,10
f90003e8:	00048513          	mv	a0,s1
f90003ec:	355010ef          	jal	ra,f9001f40 <__divsi3>
f90003f0:	049b4c63          	blt	s6,s1,f9000448 <itos+0xc0>
f90003f4:	000a5863          	bgez	s4,f9000404 <itos+0x7c>
f90003f8:	02d00793          	li	a5,45
f90003fc:	00298413          	addi	s0,s3,2
f9000400:	00fa8023          	sb	a5,0(s5)
f9000404:	00890433          	add	s0,s2,s0
f9000408:	00040023          	sb	zero,0(s0)
f900040c:	00090513          	mv	a0,s2
f9000410:	e7dff0ef          	jal	ra,f900028c <strlen>
f9000414:	fff50513          	addi	a0,a0,-1
f9000418:	00000793          	li	a5,0
f900041c:	02a7cc63          	blt	a5,a0,f9000454 <itos+0xcc>
f9000420:	01c12083          	lw	ra,28(sp)
f9000424:	01812403          	lw	s0,24(sp)
f9000428:	01412483          	lw	s1,20(sp)
f900042c:	01012903          	lw	s2,16(sp)
f9000430:	00c12983          	lw	s3,12(sp)
f9000434:	00812a03          	lw	s4,8(sp)
f9000438:	00412a83          	lw	s5,4(sp)
f900043c:	00012b03          	lw	s6,0(sp)
f9000440:	02010113          	addi	sp,sp,32
f9000444:	00008067          	ret
f9000448:	00040993          	mv	s3,s0
f900044c:	00050493          	mv	s1,a0
f9000450:	f79ff06f          	j	f90003c8 <itos+0x40>
f9000454:	00a90733          	add	a4,s2,a0
f9000458:	00f906b3          	add	a3,s2,a5
f900045c:	00074583          	lbu	a1,0(a4)
f9000460:	0006c603          	lbu	a2,0(a3)
f9000464:	00178793          	addi	a5,a5,1
f9000468:	00b68023          	sb	a1,0(a3)
f900046c:	00c70023          	sb	a2,0(a4)
f9000470:	fff50513          	addi	a0,a0,-1
f9000474:	fa9ff06f          	j	f900041c <itos+0x94>

f9000478 <_putchar>:
f9000478:	f8010737          	lui	a4,0xf8010
f900047c:	00472783          	lw	a5,4(a4) # f8010004 <__freertos_irq_stack_top+0xff008b84>
f9000480:	0107d793          	srli	a5,a5,0x10
f9000484:	0ff7f793          	andi	a5,a5,255
f9000488:	fe078ae3          	beqz	a5,f900047c <_putchar+0x4>
f900048c:	00a72023          	sw	a0,0(a4)
f9000490:	00008067          	ret

f9000494 <bsp_printf>:
f9000494:	f7010113          	addi	sp,sp,-144
f9000498:	08f12223          	sw	a5,132(sp)
f900049c:	07410793          	addi	a5,sp,116
f90004a0:	00f12823          	sw	a5,16(sp)
f90004a4:	05a12223          	sw	s10,68(sp)
f90004a8:	05b12023          	sw	s11,64(sp)
f90004ac:	8181ad03          	lw	s10,-2024(gp) # f9005450 <_impure_ptr+0x4>
f90004b0:	81c1ad83          	lw	s11,-2020(gp) # f9005454 <_impure_ptr+0x8>
f90004b4:	09012423          	sw	a6,136(sp)
f90004b8:	8241a803          	lw	a6,-2012(gp) # f900545c <_impure_ptr+0x10>
f90004bc:	8201a783          	lw	a5,-2016(gp) # f9005458 <_impure_ptr+0xc>
f90004c0:	05412c23          	sw	s4,88(sp)
f90004c4:	05512a23          	sw	s5,84(sp)
f90004c8:	f9005a37          	lui	s4,0xf9005
f90004cc:	f9005ab7          	lui	s5,0xf9005
f90004d0:	06912223          	sw	s1,100(sp)
f90004d4:	05812623          	sw	s8,76(sp)
f90004d8:	06112623          	sw	ra,108(sp)
f90004dc:	06812423          	sw	s0,104(sp)
f90004e0:	07212023          	sw	s2,96(sp)
f90004e4:	05312e23          	sw	s3,92(sp)
f90004e8:	05612823          	sw	s6,80(sp)
f90004ec:	05912423          	sw	s9,72(sp)
f90004f0:	00050c13          	mv	s8,a0
f90004f4:	06b12a23          	sw	a1,116(sp)
f90004f8:	06c12c23          	sw	a2,120(sp)
f90004fc:	06d12e23          	sw	a3,124(sp)
f9000500:	08e12023          	sw	a4,128(sp)
f9000504:	09112623          	sw	a7,140(sp)
f9000508:	00000493          	li	s1,0
f900050c:	00f12023          	sw	a5,0(sp)
f9000510:	01012223          	sw	a6,4(sp)
f9000514:	cb0a0a13          	addi	s4,s4,-848 # f9004cb0 <__freertos_irq_stack_top+0xffffd830>
f9000518:	cc4a8a93          	addi	s5,s5,-828 # f9004cc4 <__freertos_irq_stack_top+0xffffd844>
f900051c:	009c07b3          	add	a5,s8,s1
f9000520:	0007c503          	lbu	a0,0(a5)
f9000524:	02051e63          	bnez	a0,f9000560 <bsp_printf+0xcc>
f9000528:	06c12083          	lw	ra,108(sp)
f900052c:	06812403          	lw	s0,104(sp)
f9000530:	06412483          	lw	s1,100(sp)
f9000534:	06012903          	lw	s2,96(sp)
f9000538:	05c12983          	lw	s3,92(sp)
f900053c:	05812a03          	lw	s4,88(sp)
f9000540:	05412a83          	lw	s5,84(sp)
f9000544:	05012b03          	lw	s6,80(sp)
f9000548:	04c12c03          	lw	s8,76(sp)
f900054c:	04812c83          	lw	s9,72(sp)
f9000550:	04412d03          	lw	s10,68(sp)
f9000554:	04012d83          	lw	s11,64(sp)
f9000558:	09010113          	addi	sp,sp,144
f900055c:	00008067          	ret
f9000560:	02500793          	li	a5,37
f9000564:	04f51063          	bne	a0,a5,f90005a4 <bsp_printf+0x110>
f9000568:	06300713          	li	a4,99
f900056c:	07300693          	li	a3,115
f9000570:	06400613          	li	a2,100
f9000574:	05800593          	li	a1,88
f9000578:	07800513          	li	a0,120
f900057c:	06600813          	li	a6,102
f9000580:	00148493          	addi	s1,s1,1
f9000584:	009c07b3          	add	a5,s8,s1
f9000588:	0007c783          	lbu	a5,0(a5)
f900058c:	02078e63          	beqz	a5,f90005c8 <bsp_printf+0x134>
f9000590:	00e79e63          	bne	a5,a4,f90005ac <bsp_printf+0x118>
f9000594:	01012783          	lw	a5,16(sp)
f9000598:	0007c503          	lbu	a0,0(a5)
f900059c:	00478713          	addi	a4,a5,4
f90005a0:	00e12823          	sw	a4,16(sp)
f90005a4:	ed5ff0ef          	jal	ra,f9000478 <_putchar>
f90005a8:	0200006f          	j	f90005c8 <bsp_printf+0x134>
f90005ac:	02d79863          	bne	a5,a3,f90005dc <bsp_printf+0x148>
f90005b0:	01012783          	lw	a5,16(sp)
f90005b4:	0007a403          	lw	s0,0(a5)
f90005b8:	00478713          	addi	a4,a5,4
f90005bc:	00e12823          	sw	a4,16(sp)
f90005c0:	00044503          	lbu	a0,0(s0)
f90005c4:	00051663          	bnez	a0,f90005d0 <bsp_printf+0x13c>
f90005c8:	00148493          	addi	s1,s1,1
f90005cc:	f51ff06f          	j	f900051c <bsp_printf+0x88>
f90005d0:	00140413          	addi	s0,s0,1
f90005d4:	ea5ff0ef          	jal	ra,f9000478 <_putchar>
f90005d8:	fe9ff06f          	j	f90005c0 <bsp_printf+0x12c>
f90005dc:	06c79a63          	bne	a5,a2,f9000650 <bsp_printf+0x1bc>
f90005e0:	01012783          	lw	a5,16(sp)
f90005e4:	0007a903          	lw	s2,0(a5)
f90005e8:	00478713          	addi	a4,a5,4
f90005ec:	00e12823          	sw	a4,16(sp)
f90005f0:	00095863          	bgez	s2,f9000600 <bsp_printf+0x16c>
f90005f4:	02d00513          	li	a0,45
f90005f8:	e81ff0ef          	jal	ra,f9000478 <_putchar>
f90005fc:	41200933          	neg	s2,s2
f9000600:	02010413          	addi	s0,sp,32
f9000604:	00040993          	mv	s3,s0
f9000608:	00091e63          	bnez	s2,f9000624 <bsp_printf+0x190>
f900060c:	01340c63          	beq	s0,s3,f9000624 <bsp_printf+0x190>
f9000610:	fff40413          	addi	s0,s0,-1
f9000614:	00044503          	lbu	a0,0(s0)
f9000618:	e61ff0ef          	jal	ra,f9000478 <_putchar>
f900061c:	ff341ae3          	bne	s0,s3,f9000610 <bsp_printf+0x17c>
f9000620:	fa9ff06f          	j	f90005c8 <bsp_printf+0x134>
f9000624:	00a00593          	li	a1,10
f9000628:	00090513          	mv	a0,s2
f900062c:	199010ef          	jal	ra,f9001fc4 <__modsi3>
f9000630:	03050513          	addi	a0,a0,48
f9000634:	00140413          	addi	s0,s0,1
f9000638:	fea40fa3          	sb	a0,-1(s0)
f900063c:	00a00593          	li	a1,10
f9000640:	00090513          	mv	a0,s2
f9000644:	0fd010ef          	jal	ra,f9001f40 <__divsi3>
f9000648:	00050913          	mv	s2,a0
f900064c:	fbdff06f          	j	f9000608 <bsp_printf+0x174>
f9000650:	02b79e63          	bne	a5,a1,f900068c <bsp_printf+0x1f8>
f9000654:	01012783          	lw	a5,16(sp)
f9000658:	01c00413          	li	s0,28
f900065c:	ffc00913          	li	s2,-4
f9000660:	0007a983          	lw	s3,0(a5)
f9000664:	00478713          	addi	a4,a5,4
f9000668:	00e12823          	sw	a4,16(sp)
f900066c:	0089d7b3          	srl	a5,s3,s0
f9000670:	00f7f793          	andi	a5,a5,15
f9000674:	00fa87b3          	add	a5,s5,a5
f9000678:	0007c503          	lbu	a0,0(a5)
f900067c:	ffc40413          	addi	s0,s0,-4
f9000680:	df9ff0ef          	jal	ra,f9000478 <_putchar>
f9000684:	ff2414e3          	bne	s0,s2,f900066c <bsp_printf+0x1d8>
f9000688:	f41ff06f          	j	f90005c8 <bsp_printf+0x134>
f900068c:	02a79e63          	bne	a5,a0,f90006c8 <bsp_printf+0x234>
f9000690:	01012783          	lw	a5,16(sp)
f9000694:	01c00413          	li	s0,28
f9000698:	ffc00913          	li	s2,-4
f900069c:	0007a983          	lw	s3,0(a5)
f90006a0:	00478713          	addi	a4,a5,4
f90006a4:	00e12823          	sw	a4,16(sp)
f90006a8:	0089d7b3          	srl	a5,s3,s0
f90006ac:	00f7f793          	andi	a5,a5,15
f90006b0:	00fa07b3          	add	a5,s4,a5
f90006b4:	0007c503          	lbu	a0,0(a5)
f90006b8:	ffc40413          	addi	s0,s0,-4
f90006bc:	dbdff0ef          	jal	ra,f9000478 <_putchar>
f90006c0:	ff2414e3          	bne	s0,s2,f90006a8 <bsp_printf+0x214>
f90006c4:	f05ff06f          	j	f90005c8 <bsp_printf+0x134>
f90006c8:	eb079ce3          	bne	a5,a6,f9000580 <bsp_printf+0xec>
f90006cc:	01012783          	lw	a5,16(sp)
f90006d0:	02010413          	addi	s0,sp,32
f90006d4:	01510b13          	addi	s6,sp,21
f90006d8:	00778793          	addi	a5,a5,7
f90006dc:	ff87f793          	andi	a5,a5,-8
f90006e0:	0007a903          	lw	s2,0(a5)
f90006e4:	0047a983          	lw	s3,4(a5)
f90006e8:	00878713          	addi	a4,a5,8
f90006ec:	00090513          	mv	a0,s2
f90006f0:	00098593          	mv	a1,s3
f90006f4:	00e12823          	sw	a4,16(sp)
f90006f8:	1f0010ef          	jal	ra,f90018e8 <__fixdfsi>
f90006fc:	00050c93          	mv	s9,a0
f9000700:	26c010ef          	jal	ra,f900196c <__floatsidf>
f9000704:	00050613          	mv	a2,a0
f9000708:	00058693          	mv	a3,a1
f900070c:	00090513          	mv	a0,s2
f9000710:	00098593          	mv	a1,s3
f9000714:	159000ef          	jal	ra,f900106c <__subdf3>
f9000718:	00058993          	mv	s3,a1
f900071c:	00050913          	mv	s2,a0
f9000720:	00040593          	mv	a1,s0
f9000724:	000c8513          	mv	a0,s9
f9000728:	c61ff0ef          	jal	ra,f9000388 <itos>
f900072c:	02e00793          	li	a5,46
f9000730:	00098593          	mv	a1,s3
f9000734:	00090513          	mv	a0,s2
f9000738:	00f10a23          	sb	a5,20(sp)
f900073c:	5ec010ef          	jal	ra,f9001d28 <__truncdfsf2>
f9000740:	4e8010ef          	jal	ra,f9001c28 <__extendsfdf2>
f9000744:	000d0613          	mv	a2,s10
f9000748:	000d8693          	mv	a3,s11
f900074c:	218000ef          	jal	ra,f9000964 <__muldf3>
f9000750:	5d8010ef          	jal	ra,f9001d28 <__truncdfsf2>
f9000754:	00000593          	li	a1,0
f9000758:	00050993          	mv	s3,a0
f900075c:	394010ef          	jal	ra,f9001af0 <__lesf2>
f9000760:	00055c63          	bgez	a0,f9000778 <bsp_printf+0x2e4>
f9000764:	02d00793          	li	a5,45
f9000768:	00f10aa3          	sb	a5,21(sp)
f900076c:	800007b7          	lui	a5,0x80000
f9000770:	0137c9b3          	xor	s3,a5,s3
f9000774:	01610b13          	addi	s6,sp,22
f9000778:	00400913          	li	s2,4
f900077c:	03000c93          	li	s9,48
f9000780:	fff90913          	addi	s2,s2,-1
f9000784:	00090513          	mv	a0,s2
f9000788:	1e4010ef          	jal	ra,f900196c <__floatsidf>
f900078c:	00050613          	mv	a2,a0
f9000790:	00058693          	mv	a3,a1
f9000794:	00012503          	lw	a0,0(sp)
f9000798:	00412583          	lw	a1,4(sp)
f900079c:	0ed010ef          	jal	ra,f9002088 <pow>
f90007a0:	00a12423          	sw	a0,8(sp)
f90007a4:	00098513          	mv	a0,s3
f90007a8:	00b12623          	sw	a1,12(sp)
f90007ac:	47c010ef          	jal	ra,f9001c28 <__extendsfdf2>
f90007b0:	00812603          	lw	a2,8(sp)
f90007b4:	00c12683          	lw	a3,12(sp)
f90007b8:	0ac000ef          	jal	ra,f9000864 <__ledf2>
f90007bc:	00055e63          	bgez	a0,f90007d8 <bsp_printf+0x344>
f90007c0:	00000593          	li	a1,0
f90007c4:	00098513          	mv	a0,s3
f90007c8:	264010ef          	jal	ra,f9001a2c <__gesf2>
f90007cc:	00a05663          	blez	a0,f90007d8 <bsp_printf+0x344>
f90007d0:	019b0023          	sb	s9,0(s6)
f90007d4:	001b0b13          	addi	s6,s6,1
f90007d8:	fa0914e3          	bnez	s2,f9000780 <bsp_printf+0x2ec>
f90007dc:	00098513          	mv	a0,s3
f90007e0:	3d4010ef          	jal	ra,f9001bb4 <__fixsfsi>
f90007e4:	000b0593          	mv	a1,s6
f90007e8:	ba1ff0ef          	jal	ra,f9000388 <itos>
f90007ec:	01514703          	lbu	a4,21(sp)
f90007f0:	02d00793          	li	a5,45
f90007f4:	02f71063          	bne	a4,a5,f9000814 <bsp_printf+0x380>
f90007f8:	01410793          	addi	a5,sp,20
f90007fc:	01c10713          	addi	a4,sp,28
f9000800:	0027c683          	lbu	a3,2(a5) # 80000002 <__freertos_irq_stack_top+0x86ff8b82>
f9000804:	00178793          	addi	a5,a5,1
f9000808:	00d78023          	sb	a3,0(a5)
f900080c:	fef71ae3          	bne	a4,a5,f9000800 <bsp_printf+0x36c>
f9000810:	00100913          	li	s2,1
f9000814:	01410593          	addi	a1,sp,20
f9000818:	00040513          	mv	a0,s0
f900081c:	9d1ff0ef          	jal	ra,f90001ec <strcat>
f9000820:	02014703          	lbu	a4,32(sp)
f9000824:	02d00793          	li	a5,45
f9000828:	02f70463          	beq	a4,a5,f9000850 <bsp_printf+0x3bc>
f900082c:	00100793          	li	a5,1
f9000830:	02f91063          	bne	s2,a5,f9000850 <bsp_printf+0x3bc>
f9000834:	03410793          	addi	a5,sp,52
f9000838:	fff7c703          	lbu	a4,-1(a5)
f900083c:	fff78793          	addi	a5,a5,-1
f9000840:	00e780a3          	sb	a4,1(a5)
f9000844:	fef41ae3          	bne	s0,a5,f9000838 <bsp_printf+0x3a4>
f9000848:	02d00793          	li	a5,45
f900084c:	02f10023          	sb	a5,32(sp)
f9000850:	00044503          	lbu	a0,0(s0)
f9000854:	d6050ae3          	beqz	a0,f90005c8 <bsp_printf+0x134>
f9000858:	00140413          	addi	s0,s0,1
f900085c:	c1dff0ef          	jal	ra,f9000478 <_putchar>
f9000860:	ff1ff06f          	j	f9000850 <bsp_printf+0x3bc>

f9000864 <__ledf2>:
f9000864:	0145d713          	srli	a4,a1,0x14
f9000868:	001007b7          	lui	a5,0x100
f900086c:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9000870:	0146d813          	srli	a6,a3,0x14
f9000874:	7ff77713          	andi	a4,a4,2047
f9000878:	7ff00893          	li	a7,2047
f900087c:	00b7f333          	and	t1,a5,a1
f9000880:	00050e13          	mv	t3,a0
f9000884:	00d7f7b3          	and	a5,a5,a3
f9000888:	01f5d593          	srli	a1,a1,0x1f
f900088c:	00060e93          	mv	t4,a2
f9000890:	7ff87813          	andi	a6,a6,2047
f9000894:	01f6d693          	srli	a3,a3,0x1f
f9000898:	05170a63          	beq	a4,a7,f90008ec <__ledf2+0x88>
f900089c:	03180263          	beq	a6,a7,f90008c0 <__ledf2+0x5c>
f90008a0:	04071c63          	bnez	a4,f90008f8 <__ledf2+0x94>
f90008a4:	00a36533          	or	a0,t1,a0
f90008a8:	02081663          	bnez	a6,f90008d4 <__ledf2+0x70>
f90008ac:	00c7e633          	or	a2,a5,a2
f90008b0:	02061263          	bnez	a2,f90008d4 <__ledf2+0x70>
f90008b4:	00000693          	li	a3,0
f90008b8:	06050263          	beqz	a0,f900091c <__ledf2+0xb8>
f90008bc:	0200006f          	j	f90008dc <__ledf2+0x78>
f90008c0:	00c7e8b3          	or	a7,a5,a2
f90008c4:	fc088ee3          	beqz	a7,f90008a0 <__ledf2+0x3c>
f90008c8:	00200693          	li	a3,2
f90008cc:	00068513          	mv	a0,a3
f90008d0:	00008067          	ret
f90008d4:	04050263          	beqz	a0,f9000918 <__ledf2+0xb4>
f90008d8:	04d58e63          	beq	a1,a3,f9000934 <__ledf2+0xd0>
f90008dc:	00100693          	li	a3,1
f90008e0:	02058e63          	beqz	a1,f900091c <__ledf2+0xb8>
f90008e4:	fff00693          	li	a3,-1
f90008e8:	0340006f          	j	f900091c <__ledf2+0xb8>
f90008ec:	00a36533          	or	a0,t1,a0
f90008f0:	fc051ce3          	bnez	a0,f90008c8 <__ledf2+0x64>
f90008f4:	02e80863          	beq	a6,a4,f9000924 <__ledf2+0xc0>
f90008f8:	00081663          	bnez	a6,f9000904 <__ledf2+0xa0>
f90008fc:	00c7e633          	or	a2,a5,a2
f9000900:	fc060ee3          	beqz	a2,f90008dc <__ledf2+0x78>
f9000904:	fcd59ce3          	bne	a1,a3,f90008dc <__ledf2+0x78>
f9000908:	02e85663          	bge	a6,a4,f9000934 <__ledf2+0xd0>
f900090c:	fc069ce3          	bnez	a3,f90008e4 <__ledf2+0x80>
f9000910:	00100693          	li	a3,1
f9000914:	0080006f          	j	f900091c <__ledf2+0xb8>
f9000918:	fc0686e3          	beqz	a3,f90008e4 <__ledf2+0x80>
f900091c:	00068513          	mv	a0,a3
f9000920:	00008067          	ret
f9000924:	00c7e633          	or	a2,a5,a2
f9000928:	fc060ee3          	beqz	a2,f9000904 <__ledf2+0xa0>
f900092c:	00200693          	li	a3,2
f9000930:	f9dff06f          	j	f90008cc <__ledf2+0x68>
f9000934:	01074a63          	blt	a4,a6,f9000948 <__ledf2+0xe4>
f9000938:	fa67e2e3          	bltu	a5,t1,f90008dc <__ledf2+0x78>
f900093c:	00f30c63          	beq	t1,a5,f9000954 <__ledf2+0xf0>
f9000940:	00000693          	li	a3,0
f9000944:	fcf37ce3          	bgeu	t1,a5,f900091c <__ledf2+0xb8>
f9000948:	f8058ee3          	beqz	a1,f90008e4 <__ledf2+0x80>
f900094c:	00058693          	mv	a3,a1
f9000950:	fcdff06f          	j	f900091c <__ledf2+0xb8>
f9000954:	f9cee4e3          	bltu	t4,t3,f90008dc <__ledf2+0x78>
f9000958:	00000693          	li	a3,0
f900095c:	fdde70e3          	bgeu	t3,t4,f900091c <__ledf2+0xb8>
f9000960:	fe9ff06f          	j	f9000948 <__ledf2+0xe4>

f9000964 <__muldf3>:
f9000964:	fc010113          	addi	sp,sp,-64
f9000968:	0145d793          	srli	a5,a1,0x14
f900096c:	02812c23          	sw	s0,56(sp)
f9000970:	03212823          	sw	s2,48(sp)
f9000974:	03412423          	sw	s4,40(sp)
f9000978:	00c59413          	slli	s0,a1,0xc
f900097c:	02112e23          	sw	ra,60(sp)
f9000980:	02912a23          	sw	s1,52(sp)
f9000984:	03312623          	sw	s3,44(sp)
f9000988:	03512223          	sw	s5,36(sp)
f900098c:	03612023          	sw	s6,32(sp)
f9000990:	01712e23          	sw	s7,28(sp)
f9000994:	7ff7f793          	andi	a5,a5,2047
f9000998:	00050913          	mv	s2,a0
f900099c:	00c45413          	srli	s0,s0,0xc
f90009a0:	01f5da13          	srli	s4,a1,0x1f
f90009a4:	14078c63          	beqz	a5,f9000afc <__muldf3+0x198>
f90009a8:	7ff00713          	li	a4,2047
f90009ac:	20e78863          	beq	a5,a4,f9000bbc <__muldf3+0x258>
f90009b0:	00341513          	slli	a0,s0,0x3
f90009b4:	01d95413          	srli	s0,s2,0x1d
f90009b8:	00a46433          	or	s0,s0,a0
f90009bc:	00800537          	lui	a0,0x800
f90009c0:	00a46433          	or	s0,s0,a0
f90009c4:	00391493          	slli	s1,s2,0x3
f90009c8:	c0178b13          	addi	s6,a5,-1023
f90009cc:	00000993          	li	s3,0
f90009d0:	00000b93          	li	s7,0
f90009d4:	0146d793          	srli	a5,a3,0x14
f90009d8:	00c69913          	slli	s2,a3,0xc
f90009dc:	7ff7f793          	andi	a5,a5,2047
f90009e0:	00c95913          	srli	s2,s2,0xc
f90009e4:	01f6da93          	srli	s5,a3,0x1f
f90009e8:	18078263          	beqz	a5,f9000b6c <__muldf3+0x208>
f90009ec:	7ff00713          	li	a4,2047
f90009f0:	04e78c63          	beq	a5,a4,f9000a48 <__muldf3+0xe4>
f90009f4:	00391513          	slli	a0,s2,0x3
f90009f8:	01d65913          	srli	s2,a2,0x1d
f90009fc:	00a96933          	or	s2,s2,a0
f9000a00:	c0178793          	addi	a5,a5,-1023
f9000a04:	00800537          	lui	a0,0x800
f9000a08:	00a96933          	or	s2,s2,a0
f9000a0c:	00361693          	slli	a3,a2,0x3
f9000a10:	00fb0b33          	add	s6,s6,a5
f9000a14:	00000513          	li	a0,0
f9000a18:	015a4833          	xor	a6,s4,s5
f9000a1c:	00f00713          	li	a4,15
f9000a20:	00080593          	mv	a1,a6
f9000a24:	001b0793          	addi	a5,s6,1
f9000a28:	21376c63          	bltu	a4,s3,f9000c40 <__muldf3+0x2dc>
f9000a2c:	00004617          	auipc	a2,0x4
f9000a30:	31c60613          	addi	a2,a2,796 # f9004d48 <_data+0x9c>
f9000a34:	00299993          	slli	s3,s3,0x2
f9000a38:	00c989b3          	add	s3,s3,a2
f9000a3c:	0009a703          	lw	a4,0(s3)
f9000a40:	00c70733          	add	a4,a4,a2
f9000a44:	00070067          	jr	a4
f9000a48:	00c966b3          	or	a3,s2,a2
f9000a4c:	7ffb0b13          	addi	s6,s6,2047
f9000a50:	1c069063          	bnez	a3,f9000c10 <__muldf3+0x2ac>
f9000a54:	0029e993          	ori	s3,s3,2
f9000a58:	00000913          	li	s2,0
f9000a5c:	00200513          	li	a0,2
f9000a60:	fb9ff06f          	j	f9000a18 <__muldf3+0xb4>
f9000a64:	00000813          	li	a6,0
f9000a68:	7ff00793          	li	a5,2047
f9000a6c:	00080437          	lui	s0,0x80
f9000a70:	00000493          	li	s1,0
f9000a74:	00c41413          	slli	s0,s0,0xc
f9000a78:	01479793          	slli	a5,a5,0x14
f9000a7c:	00c45413          	srli	s0,s0,0xc
f9000a80:	01f81813          	slli	a6,a6,0x1f
f9000a84:	00f46433          	or	s0,s0,a5
f9000a88:	01046433          	or	s0,s0,a6
f9000a8c:	00040593          	mv	a1,s0
f9000a90:	03c12083          	lw	ra,60(sp)
f9000a94:	03812403          	lw	s0,56(sp)
f9000a98:	00048513          	mv	a0,s1
f9000a9c:	03012903          	lw	s2,48(sp)
f9000aa0:	03412483          	lw	s1,52(sp)
f9000aa4:	02c12983          	lw	s3,44(sp)
f9000aa8:	02812a03          	lw	s4,40(sp)
f9000aac:	02412a83          	lw	s5,36(sp)
f9000ab0:	02012b03          	lw	s6,32(sp)
f9000ab4:	01c12b83          	lw	s7,28(sp)
f9000ab8:	04010113          	addi	sp,sp,64
f9000abc:	00008067          	ret
f9000ac0:	000a8593          	mv	a1,s5
f9000ac4:	00090413          	mv	s0,s2
f9000ac8:	00068493          	mv	s1,a3
f9000acc:	00050b93          	mv	s7,a0
f9000ad0:	00200713          	li	a4,2
f9000ad4:	14eb8c63          	beq	s7,a4,f9000c2c <__muldf3+0x2c8>
f9000ad8:	00300713          	li	a4,3
f9000adc:	f8eb84e3          	beq	s7,a4,f9000a64 <__muldf3+0x100>
f9000ae0:	00100713          	li	a4,1
f9000ae4:	00058813          	mv	a6,a1
f9000ae8:	56eb9e63          	bne	s7,a4,f9001064 <__muldf3+0x700>
f9000aec:	00000793          	li	a5,0
f9000af0:	00000413          	li	s0,0
f9000af4:	00000493          	li	s1,0
f9000af8:	f7dff06f          	j	f9000a74 <__muldf3+0x110>
f9000afc:	00a464b3          	or	s1,s0,a0
f9000b00:	0e048e63          	beqz	s1,f9000bfc <__muldf3+0x298>
f9000b04:	00d12623          	sw	a3,12(sp)
f9000b08:	00c12423          	sw	a2,8(sp)
f9000b0c:	44040263          	beqz	s0,f9000f50 <__muldf3+0x5ec>
f9000b10:	00040513          	mv	a0,s0
f9000b14:	4e0010ef          	jal	ra,f9001ff4 <__clzsi2>
f9000b18:	00812603          	lw	a2,8(sp)
f9000b1c:	00c12683          	lw	a3,12(sp)
f9000b20:	00050793          	mv	a5,a0
f9000b24:	ff550593          	addi	a1,a0,-11 # 7ffff5 <__stack_size+0x7fdff5>
f9000b28:	01d00713          	li	a4,29
f9000b2c:	ff878493          	addi	s1,a5,-8
f9000b30:	40b70733          	sub	a4,a4,a1
f9000b34:	00941433          	sll	s0,s0,s1
f9000b38:	00e95733          	srl	a4,s2,a4
f9000b3c:	00876433          	or	s0,a4,s0
f9000b40:	009914b3          	sll	s1,s2,s1
f9000b44:	c0d00b13          	li	s6,-1011
f9000b48:	40fb0b33          	sub	s6,s6,a5
f9000b4c:	0146d793          	srli	a5,a3,0x14
f9000b50:	00c69913          	slli	s2,a3,0xc
f9000b54:	7ff7f793          	andi	a5,a5,2047
f9000b58:	00000993          	li	s3,0
f9000b5c:	00000b93          	li	s7,0
f9000b60:	00c95913          	srli	s2,s2,0xc
f9000b64:	01f6da93          	srli	s5,a3,0x1f
f9000b68:	e80792e3          	bnez	a5,f90009ec <__muldf3+0x88>
f9000b6c:	00c966b3          	or	a3,s2,a2
f9000b70:	06068463          	beqz	a3,f9000bd8 <__muldf3+0x274>
f9000b74:	3a090663          	beqz	s2,f9000f20 <__muldf3+0x5bc>
f9000b78:	00090513          	mv	a0,s2
f9000b7c:	00c12423          	sw	a2,8(sp)
f9000b80:	474010ef          	jal	ra,f9001ff4 <__clzsi2>
f9000b84:	00812603          	lw	a2,8(sp)
f9000b88:	00050793          	mv	a5,a0
f9000b8c:	ff550593          	addi	a1,a0,-11
f9000b90:	01d00713          	li	a4,29
f9000b94:	ff878693          	addi	a3,a5,-8
f9000b98:	40b70733          	sub	a4,a4,a1
f9000b9c:	00d91933          	sll	s2,s2,a3
f9000ba0:	00e65733          	srl	a4,a2,a4
f9000ba4:	01276933          	or	s2,a4,s2
f9000ba8:	00d616b3          	sll	a3,a2,a3
f9000bac:	40fb07b3          	sub	a5,s6,a5
f9000bb0:	c0d78b13          	addi	s6,a5,-1011
f9000bb4:	00000513          	li	a0,0
f9000bb8:	e61ff06f          	j	f9000a18 <__muldf3+0xb4>
f9000bbc:	00a464b3          	or	s1,s0,a0
f9000bc0:	02049463          	bnez	s1,f9000be8 <__muldf3+0x284>
f9000bc4:	00000413          	li	s0,0
f9000bc8:	00800993          	li	s3,8
f9000bcc:	7ff00b13          	li	s6,2047
f9000bd0:	00200b93          	li	s7,2
f9000bd4:	e01ff06f          	j	f90009d4 <__muldf3+0x70>
f9000bd8:	0019e993          	ori	s3,s3,1
f9000bdc:	00000913          	li	s2,0
f9000be0:	00100513          	li	a0,1
f9000be4:	e35ff06f          	j	f9000a18 <__muldf3+0xb4>
f9000be8:	00050493          	mv	s1,a0
f9000bec:	00c00993          	li	s3,12
f9000bf0:	7ff00b13          	li	s6,2047
f9000bf4:	00300b93          	li	s7,3
f9000bf8:	dddff06f          	j	f90009d4 <__muldf3+0x70>
f9000bfc:	00000413          	li	s0,0
f9000c00:	00400993          	li	s3,4
f9000c04:	00000b13          	li	s6,0
f9000c08:	00100b93          	li	s7,1
f9000c0c:	dc9ff06f          	j	f90009d4 <__muldf3+0x70>
f9000c10:	0039e993          	ori	s3,s3,3
f9000c14:	00060693          	mv	a3,a2
f9000c18:	00300513          	li	a0,3
f9000c1c:	dfdff06f          	j	f9000a18 <__muldf3+0xb4>
f9000c20:	00200713          	li	a4,2
f9000c24:	000a0593          	mv	a1,s4
f9000c28:	eaeb98e3          	bne	s7,a4,f9000ad8 <__muldf3+0x174>
f9000c2c:	00058813          	mv	a6,a1
f9000c30:	7ff00793          	li	a5,2047
f9000c34:	00000413          	li	s0,0
f9000c38:	00000493          	li	s1,0
f9000c3c:	e39ff06f          	j	f9000a74 <__muldf3+0x110>
f9000c40:	000103b7          	lui	t2,0x10
f9000c44:	fff38e13          	addi	t3,t2,-1 # ffff <__stack_size+0xdfff>
f9000c48:	01c4ff33          	and	t5,s1,t3
f9000c4c:	01c6fe33          	and	t3,a3,t3
f9000c50:	0104d313          	srli	t1,s1,0x10
f9000c54:	0106d893          	srli	a7,a3,0x10
f9000c58:	000f0513          	mv	a0,t5
f9000c5c:	000e0593          	mv	a1,t3
f9000c60:	2bc010ef          	jal	ra,f9001f1c <__mulsi3>
f9000c64:	00050e93          	mv	t4,a0
f9000c68:	00088593          	mv	a1,a7
f9000c6c:	000f0513          	mv	a0,t5
f9000c70:	2ac010ef          	jal	ra,f9001f1c <__mulsi3>
f9000c74:	00050713          	mv	a4,a0
f9000c78:	000e0593          	mv	a1,t3
f9000c7c:	00030513          	mv	a0,t1
f9000c80:	29c010ef          	jal	ra,f9001f1c <__mulsi3>
f9000c84:	00050293          	mv	t0,a0
f9000c88:	00088593          	mv	a1,a7
f9000c8c:	00030513          	mv	a0,t1
f9000c90:	28c010ef          	jal	ra,f9001f1c <__mulsi3>
f9000c94:	010ed693          	srli	a3,t4,0x10
f9000c98:	00570733          	add	a4,a4,t0
f9000c9c:	00e686b3          	add	a3,a3,a4
f9000ca0:	00050f93          	mv	t6,a0
f9000ca4:	0056f463          	bgeu	a3,t0,f9000cac <__muldf3+0x348>
f9000ca8:	00750fb3          	add	t6,a0,t2
f9000cac:	000103b7          	lui	t2,0x10
f9000cb0:	fff38993          	addi	s3,t2,-1 # ffff <__stack_size+0xdfff>
f9000cb4:	0136f4b3          	and	s1,a3,s3
f9000cb8:	01049713          	slli	a4,s1,0x10
f9000cbc:	013ef4b3          	and	s1,t4,s3
f9000cc0:	013979b3          	and	s3,s2,s3
f9000cc4:	0106de93          	srli	t4,a3,0x10
f9000cc8:	009704b3          	add	s1,a4,s1
f9000ccc:	01095913          	srli	s2,s2,0x10
f9000cd0:	000f0513          	mv	a0,t5
f9000cd4:	00098593          	mv	a1,s3
f9000cd8:	244010ef          	jal	ra,f9001f1c <__mulsi3>
f9000cdc:	00050293          	mv	t0,a0
f9000ce0:	00090593          	mv	a1,s2
f9000ce4:	000f0513          	mv	a0,t5
f9000ce8:	234010ef          	jal	ra,f9001f1c <__mulsi3>
f9000cec:	00050f13          	mv	t5,a0
f9000cf0:	00098593          	mv	a1,s3
f9000cf4:	00030513          	mv	a0,t1
f9000cf8:	224010ef          	jal	ra,f9001f1c <__mulsi3>
f9000cfc:	00050a13          	mv	s4,a0
f9000d00:	00090593          	mv	a1,s2
f9000d04:	00030513          	mv	a0,t1
f9000d08:	214010ef          	jal	ra,f9001f1c <__mulsi3>
f9000d0c:	0102d713          	srli	a4,t0,0x10
f9000d10:	014f0f33          	add	t5,t5,s4
f9000d14:	01e70733          	add	a4,a4,t5
f9000d18:	01477463          	bgeu	a4,s4,f9000d20 <__muldf3+0x3bc>
f9000d1c:	00750533          	add	a0,a0,t2
f9000d20:	00010a37          	lui	s4,0x10
f9000d24:	fffa0693          	addi	a3,s4,-1 # ffff <__stack_size+0xdfff>
f9000d28:	00d77333          	and	t1,a4,a3
f9000d2c:	01031313          	slli	t1,t1,0x10
f9000d30:	00d2f2b3          	and	t0,t0,a3
f9000d34:	005303b3          	add	t2,t1,t0
f9000d38:	01075713          	srli	a4,a4,0x10
f9000d3c:	00d47333          	and	t1,s0,a3
f9000d40:	00a70f33          	add	t5,a4,a0
f9000d44:	007e8eb3          	add	t4,t4,t2
f9000d48:	01045413          	srli	s0,s0,0x10
f9000d4c:	00030513          	mv	a0,t1
f9000d50:	000e0593          	mv	a1,t3
f9000d54:	1c8010ef          	jal	ra,f9001f1c <__mulsi3>
f9000d58:	00050713          	mv	a4,a0
f9000d5c:	00088593          	mv	a1,a7
f9000d60:	00030513          	mv	a0,t1
f9000d64:	1b8010ef          	jal	ra,f9001f1c <__mulsi3>
f9000d68:	00050293          	mv	t0,a0
f9000d6c:	000e0593          	mv	a1,t3
f9000d70:	00040513          	mv	a0,s0
f9000d74:	1a8010ef          	jal	ra,f9001f1c <__mulsi3>
f9000d78:	00050e13          	mv	t3,a0
f9000d7c:	00088593          	mv	a1,a7
f9000d80:	00040513          	mv	a0,s0
f9000d84:	198010ef          	jal	ra,f9001f1c <__mulsi3>
f9000d88:	01075693          	srli	a3,a4,0x10
f9000d8c:	01c282b3          	add	t0,t0,t3
f9000d90:	005686b3          	add	a3,a3,t0
f9000d94:	01c6f463          	bgeu	a3,t3,f9000d9c <__muldf3+0x438>
f9000d98:	01450533          	add	a0,a0,s4
f9000d9c:	00010a37          	lui	s4,0x10
f9000da0:	fffa0613          	addi	a2,s4,-1 # ffff <__stack_size+0xdfff>
f9000da4:	00c6f8b3          	and	a7,a3,a2
f9000da8:	00c77733          	and	a4,a4,a2
f9000dac:	0106d693          	srli	a3,a3,0x10
f9000db0:	01089893          	slli	a7,a7,0x10
f9000db4:	00a682b3          	add	t0,a3,a0
f9000db8:	00e888b3          	add	a7,a7,a4
f9000dbc:	00030513          	mv	a0,t1
f9000dc0:	00098593          	mv	a1,s3
f9000dc4:	158010ef          	jal	ra,f9001f1c <__mulsi3>
f9000dc8:	00050e13          	mv	t3,a0
f9000dcc:	00090593          	mv	a1,s2
f9000dd0:	00030513          	mv	a0,t1
f9000dd4:	148010ef          	jal	ra,f9001f1c <__mulsi3>
f9000dd8:	00050713          	mv	a4,a0
f9000ddc:	00098593          	mv	a1,s3
f9000de0:	00040513          	mv	a0,s0
f9000de4:	138010ef          	jal	ra,f9001f1c <__mulsi3>
f9000de8:	00050313          	mv	t1,a0
f9000dec:	00090593          	mv	a1,s2
f9000df0:	00040513          	mv	a0,s0
f9000df4:	128010ef          	jal	ra,f9001f1c <__mulsi3>
f9000df8:	010e5613          	srli	a2,t3,0x10
f9000dfc:	00670733          	add	a4,a4,t1
f9000e00:	00e60633          	add	a2,a2,a4
f9000e04:	00667463          	bgeu	a2,t1,f9000e0c <__muldf3+0x4a8>
f9000e08:	01450533          	add	a0,a0,s4
f9000e0c:	000106b7          	lui	a3,0x10
f9000e10:	fff68693          	addi	a3,a3,-1 # ffff <__stack_size+0xdfff>
f9000e14:	00d67733          	and	a4,a2,a3
f9000e18:	00de7e33          	and	t3,t3,a3
f9000e1c:	01071713          	slli	a4,a4,0x10
f9000e20:	01fe86b3          	add	a3,t4,t6
f9000e24:	01c70733          	add	a4,a4,t3
f9000e28:	0076b333          	sltu	t1,a3,t2
f9000e2c:	01e70733          	add	a4,a4,t5
f9000e30:	011686b3          	add	a3,a3,a7
f9000e34:	00670433          	add	s0,a4,t1
f9000e38:	0116b8b3          	sltu	a7,a3,a7
f9000e3c:	005405b3          	add	a1,s0,t0
f9000e40:	01158e33          	add	t3,a1,a7
f9000e44:	01e73733          	sltu	a4,a4,t5
f9000e48:	00643433          	sltu	s0,s0,t1
f9000e4c:	00876433          	or	s0,a4,s0
f9000e50:	01065613          	srli	a2,a2,0x10
f9000e54:	0055b5b3          	sltu	a1,a1,t0
f9000e58:	011e38b3          	sltu	a7,t3,a7
f9000e5c:	00c40433          	add	s0,s0,a2
f9000e60:	0115e8b3          	or	a7,a1,a7
f9000e64:	00969713          	slli	a4,a3,0x9
f9000e68:	01140433          	add	s0,s0,a7
f9000e6c:	00a40433          	add	s0,s0,a0
f9000e70:	009764b3          	or	s1,a4,s1
f9000e74:	00941413          	slli	s0,s0,0x9
f9000e78:	017e5513          	srli	a0,t3,0x17
f9000e7c:	009034b3          	snez	s1,s1
f9000e80:	0176d693          	srli	a3,a3,0x17
f9000e84:	009e1713          	slli	a4,t3,0x9
f9000e88:	00d4e4b3          	or	s1,s1,a3
f9000e8c:	00a46433          	or	s0,s0,a0
f9000e90:	00e4e4b3          	or	s1,s1,a4
f9000e94:	00741713          	slli	a4,s0,0x7
f9000e98:	02075063          	bgez	a4,f9000eb8 <__muldf3+0x554>
f9000e9c:	0014d713          	srli	a4,s1,0x1
f9000ea0:	0014f493          	andi	s1,s1,1
f9000ea4:	01f41693          	slli	a3,s0,0x1f
f9000ea8:	009764b3          	or	s1,a4,s1
f9000eac:	00d4e4b3          	or	s1,s1,a3
f9000eb0:	00145413          	srli	s0,s0,0x1
f9000eb4:	00078b13          	mv	s6,a5
f9000eb8:	3ffb0713          	addi	a4,s6,1023
f9000ebc:	0ce05063          	blez	a4,f9000f7c <__muldf3+0x618>
f9000ec0:	0074f793          	andi	a5,s1,7
f9000ec4:	02078063          	beqz	a5,f9000ee4 <__muldf3+0x580>
f9000ec8:	00f4f793          	andi	a5,s1,15
f9000ecc:	00400693          	li	a3,4
f9000ed0:	00d78a63          	beq	a5,a3,f9000ee4 <__muldf3+0x580>
f9000ed4:	00448793          	addi	a5,s1,4
f9000ed8:	0097b4b3          	sltu	s1,a5,s1
f9000edc:	00940433          	add	s0,s0,s1
f9000ee0:	00078493          	mv	s1,a5
f9000ee4:	00741793          	slli	a5,s0,0x7
f9000ee8:	0007da63          	bgez	a5,f9000efc <__muldf3+0x598>
f9000eec:	ff0007b7          	lui	a5,0xff000
f9000ef0:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ff8b7f>
f9000ef4:	00f47433          	and	s0,s0,a5
f9000ef8:	400b0713          	addi	a4,s6,1024
f9000efc:	7fe00793          	li	a5,2046
f9000f00:	14e7ca63          	blt	a5,a4,f9001054 <__muldf3+0x6f0>
f9000f04:	0034d793          	srli	a5,s1,0x3
f9000f08:	01d41493          	slli	s1,s0,0x1d
f9000f0c:	00941413          	slli	s0,s0,0x9
f9000f10:	00f4e4b3          	or	s1,s1,a5
f9000f14:	00c45413          	srli	s0,s0,0xc
f9000f18:	7ff77793          	andi	a5,a4,2047
f9000f1c:	b59ff06f          	j	f9000a74 <__muldf3+0x110>
f9000f20:	00060513          	mv	a0,a2
f9000f24:	00c12423          	sw	a2,8(sp)
f9000f28:	0cc010ef          	jal	ra,f9001ff4 <__clzsi2>
f9000f2c:	01550593          	addi	a1,a0,21
f9000f30:	01c00713          	li	a4,28
f9000f34:	02050793          	addi	a5,a0,32
f9000f38:	00812603          	lw	a2,8(sp)
f9000f3c:	c4b75ae3          	bge	a4,a1,f9000b90 <__muldf3+0x22c>
f9000f40:	ff850513          	addi	a0,a0,-8
f9000f44:	00000693          	li	a3,0
f9000f48:	00a61933          	sll	s2,a2,a0
f9000f4c:	c61ff06f          	j	f9000bac <__muldf3+0x248>
f9000f50:	0a4010ef          	jal	ra,f9001ff4 <__clzsi2>
f9000f54:	01550593          	addi	a1,a0,21
f9000f58:	01c00713          	li	a4,28
f9000f5c:	02050793          	addi	a5,a0,32
f9000f60:	00812603          	lw	a2,8(sp)
f9000f64:	00c12683          	lw	a3,12(sp)
f9000f68:	bcb750e3          	bge	a4,a1,f9000b28 <__muldf3+0x1c4>
f9000f6c:	ff850513          	addi	a0,a0,-8
f9000f70:	00000493          	li	s1,0
f9000f74:	00a91433          	sll	s0,s2,a0
f9000f78:	bcdff06f          	j	f9000b44 <__muldf3+0x1e0>
f9000f7c:	00100693          	li	a3,1
f9000f80:	40e686b3          	sub	a3,a3,a4
f9000f84:	06071063          	bnez	a4,f9000fe4 <__muldf3+0x680>
f9000f88:	41eb0793          	addi	a5,s6,1054
f9000f8c:	00f49733          	sll	a4,s1,a5
f9000f90:	00f417b3          	sll	a5,s0,a5
f9000f94:	00d4d4b3          	srl	s1,s1,a3
f9000f98:	0097e4b3          	or	s1,a5,s1
f9000f9c:	00e03733          	snez	a4,a4
f9000fa0:	00e4e4b3          	or	s1,s1,a4
f9000fa4:	0074f793          	andi	a5,s1,7
f9000fa8:	00d456b3          	srl	a3,s0,a3
f9000fac:	02078063          	beqz	a5,f9000fcc <__muldf3+0x668>
f9000fb0:	00f4f793          	andi	a5,s1,15
f9000fb4:	00400713          	li	a4,4
f9000fb8:	00e78a63          	beq	a5,a4,f9000fcc <__muldf3+0x668>
f9000fbc:	00448793          	addi	a5,s1,4
f9000fc0:	0097b4b3          	sltu	s1,a5,s1
f9000fc4:	009686b3          	add	a3,a3,s1
f9000fc8:	00078493          	mv	s1,a5
f9000fcc:	00869793          	slli	a5,a3,0x8
f9000fd0:	0607d463          	bgez	a5,f9001038 <__muldf3+0x6d4>
f9000fd4:	00100793          	li	a5,1
f9000fd8:	00000413          	li	s0,0
f9000fdc:	00000493          	li	s1,0
f9000fe0:	a95ff06f          	j	f9000a74 <__muldf3+0x110>
f9000fe4:	03800793          	li	a5,56
f9000fe8:	b0d7c2e3          	blt	a5,a3,f9000aec <__muldf3+0x188>
f9000fec:	01f00793          	li	a5,31
f9000ff0:	f8d7dce3          	bge	a5,a3,f9000f88 <__muldf3+0x624>
f9000ff4:	fe100793          	li	a5,-31
f9000ff8:	40e78733          	sub	a4,a5,a4
f9000ffc:	02000793          	li	a5,32
f9001000:	00e45733          	srl	a4,s0,a4
f9001004:	00f68863          	beq	a3,a5,f9001014 <__muldf3+0x6b0>
f9001008:	43eb0793          	addi	a5,s6,1086
f900100c:	00f417b3          	sll	a5,s0,a5
f9001010:	00f4e4b3          	or	s1,s1,a5
f9001014:	009034b3          	snez	s1,s1
f9001018:	00e4e4b3          	or	s1,s1,a4
f900101c:	0074f693          	andi	a3,s1,7
f9001020:	00000413          	li	s0,0
f9001024:	02068063          	beqz	a3,f9001044 <__muldf3+0x6e0>
f9001028:	00f4f793          	andi	a5,s1,15
f900102c:	00400713          	li	a4,4
f9001030:	00000693          	li	a3,0
f9001034:	f8e794e3          	bne	a5,a4,f9000fbc <__muldf3+0x658>
f9001038:	00969413          	slli	s0,a3,0x9
f900103c:	00c45413          	srli	s0,s0,0xc
f9001040:	01d69693          	slli	a3,a3,0x1d
f9001044:	0034d493          	srli	s1,s1,0x3
f9001048:	00d4e4b3          	or	s1,s1,a3
f900104c:	00000793          	li	a5,0
f9001050:	a25ff06f          	j	f9000a74 <__muldf3+0x110>
f9001054:	7ff00793          	li	a5,2047
f9001058:	00000413          	li	s0,0
f900105c:	00000493          	li	s1,0
f9001060:	a15ff06f          	j	f9000a74 <__muldf3+0x110>
f9001064:	00078b13          	mv	s6,a5
f9001068:	e51ff06f          	j	f9000eb8 <__muldf3+0x554>

f900106c <__subdf3>:
f900106c:	00100737          	lui	a4,0x100
f9001070:	fff70713          	addi	a4,a4,-1 # fffff <__stack_size+0xfdfff>
f9001074:	fe010113          	addi	sp,sp,-32
f9001078:	00b77333          	and	t1,a4,a1
f900107c:	0146d893          	srli	a7,a3,0x14
f9001080:	00d77733          	and	a4,a4,a3
f9001084:	01d65e93          	srli	t4,a2,0x1d
f9001088:	00812c23          	sw	s0,24(sp)
f900108c:	00912a23          	sw	s1,20(sp)
f9001090:	00331313          	slli	t1,t1,0x3
f9001094:	0145d493          	srli	s1,a1,0x14
f9001098:	01d55793          	srli	a5,a0,0x1d
f900109c:	00371713          	slli	a4,a4,0x3
f90010a0:	00112e23          	sw	ra,28(sp)
f90010a4:	01212823          	sw	s2,16(sp)
f90010a8:	01312623          	sw	s3,12(sp)
f90010ac:	7ff8f893          	andi	a7,a7,2047
f90010b0:	7ff00e13          	li	t3,2047
f90010b4:	00eee733          	or	a4,t4,a4
f90010b8:	7ff4f493          	andi	s1,s1,2047
f90010bc:	01f5d413          	srli	s0,a1,0x1f
f90010c0:	0067e333          	or	t1,a5,t1
f90010c4:	00351f13          	slli	t5,a0,0x3
f90010c8:	01f6d693          	srli	a3,a3,0x1f
f90010cc:	00361e93          	slli	t4,a2,0x3
f90010d0:	1dc88663          	beq	a7,t3,f900129c <__subdf3+0x230>
f90010d4:	0016c693          	xori	a3,a3,1
f90010d8:	411485b3          	sub	a1,s1,a7
f90010dc:	16d40863          	beq	s0,a3,f900124c <__subdf3+0x1e0>
f90010e0:	1cb05863          	blez	a1,f90012b0 <__subdf3+0x244>
f90010e4:	20088463          	beqz	a7,f90012ec <__subdf3+0x280>
f90010e8:	008007b7          	lui	a5,0x800
f90010ec:	00f76733          	or	a4,a4,a5
f90010f0:	67c48a63          	beq	s1,t3,f9001764 <__subdf3+0x6f8>
f90010f4:	03800793          	li	a5,56
f90010f8:	3eb7c263          	blt	a5,a1,f90014dc <__subdf3+0x470>
f90010fc:	01f00793          	li	a5,31
f9001100:	54b7ca63          	blt	a5,a1,f9001654 <__subdf3+0x5e8>
f9001104:	02000793          	li	a5,32
f9001108:	40b787b3          	sub	a5,a5,a1
f900110c:	00bed9b3          	srl	s3,t4,a1
f9001110:	00f71833          	sll	a6,a4,a5
f9001114:	00fe9eb3          	sll	t4,t4,a5
f9001118:	01386833          	or	a6,a6,s3
f900111c:	00b75733          	srl	a4,a4,a1
f9001120:	01d039b3          	snez	s3,t4
f9001124:	01386833          	or	a6,a6,s3
f9001128:	40e30333          	sub	t1,t1,a4
f900112c:	410f09b3          	sub	s3,t5,a6
f9001130:	013f37b3          	sltu	a5,t5,s3
f9001134:	40f30633          	sub	a2,t1,a5
f9001138:	00861793          	slli	a5,a2,0x8
f900113c:	2a07d863          	bgez	a5,f90013ec <__subdf3+0x380>
f9001140:	00800937          	lui	s2,0x800
f9001144:	fff90913          	addi	s2,s2,-1 # 7fffff <__stack_size+0x7fdfff>
f9001148:	01267933          	and	s2,a2,s2
f900114c:	36090663          	beqz	s2,f90014b8 <__subdf3+0x44c>
f9001150:	00090513          	mv	a0,s2
f9001154:	6a1000ef          	jal	ra,f9001ff4 <__clzsi2>
f9001158:	ff850713          	addi	a4,a0,-8
f900115c:	02000793          	li	a5,32
f9001160:	40e787b3          	sub	a5,a5,a4
f9001164:	00f9d7b3          	srl	a5,s3,a5
f9001168:	00e91633          	sll	a2,s2,a4
f900116c:	00c7e7b3          	or	a5,a5,a2
f9001170:	00e999b3          	sll	s3,s3,a4
f9001174:	32974463          	blt	a4,s1,f900149c <__subdf3+0x430>
f9001178:	40970733          	sub	a4,a4,s1
f900117c:	00170613          	addi	a2,a4,1
f9001180:	01f00693          	li	a3,31
f9001184:	44c6ca63          	blt	a3,a2,f90015d8 <__subdf3+0x56c>
f9001188:	02000713          	li	a4,32
f900118c:	40c70733          	sub	a4,a4,a2
f9001190:	00c9d6b3          	srl	a3,s3,a2
f9001194:	00e99833          	sll	a6,s3,a4
f9001198:	00e79733          	sll	a4,a5,a4
f900119c:	00d76733          	or	a4,a4,a3
f90011a0:	01003833          	snez	a6,a6
f90011a4:	010769b3          	or	s3,a4,a6
f90011a8:	00c7d633          	srl	a2,a5,a2
f90011ac:	00000493          	li	s1,0
f90011b0:	0079f793          	andi	a5,s3,7
f90011b4:	02078063          	beqz	a5,f90011d4 <__subdf3+0x168>
f90011b8:	00f9f693          	andi	a3,s3,15
f90011bc:	00400793          	li	a5,4
f90011c0:	00f68a63          	beq	a3,a5,f90011d4 <__subdf3+0x168>
f90011c4:	00498693          	addi	a3,s3,4
f90011c8:	0136b833          	sltu	a6,a3,s3
f90011cc:	01060633          	add	a2,a2,a6
f90011d0:	00068993          	mv	s3,a3
f90011d4:	00861793          	slli	a5,a2,0x8
f90011d8:	2007de63          	bgez	a5,f90013f4 <__subdf3+0x388>
f90011dc:	00148713          	addi	a4,s1,1
f90011e0:	7ff00793          	li	a5,2047
f90011e4:	00147413          	andi	s0,s0,1
f90011e8:	26f70463          	beq	a4,a5,f9001450 <__subdf3+0x3e4>
f90011ec:	ff8007b7          	lui	a5,0xff800
f90011f0:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f90011f4:	00f677b3          	and	a5,a2,a5
f90011f8:	01d79813          	slli	a6,a5,0x1d
f90011fc:	0039d993          	srli	s3,s3,0x3
f9001200:	00979793          	slli	a5,a5,0x9
f9001204:	01386833          	or	a6,a6,s3
f9001208:	00c7d793          	srli	a5,a5,0xc
f900120c:	7ff77713          	andi	a4,a4,2047
f9001210:	00c79693          	slli	a3,a5,0xc
f9001214:	01471713          	slli	a4,a4,0x14
f9001218:	00c6d693          	srli	a3,a3,0xc
f900121c:	01f41413          	slli	s0,s0,0x1f
f9001220:	00e6e6b3          	or	a3,a3,a4
f9001224:	0086e6b3          	or	a3,a3,s0
f9001228:	01c12083          	lw	ra,28(sp)
f900122c:	01812403          	lw	s0,24(sp)
f9001230:	01412483          	lw	s1,20(sp)
f9001234:	01012903          	lw	s2,16(sp)
f9001238:	00c12983          	lw	s3,12(sp)
f900123c:	00080513          	mv	a0,a6
f9001240:	00068593          	mv	a1,a3
f9001244:	02010113          	addi	sp,sp,32
f9001248:	00008067          	ret
f900124c:	0ab05e63          	blez	a1,f9001308 <__subdf3+0x29c>
f9001250:	14088a63          	beqz	a7,f90013a4 <__subdf3+0x338>
f9001254:	008007b7          	lui	a5,0x800
f9001258:	00f76733          	or	a4,a4,a5
f900125c:	33c48c63          	beq	s1,t3,f9001594 <__subdf3+0x528>
f9001260:	03800793          	li	a5,56
f9001264:	1cb7c063          	blt	a5,a1,f9001424 <__subdf3+0x3b8>
f9001268:	01f00793          	li	a5,31
f900126c:	44b7da63          	bge	a5,a1,f90016c0 <__subdf3+0x654>
f9001270:	fe058813          	addi	a6,a1,-32
f9001274:	02000793          	li	a5,32
f9001278:	010759b3          	srl	s3,a4,a6
f900127c:	00f58a63          	beq	a1,a5,f9001290 <__subdf3+0x224>
f9001280:	04000793          	li	a5,64
f9001284:	40b785b3          	sub	a1,a5,a1
f9001288:	00b71733          	sll	a4,a4,a1
f900128c:	00eeeeb3          	or	t4,t4,a4
f9001290:	01d03833          	snez	a6,t4
f9001294:	01386833          	or	a6,a6,s3
f9001298:	1940006f          	j	f900142c <__subdf3+0x3c0>
f900129c:	01d767b3          	or	a5,a4,t4
f90012a0:	80148593          	addi	a1,s1,-2047
f90012a4:	00079463          	bnez	a5,f90012ac <__subdf3+0x240>
f90012a8:	0016c693          	xori	a3,a3,1
f90012ac:	04d40e63          	beq	s0,a3,f9001308 <__subdf3+0x29c>
f90012b0:	08059a63          	bnez	a1,f9001344 <__subdf3+0x2d8>
f90012b4:	00148793          	addi	a5,s1,1
f90012b8:	7fe7f793          	andi	a5,a5,2046
f90012bc:	24079263          	bnez	a5,f9001500 <__subdf3+0x494>
f90012c0:	01e367b3          	or	a5,t1,t5
f90012c4:	01d76833          	or	a6,a4,t4
f90012c8:	18049c63          	bnez	s1,f9001460 <__subdf3+0x3f4>
f90012cc:	46078063          	beqz	a5,f900172c <__subdf3+0x6c0>
f90012d0:	4c081e63          	bnez	a6,f90017ac <__subdf3+0x740>
f90012d4:	00351813          	slli	a6,a0,0x3
f90012d8:	01d31693          	slli	a3,t1,0x1d
f90012dc:	00385813          	srli	a6,a6,0x3
f90012e0:	0106e833          	or	a6,a3,a6
f90012e4:	00335793          	srli	a5,t1,0x3
f90012e8:	1280006f          	j	f9001410 <__subdf3+0x3a4>
f90012ec:	01d767b3          	or	a5,a4,t4
f90012f0:	1e078c63          	beqz	a5,f90014e8 <__subdf3+0x47c>
f90012f4:	fff58793          	addi	a5,a1,-1
f90012f8:	44078a63          	beqz	a5,f900174c <__subdf3+0x6e0>
f90012fc:	29c58c63          	beq	a1,t3,f9001594 <__subdf3+0x528>
f9001300:	00078593          	mv	a1,a5
f9001304:	df1ff06f          	j	f90010f4 <__subdf3+0x88>
f9001308:	22059263          	bnez	a1,f900152c <__subdf3+0x4c0>
f900130c:	00148693          	addi	a3,s1,1
f9001310:	7fe6f793          	andi	a5,a3,2046
f9001314:	0a079663          	bnez	a5,f90013c0 <__subdf3+0x354>
f9001318:	01e367b3          	or	a5,t1,t5
f900131c:	3e049663          	bnez	s1,f9001708 <__subdf3+0x69c>
f9001320:	50078863          	beqz	a5,f9001830 <__subdf3+0x7c4>
f9001324:	01d767b3          	or	a5,a4,t4
f9001328:	52079063          	bnez	a5,f9001848 <__subdf3+0x7dc>
f900132c:	00351513          	slli	a0,a0,0x3
f9001330:	01d31813          	slli	a6,t1,0x1d
f9001334:	00355513          	srli	a0,a0,0x3
f9001338:	00a86833          	or	a6,a6,a0
f900133c:	00335793          	srli	a5,t1,0x3
f9001340:	0d00006f          	j	f9001410 <__subdf3+0x3a4>
f9001344:	409885b3          	sub	a1,a7,s1
f9001348:	26049263          	bnez	s1,f90015ac <__subdf3+0x540>
f900134c:	01e367b3          	or	a5,t1,t5
f9001350:	38078e63          	beqz	a5,f90016ec <__subdf3+0x680>
f9001354:	fff58793          	addi	a5,a1,-1
f9001358:	4a078e63          	beqz	a5,f9001814 <__subdf3+0x7a8>
f900135c:	7ff00513          	li	a0,2047
f9001360:	24a58e63          	beq	a1,a0,f90015bc <__subdf3+0x550>
f9001364:	00078593          	mv	a1,a5
f9001368:	03800793          	li	a5,56
f900136c:	30b7ca63          	blt	a5,a1,f9001680 <__subdf3+0x614>
f9001370:	01f00793          	li	a5,31
f9001374:	46b7ca63          	blt	a5,a1,f90017e8 <__subdf3+0x77c>
f9001378:	02000793          	li	a5,32
f900137c:	40b787b3          	sub	a5,a5,a1
f9001380:	00f31833          	sll	a6,t1,a5
f9001384:	00bf5633          	srl	a2,t5,a1
f9001388:	00ff17b3          	sll	a5,t5,a5
f900138c:	00c86833          	or	a6,a6,a2
f9001390:	00f039b3          	snez	s3,a5
f9001394:	00b35333          	srl	t1,t1,a1
f9001398:	01386833          	or	a6,a6,s3
f900139c:	40670733          	sub	a4,a4,t1
f90013a0:	2e80006f          	j	f9001688 <__subdf3+0x61c>
f90013a4:	01d767b3          	or	a5,a4,t4
f90013a8:	14078063          	beqz	a5,f90014e8 <__subdf3+0x47c>
f90013ac:	fff58793          	addi	a5,a1,-1
f90013b0:	24078e63          	beqz	a5,f900160c <__subdf3+0x5a0>
f90013b4:	37c58063          	beq	a1,t3,f9001714 <__subdf3+0x6a8>
f90013b8:	00078593          	mv	a1,a5
f90013bc:	ea5ff06f          	j	f9001260 <__subdf3+0x1f4>
f90013c0:	7ff00793          	li	a5,2047
f90013c4:	08f68463          	beq	a3,a5,f900144c <__subdf3+0x3e0>
f90013c8:	01df0eb3          	add	t4,t5,t4
f90013cc:	01eeb633          	sltu	a2,t4,t5
f90013d0:	00e307b3          	add	a5,t1,a4
f90013d4:	00c787b3          	add	a5,a5,a2
f90013d8:	01f79813          	slli	a6,a5,0x1f
f90013dc:	001ede93          	srli	t4,t4,0x1
f90013e0:	01d869b3          	or	s3,a6,t4
f90013e4:	0017d613          	srli	a2,a5,0x1
f90013e8:	00068493          	mv	s1,a3
f90013ec:	0079f793          	andi	a5,s3,7
f90013f0:	dc0794e3          	bnez	a5,f90011b8 <__subdf3+0x14c>
f90013f4:	01d61793          	slli	a5,a2,0x1d
f90013f8:	0039d813          	srli	a6,s3,0x3
f90013fc:	00f86833          	or	a6,a6,a5
f9001400:	00048593          	mv	a1,s1
f9001404:	00365793          	srli	a5,a2,0x3
f9001408:	7ff00713          	li	a4,2047
f900140c:	06e58a63          	beq	a1,a4,f9001480 <__subdf3+0x414>
f9001410:	00c79793          	slli	a5,a5,0xc
f9001414:	00c7d793          	srli	a5,a5,0xc
f9001418:	7ff5f713          	andi	a4,a1,2047
f900141c:	00147413          	andi	s0,s0,1
f9001420:	df1ff06f          	j	f9001210 <__subdf3+0x1a4>
f9001424:	01d76733          	or	a4,a4,t4
f9001428:	00e03833          	snez	a6,a4
f900142c:	01e809b3          	add	s3,a6,t5
f9001430:	01e9b7b3          	sltu	a5,s3,t5
f9001434:	00678633          	add	a2,a5,t1
f9001438:	00861793          	slli	a5,a2,0x8
f900143c:	fa07d8e3          	bgez	a5,f90013ec <__subdf3+0x380>
f9001440:	00148493          	addi	s1,s1,1
f9001444:	7ff00793          	li	a5,2047
f9001448:	1ef49263          	bne	s1,a5,f900162c <__subdf3+0x5c0>
f900144c:	00147413          	andi	s0,s0,1
f9001450:	7ff00713          	li	a4,2047
f9001454:	00000793          	li	a5,0
f9001458:	00000813          	li	a6,0
f900145c:	db5ff06f          	j	f9001210 <__subdf3+0x1a4>
f9001460:	12079863          	bnez	a5,f9001590 <__subdf3+0x524>
f9001464:	46080063          	beqz	a6,f90018c4 <__subdf3+0x858>
f9001468:	00361813          	slli	a6,a2,0x3
f900146c:	01d71793          	slli	a5,a4,0x1d
f9001470:	00385813          	srli	a6,a6,0x3
f9001474:	00f86833          	or	a6,a6,a5
f9001478:	00068413          	mv	s0,a3
f900147c:	00375793          	srli	a5,a4,0x3
f9001480:	00f867b3          	or	a5,a6,a5
f9001484:	fc0784e3          	beqz	a5,f900144c <__subdf3+0x3e0>
f9001488:	00000413          	li	s0,0
f900148c:	7ff00713          	li	a4,2047
f9001490:	000807b7          	lui	a5,0x80
f9001494:	00000813          	li	a6,0
f9001498:	d79ff06f          	j	f9001210 <__subdf3+0x1a4>
f900149c:	ff800637          	lui	a2,0xff800
f90014a0:	fff60613          	addi	a2,a2,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f90014a4:	00c7f633          	and	a2,a5,a2
f90014a8:	0079f793          	andi	a5,s3,7
f90014ac:	40e484b3          	sub	s1,s1,a4
f90014b0:	d00794e3          	bnez	a5,f90011b8 <__subdf3+0x14c>
f90014b4:	f41ff06f          	j	f90013f4 <__subdf3+0x388>
f90014b8:	00098513          	mv	a0,s3
f90014bc:	339000ef          	jal	ra,f9001ff4 <__clzsi2>
f90014c0:	01850713          	addi	a4,a0,24
f90014c4:	01f00793          	li	a5,31
f90014c8:	c8e7dae3          	bge	a5,a4,f900115c <__subdf3+0xf0>
f90014cc:	ff850613          	addi	a2,a0,-8
f90014d0:	00c997b3          	sll	a5,s3,a2
f90014d4:	00000993          	li	s3,0
f90014d8:	c9dff06f          	j	f9001174 <__subdf3+0x108>
f90014dc:	01d76833          	or	a6,a4,t4
f90014e0:	01003833          	snez	a6,a6
f90014e4:	c49ff06f          	j	f900112c <__subdf3+0xc0>
f90014e8:	00351813          	slli	a6,a0,0x3
f90014ec:	01d31793          	slli	a5,t1,0x1d
f90014f0:	00385813          	srli	a6,a6,0x3
f90014f4:	00f86833          	or	a6,a6,a5
f90014f8:	00335793          	srli	a5,t1,0x3
f90014fc:	f0dff06f          	j	f9001408 <__subdf3+0x39c>
f9001500:	41df09b3          	sub	s3,t5,t4
f9001504:	40e30933          	sub	s2,t1,a4
f9001508:	013f3633          	sltu	a2,t5,s3
f900150c:	40c90933          	sub	s2,s2,a2
f9001510:	00891793          	slli	a5,s2,0x8
f9001514:	2607c463          	bltz	a5,f900177c <__subdf3+0x710>
f9001518:	0129e833          	or	a6,s3,s2
f900151c:	c20818e3          	bnez	a6,f900114c <__subdf3+0xe0>
f9001520:	00000793          	li	a5,0
f9001524:	00000413          	li	s0,0
f9001528:	ee9ff06f          	j	f9001410 <__subdf3+0x3a4>
f900152c:	409885b3          	sub	a1,a7,s1
f9001530:	16048863          	beqz	s1,f90016a0 <__subdf3+0x634>
f9001534:	008006b7          	lui	a3,0x800
f9001538:	7ff00793          	li	a5,2047
f900153c:	00d36333          	or	t1,t1,a3
f9001540:	24f88a63          	beq	a7,a5,f9001794 <__subdf3+0x728>
f9001544:	03800793          	li	a5,56
f9001548:	28b7ca63          	blt	a5,a1,f90017dc <__subdf3+0x770>
f900154c:	01f00793          	li	a5,31
f9001550:	34b7c463          	blt	a5,a1,f9001898 <__subdf3+0x82c>
f9001554:	02000793          	li	a5,32
f9001558:	40b787b3          	sub	a5,a5,a1
f900155c:	00f31833          	sll	a6,t1,a5
f9001560:	00bf56b3          	srl	a3,t5,a1
f9001564:	00ff17b3          	sll	a5,t5,a5
f9001568:	00d86833          	or	a6,a6,a3
f900156c:	00f039b3          	snez	s3,a5
f9001570:	00b35333          	srl	t1,t1,a1
f9001574:	01386833          	or	a6,a6,s3
f9001578:	00670733          	add	a4,a4,t1
f900157c:	01d809b3          	add	s3,a6,t4
f9001580:	01d9b7b3          	sltu	a5,s3,t4
f9001584:	00e78633          	add	a2,a5,a4
f9001588:	00088493          	mv	s1,a7
f900158c:	eadff06f          	j	f9001438 <__subdf3+0x3cc>
f9001590:	ee081ce3          	bnez	a6,f9001488 <__subdf3+0x41c>
f9001594:	00351813          	slli	a6,a0,0x3
f9001598:	01d31793          	slli	a5,t1,0x1d
f900159c:	00385813          	srli	a6,a6,0x3
f90015a0:	00f86833          	or	a6,a6,a5
f90015a4:	00335793          	srli	a5,t1,0x3
f90015a8:	ed9ff06f          	j	f9001480 <__subdf3+0x414>
f90015ac:	00800537          	lui	a0,0x800
f90015b0:	7ff00793          	li	a5,2047
f90015b4:	00a36333          	or	t1,t1,a0
f90015b8:	daf898e3          	bne	a7,a5,f9001368 <__subdf3+0x2fc>
f90015bc:	00361613          	slli	a2,a2,0x3
f90015c0:	01d71813          	slli	a6,a4,0x1d
f90015c4:	00365613          	srli	a2,a2,0x3
f90015c8:	00c86833          	or	a6,a6,a2
f90015cc:	00375793          	srli	a5,a4,0x3
f90015d0:	00068413          	mv	s0,a3
f90015d4:	eadff06f          	j	f9001480 <__subdf3+0x414>
f90015d8:	fe170713          	addi	a4,a4,-31
f90015dc:	02000693          	li	a3,32
f90015e0:	00e7d733          	srl	a4,a5,a4
f90015e4:	00d60a63          	beq	a2,a3,f90015f8 <__subdf3+0x58c>
f90015e8:	04000693          	li	a3,64
f90015ec:	40c68633          	sub	a2,a3,a2
f90015f0:	00c79633          	sll	a2,a5,a2
f90015f4:	00c9e9b3          	or	s3,s3,a2
f90015f8:	01303833          	snez	a6,s3
f90015fc:	00e869b3          	or	s3,a6,a4
f9001600:	00000613          	li	a2,0
f9001604:	00000493          	li	s1,0
f9001608:	de5ff06f          	j	f90013ec <__subdf3+0x380>
f900160c:	01df09b3          	add	s3,t5,t4
f9001610:	00e307b3          	add	a5,t1,a4
f9001614:	01e9bf33          	sltu	t5,s3,t5
f9001618:	01e78633          	add	a2,a5,t5
f900161c:	00861793          	slli	a5,a2,0x8
f9001620:	00100493          	li	s1,1
f9001624:	dc07d4e3          	bgez	a5,f90013ec <__subdf3+0x380>
f9001628:	00200493          	li	s1,2
f900162c:	ff8007b7          	lui	a5,0xff800
f9001630:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9001634:	00f677b3          	and	a5,a2,a5
f9001638:	0019d713          	srli	a4,s3,0x1
f900163c:	0019f813          	andi	a6,s3,1
f9001640:	01076833          	or	a6,a4,a6
f9001644:	01f79993          	slli	s3,a5,0x1f
f9001648:	0109e9b3          	or	s3,s3,a6
f900164c:	0017d613          	srli	a2,a5,0x1
f9001650:	b61ff06f          	j	f90011b0 <__subdf3+0x144>
f9001654:	fe058813          	addi	a6,a1,-32
f9001658:	02000793          	li	a5,32
f900165c:	010759b3          	srl	s3,a4,a6
f9001660:	00f58a63          	beq	a1,a5,f9001674 <__subdf3+0x608>
f9001664:	04000793          	li	a5,64
f9001668:	40b785b3          	sub	a1,a5,a1
f900166c:	00b71733          	sll	a4,a4,a1
f9001670:	00eeeeb3          	or	t4,t4,a4
f9001674:	01d03833          	snez	a6,t4
f9001678:	01386833          	or	a6,a6,s3
f900167c:	ab1ff06f          	j	f900112c <__subdf3+0xc0>
f9001680:	01e36333          	or	t1,t1,t5
f9001684:	00603833          	snez	a6,t1
f9001688:	410e89b3          	sub	s3,t4,a6
f900168c:	013eb7b3          	sltu	a5,t4,s3
f9001690:	40f70633          	sub	a2,a4,a5
f9001694:	00088493          	mv	s1,a7
f9001698:	00068413          	mv	s0,a3
f900169c:	a9dff06f          	j	f9001138 <__subdf3+0xcc>
f90016a0:	01e367b3          	or	a5,t1,t5
f90016a4:	1c078863          	beqz	a5,f9001874 <__subdf3+0x808>
f90016a8:	fff58793          	addi	a5,a1,-1
f90016ac:	22078463          	beqz	a5,f90018d4 <__subdf3+0x868>
f90016b0:	7ff00693          	li	a3,2047
f90016b4:	0ed58063          	beq	a1,a3,f9001794 <__subdf3+0x728>
f90016b8:	00078593          	mv	a1,a5
f90016bc:	e89ff06f          	j	f9001544 <__subdf3+0x4d8>
f90016c0:	02000793          	li	a5,32
f90016c4:	40b787b3          	sub	a5,a5,a1
f90016c8:	00bed9b3          	srl	s3,t4,a1
f90016cc:	00f71833          	sll	a6,a4,a5
f90016d0:	00fe9eb3          	sll	t4,t4,a5
f90016d4:	01386833          	or	a6,a6,s3
f90016d8:	00b75733          	srl	a4,a4,a1
f90016dc:	01d039b3          	snez	s3,t4
f90016e0:	01386833          	or	a6,a6,s3
f90016e4:	00e30333          	add	t1,t1,a4
f90016e8:	d45ff06f          	j	f900142c <__subdf3+0x3c0>
f90016ec:	00361813          	slli	a6,a2,0x3
f90016f0:	01d71793          	slli	a5,a4,0x1d
f90016f4:	00385813          	srli	a6,a6,0x3
f90016f8:	0107e833          	or	a6,a5,a6
f90016fc:	00068413          	mv	s0,a3
f9001700:	00375793          	srli	a5,a4,0x3
f9001704:	d05ff06f          	j	f9001408 <__subdf3+0x39c>
f9001708:	08078663          	beqz	a5,f9001794 <__subdf3+0x728>
f900170c:	01d76733          	or	a4,a4,t4
f9001710:	d6071ce3          	bnez	a4,f9001488 <__subdf3+0x41c>
f9001714:	00351513          	slli	a0,a0,0x3
f9001718:	01d31813          	slli	a6,t1,0x1d
f900171c:	00355513          	srli	a0,a0,0x3
f9001720:	00a86833          	or	a6,a6,a0
f9001724:	00335793          	srli	a5,t1,0x3
f9001728:	d59ff06f          	j	f9001480 <__subdf3+0x414>
f900172c:	de080ae3          	beqz	a6,f9001520 <__subdf3+0x4b4>
f9001730:	00361813          	slli	a6,a2,0x3
f9001734:	01d71793          	slli	a5,a4,0x1d
f9001738:	00385813          	srli	a6,a6,0x3
f900173c:	00f86833          	or	a6,a6,a5
f9001740:	00068413          	mv	s0,a3
f9001744:	00375793          	srli	a5,a4,0x3
f9001748:	cc9ff06f          	j	f9001410 <__subdf3+0x3a4>
f900174c:	41df09b3          	sub	s3,t5,t4
f9001750:	40e307b3          	sub	a5,t1,a4
f9001754:	013f3f33          	sltu	t5,t5,s3
f9001758:	41e78633          	sub	a2,a5,t5
f900175c:	00100493          	li	s1,1
f9001760:	9d9ff06f          	j	f9001138 <__subdf3+0xcc>
f9001764:	00351813          	slli	a6,a0,0x3
f9001768:	01d31693          	slli	a3,t1,0x1d
f900176c:	00385813          	srli	a6,a6,0x3
f9001770:	0106e833          	or	a6,a3,a6
f9001774:	00335793          	srli	a5,t1,0x3
f9001778:	d09ff06f          	j	f9001480 <__subdf3+0x414>
f900177c:	41ee89b3          	sub	s3,t4,t5
f9001780:	40670633          	sub	a2,a4,t1
f9001784:	013eb933          	sltu	s2,t4,s3
f9001788:	41260933          	sub	s2,a2,s2
f900178c:	00068413          	mv	s0,a3
f9001790:	9bdff06f          	j	f900114c <__subdf3+0xe0>
f9001794:	00361613          	slli	a2,a2,0x3
f9001798:	01d71813          	slli	a6,a4,0x1d
f900179c:	00365613          	srli	a2,a2,0x3
f90017a0:	00c86833          	or	a6,a6,a2
f90017a4:	00375793          	srli	a5,a4,0x3
f90017a8:	cd9ff06f          	j	f9001480 <__subdf3+0x414>
f90017ac:	41df09b3          	sub	s3,t5,t4
f90017b0:	40e307b3          	sub	a5,t1,a4
f90017b4:	013f3633          	sltu	a2,t5,s3
f90017b8:	40c78633          	sub	a2,a5,a2
f90017bc:	00861793          	slli	a5,a2,0x8
f90017c0:	0c07d663          	bgez	a5,f900188c <__subdf3+0x820>
f90017c4:	41ee89b3          	sub	s3,t4,t5
f90017c8:	406707b3          	sub	a5,a4,t1
f90017cc:	013ebeb3          	sltu	t4,t4,s3
f90017d0:	41d78633          	sub	a2,a5,t4
f90017d4:	00068413          	mv	s0,a3
f90017d8:	9d9ff06f          	j	f90011b0 <__subdf3+0x144>
f90017dc:	01e36333          	or	t1,t1,t5
f90017e0:	00603833          	snez	a6,t1
f90017e4:	d99ff06f          	j	f900157c <__subdf3+0x510>
f90017e8:	fe058813          	addi	a6,a1,-32
f90017ec:	02000793          	li	a5,32
f90017f0:	010359b3          	srl	s3,t1,a6
f90017f4:	00f58a63          	beq	a1,a5,f9001808 <__subdf3+0x79c>
f90017f8:	04000793          	li	a5,64
f90017fc:	40b785b3          	sub	a1,a5,a1
f9001800:	00b31333          	sll	t1,t1,a1
f9001804:	006f6f33          	or	t5,t5,t1
f9001808:	01e03833          	snez	a6,t5
f900180c:	01386833          	or	a6,a6,s3
f9001810:	e79ff06f          	j	f9001688 <__subdf3+0x61c>
f9001814:	41ee89b3          	sub	s3,t4,t5
f9001818:	406707b3          	sub	a5,a4,t1
f900181c:	013ebeb3          	sltu	t4,t4,s3
f9001820:	41d78633          	sub	a2,a5,t4
f9001824:	00068413          	mv	s0,a3
f9001828:	00100493          	li	s1,1
f900182c:	90dff06f          	j	f9001138 <__subdf3+0xcc>
f9001830:	00361813          	slli	a6,a2,0x3
f9001834:	01d71793          	slli	a5,a4,0x1d
f9001838:	00385813          	srli	a6,a6,0x3
f900183c:	00f86833          	or	a6,a6,a5
f9001840:	00375793          	srli	a5,a4,0x3
f9001844:	bcdff06f          	j	f9001410 <__subdf3+0x3a4>
f9001848:	01df09b3          	add	s3,t5,t4
f900184c:	00e307b3          	add	a5,t1,a4
f9001850:	01e9bf33          	sltu	t5,s3,t5
f9001854:	01e78633          	add	a2,a5,t5
f9001858:	00861793          	slli	a5,a2,0x8
f900185c:	b807d8e3          	bgez	a5,f90013ec <__subdf3+0x380>
f9001860:	ff8007b7          	lui	a5,0xff800
f9001864:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9001868:	00f67633          	and	a2,a2,a5
f900186c:	00100493          	li	s1,1
f9001870:	b7dff06f          	j	f90013ec <__subdf3+0x380>
f9001874:	00361613          	slli	a2,a2,0x3
f9001878:	01d71813          	slli	a6,a4,0x1d
f900187c:	00365613          	srli	a2,a2,0x3
f9001880:	00c86833          	or	a6,a6,a2
f9001884:	00375793          	srli	a5,a4,0x3
f9001888:	b81ff06f          	j	f9001408 <__subdf3+0x39c>
f900188c:	00c9e833          	or	a6,s3,a2
f9001890:	c80808e3          	beqz	a6,f9001520 <__subdf3+0x4b4>
f9001894:	b59ff06f          	j	f90013ec <__subdf3+0x380>
f9001898:	fe058813          	addi	a6,a1,-32
f900189c:	02000793          	li	a5,32
f90018a0:	010359b3          	srl	s3,t1,a6
f90018a4:	00f58a63          	beq	a1,a5,f90018b8 <__subdf3+0x84c>
f90018a8:	04000793          	li	a5,64
f90018ac:	40b785b3          	sub	a1,a5,a1
f90018b0:	00b31333          	sll	t1,t1,a1
f90018b4:	006f6f33          	or	t5,t5,t1
f90018b8:	01e03833          	snez	a6,t5
f90018bc:	01386833          	or	a6,a6,s3
f90018c0:	cbdff06f          	j	f900157c <__subdf3+0x510>
f90018c4:	00000413          	li	s0,0
f90018c8:	7ff00713          	li	a4,2047
f90018cc:	000807b7          	lui	a5,0x80
f90018d0:	941ff06f          	j	f9001210 <__subdf3+0x1a4>
f90018d4:	01df09b3          	add	s3,t5,t4
f90018d8:	00e307b3          	add	a5,t1,a4
f90018dc:	01d9beb3          	sltu	t4,s3,t4
f90018e0:	01d78633          	add	a2,a5,t4
f90018e4:	d39ff06f          	j	f900161c <__subdf3+0x5b0>

f90018e8 <__fixdfsi>:
f90018e8:	0145d793          	srli	a5,a1,0x14
f90018ec:	001006b7          	lui	a3,0x100
f90018f0:	fff68713          	addi	a4,a3,-1 # fffff <__stack_size+0xfdfff>
f90018f4:	7ff7f793          	andi	a5,a5,2047
f90018f8:	3fe00613          	li	a2,1022
f90018fc:	00b77733          	and	a4,a4,a1
f9001900:	01f5d593          	srli	a1,a1,0x1f
f9001904:	00f65e63          	bge	a2,a5,f9001920 <__fixdfsi+0x38>
f9001908:	41d00613          	li	a2,1053
f900190c:	00f65e63          	bge	a2,a5,f9001928 <__fixdfsi+0x40>
f9001910:	80000537          	lui	a0,0x80000
f9001914:	fff54513          	not	a0,a0
f9001918:	00a58533          	add	a0,a1,a0
f900191c:	00008067          	ret
f9001920:	00000513          	li	a0,0
f9001924:	00008067          	ret
f9001928:	43300613          	li	a2,1075
f900192c:	40f60633          	sub	a2,a2,a5
f9001930:	01f00813          	li	a6,31
f9001934:	00d76733          	or	a4,a4,a3
f9001938:	02c85063          	bge	a6,a2,f9001958 <__fixdfsi+0x70>
f900193c:	41300693          	li	a3,1043
f9001940:	40f687b3          	sub	a5,a3,a5
f9001944:	00f757b3          	srl	a5,a4,a5
f9001948:	40f00533          	neg	a0,a5
f900194c:	fc059ce3          	bnez	a1,f9001924 <__fixdfsi+0x3c>
f9001950:	00078513          	mv	a0,a5
f9001954:	00008067          	ret
f9001958:	bed78793          	addi	a5,a5,-1043 # 7fbed <__stack_size+0x7dbed>
f900195c:	00f717b3          	sll	a5,a4,a5
f9001960:	00c55533          	srl	a0,a0,a2
f9001964:	00a7e7b3          	or	a5,a5,a0
f9001968:	fe1ff06f          	j	f9001948 <__fixdfsi+0x60>

f900196c <__floatsidf>:
f900196c:	ff010113          	addi	sp,sp,-16
f9001970:	00112623          	sw	ra,12(sp)
f9001974:	00812423          	sw	s0,8(sp)
f9001978:	00912223          	sw	s1,4(sp)
f900197c:	04050a63          	beqz	a0,f90019d0 <__floatsidf+0x64>
f9001980:	41f55793          	srai	a5,a0,0x1f
f9001984:	00a7c4b3          	xor	s1,a5,a0
f9001988:	40f484b3          	sub	s1,s1,a5
f900198c:	00050413          	mv	s0,a0
f9001990:	00048513          	mv	a0,s1
f9001994:	660000ef          	jal	ra,f9001ff4 <__clzsi2>
f9001998:	41e00693          	li	a3,1054
f900199c:	40a686b3          	sub	a3,a3,a0
f90019a0:	00a00793          	li	a5,10
f90019a4:	01f45413          	srli	s0,s0,0x1f
f90019a8:	7ff6f693          	andi	a3,a3,2047
f90019ac:	06a7c463          	blt	a5,a0,f9001a14 <__floatsidf+0xa8>
f90019b0:	00b00713          	li	a4,11
f90019b4:	40a70733          	sub	a4,a4,a0
f90019b8:	00e4d7b3          	srl	a5,s1,a4
f90019bc:	01550513          	addi	a0,a0,21 # 80000015 <__freertos_irq_stack_top+0x86ff8b95>
f90019c0:	00c79793          	slli	a5,a5,0xc
f90019c4:	00a494b3          	sll	s1,s1,a0
f90019c8:	00c7d793          	srli	a5,a5,0xc
f90019cc:	0140006f          	j	f90019e0 <__floatsidf+0x74>
f90019d0:	00000413          	li	s0,0
f90019d4:	00000693          	li	a3,0
f90019d8:	00000793          	li	a5,0
f90019dc:	00000493          	li	s1,0
f90019e0:	00c79793          	slli	a5,a5,0xc
f90019e4:	01469693          	slli	a3,a3,0x14
f90019e8:	00c7d793          	srli	a5,a5,0xc
f90019ec:	01f41413          	slli	s0,s0,0x1f
f90019f0:	00d7e7b3          	or	a5,a5,a3
f90019f4:	0087e7b3          	or	a5,a5,s0
f90019f8:	00c12083          	lw	ra,12(sp)
f90019fc:	00812403          	lw	s0,8(sp)
f9001a00:	00048513          	mv	a0,s1
f9001a04:	00078593          	mv	a1,a5
f9001a08:	00412483          	lw	s1,4(sp)
f9001a0c:	01010113          	addi	sp,sp,16
f9001a10:	00008067          	ret
f9001a14:	ff550513          	addi	a0,a0,-11
f9001a18:	00a497b3          	sll	a5,s1,a0
f9001a1c:	00c79793          	slli	a5,a5,0xc
f9001a20:	00c7d793          	srli	a5,a5,0xc
f9001a24:	00000493          	li	s1,0
f9001a28:	fb9ff06f          	j	f90019e0 <__floatsidf+0x74>

f9001a2c <__gesf2>:
f9001a2c:	01755693          	srli	a3,a0,0x17
f9001a30:	008007b7          	lui	a5,0x800
f9001a34:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fdfff>
f9001a38:	0175d613          	srli	a2,a1,0x17
f9001a3c:	0ff6f693          	andi	a3,a3,255
f9001a40:	0ff00813          	li	a6,255
f9001a44:	00a7f8b3          	and	a7,a5,a0
f9001a48:	01f55713          	srli	a4,a0,0x1f
f9001a4c:	00b7f7b3          	and	a5,a5,a1
f9001a50:	0ff67613          	andi	a2,a2,255
f9001a54:	01f5d513          	srli	a0,a1,0x1f
f9001a58:	03068a63          	beq	a3,a6,f9001a8c <__gesf2+0x60>
f9001a5c:	03060263          	beq	a2,a6,f9001a80 <__gesf2+0x54>
f9001a60:	02069a63          	bnez	a3,f9001a94 <__gesf2+0x68>
f9001a64:	00061463          	bnez	a2,f9001a6c <__gesf2+0x40>
f9001a68:	04078a63          	beqz	a5,f9001abc <__gesf2+0x90>
f9001a6c:	04088263          	beqz	a7,f9001ab0 <__gesf2+0x84>
f9001a70:	06a70063          	beq	a4,a0,f9001ad0 <__gesf2+0xa4>
f9001a74:	00100513          	li	a0,1
f9001a78:	02071e63          	bnez	a4,f9001ab4 <__gesf2+0x88>
f9001a7c:	00008067          	ret
f9001a80:	fe0780e3          	beqz	a5,f9001a60 <__gesf2+0x34>
f9001a84:	ffe00513          	li	a0,-2
f9001a88:	00008067          	ret
f9001a8c:	fe089ce3          	bnez	a7,f9001a84 <__gesf2+0x58>
f9001a90:	02d60c63          	beq	a2,a3,f9001ac8 <__gesf2+0x9c>
f9001a94:	00061463          	bnez	a2,f9001a9c <__gesf2+0x70>
f9001a98:	fc078ee3          	beqz	a5,f9001a74 <__gesf2+0x48>
f9001a9c:	fca71ce3          	bne	a4,a0,f9001a74 <__gesf2+0x48>
f9001aa0:	02d65a63          	bge	a2,a3,f9001ad4 <__gesf2+0xa8>
f9001aa4:	00051863          	bnez	a0,f9001ab4 <__gesf2+0x88>
f9001aa8:	00100513          	li	a0,1
f9001aac:	00008067          	ret
f9001ab0:	fc0516e3          	bnez	a0,f9001a7c <__gesf2+0x50>
f9001ab4:	fff00513          	li	a0,-1
f9001ab8:	00008067          	ret
f9001abc:	00000513          	li	a0,0
f9001ac0:	fa089ae3          	bnez	a7,f9001a74 <__gesf2+0x48>
f9001ac4:	00008067          	ret
f9001ac8:	fc078ae3          	beqz	a5,f9001a9c <__gesf2+0x70>
f9001acc:	fb9ff06f          	j	f9001a84 <__gesf2+0x58>
f9001ad0:	00000693          	li	a3,0
f9001ad4:	00c6c863          	blt	a3,a2,f9001ae4 <__gesf2+0xb8>
f9001ad8:	f917eee3          	bltu	a5,a7,f9001a74 <__gesf2+0x48>
f9001adc:	00000513          	li	a0,0
f9001ae0:	f8f8fee3          	bgeu	a7,a5,f9001a7c <__gesf2+0x50>
f9001ae4:	fc0708e3          	beqz	a4,f9001ab4 <__gesf2+0x88>
f9001ae8:	00070513          	mv	a0,a4
f9001aec:	00008067          	ret

f9001af0 <__lesf2>:
f9001af0:	01755693          	srli	a3,a0,0x17
f9001af4:	008007b7          	lui	a5,0x800
f9001af8:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fdfff>
f9001afc:	0175d613          	srli	a2,a1,0x17
f9001b00:	0ff6f693          	andi	a3,a3,255
f9001b04:	0ff00813          	li	a6,255
f9001b08:	00a7f8b3          	and	a7,a5,a0
f9001b0c:	01f55713          	srli	a4,a0,0x1f
f9001b10:	00b7f7b3          	and	a5,a5,a1
f9001b14:	0ff67613          	andi	a2,a2,255
f9001b18:	01f5d513          	srli	a0,a1,0x1f
f9001b1c:	05068263          	beq	a3,a6,f9001b60 <__lesf2+0x70>
f9001b20:	01060e63          	beq	a2,a6,f9001b3c <__lesf2+0x4c>
f9001b24:	04069263          	bnez	a3,f9001b68 <__lesf2+0x78>
f9001b28:	02061063          	bnez	a2,f9001b48 <__lesf2+0x58>
f9001b2c:	00079e63          	bnez	a5,f9001b48 <__lesf2+0x58>
f9001b30:	00000513          	li	a0,0
f9001b34:	00089e63          	bnez	a7,f9001b50 <__lesf2+0x60>
f9001b38:	00008067          	ret
f9001b3c:	fe0784e3          	beqz	a5,f9001b24 <__lesf2+0x34>
f9001b40:	00200513          	li	a0,2
f9001b44:	00008067          	ret
f9001b48:	02088e63          	beqz	a7,f9001b84 <__lesf2+0x94>
f9001b4c:	04a70463          	beq	a4,a0,f9001b94 <__lesf2+0xa4>
f9001b50:	00100513          	li	a0,1
f9001b54:	fe0702e3          	beqz	a4,f9001b38 <__lesf2+0x48>
f9001b58:	fff00513          	li	a0,-1
f9001b5c:	00008067          	ret
f9001b60:	fe0890e3          	bnez	a7,f9001b40 <__lesf2+0x50>
f9001b64:	02d60463          	beq	a2,a3,f9001b8c <__lesf2+0x9c>
f9001b68:	00061463          	bnez	a2,f9001b70 <__lesf2+0x80>
f9001b6c:	fe0782e3          	beqz	a5,f9001b50 <__lesf2+0x60>
f9001b70:	fea710e3          	bne	a4,a0,f9001b50 <__lesf2+0x60>
f9001b74:	02d65263          	bge	a2,a3,f9001b98 <__lesf2+0xa8>
f9001b78:	fe0510e3          	bnez	a0,f9001b58 <__lesf2+0x68>
f9001b7c:	00100513          	li	a0,1
f9001b80:	00008067          	ret
f9001b84:	fc050ae3          	beqz	a0,f9001b58 <__lesf2+0x68>
f9001b88:	00008067          	ret
f9001b8c:	fe0782e3          	beqz	a5,f9001b70 <__lesf2+0x80>
f9001b90:	fb1ff06f          	j	f9001b40 <__lesf2+0x50>
f9001b94:	00000693          	li	a3,0
f9001b98:	00c6c863          	blt	a3,a2,f9001ba8 <__lesf2+0xb8>
f9001b9c:	fb17eae3          	bltu	a5,a7,f9001b50 <__lesf2+0x60>
f9001ba0:	00000513          	li	a0,0
f9001ba4:	f8f8fae3          	bgeu	a7,a5,f9001b38 <__lesf2+0x48>
f9001ba8:	fa0708e3          	beqz	a4,f9001b58 <__lesf2+0x68>
f9001bac:	00070513          	mv	a0,a4
f9001bb0:	00008067          	ret

f9001bb4 <__fixsfsi>:
f9001bb4:	00800637          	lui	a2,0x800
f9001bb8:	01755713          	srli	a4,a0,0x17
f9001bbc:	fff60793          	addi	a5,a2,-1 # 7fffff <__stack_size+0x7fdfff>
f9001bc0:	0ff77713          	andi	a4,a4,255
f9001bc4:	07e00593          	li	a1,126
f9001bc8:	00a7f6b3          	and	a3,a5,a0
f9001bcc:	01f55793          	srli	a5,a0,0x1f
f9001bd0:	00e5fe63          	bgeu	a1,a4,f9001bec <__fixsfsi+0x38>
f9001bd4:	09d00593          	li	a1,157
f9001bd8:	00e5fe63          	bgeu	a1,a4,f9001bf4 <__fixsfsi+0x40>
f9001bdc:	80000537          	lui	a0,0x80000
f9001be0:	fff54513          	not	a0,a0
f9001be4:	00a78533          	add	a0,a5,a0
f9001be8:	00008067          	ret
f9001bec:	00000513          	li	a0,0
f9001bf0:	00008067          	ret
f9001bf4:	09500593          	li	a1,149
f9001bf8:	00c6e6b3          	or	a3,a3,a2
f9001bfc:	02e5c063          	blt	a1,a4,f9001c1c <__fixsfsi+0x68>
f9001c00:	09600613          	li	a2,150
f9001c04:	40e60733          	sub	a4,a2,a4
f9001c08:	00e6d733          	srl	a4,a3,a4
f9001c0c:	40e00533          	neg	a0,a4
f9001c10:	fe0790e3          	bnez	a5,f9001bf0 <__fixsfsi+0x3c>
f9001c14:	00070513          	mv	a0,a4
f9001c18:	00008067          	ret
f9001c1c:	f6a70713          	addi	a4,a4,-150
f9001c20:	00e69733          	sll	a4,a3,a4
f9001c24:	fe9ff06f          	j	f9001c0c <__fixsfsi+0x58>

f9001c28 <__extendsfdf2>:
f9001c28:	01755713          	srli	a4,a0,0x17
f9001c2c:	0ff77713          	andi	a4,a4,255
f9001c30:	ff010113          	addi	sp,sp,-16
f9001c34:	00170793          	addi	a5,a4,1
f9001c38:	00812423          	sw	s0,8(sp)
f9001c3c:	00912223          	sw	s1,4(sp)
f9001c40:	00951413          	slli	s0,a0,0x9
f9001c44:	00112623          	sw	ra,12(sp)
f9001c48:	0fe7f793          	andi	a5,a5,254
f9001c4c:	00945413          	srli	s0,s0,0x9
f9001c50:	01f55493          	srli	s1,a0,0x1f
f9001c54:	04078263          	beqz	a5,f9001c98 <__extendsfdf2+0x70>
f9001c58:	00345793          	srli	a5,s0,0x3
f9001c5c:	38070713          	addi	a4,a4,896
f9001c60:	01d41413          	slli	s0,s0,0x1d
f9001c64:	00c79793          	slli	a5,a5,0xc
f9001c68:	01471713          	slli	a4,a4,0x14
f9001c6c:	00c7d793          	srli	a5,a5,0xc
f9001c70:	01f49513          	slli	a0,s1,0x1f
f9001c74:	00e7e7b3          	or	a5,a5,a4
f9001c78:	00a7e7b3          	or	a5,a5,a0
f9001c7c:	00c12083          	lw	ra,12(sp)
f9001c80:	00040513          	mv	a0,s0
f9001c84:	00812403          	lw	s0,8(sp)
f9001c88:	00412483          	lw	s1,4(sp)
f9001c8c:	00078593          	mv	a1,a5
f9001c90:	01010113          	addi	sp,sp,16
f9001c94:	00008067          	ret
f9001c98:	04071263          	bnez	a4,f9001cdc <__extendsfdf2+0xb4>
f9001c9c:	06040863          	beqz	s0,f9001d0c <__extendsfdf2+0xe4>
f9001ca0:	00040513          	mv	a0,s0
f9001ca4:	350000ef          	jal	ra,f9001ff4 <__clzsi2>
f9001ca8:	00a00793          	li	a5,10
f9001cac:	06a7c663          	blt	a5,a0,f9001d18 <__extendsfdf2+0xf0>
f9001cb0:	00b00713          	li	a4,11
f9001cb4:	40a70733          	sub	a4,a4,a0
f9001cb8:	01550793          	addi	a5,a0,21 # 80000015 <__freertos_irq_stack_top+0x86ff8b95>
f9001cbc:	00e45733          	srl	a4,s0,a4
f9001cc0:	00f41433          	sll	s0,s0,a5
f9001cc4:	00c71793          	slli	a5,a4,0xc
f9001cc8:	38900713          	li	a4,905
f9001ccc:	40a70733          	sub	a4,a4,a0
f9001cd0:	00c7d793          	srli	a5,a5,0xc
f9001cd4:	7ff77713          	andi	a4,a4,2047
f9001cd8:	f8dff06f          	j	f9001c64 <__extendsfdf2+0x3c>
f9001cdc:	02040263          	beqz	s0,f9001d00 <__extendsfdf2+0xd8>
f9001ce0:	00345713          	srli	a4,s0,0x3
f9001ce4:	000807b7          	lui	a5,0x80
f9001ce8:	00f767b3          	or	a5,a4,a5
f9001cec:	00c79793          	slli	a5,a5,0xc
f9001cf0:	01d41413          	slli	s0,s0,0x1d
f9001cf4:	00c7d793          	srli	a5,a5,0xc
f9001cf8:	7ff00713          	li	a4,2047
f9001cfc:	f69ff06f          	j	f9001c64 <__extendsfdf2+0x3c>
f9001d00:	7ff00713          	li	a4,2047
f9001d04:	00000793          	li	a5,0
f9001d08:	f5dff06f          	j	f9001c64 <__extendsfdf2+0x3c>
f9001d0c:	00000713          	li	a4,0
f9001d10:	00000793          	li	a5,0
f9001d14:	f51ff06f          	j	f9001c64 <__extendsfdf2+0x3c>
f9001d18:	ff550713          	addi	a4,a0,-11
f9001d1c:	00e41733          	sll	a4,s0,a4
f9001d20:	00000413          	li	s0,0
f9001d24:	fa1ff06f          	j	f9001cc4 <__extendsfdf2+0x9c>

f9001d28 <__truncdfsf2>:
f9001d28:	0145d693          	srli	a3,a1,0x14
f9001d2c:	00c59793          	slli	a5,a1,0xc
f9001d30:	7ff6f693          	andi	a3,a3,2047
f9001d34:	00c7d793          	srli	a5,a5,0xc
f9001d38:	00168613          	addi	a2,a3,1
f9001d3c:	00379793          	slli	a5,a5,0x3
f9001d40:	01d55713          	srli	a4,a0,0x1d
f9001d44:	7fe67613          	andi	a2,a2,2046
f9001d48:	01f5d593          	srli	a1,a1,0x1f
f9001d4c:	00f76733          	or	a4,a4,a5
f9001d50:	00351893          	slli	a7,a0,0x3
f9001d54:	0a060463          	beqz	a2,f9001dfc <__truncdfsf2+0xd4>
f9001d58:	c8068813          	addi	a6,a3,-896
f9001d5c:	0fe00793          	li	a5,254
f9001d60:	0307d463          	bge	a5,a6,f9001d88 <__truncdfsf2+0x60>
f9001d64:	00000793          	li	a5,0
f9001d68:	00979513          	slli	a0,a5,0x9
f9001d6c:	0ff00693          	li	a3,255
f9001d70:	01769693          	slli	a3,a3,0x17
f9001d74:	00955513          	srli	a0,a0,0x9
f9001d78:	01f59593          	slli	a1,a1,0x1f
f9001d7c:	00d56533          	or	a0,a0,a3
f9001d80:	00b56533          	or	a0,a0,a1
f9001d84:	00008067          	ret
f9001d88:	0f005e63          	blez	a6,f9001e84 <__truncdfsf2+0x15c>
f9001d8c:	00651793          	slli	a5,a0,0x6
f9001d90:	00371713          	slli	a4,a4,0x3
f9001d94:	00f037b3          	snez	a5,a5
f9001d98:	00e7e7b3          	or	a5,a5,a4
f9001d9c:	01d8d893          	srli	a7,a7,0x1d
f9001da0:	0117e7b3          	or	a5,a5,a7
f9001da4:	0077f713          	andi	a4,a5,7
f9001da8:	16070663          	beqz	a4,f9001f14 <__truncdfsf2+0x1ec>
f9001dac:	00f7f713          	andi	a4,a5,15
f9001db0:	00400693          	li	a3,4
f9001db4:	00d70463          	beq	a4,a3,f9001dbc <__truncdfsf2+0x94>
f9001db8:	00478793          	addi	a5,a5,4 # 80004 <__stack_size+0x7e004>
f9001dbc:	04000737          	lui	a4,0x4000
f9001dc0:	00e7f733          	and	a4,a5,a4
f9001dc4:	14070863          	beqz	a4,f9001f14 <__truncdfsf2+0x1ec>
f9001dc8:	00180713          	addi	a4,a6,1
f9001dcc:	0ff00613          	li	a2,255
f9001dd0:	0ff77693          	andi	a3,a4,255
f9001dd4:	f8c708e3          	beq	a4,a2,f9001d64 <__truncdfsf2+0x3c>
f9001dd8:	00679793          	slli	a5,a5,0x6
f9001ddc:	0097d793          	srli	a5,a5,0x9
f9001de0:	00979513          	slli	a0,a5,0x9
f9001de4:	01769693          	slli	a3,a3,0x17
f9001de8:	00955513          	srli	a0,a0,0x9
f9001dec:	01f59593          	slli	a1,a1,0x1f
f9001df0:	00d56533          	or	a0,a0,a3
f9001df4:	00b56533          	or	a0,a0,a1
f9001df8:	00008067          	ret
f9001dfc:	011767b3          	or	a5,a4,a7
f9001e00:	02069a63          	bnez	a3,f9001e34 <__truncdfsf2+0x10c>
f9001e04:	04078e63          	beqz	a5,f9001e60 <__truncdfsf2+0x138>
f9001e08:	00500793          	li	a5,5
f9001e0c:	00679793          	slli	a5,a5,0x6
f9001e10:	0097d793          	srli	a5,a5,0x9
f9001e14:	00979513          	slli	a0,a5,0x9
f9001e18:	0ff6f693          	andi	a3,a3,255
f9001e1c:	01769693          	slli	a3,a3,0x17
f9001e20:	00955513          	srli	a0,a0,0x9
f9001e24:	01f59593          	slli	a1,a1,0x1f
f9001e28:	00d56533          	or	a0,a0,a3
f9001e2c:	00b56533          	or	a0,a0,a1
f9001e30:	00008067          	ret
f9001e34:	f20788e3          	beqz	a5,f9001d64 <__truncdfsf2+0x3c>
f9001e38:	004007b7          	lui	a5,0x400
f9001e3c:	00979513          	slli	a0,a5,0x9
f9001e40:	0ff00693          	li	a3,255
f9001e44:	01769693          	slli	a3,a3,0x17
f9001e48:	00000593          	li	a1,0
f9001e4c:	00955513          	srli	a0,a0,0x9
f9001e50:	01f59593          	slli	a1,a1,0x1f
f9001e54:	00d56533          	or	a0,a0,a3
f9001e58:	00b56533          	or	a0,a0,a1
f9001e5c:	00008067          	ret
f9001e60:	00000793          	li	a5,0
f9001e64:	00979513          	slli	a0,a5,0x9
f9001e68:	00000693          	li	a3,0
f9001e6c:	01769693          	slli	a3,a3,0x17
f9001e70:	00955513          	srli	a0,a0,0x9
f9001e74:	01f59593          	slli	a1,a1,0x1f
f9001e78:	00d56533          	or	a0,a0,a3
f9001e7c:	00b56533          	or	a0,a0,a1
f9001e80:	00008067          	ret
f9001e84:	fe900793          	li	a5,-23
f9001e88:	06f84263          	blt	a6,a5,f9001eec <__truncdfsf2+0x1c4>
f9001e8c:	01e00793          	li	a5,30
f9001e90:	00800637          	lui	a2,0x800
f9001e94:	410787b3          	sub	a5,a5,a6
f9001e98:	01f00513          	li	a0,31
f9001e9c:	00c76633          	or	a2,a4,a2
f9001ea0:	04f55a63          	bge	a0,a5,f9001ef4 <__truncdfsf2+0x1cc>
f9001ea4:	ffe00713          	li	a4,-2
f9001ea8:	41070733          	sub	a4,a4,a6
f9001eac:	02000513          	li	a0,32
f9001eb0:	00e65733          	srl	a4,a2,a4
f9001eb4:	00a78863          	beq	a5,a0,f9001ec4 <__truncdfsf2+0x19c>
f9001eb8:	ca268693          	addi	a3,a3,-862
f9001ebc:	00d616b3          	sll	a3,a2,a3
f9001ec0:	00d8e8b3          	or	a7,a7,a3
f9001ec4:	011037b3          	snez	a5,a7
f9001ec8:	00e7e7b3          	or	a5,a5,a4
f9001ecc:	0077f713          	andi	a4,a5,7
f9001ed0:	00000813          	li	a6,0
f9001ed4:	ec071ce3          	bnez	a4,f9001dac <__truncdfsf2+0x84>
f9001ed8:	00579713          	slli	a4,a5,0x5
f9001edc:	00100693          	li	a3,1
f9001ee0:	ee074ce3          	bltz	a4,f9001dd8 <__truncdfsf2+0xb0>
f9001ee4:	00000693          	li	a3,0
f9001ee8:	f25ff06f          	j	f9001e0c <__truncdfsf2+0xe4>
f9001eec:	00000693          	li	a3,0
f9001ef0:	f19ff06f          	j	f9001e08 <__truncdfsf2+0xe0>
f9001ef4:	c8268693          	addi	a3,a3,-894
f9001ef8:	00d89733          	sll	a4,a7,a3
f9001efc:	00e03733          	snez	a4,a4
f9001f00:	00d616b3          	sll	a3,a2,a3
f9001f04:	00f8d8b3          	srl	a7,a7,a5
f9001f08:	00d767b3          	or	a5,a4,a3
f9001f0c:	00f8e7b3          	or	a5,a7,a5
f9001f10:	fbdff06f          	j	f9001ecc <__truncdfsf2+0x1a4>
f9001f14:	00080693          	mv	a3,a6
f9001f18:	ef5ff06f          	j	f9001e0c <__truncdfsf2+0xe4>

f9001f1c <__mulsi3>:
f9001f1c:	00050613          	mv	a2,a0
f9001f20:	00000513          	li	a0,0
f9001f24:	0015f693          	andi	a3,a1,1
f9001f28:	00068463          	beqz	a3,f9001f30 <__mulsi3+0x14>
f9001f2c:	00c50533          	add	a0,a0,a2
f9001f30:	0015d593          	srli	a1,a1,0x1
f9001f34:	00161613          	slli	a2,a2,0x1
f9001f38:	fe0596e3          	bnez	a1,f9001f24 <__mulsi3+0x8>
f9001f3c:	00008067          	ret

f9001f40 <__divsi3>:
f9001f40:	06054063          	bltz	a0,f9001fa0 <__umodsi3+0x10>
f9001f44:	0605c663          	bltz	a1,f9001fb0 <__umodsi3+0x20>

f9001f48 <__udivsi3>:
f9001f48:	00058613          	mv	a2,a1
f9001f4c:	00050593          	mv	a1,a0
f9001f50:	fff00513          	li	a0,-1
f9001f54:	02060c63          	beqz	a2,f9001f8c <__udivsi3+0x44>
f9001f58:	00100693          	li	a3,1
f9001f5c:	00b67a63          	bgeu	a2,a1,f9001f70 <__udivsi3+0x28>
f9001f60:	00c05863          	blez	a2,f9001f70 <__udivsi3+0x28>
f9001f64:	00161613          	slli	a2,a2,0x1
f9001f68:	00169693          	slli	a3,a3,0x1
f9001f6c:	feb66ae3          	bltu	a2,a1,f9001f60 <__udivsi3+0x18>
f9001f70:	00000513          	li	a0,0
f9001f74:	00c5e663          	bltu	a1,a2,f9001f80 <__udivsi3+0x38>
f9001f78:	40c585b3          	sub	a1,a1,a2
f9001f7c:	00d56533          	or	a0,a0,a3
f9001f80:	0016d693          	srli	a3,a3,0x1
f9001f84:	00165613          	srli	a2,a2,0x1
f9001f88:	fe0696e3          	bnez	a3,f9001f74 <__udivsi3+0x2c>
f9001f8c:	00008067          	ret

f9001f90 <__umodsi3>:
f9001f90:	00008293          	mv	t0,ra
f9001f94:	fb5ff0ef          	jal	ra,f9001f48 <__udivsi3>
f9001f98:	00058513          	mv	a0,a1
f9001f9c:	00028067          	jr	t0
f9001fa0:	40a00533          	neg	a0,a0
f9001fa4:	0005d863          	bgez	a1,f9001fb4 <__umodsi3+0x24>
f9001fa8:	40b005b3          	neg	a1,a1
f9001fac:	f9dff06f          	j	f9001f48 <__udivsi3>
f9001fb0:	40b005b3          	neg	a1,a1
f9001fb4:	00008293          	mv	t0,ra
f9001fb8:	f91ff0ef          	jal	ra,f9001f48 <__udivsi3>
f9001fbc:	40a00533          	neg	a0,a0
f9001fc0:	00028067          	jr	t0

f9001fc4 <__modsi3>:
f9001fc4:	00008293          	mv	t0,ra
f9001fc8:	0005ca63          	bltz	a1,f9001fdc <__modsi3+0x18>
f9001fcc:	00054c63          	bltz	a0,f9001fe4 <__modsi3+0x20>
f9001fd0:	f79ff0ef          	jal	ra,f9001f48 <__udivsi3>
f9001fd4:	00058513          	mv	a0,a1
f9001fd8:	00028067          	jr	t0
f9001fdc:	40b005b3          	neg	a1,a1
f9001fe0:	fe0558e3          	bgez	a0,f9001fd0 <__modsi3+0xc>
f9001fe4:	40a00533          	neg	a0,a0
f9001fe8:	f61ff0ef          	jal	ra,f9001f48 <__udivsi3>
f9001fec:	40b00533          	neg	a0,a1
f9001ff0:	00028067          	jr	t0

f9001ff4 <__clzsi2>:
f9001ff4:	000107b7          	lui	a5,0x10
f9001ff8:	04f57463          	bgeu	a0,a5,f9002040 <__clzsi2+0x4c>
f9001ffc:	0ff00793          	li	a5,255
f9002000:	02000713          	li	a4,32
f9002004:	00a7ee63          	bltu	a5,a0,f9002020 <__clzsi2+0x2c>
f9002008:	00003797          	auipc	a5,0x3
f900200c:	d8078793          	addi	a5,a5,-640 # f9004d88 <__clz_tab>
f9002010:	00a787b3          	add	a5,a5,a0
f9002014:	0007c503          	lbu	a0,0(a5)
f9002018:	40a70533          	sub	a0,a4,a0
f900201c:	00008067          	ret
f9002020:	00855513          	srli	a0,a0,0x8
f9002024:	00003797          	auipc	a5,0x3
f9002028:	d6478793          	addi	a5,a5,-668 # f9004d88 <__clz_tab>
f900202c:	00a787b3          	add	a5,a5,a0
f9002030:	0007c503          	lbu	a0,0(a5)
f9002034:	01800713          	li	a4,24
f9002038:	40a70533          	sub	a0,a4,a0
f900203c:	00008067          	ret
f9002040:	010007b7          	lui	a5,0x1000
f9002044:	02f56263          	bltu	a0,a5,f9002068 <__clzsi2+0x74>
f9002048:	01855513          	srli	a0,a0,0x18
f900204c:	00003797          	auipc	a5,0x3
f9002050:	d3c78793          	addi	a5,a5,-708 # f9004d88 <__clz_tab>
f9002054:	00a787b3          	add	a5,a5,a0
f9002058:	0007c503          	lbu	a0,0(a5)
f900205c:	00800713          	li	a4,8
f9002060:	40a70533          	sub	a0,a4,a0
f9002064:	00008067          	ret
f9002068:	01055513          	srli	a0,a0,0x10
f900206c:	00003797          	auipc	a5,0x3
f9002070:	d1c78793          	addi	a5,a5,-740 # f9004d88 <__clz_tab>
f9002074:	00a787b3          	add	a5,a5,a0
f9002078:	0007c503          	lbu	a0,0(a5)
f900207c:	01000713          	li	a4,16
f9002080:	40a70533          	sub	a0,a4,a0
f9002084:	00008067          	ret

f9002088 <pow>:
f9002088:	fe010113          	addi	sp,sp,-32
f900208c:	00812c23          	sw	s0,24(sp)
f9002090:	00912a23          	sw	s1,20(sp)
f9002094:	01212823          	sw	s2,16(sp)
f9002098:	01312623          	sw	s3,12(sp)
f900209c:	01412423          	sw	s4,8(sp)
f90020a0:	01512223          	sw	s5,4(sp)
f90020a4:	00112e23          	sw	ra,28(sp)
f90020a8:	00050913          	mv	s2,a0
f90020ac:	00058993          	mv	s3,a1
f90020b0:	00060413          	mv	s0,a2
f90020b4:	00068493          	mv	s1,a3
f90020b8:	240000ef          	jal	ra,f90022f8 <__ieee754_pow>
f90020bc:	81018793          	addi	a5,gp,-2032 # f9005448 <__fdlib_version>
f90020c0:	0007a703          	lw	a4,0(a5)
f90020c4:	fff00793          	li	a5,-1
f90020c8:	00050a13          	mv	s4,a0
f90020cc:	00058a93          	mv	s5,a1
f90020d0:	08f70663          	beq	a4,a5,f900215c <pow+0xd4>
f90020d4:	00040613          	mv	a2,s0
f90020d8:	00048693          	mv	a3,s1
f90020dc:	00040513          	mv	a0,s0
f90020e0:	00048593          	mv	a1,s1
f90020e4:	365020ef          	jal	ra,f9004c48 <__unorddf2>
f90020e8:	06051a63          	bnez	a0,f900215c <pow+0xd4>
f90020ec:	00090613          	mv	a2,s2
f90020f0:	00098693          	mv	a3,s3
f90020f4:	00090513          	mv	a0,s2
f90020f8:	00098593          	mv	a1,s3
f90020fc:	34d020ef          	jal	ra,f9004c48 <__unorddf2>
f9002100:	00000613          	li	a2,0
f9002104:	00000693          	li	a3,0
f9002108:	0e051063          	bnez	a0,f90021e8 <pow+0x160>
f900210c:	00090513          	mv	a0,s2
f9002110:	00098593          	mv	a1,s3
f9002114:	1ad020ef          	jal	ra,f9004ac0 <__eqdf2>
f9002118:	06051863          	bnez	a0,f9002188 <pow+0x100>
f900211c:	00000613          	li	a2,0
f9002120:	00000693          	li	a3,0
f9002124:	00040513          	mv	a0,s0
f9002128:	00048593          	mv	a1,s1
f900212c:	195020ef          	jal	ra,f9004ac0 <__eqdf2>
f9002130:	0c050463          	beqz	a0,f90021f8 <pow+0x170>
f9002134:	00040513          	mv	a0,s0
f9002138:	00048593          	mv	a1,s1
f900213c:	454010ef          	jal	ra,f9003590 <finite>
f9002140:	00050e63          	beqz	a0,f900215c <pow+0xd4>
f9002144:	00000613          	li	a2,0
f9002148:	00000693          	li	a3,0
f900214c:	00040513          	mv	a0,s0
f9002150:	00048593          	mv	a1,s1
f9002154:	f10fe0ef          	jal	ra,f9000864 <__ledf2>
f9002158:	12054263          	bltz	a0,f900227c <pow+0x1f4>
f900215c:	01c12083          	lw	ra,28(sp)
f9002160:	01812403          	lw	s0,24(sp)
f9002164:	000a0513          	mv	a0,s4
f9002168:	000a8593          	mv	a1,s5
f900216c:	01412483          	lw	s1,20(sp)
f9002170:	01012903          	lw	s2,16(sp)
f9002174:	00c12983          	lw	s3,12(sp)
f9002178:	00812a03          	lw	s4,8(sp)
f900217c:	00412a83          	lw	s5,4(sp)
f9002180:	02010113          	addi	sp,sp,32
f9002184:	00008067          	ret
f9002188:	000a0513          	mv	a0,s4
f900218c:	000a8593          	mv	a1,s5
f9002190:	400010ef          	jal	ra,f9003590 <finite>
f9002194:	06050c63          	beqz	a0,f900220c <pow+0x184>
f9002198:	00000613          	li	a2,0
f900219c:	00000693          	li	a3,0
f90021a0:	000a0513          	mv	a0,s4
f90021a4:	000a8593          	mv	a1,s5
f90021a8:	119020ef          	jal	ra,f9004ac0 <__eqdf2>
f90021ac:	fa0518e3          	bnez	a0,f900215c <pow+0xd4>
f90021b0:	00090513          	mv	a0,s2
f90021b4:	00098593          	mv	a1,s3
f90021b8:	3d8010ef          	jal	ra,f9003590 <finite>
f90021bc:	fa0500e3          	beqz	a0,f900215c <pow+0xd4>
f90021c0:	00040513          	mv	a0,s0
f90021c4:	00048593          	mv	a1,s1
f90021c8:	3c8010ef          	jal	ra,f9003590 <finite>
f90021cc:	f80508e3          	beqz	a0,f900215c <pow+0xd4>
f90021d0:	2cd020ef          	jal	ra,f9004c9c <__errno>
f90021d4:	02200793          	li	a5,34
f90021d8:	00f52023          	sw	a5,0(a0)
f90021dc:	00000a13          	li	s4,0
f90021e0:	00000a93          	li	s5,0
f90021e4:	f79ff06f          	j	f900215c <pow+0xd4>
f90021e8:	00040513          	mv	a0,s0
f90021ec:	00048593          	mv	a1,s1
f90021f0:	0d1020ef          	jal	ra,f9004ac0 <__eqdf2>
f90021f4:	f60514e3          	bnez	a0,f900215c <pow+0xd4>
f90021f8:	00003797          	auipc	a5,0x3
f90021fc:	c9078793          	addi	a5,a5,-880 # f9004e88 <__clz_tab+0x100>
f9002200:	0007aa03          	lw	s4,0(a5)
f9002204:	0047aa83          	lw	s5,4(a5)
f9002208:	f55ff06f          	j	f900215c <pow+0xd4>
f900220c:	00090513          	mv	a0,s2
f9002210:	00098593          	mv	a1,s3
f9002214:	37c010ef          	jal	ra,f9003590 <finite>
f9002218:	f80500e3          	beqz	a0,f9002198 <pow+0x110>
f900221c:	00040513          	mv	a0,s0
f9002220:	00048593          	mv	a1,s1
f9002224:	36c010ef          	jal	ra,f9003590 <finite>
f9002228:	f60508e3          	beqz	a0,f9002198 <pow+0x110>
f900222c:	000a0613          	mv	a2,s4
f9002230:	000a8693          	mv	a3,s5
f9002234:	000a0513          	mv	a0,s4
f9002238:	000a8593          	mv	a1,s5
f900223c:	20d020ef          	jal	ra,f9004c48 <__unorddf2>
f9002240:	08051663          	bnez	a0,f90022cc <pow+0x244>
f9002244:	259020ef          	jal	ra,f9004c9c <__errno>
f9002248:	02200793          	li	a5,34
f900224c:	00f52023          	sw	a5,0(a0)
f9002250:	00000613          	li	a2,0
f9002254:	00000693          	li	a3,0
f9002258:	00090513          	mv	a0,s2
f900225c:	00098593          	mv	a1,s3
f9002260:	e04fe0ef          	jal	ra,f9000864 <__ledf2>
f9002264:	02054c63          	bltz	a0,f900229c <pow+0x214>
f9002268:	00003797          	auipc	a5,0x3
f900226c:	c3078793          	addi	a5,a5,-976 # f9004e98 <__clz_tab+0x110>
f9002270:	0007aa03          	lw	s4,0(a5)
f9002274:	0047aa83          	lw	s5,4(a5)
f9002278:	ee5ff06f          	j	f900215c <pow+0xd4>
f900227c:	221020ef          	jal	ra,f9004c9c <__errno>
f9002280:	02100793          	li	a5,33
f9002284:	00f52023          	sw	a5,0(a0)
f9002288:	00003797          	auipc	a5,0x3
f900228c:	c0878793          	addi	a5,a5,-1016 # f9004e90 <__clz_tab+0x108>
f9002290:	0007aa03          	lw	s4,0(a5)
f9002294:	0047aa83          	lw	s5,4(a5)
f9002298:	ec5ff06f          	j	f900215c <pow+0xd4>
f900229c:	00040513          	mv	a0,s0
f90022a0:	00048593          	mv	a1,s1
f90022a4:	318010ef          	jal	ra,f90035bc <rint>
f90022a8:	00040613          	mv	a2,s0
f90022ac:	00048693          	mv	a3,s1
f90022b0:	011020ef          	jal	ra,f9004ac0 <__eqdf2>
f90022b4:	fa050ae3          	beqz	a0,f9002268 <pow+0x1e0>
f90022b8:	00003797          	auipc	a5,0x3
f90022bc:	bd878793          	addi	a5,a5,-1064 # f9004e90 <__clz_tab+0x108>
f90022c0:	0007aa03          	lw	s4,0(a5)
f90022c4:	0047aa83          	lw	s5,4(a5)
f90022c8:	e95ff06f          	j	f900215c <pow+0xd4>
f90022cc:	1d1020ef          	jal	ra,f9004c9c <__errno>
f90022d0:	02100793          	li	a5,33
f90022d4:	00000613          	li	a2,0
f90022d8:	00000693          	li	a3,0
f90022dc:	00f52023          	sw	a5,0(a0)
f90022e0:	00068593          	mv	a1,a3
f90022e4:	00060513          	mv	a0,a2
f90022e8:	735010ef          	jal	ra,f900421c <__divdf3>
f90022ec:	00050a13          	mv	s4,a0
f90022f0:	00058a93          	mv	s5,a1
f90022f4:	e69ff06f          	j	f900215c <pow+0xd4>

f90022f8 <__ieee754_pow>:
f90022f8:	80000837          	lui	a6,0x80000
f90022fc:	f8010113          	addi	sp,sp,-128
f9002300:	fff84813          	not	a6,a6
f9002304:	07212823          	sw	s2,112(sp)
f9002308:	0106f933          	and	s2,a3,a6
f900230c:	06112e23          	sw	ra,124(sp)
f9002310:	06812c23          	sw	s0,120(sp)
f9002314:	06912a23          	sw	s1,116(sp)
f9002318:	07312623          	sw	s3,108(sp)
f900231c:	07412423          	sw	s4,104(sp)
f9002320:	07512223          	sw	s5,100(sp)
f9002324:	07612023          	sw	s6,96(sp)
f9002328:	05712e23          	sw	s7,92(sp)
f900232c:	05812c23          	sw	s8,88(sp)
f9002330:	05912a23          	sw	s9,84(sp)
f9002334:	05a12823          	sw	s10,80(sp)
f9002338:	05b12623          	sw	s11,76(sp)
f900233c:	00c967b3          	or	a5,s2,a2
f9002340:	10078063          	beqz	a5,f9002440 <__ieee754_pow+0x148>
f9002344:	00b87433          	and	s0,a6,a1
f9002348:	7ff007b7          	lui	a5,0x7ff00
f900234c:	00058a93          	mv	s5,a1
f9002350:	00050a13          	mv	s4,a0
f9002354:	0487dc63          	bge	a5,s0,f90023ac <__ieee754_pow+0xb4>
f9002358:	c0100837          	lui	a6,0xc0100
f900235c:	01040833          	add	a6,s0,a6
f9002360:	00a86833          	or	a6,a6,a0
f9002364:	3ff005b7          	lui	a1,0x3ff00
f9002368:	00000513          	li	a0,0
f900236c:	0e081463          	bnez	a6,f9002454 <__ieee754_pow+0x15c>
f9002370:	07c12083          	lw	ra,124(sp)
f9002374:	07812403          	lw	s0,120(sp)
f9002378:	07412483          	lw	s1,116(sp)
f900237c:	07012903          	lw	s2,112(sp)
f9002380:	06c12983          	lw	s3,108(sp)
f9002384:	06812a03          	lw	s4,104(sp)
f9002388:	06412a83          	lw	s5,100(sp)
f900238c:	06012b03          	lw	s6,96(sp)
f9002390:	05c12b83          	lw	s7,92(sp)
f9002394:	05812c03          	lw	s8,88(sp)
f9002398:	05412c83          	lw	s9,84(sp)
f900239c:	05012d03          	lw	s10,80(sp)
f90023a0:	04c12d83          	lw	s11,76(sp)
f90023a4:	08010113          	addi	sp,sp,128
f90023a8:	00008067          	ret
f90023ac:	0af40063          	beq	s0,a5,f900244c <__ieee754_pow+0x154>
f90023b0:	fb27c4e3          	blt	a5,s2,f9002358 <__ieee754_pow+0x60>
f90023b4:	7ff007b7          	lui	a5,0x7ff00
f90023b8:	24f90e63          	beq	s2,a5,f9002614 <__ieee754_pow+0x31c>
f90023bc:	00058493          	mv	s1,a1
f90023c0:	00050993          	mv	s3,a0
f90023c4:	00060c93          	mv	s9,a2
f90023c8:	00068d93          	mv	s11,a3
f90023cc:	00000d13          	li	s10,0
f90023d0:	0c0ac463          	bltz	s5,f9002498 <__ieee754_pow+0x1a0>
f90023d4:	100c9463          	bnez	s9,f90024dc <__ieee754_pow+0x1e4>
f90023d8:	7ff006b7          	lui	a3,0x7ff00
f90023dc:	1ad90663          	beq	s2,a3,f9002588 <__ieee754_pow+0x290>
f90023e0:	3ff006b7          	lui	a3,0x3ff00
f90023e4:	1cd90a63          	beq	s2,a3,f90025b8 <__ieee754_pow+0x2c0>
f90023e8:	400006b7          	lui	a3,0x40000
f90023ec:	60dd80e3          	beq	s11,a3,f90031ec <__ieee754_pow+0xef4>
f90023f0:	3fe006b7          	lui	a3,0x3fe00
f90023f4:	0edd9463          	bne	s11,a3,f90024dc <__ieee754_pow+0x1e4>
f90023f8:	0e0ac263          	bltz	s5,f90024dc <__ieee754_pow+0x1e4>
f90023fc:	07812403          	lw	s0,120(sp)
f9002400:	07c12083          	lw	ra,124(sp)
f9002404:	07012903          	lw	s2,112(sp)
f9002408:	06812a03          	lw	s4,104(sp)
f900240c:	06412a83          	lw	s5,100(sp)
f9002410:	06012b03          	lw	s6,96(sp)
f9002414:	05c12b83          	lw	s7,92(sp)
f9002418:	05812c03          	lw	s8,88(sp)
f900241c:	05412c83          	lw	s9,84(sp)
f9002420:	05012d03          	lw	s10,80(sp)
f9002424:	04c12d83          	lw	s11,76(sp)
f9002428:	00098513          	mv	a0,s3
f900242c:	00048593          	mv	a1,s1
f9002430:	06c12983          	lw	s3,108(sp)
f9002434:	07412483          	lw	s1,116(sp)
f9002438:	08010113          	addi	sp,sp,128
f900243c:	6950006f          	j	f90032d0 <__ieee754_sqrt>
f9002440:	00000513          	li	a0,0
f9002444:	3ff005b7          	lui	a1,0x3ff00
f9002448:	f29ff06f          	j	f9002370 <__ieee754_pow+0x78>
f900244c:	00051463          	bnez	a0,f9002454 <__ieee754_pow+0x15c>
f9002450:	f72452e3          	bge	s0,s2,f90023b4 <__ieee754_pow+0xbc>
f9002454:	07812403          	lw	s0,120(sp)
f9002458:	07c12083          	lw	ra,124(sp)
f900245c:	07412483          	lw	s1,116(sp)
f9002460:	07012903          	lw	s2,112(sp)
f9002464:	06c12983          	lw	s3,108(sp)
f9002468:	06812a03          	lw	s4,104(sp)
f900246c:	06412a83          	lw	s5,100(sp)
f9002470:	06012b03          	lw	s6,96(sp)
f9002474:	05c12b83          	lw	s7,92(sp)
f9002478:	05812c03          	lw	s8,88(sp)
f900247c:	05412c83          	lw	s9,84(sp)
f9002480:	05012d03          	lw	s10,80(sp)
f9002484:	04c12d83          	lw	s11,76(sp)
f9002488:	00003517          	auipc	a0,0x3
f900248c:	87050513          	addi	a0,a0,-1936 # f9004cf8 <_data+0x4c>
f9002490:	08010113          	addi	sp,sp,128
f9002494:	1140106f          	j	f90035a8 <nan>
f9002498:	434006b7          	lui	a3,0x43400
f900249c:	18d95063          	bge	s2,a3,f900261c <__ieee754_pow+0x324>
f90024a0:	3ff006b7          	lui	a3,0x3ff00
f90024a4:	02d94a63          	blt	s2,a3,f90024d8 <__ieee754_pow+0x1e0>
f90024a8:	41495693          	srai	a3,s2,0x14
f90024ac:	c0168693          	addi	a3,a3,-1023 # 3feffc01 <__stack_size+0x3fefdc01>
f90024b0:	01400613          	li	a2,20
f90024b4:	54d658e3          	bge	a2,a3,f9003204 <__ieee754_pow+0xf0c>
f90024b8:	03400613          	li	a2,52
f90024bc:	40d606b3          	sub	a3,a2,a3
f90024c0:	00dcd633          	srl	a2,s9,a3
f90024c4:	00d616b3          	sll	a3,a2,a3
f90024c8:	01969863          	bne	a3,s9,f90024d8 <__ieee754_pow+0x1e0>
f90024cc:	00167613          	andi	a2,a2,1
f90024d0:	00200313          	li	t1,2
f90024d4:	40c30d33          	sub	s10,t1,a2
f90024d8:	f00c84e3          	beqz	s9,f90023e0 <__ieee754_pow+0xe8>
f90024dc:	00098513          	mv	a0,s3
f90024e0:	00048593          	mv	a1,s1
f90024e4:	0a0010ef          	jal	ra,f9003584 <fabs>
f90024e8:	040a0c63          	beqz	s4,f9002540 <__ieee754_pow+0x248>
f90024ec:	01f4de13          	srli	t3,s1,0x1f
f90024f0:	fffe0e13          	addi	t3,t3,-1
f90024f4:	01cd66b3          	or	a3,s10,t3
f90024f8:	12068663          	beqz	a3,f9002624 <__ieee754_pow+0x32c>
f90024fc:	41e006b7          	lui	a3,0x41e00
f9002500:	1526d463          	bge	a3,s2,f9002648 <__ieee754_pow+0x350>
f9002504:	43f006b7          	lui	a3,0x43f00
f9002508:	3526dce3          	bge	a3,s2,f9003060 <__ieee754_pow+0xd68>
f900250c:	3ff00737          	lui	a4,0x3ff00
f9002510:	0ce45a63          	bge	s0,a4,f90025e4 <__ieee754_pow+0x2ec>
f9002514:	080ddc63          	bgez	s11,f90025ac <__ieee754_pow+0x2b4>
f9002518:	00003797          	auipc	a5,0x3
f900251c:	9a878793          	addi	a5,a5,-1624 # f9004ec0 <__clz_tab+0x138>
f9002520:	0007a603          	lw	a2,0(a5)
f9002524:	0047a683          	lw	a3,4(a5)
f9002528:	00060513          	mv	a0,a2
f900252c:	00068593          	mv	a1,a3
f9002530:	c34fe0ef          	jal	ra,f9000964 <__muldf3>
f9002534:	e3dff06f          	j	f9002370 <__ieee754_pow+0x78>
f9002538:	04c010ef          	jal	ra,f9003584 <fabs>
f900253c:	0e0a1463          	bnez	s4,f9002624 <__ieee754_pow+0x32c>
f9002540:	00040a63          	beqz	s0,f9002554 <__ieee754_pow+0x25c>
f9002544:	00249693          	slli	a3,s1,0x2
f9002548:	0026d693          	srli	a3,a3,0x2
f900254c:	3ff00637          	lui	a2,0x3ff00
f9002550:	f8c69ee3          	bne	a3,a2,f90024ec <__ieee754_pow+0x1f4>
f9002554:	080dcc63          	bltz	s11,f90025ec <__ieee754_pow+0x2f4>
f9002558:	e00adce3          	bgez	s5,f9002370 <__ieee754_pow+0x78>
f900255c:	c01007b7          	lui	a5,0xc0100
f9002560:	00f407b3          	add	a5,s0,a5
f9002564:	01a7e7b3          	or	a5,a5,s10
f9002568:	4e0796e3          	bnez	a5,f9003254 <__ieee754_pow+0xf5c>
f900256c:	00050613          	mv	a2,a0
f9002570:	00058693          	mv	a3,a1
f9002574:	af9fe0ef          	jal	ra,f900106c <__subdf3>
f9002578:	00050613          	mv	a2,a0
f900257c:	00058693          	mv	a3,a1
f9002580:	49d010ef          	jal	ra,f900421c <__divdf3>
f9002584:	dedff06f          	j	f9002370 <__ieee754_pow+0x78>
f9002588:	c0100537          	lui	a0,0xc0100
f900258c:	00a40533          	add	a0,s0,a0
f9002590:	01356533          	or	a0,a0,s3
f9002594:	ea0506e3          	beqz	a0,f9002440 <__ieee754_pow+0x148>
f9002598:	3ff00737          	lui	a4,0x3ff00
f900259c:	2ae442e3          	blt	s0,a4,f9003040 <__ieee754_pow+0xd48>
f90025a0:	000d8593          	mv	a1,s11
f90025a4:	00000513          	li	a0,0
f90025a8:	dc0dd4e3          	bgez	s11,f9002370 <__ieee754_pow+0x78>
f90025ac:	00000513          	li	a0,0
f90025b0:	00000593          	li	a1,0
f90025b4:	dbdff06f          	j	f9002370 <__ieee754_pow+0x78>
f90025b8:	00098513          	mv	a0,s3
f90025bc:	00048593          	mv	a1,s1
f90025c0:	da0dd8e3          	bgez	s11,f9002370 <__ieee754_pow+0x78>
f90025c4:	00003797          	auipc	a5,0x3
f90025c8:	8c478793          	addi	a5,a5,-1852 # f9004e88 <__clz_tab+0x100>
f90025cc:	0007a503          	lw	a0,0(a5)
f90025d0:	0047a583          	lw	a1,4(a5)
f90025d4:	00098613          	mv	a2,s3
f90025d8:	00048693          	mv	a3,s1
f90025dc:	441010ef          	jal	ra,f900421c <__divdf3>
f90025e0:	d91ff06f          	j	f9002370 <__ieee754_pow+0x78>
f90025e4:	f3b04ae3          	bgtz	s11,f9002518 <__ieee754_pow+0x220>
f90025e8:	fc5ff06f          	j	f90025ac <__ieee754_pow+0x2b4>
f90025ec:	00003717          	auipc	a4,0x3
f90025f0:	89c70713          	addi	a4,a4,-1892 # f9004e88 <__clz_tab+0x100>
f90025f4:	00050c93          	mv	s9,a0
f90025f8:	00058793          	mv	a5,a1
f90025fc:	00072503          	lw	a0,0(a4)
f9002600:	00472583          	lw	a1,4(a4)
f9002604:	000c8613          	mv	a2,s9
f9002608:	00078693          	mv	a3,a5
f900260c:	411010ef          	jal	ra,f900421c <__divdf3>
f9002610:	f49ff06f          	j	f9002558 <__ieee754_pow+0x260>
f9002614:	da0604e3          	beqz	a2,f90023bc <__ieee754_pow+0xc4>
f9002618:	d41ff06f          	j	f9002358 <__ieee754_pow+0x60>
f900261c:	00200d13          	li	s10,2
f9002620:	db5ff06f          	j	f90023d4 <__ieee754_pow+0xdc>
f9002624:	00098613          	mv	a2,s3
f9002628:	00048693          	mv	a3,s1
f900262c:	00098513          	mv	a0,s3
f9002630:	00048593          	mv	a1,s1
f9002634:	a39fe0ef          	jal	ra,f900106c <__subdf3>
f9002638:	00050613          	mv	a2,a0
f900263c:	00058693          	mv	a3,a1
f9002640:	3dd010ef          	jal	ra,f900421c <__divdf3>
f9002644:	d2dff06f          	j	f9002370 <__ieee754_pow+0x78>
f9002648:	7ff006b7          	lui	a3,0x7ff00
f900264c:	0096f4b3          	and	s1,a3,s1
f9002650:	00000613          	li	a2,0
f9002654:	02049463          	bnez	s1,f900267c <__ieee754_pow+0x384>
f9002658:	00003697          	auipc	a3,0x3
f900265c:	8a068693          	addi	a3,a3,-1888 # f9004ef8 <__clz_tab+0x170>
f9002660:	0006a603          	lw	a2,0(a3)
f9002664:	0046a683          	lw	a3,4(a3)
f9002668:	01c12423          	sw	t3,8(sp)
f900266c:	af8fe0ef          	jal	ra,f9000964 <__muldf3>
f9002670:	00812e03          	lw	t3,8(sp)
f9002674:	00058413          	mv	s0,a1
f9002678:	fcb00613          	li	a2,-53
f900267c:	001005b7          	lui	a1,0x100
f9002680:	41445e93          	srai	t4,s0,0x14
f9002684:	fff58813          	addi	a6,a1,-1 # fffff <__stack_size+0xfdfff>
f9002688:	0003a6b7          	lui	a3,0x3a
f900268c:	c01e8e93          	addi	t4,t4,-1023
f9002690:	01047833          	and	a6,s0,a6
f9002694:	3ff00c37          	lui	s8,0x3ff00
f9002698:	88e68693          	addi	a3,a3,-1906 # 3988e <__stack_size+0x3788e>
f900269c:	00ce8eb3          	add	t4,t4,a2
f90026a0:	01886c33          	or	s8,a6,s8
f90026a4:	1b06d8e3          	bge	a3,a6,f9003054 <__ieee754_pow+0xd5c>
f90026a8:	000bb6b7          	lui	a3,0xbb
f90026ac:	67968693          	addi	a3,a3,1657 # bb679 <__stack_size+0xb9679>
f90026b0:	3b06dee3          	bge	a3,a6,f900326c <__ieee754_pow+0xf74>
f90026b4:	00002a97          	auipc	s5,0x2
f90026b8:	7d4a8a93          	addi	s5,s5,2004 # f9004e88 <__clz_tab+0x100>
f90026bc:	001e8e93          	addi	t4,t4,1
f90026c0:	40bc0c33          	sub	s8,s8,a1
f90026c4:	000aa783          	lw	a5,0(s5)
f90026c8:	004aa803          	lw	a6,4(s5)
f90026cc:	00012823          	sw	zero,16(sp)
f90026d0:	00012a23          	sw	zero,20(sp)
f90026d4:	02012c23          	sw	zero,56(sp)
f90026d8:	02012e23          	sw	zero,60(sp)
f90026dc:	00000993          	li	s3,0
f90026e0:	00f12423          	sw	a5,8(sp)
f90026e4:	01012623          	sw	a6,12(sp)
f90026e8:	00812403          	lw	s0,8(sp)
f90026ec:	00c12483          	lw	s1,12(sp)
f90026f0:	000c0593          	mv	a1,s8
f90026f4:	00040613          	mv	a2,s0
f90026f8:	00048693          	mv	a3,s1
f90026fc:	03d12a23          	sw	t4,52(sp)
f9002700:	03c12823          	sw	t3,48(sp)
f9002704:	00050913          	mv	s2,a0
f9002708:	965fe0ef          	jal	ra,f900106c <__subdf3>
f900270c:	00050b13          	mv	s6,a0
f9002710:	00058b93          	mv	s7,a1
f9002714:	00040613          	mv	a2,s0
f9002718:	00048693          	mv	a3,s1
f900271c:	00090513          	mv	a0,s2
f9002720:	000c0593          	mv	a1,s8
f9002724:	00812423          	sw	s0,8(sp)
f9002728:	00912623          	sw	s1,12(sp)
f900272c:	26c010ef          	jal	ra,f9003998 <__adddf3>
f9002730:	00050613          	mv	a2,a0
f9002734:	00058693          	mv	a3,a1
f9002738:	000aa503          	lw	a0,0(s5)
f900273c:	004aa583          	lw	a1,4(s5)
f9002740:	00000493          	li	s1,0
f9002744:	2d9010ef          	jal	ra,f900421c <__divdf3>
f9002748:	00050613          	mv	a2,a0
f900274c:	00058693          	mv	a3,a1
f9002750:	00a12c23          	sw	a0,24(sp)
f9002754:	00b12e23          	sw	a1,28(sp)
f9002758:	000b0513          	mv	a0,s6
f900275c:	000b8593          	mv	a1,s7
f9002760:	a04fe0ef          	jal	ra,f9000964 <__muldf3>
f9002764:	401c5f13          	srai	t5,s8,0x1
f9002768:	200006b7          	lui	a3,0x20000
f900276c:	00df6f33          	or	t5,t5,a3
f9002770:	000806b7          	lui	a3,0x80
f9002774:	00df0f33          	add	t5,t5,a3
f9002778:	013f09b3          	add	s3,t5,s3
f900277c:	00050a13          	mv	s4,a0
f9002780:	00098693          	mv	a3,s3
f9002784:	00000613          	li	a2,0
f9002788:	00048513          	mv	a0,s1
f900278c:	00058413          	mv	s0,a1
f9002790:	9d4fe0ef          	jal	ra,f9000964 <__muldf3>
f9002794:	00050613          	mv	a2,a0
f9002798:	00058693          	mv	a3,a1
f900279c:	000b0513          	mv	a0,s6
f90027a0:	000b8593          	mv	a1,s7
f90027a4:	8c9fe0ef          	jal	ra,f900106c <__subdf3>
f90027a8:	00812603          	lw	a2,8(sp)
f90027ac:	00c12683          	lw	a3,12(sp)
f90027b0:	00050b13          	mv	s6,a0
f90027b4:	00058b93          	mv	s7,a1
f90027b8:	00000513          	li	a0,0
f90027bc:	00098593          	mv	a1,s3
f90027c0:	8adfe0ef          	jal	ra,f900106c <__subdf3>
f90027c4:	00050613          	mv	a2,a0
f90027c8:	00058693          	mv	a3,a1
f90027cc:	00090513          	mv	a0,s2
f90027d0:	000c0593          	mv	a1,s8
f90027d4:	899fe0ef          	jal	ra,f900106c <__subdf3>
f90027d8:	00048613          	mv	a2,s1
f90027dc:	00040693          	mv	a3,s0
f90027e0:	984fe0ef          	jal	ra,f9000964 <__muldf3>
f90027e4:	00050613          	mv	a2,a0
f90027e8:	00058693          	mv	a3,a1
f90027ec:	000b0513          	mv	a0,s6
f90027f0:	000b8593          	mv	a1,s7
f90027f4:	879fe0ef          	jal	ra,f900106c <__subdf3>
f90027f8:	01812803          	lw	a6,24(sp)
f90027fc:	01c12883          	lw	a7,28(sp)
f9002800:	00002b97          	auipc	s7,0x2
f9002804:	730b8b93          	addi	s7,s7,1840 # f9004f30 <__clz_tab+0x1a8>
f9002808:	00080613          	mv	a2,a6
f900280c:	00088693          	mv	a3,a7
f9002810:	954fe0ef          	jal	ra,f9000964 <__muldf3>
f9002814:	000a0613          	mv	a2,s4
f9002818:	00040693          	mv	a3,s0
f900281c:	00a12423          	sw	a0,8(sp)
f9002820:	00b12623          	sw	a1,12(sp)
f9002824:	000a0513          	mv	a0,s4
f9002828:	00040593          	mv	a1,s0
f900282c:	938fe0ef          	jal	ra,f9000964 <__muldf3>
f9002830:	00002697          	auipc	a3,0x2
f9002834:	6d068693          	addi	a3,a3,1744 # f9004f00 <__clz_tab+0x178>
f9002838:	0006a603          	lw	a2,0(a3)
f900283c:	0046a683          	lw	a3,4(a3)
f9002840:	00050913          	mv	s2,a0
f9002844:	00058993          	mv	s3,a1
f9002848:	91cfe0ef          	jal	ra,f9000964 <__muldf3>
f900284c:	00002697          	auipc	a3,0x2
f9002850:	6bc68693          	addi	a3,a3,1724 # f9004f08 <__clz_tab+0x180>
f9002854:	0006a603          	lw	a2,0(a3)
f9002858:	0046a683          	lw	a3,4(a3)
f900285c:	00000b13          	li	s6,0
f9002860:	00000c13          	li	s8,0
f9002864:	134010ef          	jal	ra,f9003998 <__adddf3>
f9002868:	00090613          	mv	a2,s2
f900286c:	00098693          	mv	a3,s3
f9002870:	8f4fe0ef          	jal	ra,f9000964 <__muldf3>
f9002874:	00002697          	auipc	a3,0x2
f9002878:	69c68693          	addi	a3,a3,1692 # f9004f10 <__clz_tab+0x188>
f900287c:	0006a603          	lw	a2,0(a3)
f9002880:	0046a683          	lw	a3,4(a3)
f9002884:	114010ef          	jal	ra,f9003998 <__adddf3>
f9002888:	00090613          	mv	a2,s2
f900288c:	00098693          	mv	a3,s3
f9002890:	8d4fe0ef          	jal	ra,f9000964 <__muldf3>
f9002894:	00002697          	auipc	a3,0x2
f9002898:	68468693          	addi	a3,a3,1668 # f9004f18 <__clz_tab+0x190>
f900289c:	0006a603          	lw	a2,0(a3)
f90028a0:	0046a683          	lw	a3,4(a3)
f90028a4:	0f4010ef          	jal	ra,f9003998 <__adddf3>
f90028a8:	00090613          	mv	a2,s2
f90028ac:	00098693          	mv	a3,s3
f90028b0:	8b4fe0ef          	jal	ra,f9000964 <__muldf3>
f90028b4:	00002697          	auipc	a3,0x2
f90028b8:	66c68693          	addi	a3,a3,1644 # f9004f20 <__clz_tab+0x198>
f90028bc:	0006a603          	lw	a2,0(a3)
f90028c0:	0046a683          	lw	a3,4(a3)
f90028c4:	0d4010ef          	jal	ra,f9003998 <__adddf3>
f90028c8:	00090613          	mv	a2,s2
f90028cc:	00098693          	mv	a3,s3
f90028d0:	894fe0ef          	jal	ra,f9000964 <__muldf3>
f90028d4:	00002697          	auipc	a3,0x2
f90028d8:	65468693          	addi	a3,a3,1620 # f9004f28 <__clz_tab+0x1a0>
f90028dc:	0006a603          	lw	a2,0(a3)
f90028e0:	0046a683          	lw	a3,4(a3)
f90028e4:	0b4010ef          	jal	ra,f9003998 <__adddf3>
f90028e8:	00090613          	mv	a2,s2
f90028ec:	00098693          	mv	a3,s3
f90028f0:	00a12c23          	sw	a0,24(sp)
f90028f4:	00b12e23          	sw	a1,28(sp)
f90028f8:	00090513          	mv	a0,s2
f90028fc:	00098593          	mv	a1,s3
f9002900:	864fe0ef          	jal	ra,f9000964 <__muldf3>
f9002904:	01812703          	lw	a4,24(sp)
f9002908:	01c12783          	lw	a5,28(sp)
f900290c:	00050613          	mv	a2,a0
f9002910:	00058693          	mv	a3,a1
f9002914:	00070513          	mv	a0,a4
f9002918:	00078593          	mv	a1,a5
f900291c:	848fe0ef          	jal	ra,f9000964 <__muldf3>
f9002920:	00050913          	mv	s2,a0
f9002924:	00058993          	mv	s3,a1
f9002928:	00048613          	mv	a2,s1
f900292c:	00040693          	mv	a3,s0
f9002930:	000a0513          	mv	a0,s4
f9002934:	00040593          	mv	a1,s0
f9002938:	060010ef          	jal	ra,f9003998 <__adddf3>
f900293c:	00812603          	lw	a2,8(sp)
f9002940:	00c12683          	lw	a3,12(sp)
f9002944:	820fe0ef          	jal	ra,f9000964 <__muldf3>
f9002948:	00090613          	mv	a2,s2
f900294c:	00098693          	mv	a3,s3
f9002950:	048010ef          	jal	ra,f9003998 <__adddf3>
f9002954:	00050913          	mv	s2,a0
f9002958:	00058993          	mv	s3,a1
f900295c:	00048613          	mv	a2,s1
f9002960:	00040693          	mv	a3,s0
f9002964:	00048513          	mv	a0,s1
f9002968:	00040593          	mv	a1,s0
f900296c:	ff9fd0ef          	jal	ra,f9000964 <__muldf3>
f9002970:	000ba603          	lw	a2,0(s7)
f9002974:	004ba683          	lw	a3,4(s7)
f9002978:	02a12423          	sw	a0,40(sp)
f900297c:	02b12623          	sw	a1,44(sp)
f9002980:	018010ef          	jal	ra,f9003998 <__adddf3>
f9002984:	00090613          	mv	a2,s2
f9002988:	00098693          	mv	a3,s3
f900298c:	01212c23          	sw	s2,24(sp)
f9002990:	01312e23          	sw	s3,28(sp)
f9002994:	004010ef          	jal	ra,f9003998 <__adddf3>
f9002998:	00058913          	mv	s2,a1
f900299c:	000b0613          	mv	a2,s6
f90029a0:	00058693          	mv	a3,a1
f90029a4:	00048513          	mv	a0,s1
f90029a8:	00040593          	mv	a1,s0
f90029ac:	fb9fd0ef          	jal	ra,f9000964 <__muldf3>
f90029b0:	000ba603          	lw	a2,0(s7)
f90029b4:	004ba683          	lw	a3,4(s7)
f90029b8:	02a12023          	sw	a0,32(sp)
f90029bc:	02b12223          	sw	a1,36(sp)
f90029c0:	000b0513          	mv	a0,s6
f90029c4:	00090593          	mv	a1,s2
f90029c8:	ea4fe0ef          	jal	ra,f900106c <__subdf3>
f90029cc:	02812f03          	lw	t5,40(sp)
f90029d0:	02c12f83          	lw	t6,44(sp)
f90029d4:	000f0613          	mv	a2,t5
f90029d8:	000f8693          	mv	a3,t6
f90029dc:	e90fe0ef          	jal	ra,f900106c <__subdf3>
f90029e0:	00050613          	mv	a2,a0
f90029e4:	00058693          	mv	a3,a1
f90029e8:	01812503          	lw	a0,24(sp)
f90029ec:	01c12583          	lw	a1,28(sp)
f90029f0:	e7cfe0ef          	jal	ra,f900106c <__subdf3>
f90029f4:	000a0613          	mv	a2,s4
f90029f8:	00040693          	mv	a3,s0
f90029fc:	f69fd0ef          	jal	ra,f9000964 <__muldf3>
f9002a00:	00050413          	mv	s0,a0
f9002a04:	00058493          	mv	s1,a1
f9002a08:	00812503          	lw	a0,8(sp)
f9002a0c:	00c12583          	lw	a1,12(sp)
f9002a10:	000b0613          	mv	a2,s6
f9002a14:	00090693          	mv	a3,s2
f9002a18:	f4dfd0ef          	jal	ra,f9000964 <__muldf3>
f9002a1c:	00050613          	mv	a2,a0
f9002a20:	00058693          	mv	a3,a1
f9002a24:	00040513          	mv	a0,s0
f9002a28:	00048593          	mv	a1,s1
f9002a2c:	76d000ef          	jal	ra,f9003998 <__adddf3>
f9002a30:	02012b03          	lw	s6,32(sp)
f9002a34:	02412b83          	lw	s7,36(sp)
f9002a38:	00050413          	mv	s0,a0
f9002a3c:	00058493          	mv	s1,a1
f9002a40:	00050613          	mv	a2,a0
f9002a44:	00058693          	mv	a3,a1
f9002a48:	000b0513          	mv	a0,s6
f9002a4c:	000b8593          	mv	a1,s7
f9002a50:	749000ef          	jal	ra,f9003998 <__adddf3>
f9002a54:	00002697          	auipc	a3,0x2
f9002a58:	4e468693          	addi	a3,a3,1252 # f9004f38 <__clz_tab+0x1b0>
f9002a5c:	0006a603          	lw	a2,0(a3)
f9002a60:	0046a683          	lw	a3,4(a3)
f9002a64:	000c0513          	mv	a0,s8
f9002a68:	00058a13          	mv	s4,a1
f9002a6c:	ef9fd0ef          	jal	ra,f9000964 <__muldf3>
f9002a70:	00050913          	mv	s2,a0
f9002a74:	00058993          	mv	s3,a1
f9002a78:	000b0613          	mv	a2,s6
f9002a7c:	000b8693          	mv	a3,s7
f9002a80:	000c0513          	mv	a0,s8
f9002a84:	000a0593          	mv	a1,s4
f9002a88:	de4fe0ef          	jal	ra,f900106c <__subdf3>
f9002a8c:	00050613          	mv	a2,a0
f9002a90:	00058693          	mv	a3,a1
f9002a94:	00040513          	mv	a0,s0
f9002a98:	00048593          	mv	a1,s1
f9002a9c:	dd0fe0ef          	jal	ra,f900106c <__subdf3>
f9002aa0:	00002697          	auipc	a3,0x2
f9002aa4:	4a068693          	addi	a3,a3,1184 # f9004f40 <__clz_tab+0x1b8>
f9002aa8:	0006a603          	lw	a2,0(a3)
f9002aac:	0046a683          	lw	a3,4(a3)
f9002ab0:	eb5fd0ef          	jal	ra,f9000964 <__muldf3>
f9002ab4:	00002697          	auipc	a3,0x2
f9002ab8:	49468693          	addi	a3,a3,1172 # f9004f48 <__clz_tab+0x1c0>
f9002abc:	0006a603          	lw	a2,0(a3)
f9002ac0:	0046a683          	lw	a3,4(a3)
f9002ac4:	00050413          	mv	s0,a0
f9002ac8:	00058493          	mv	s1,a1
f9002acc:	000c0513          	mv	a0,s8
f9002ad0:	000a0593          	mv	a1,s4
f9002ad4:	e91fd0ef          	jal	ra,f9000964 <__muldf3>
f9002ad8:	00050613          	mv	a2,a0
f9002adc:	00058693          	mv	a3,a1
f9002ae0:	00040513          	mv	a0,s0
f9002ae4:	00048593          	mv	a1,s1
f9002ae8:	6b1000ef          	jal	ra,f9003998 <__adddf3>
f9002aec:	03812603          	lw	a2,56(sp)
f9002af0:	03c12683          	lw	a3,60(sp)
f9002af4:	6a5000ef          	jal	ra,f9003998 <__adddf3>
f9002af8:	03412e83          	lw	t4,52(sp)
f9002afc:	00050b13          	mv	s6,a0
f9002b00:	00058b93          	mv	s7,a1
f9002b04:	000e8513          	mv	a0,t4
f9002b08:	e65fe0ef          	jal	ra,f900196c <__floatsidf>
f9002b0c:	00050413          	mv	s0,a0
f9002b10:	00058493          	mv	s1,a1
f9002b14:	000b0613          	mv	a2,s6
f9002b18:	000b8693          	mv	a3,s7
f9002b1c:	00090513          	mv	a0,s2
f9002b20:	00098593          	mv	a1,s3
f9002b24:	675000ef          	jal	ra,f9003998 <__adddf3>
f9002b28:	01012603          	lw	a2,16(sp)
f9002b2c:	01412683          	lw	a3,20(sp)
f9002b30:	669000ef          	jal	ra,f9003998 <__adddf3>
f9002b34:	00040613          	mv	a2,s0
f9002b38:	00048693          	mv	a3,s1
f9002b3c:	65d000ef          	jal	ra,f9003998 <__adddf3>
f9002b40:	00000613          	li	a2,0
f9002b44:	00060513          	mv	a0,a2
f9002b48:	00048693          	mv	a3,s1
f9002b4c:	00040613          	mv	a2,s0
f9002b50:	00058493          	mv	s1,a1
f9002b54:	00050413          	mv	s0,a0
f9002b58:	d14fe0ef          	jal	ra,f900106c <__subdf3>
f9002b5c:	01012603          	lw	a2,16(sp)
f9002b60:	01412683          	lw	a3,20(sp)
f9002b64:	d08fe0ef          	jal	ra,f900106c <__subdf3>
f9002b68:	00090613          	mv	a2,s2
f9002b6c:	00098693          	mv	a3,s3
f9002b70:	cfcfe0ef          	jal	ra,f900106c <__subdf3>
f9002b74:	00050613          	mv	a2,a0
f9002b78:	00058693          	mv	a3,a1
f9002b7c:	000b0513          	mv	a0,s6
f9002b80:	000b8593          	mv	a1,s7
f9002b84:	ce8fe0ef          	jal	ra,f900106c <__subdf3>
f9002b88:	03012e03          	lw	t3,48(sp)
f9002b8c:	00050913          	mv	s2,a0
f9002b90:	00058993          	mv	s3,a1
f9002b94:	fffd0313          	addi	t1,s10,-1
f9002b98:	01c36e33          	or	t3,t1,t3
f9002b9c:	480e1863          	bnez	t3,f900302c <__ieee754_pow+0xd34>
f9002ba0:	00002697          	auipc	a3,0x2
f9002ba4:	31868693          	addi	a3,a3,792 # f9004eb8 <__clz_tab+0x130>
f9002ba8:	0006a783          	lw	a5,0(a3)
f9002bac:	0046a803          	lw	a6,4(a3)
f9002bb0:	00f12423          	sw	a5,8(sp)
f9002bb4:	01012623          	sw	a6,12(sp)
f9002bb8:	00000c13          	li	s8,0
f9002bbc:	000c0613          	mv	a2,s8
f9002bc0:	000d8693          	mv	a3,s11
f9002bc4:	000c8513          	mv	a0,s9
f9002bc8:	000d8593          	mv	a1,s11
f9002bcc:	ca0fe0ef          	jal	ra,f900106c <__subdf3>
f9002bd0:	00040613          	mv	a2,s0
f9002bd4:	00048693          	mv	a3,s1
f9002bd8:	d8dfd0ef          	jal	ra,f9000964 <__muldf3>
f9002bdc:	00050b13          	mv	s6,a0
f9002be0:	00058b93          	mv	s7,a1
f9002be4:	000c8613          	mv	a2,s9
f9002be8:	000d8693          	mv	a3,s11
f9002bec:	00090513          	mv	a0,s2
f9002bf0:	00098593          	mv	a1,s3
f9002bf4:	d71fd0ef          	jal	ra,f9000964 <__muldf3>
f9002bf8:	00050613          	mv	a2,a0
f9002bfc:	00058693          	mv	a3,a1
f9002c00:	000b0513          	mv	a0,s6
f9002c04:	000b8593          	mv	a1,s7
f9002c08:	591000ef          	jal	ra,f9003998 <__adddf3>
f9002c0c:	00050913          	mv	s2,a0
f9002c10:	00058993          	mv	s3,a1
f9002c14:	000c0613          	mv	a2,s8
f9002c18:	000d8693          	mv	a3,s11
f9002c1c:	00040513          	mv	a0,s0
f9002c20:	00048593          	mv	a1,s1
f9002c24:	d41fd0ef          	jal	ra,f9000964 <__muldf3>
f9002c28:	00050613          	mv	a2,a0
f9002c2c:	00058693          	mv	a3,a1
f9002c30:	00050413          	mv	s0,a0
f9002c34:	00058493          	mv	s1,a1
f9002c38:	00090513          	mv	a0,s2
f9002c3c:	00098593          	mv	a1,s3
f9002c40:	559000ef          	jal	ra,f9003998 <__adddf3>
f9002c44:	409007b7          	lui	a5,0x40900
f9002c48:	00050a13          	mv	s4,a0
f9002c4c:	00058b13          	mv	s6,a1
f9002c50:	00058b93          	mv	s7,a1
f9002c54:	36f5c463          	blt	a1,a5,f9002fbc <__ieee754_pow+0xcc4>
f9002c58:	40f587b3          	sub	a5,a1,a5
f9002c5c:	00a7e7b3          	or	a5,a5,a0
f9002c60:	5e079463          	bnez	a5,f9003248 <__ieee754_pow+0xf50>
f9002c64:	00002797          	auipc	a5,0x2
f9002c68:	2ec78793          	addi	a5,a5,748 # f9004f50 <__clz_tab+0x1c8>
f9002c6c:	0007a603          	lw	a2,0(a5)
f9002c70:	0047a683          	lw	a3,4(a5)
f9002c74:	00090513          	mv	a0,s2
f9002c78:	00098593          	mv	a1,s3
f9002c7c:	51d000ef          	jal	ra,f9003998 <__adddf3>
f9002c80:	00050d13          	mv	s10,a0
f9002c84:	00058d93          	mv	s11,a1
f9002c88:	00040613          	mv	a2,s0
f9002c8c:	00048693          	mv	a3,s1
f9002c90:	000a0513          	mv	a0,s4
f9002c94:	000b0593          	mv	a1,s6
f9002c98:	bd4fe0ef          	jal	ra,f900106c <__subdf3>
f9002c9c:	00050613          	mv	a2,a0
f9002ca0:	00058693          	mv	a3,a1
f9002ca4:	000d0513          	mv	a0,s10
f9002ca8:	000d8593          	mv	a1,s11
f9002cac:	6a1010ef          	jal	ra,f9004b4c <__gedf2>
f9002cb0:	58a04c63          	bgtz	a0,f9003248 <__ieee754_pow+0xf50>
f9002cb4:	414bd793          	srai	a5,s7,0x14
f9002cb8:	7ff7f793          	andi	a5,a5,2047
f9002cbc:	00100537          	lui	a0,0x100
f9002cc0:	c0278793          	addi	a5,a5,-1022
f9002cc4:	40f557b3          	sra	a5,a0,a5
f9002cc8:	017787b3          	add	a5,a5,s7
f9002ccc:	4147d713          	srai	a4,a5,0x14
f9002cd0:	7ff77713          	andi	a4,a4,2047
f9002cd4:	c0170713          	addi	a4,a4,-1023
f9002cd8:	fff50a13          	addi	s4,a0,-1 # fffff <__stack_size+0xfdfff>
f9002cdc:	40ea55b3          	sra	a1,s4,a4
f9002ce0:	fff5c593          	not	a1,a1
f9002ce4:	00f5f5b3          	and	a1,a1,a5
f9002ce8:	0147fa33          	and	s4,a5,s4
f9002cec:	01400793          	li	a5,20
f9002cf0:	00aa6a33          	or	s4,s4,a0
f9002cf4:	40e78733          	sub	a4,a5,a4
f9002cf8:	00000613          	li	a2,0
f9002cfc:	00058693          	mv	a3,a1
f9002d00:	40ea5a33          	sra	s4,s4,a4
f9002d04:	000bd463          	bgez	s7,f9002d0c <__ieee754_pow+0xa14>
f9002d08:	41400a33          	neg	s4,s4
f9002d0c:	00040513          	mv	a0,s0
f9002d10:	00048593          	mv	a1,s1
f9002d14:	b58fe0ef          	jal	ra,f900106c <__subdf3>
f9002d18:	00050613          	mv	a2,a0
f9002d1c:	00058693          	mv	a3,a1
f9002d20:	00050413          	mv	s0,a0
f9002d24:	00058493          	mv	s1,a1
f9002d28:	00090513          	mv	a0,s2
f9002d2c:	00098593          	mv	a1,s3
f9002d30:	469000ef          	jal	ra,f9003998 <__adddf3>
f9002d34:	00058b13          	mv	s6,a1
f9002d38:	014a1d93          	slli	s11,s4,0x14
f9002d3c:	00002717          	auipc	a4,0x2
f9002d40:	22470713          	addi	a4,a4,548 # f9004f60 <__clz_tab+0x1d8>
f9002d44:	00072603          	lw	a2,0(a4)
f9002d48:	00472683          	lw	a3,4(a4)
f9002d4c:	00000c13          	li	s8,0
f9002d50:	000c0513          	mv	a0,s8
f9002d54:	000b0593          	mv	a1,s6
f9002d58:	c0dfd0ef          	jal	ra,f9000964 <__muldf3>
f9002d5c:	000b0d13          	mv	s10,s6
f9002d60:	00058b93          	mv	s7,a1
f9002d64:	00050b13          	mv	s6,a0
f9002d68:	00040613          	mv	a2,s0
f9002d6c:	00048693          	mv	a3,s1
f9002d70:	000c0513          	mv	a0,s8
f9002d74:	000d0593          	mv	a1,s10
f9002d78:	af4fe0ef          	jal	ra,f900106c <__subdf3>
f9002d7c:	00050613          	mv	a2,a0
f9002d80:	00058693          	mv	a3,a1
f9002d84:	00090513          	mv	a0,s2
f9002d88:	00098593          	mv	a1,s3
f9002d8c:	ae0fe0ef          	jal	ra,f900106c <__subdf3>
f9002d90:	00002717          	auipc	a4,0x2
f9002d94:	1d870713          	addi	a4,a4,472 # f9004f68 <__clz_tab+0x1e0>
f9002d98:	00072603          	lw	a2,0(a4)
f9002d9c:	00472683          	lw	a3,4(a4)
f9002da0:	bc5fd0ef          	jal	ra,f9000964 <__muldf3>
f9002da4:	00002717          	auipc	a4,0x2
f9002da8:	1cc70713          	addi	a4,a4,460 # f9004f70 <__clz_tab+0x1e8>
f9002dac:	00072603          	lw	a2,0(a4)
f9002db0:	00472683          	lw	a3,4(a4)
f9002db4:	00050413          	mv	s0,a0
f9002db8:	00058493          	mv	s1,a1
f9002dbc:	000c0513          	mv	a0,s8
f9002dc0:	000d0593          	mv	a1,s10
f9002dc4:	ba1fd0ef          	jal	ra,f9000964 <__muldf3>
f9002dc8:	00050613          	mv	a2,a0
f9002dcc:	00058693          	mv	a3,a1
f9002dd0:	00040513          	mv	a0,s0
f9002dd4:	00048593          	mv	a1,s1
f9002dd8:	3c1000ef          	jal	ra,f9003998 <__adddf3>
f9002ddc:	00050913          	mv	s2,a0
f9002de0:	00058993          	mv	s3,a1
f9002de4:	00050613          	mv	a2,a0
f9002de8:	00058693          	mv	a3,a1
f9002dec:	000b0513          	mv	a0,s6
f9002df0:	000b8593          	mv	a1,s7
f9002df4:	3a5000ef          	jal	ra,f9003998 <__adddf3>
f9002df8:	000b0613          	mv	a2,s6
f9002dfc:	000b8693          	mv	a3,s7
f9002e00:	00050413          	mv	s0,a0
f9002e04:	00058493          	mv	s1,a1
f9002e08:	a64fe0ef          	jal	ra,f900106c <__subdf3>
f9002e0c:	00050613          	mv	a2,a0
f9002e10:	00058693          	mv	a3,a1
f9002e14:	00090513          	mv	a0,s2
f9002e18:	00098593          	mv	a1,s3
f9002e1c:	a50fe0ef          	jal	ra,f900106c <__subdf3>
f9002e20:	00050b13          	mv	s6,a0
f9002e24:	00058b93          	mv	s7,a1
f9002e28:	00040613          	mv	a2,s0
f9002e2c:	00048693          	mv	a3,s1
f9002e30:	00040513          	mv	a0,s0
f9002e34:	00048593          	mv	a1,s1
f9002e38:	b2dfd0ef          	jal	ra,f9000964 <__muldf3>
f9002e3c:	00002797          	auipc	a5,0x2
f9002e40:	13c78793          	addi	a5,a5,316 # f9004f78 <__clz_tab+0x1f0>
f9002e44:	0007a603          	lw	a2,0(a5)
f9002e48:	0047a683          	lw	a3,4(a5)
f9002e4c:	00050913          	mv	s2,a0
f9002e50:	00058993          	mv	s3,a1
f9002e54:	b11fd0ef          	jal	ra,f9000964 <__muldf3>
f9002e58:	00002797          	auipc	a5,0x2
f9002e5c:	12878793          	addi	a5,a5,296 # f9004f80 <__clz_tab+0x1f8>
f9002e60:	0007a603          	lw	a2,0(a5)
f9002e64:	0047a683          	lw	a3,4(a5)
f9002e68:	a04fe0ef          	jal	ra,f900106c <__subdf3>
f9002e6c:	00090613          	mv	a2,s2
f9002e70:	00098693          	mv	a3,s3
f9002e74:	af1fd0ef          	jal	ra,f9000964 <__muldf3>
f9002e78:	00002797          	auipc	a5,0x2
f9002e7c:	11078793          	addi	a5,a5,272 # f9004f88 <__clz_tab+0x200>
f9002e80:	0007a603          	lw	a2,0(a5)
f9002e84:	0047a683          	lw	a3,4(a5)
f9002e88:	311000ef          	jal	ra,f9003998 <__adddf3>
f9002e8c:	00090613          	mv	a2,s2
f9002e90:	00098693          	mv	a3,s3
f9002e94:	ad1fd0ef          	jal	ra,f9000964 <__muldf3>
f9002e98:	00002797          	auipc	a5,0x2
f9002e9c:	0f878793          	addi	a5,a5,248 # f9004f90 <__clz_tab+0x208>
f9002ea0:	0007a603          	lw	a2,0(a5)
f9002ea4:	0047a683          	lw	a3,4(a5)
f9002ea8:	9c4fe0ef          	jal	ra,f900106c <__subdf3>
f9002eac:	00090613          	mv	a2,s2
f9002eb0:	00098693          	mv	a3,s3
f9002eb4:	ab1fd0ef          	jal	ra,f9000964 <__muldf3>
f9002eb8:	00002797          	auipc	a5,0x2
f9002ebc:	0e078793          	addi	a5,a5,224 # f9004f98 <__clz_tab+0x210>
f9002ec0:	0007a603          	lw	a2,0(a5)
f9002ec4:	0047a683          	lw	a3,4(a5)
f9002ec8:	2d1000ef          	jal	ra,f9003998 <__adddf3>
f9002ecc:	00090613          	mv	a2,s2
f9002ed0:	00098693          	mv	a3,s3
f9002ed4:	a91fd0ef          	jal	ra,f9000964 <__muldf3>
f9002ed8:	00050613          	mv	a2,a0
f9002edc:	00058693          	mv	a3,a1
f9002ee0:	00040513          	mv	a0,s0
f9002ee4:	00048593          	mv	a1,s1
f9002ee8:	984fe0ef          	jal	ra,f900106c <__subdf3>
f9002eec:	00050613          	mv	a2,a0
f9002ef0:	00058693          	mv	a3,a1
f9002ef4:	00050c13          	mv	s8,a0
f9002ef8:	00058c93          	mv	s9,a1
f9002efc:	00040513          	mv	a0,s0
f9002f00:	00048593          	mv	a1,s1
f9002f04:	a61fd0ef          	jal	ra,f9000964 <__muldf3>
f9002f08:	00002697          	auipc	a3,0x2
f9002f0c:	09868693          	addi	a3,a3,152 # f9004fa0 <__clz_tab+0x218>
f9002f10:	0006a603          	lw	a2,0(a3)
f9002f14:	0046a683          	lw	a3,4(a3)
f9002f18:	00050913          	mv	s2,a0
f9002f1c:	00058993          	mv	s3,a1
f9002f20:	000c0513          	mv	a0,s8
f9002f24:	000c8593          	mv	a1,s9
f9002f28:	944fe0ef          	jal	ra,f900106c <__subdf3>
f9002f2c:	00050613          	mv	a2,a0
f9002f30:	00058693          	mv	a3,a1
f9002f34:	00090513          	mv	a0,s2
f9002f38:	00098593          	mv	a1,s3
f9002f3c:	2e0010ef          	jal	ra,f900421c <__divdf3>
f9002f40:	00050913          	mv	s2,a0
f9002f44:	00058993          	mv	s3,a1
f9002f48:	000b0613          	mv	a2,s6
f9002f4c:	000b8693          	mv	a3,s7
f9002f50:	00040513          	mv	a0,s0
f9002f54:	00048593          	mv	a1,s1
f9002f58:	a0dfd0ef          	jal	ra,f9000964 <__muldf3>
f9002f5c:	000b0613          	mv	a2,s6
f9002f60:	000b8693          	mv	a3,s7
f9002f64:	235000ef          	jal	ra,f9003998 <__adddf3>
f9002f68:	00050613          	mv	a2,a0
f9002f6c:	00058693          	mv	a3,a1
f9002f70:	00090513          	mv	a0,s2
f9002f74:	00098593          	mv	a1,s3
f9002f78:	8f4fe0ef          	jal	ra,f900106c <__subdf3>
f9002f7c:	00040613          	mv	a2,s0
f9002f80:	00048693          	mv	a3,s1
f9002f84:	8e8fe0ef          	jal	ra,f900106c <__subdf3>
f9002f88:	00058693          	mv	a3,a1
f9002f8c:	00050613          	mv	a2,a0
f9002f90:	004aa583          	lw	a1,4(s5)
f9002f94:	000aa503          	lw	a0,0(s5)
f9002f98:	8d4fe0ef          	jal	ra,f900106c <__subdf3>
f9002f9c:	00bd87b3          	add	a5,s11,a1
f9002fa0:	4147d693          	srai	a3,a5,0x14
f9002fa4:	32d05063          	blez	a3,f90032c4 <__ieee754_pow+0xfcc>
f9002fa8:	00078593          	mv	a1,a5
f9002fac:	00812603          	lw	a2,8(sp)
f9002fb0:	00c12683          	lw	a3,12(sp)
f9002fb4:	9b1fd0ef          	jal	ra,f9000964 <__muldf3>
f9002fb8:	bb8ff06f          	j	f9002370 <__ieee754_pow+0x78>
f9002fbc:	00159793          	slli	a5,a1,0x1
f9002fc0:	4090d6b7          	lui	a3,0x4090d
f9002fc4:	0017d793          	srli	a5,a5,0x1
f9002fc8:	bff68693          	addi	a3,a3,-1025 # 4090cbff <__stack_size+0x4090abff>
f9002fcc:	26f6d263          	bge	a3,a5,f9003230 <__ieee754_pow+0xf38>
f9002fd0:	3f6f37b7          	lui	a5,0x3f6f3
f9002fd4:	40078793          	addi	a5,a5,1024 # 3f6f3400 <__stack_size+0x3f6f1400>
f9002fd8:	00f587b3          	add	a5,a1,a5
f9002fdc:	00a7e7b3          	or	a5,a5,a0
f9002fe0:	02079063          	bnez	a5,f9003000 <__ieee754_pow+0xd08>
f9002fe4:	00040613          	mv	a2,s0
f9002fe8:	00048693          	mv	a3,s1
f9002fec:	880fe0ef          	jal	ra,f900106c <__subdf3>
f9002ff0:	00090613          	mv	a2,s2
f9002ff4:	00098693          	mv	a3,s3
f9002ff8:	355010ef          	jal	ra,f9004b4c <__gedf2>
f9002ffc:	ca054ce3          	bltz	a0,f9002cb4 <__ieee754_pow+0x9bc>
f9003000:	00002417          	auipc	s0,0x2
f9003004:	f5840413          	addi	s0,s0,-168 # f9004f58 <__clz_tab+0x1d0>
f9003008:	00042603          	lw	a2,0(s0)
f900300c:	00442683          	lw	a3,4(s0)
f9003010:	00812503          	lw	a0,8(sp)
f9003014:	00c12583          	lw	a1,12(sp)
f9003018:	94dfd0ef          	jal	ra,f9000964 <__muldf3>
f900301c:	00042603          	lw	a2,0(s0)
f9003020:	00442683          	lw	a3,4(s0)
f9003024:	941fd0ef          	jal	ra,f9000964 <__muldf3>
f9003028:	b48ff06f          	j	f9002370 <__ieee754_pow+0x78>
f900302c:	000aa783          	lw	a5,0(s5)
f9003030:	004aa803          	lw	a6,4(s5)
f9003034:	00f12423          	sw	a5,8(sp)
f9003038:	01012623          	sw	a6,12(sp)
f900303c:	b7dff06f          	j	f9002bb8 <__ieee754_pow+0x8c0>
f9003040:	d60dd663          	bgez	s11,f90025ac <__ieee754_pow+0x2b4>
f9003044:	800005b7          	lui	a1,0x80000
f9003048:	00000513          	li	a0,0
f900304c:	01b5c5b3          	xor	a1,a1,s11
f9003050:	b20ff06f          	j	f9002370 <__ieee754_pow+0x78>
f9003054:	00002a97          	auipc	s5,0x2
f9003058:	e34a8a93          	addi	s5,s5,-460 # f9004e88 <__clz_tab+0x100>
f900305c:	e68ff06f          	j	f90026c4 <__ieee754_pow+0x3cc>
f9003060:	3ff006b7          	lui	a3,0x3ff00
f9003064:	ffe68613          	addi	a2,a3,-2 # 3feffffe <__stack_size+0x3fefdffe>
f9003068:	ca865663          	bge	a2,s0,f9002514 <__ieee754_pow+0x21c>
f900306c:	d686cc63          	blt	a3,s0,f90025e4 <__ieee754_pow+0x2ec>
f9003070:	00002a97          	auipc	s5,0x2
f9003074:	e18a8a93          	addi	s5,s5,-488 # f9004e88 <__clz_tab+0x100>
f9003078:	000aa603          	lw	a2,0(s5)
f900307c:	004aa683          	lw	a3,4(s5)
f9003080:	01c12823          	sw	t3,16(sp)
f9003084:	fe9fd0ef          	jal	ra,f900106c <__subdf3>
f9003088:	00002697          	auipc	a3,0x2
f900308c:	e4068693          	addi	a3,a3,-448 # f9004ec8 <__clz_tab+0x140>
f9003090:	0006a603          	lw	a2,0(a3)
f9003094:	0046a683          	lw	a3,4(a3)
f9003098:	00050413          	mv	s0,a0
f900309c:	00058493          	mv	s1,a1
f90030a0:	8c5fd0ef          	jal	ra,f9000964 <__muldf3>
f90030a4:	00002697          	auipc	a3,0x2
f90030a8:	e2c68693          	addi	a3,a3,-468 # f9004ed0 <__clz_tab+0x148>
f90030ac:	0006a603          	lw	a2,0(a3)
f90030b0:	0046a683          	lw	a3,4(a3)
f90030b4:	00050913          	mv	s2,a0
f90030b8:	00058993          	mv	s3,a1
f90030bc:	00040513          	mv	a0,s0
f90030c0:	00048593          	mv	a1,s1
f90030c4:	8a1fd0ef          	jal	ra,f9000964 <__muldf3>
f90030c8:	00002697          	auipc	a3,0x2
f90030cc:	e1068693          	addi	a3,a3,-496 # f9004ed8 <__clz_tab+0x150>
f90030d0:	0006a603          	lw	a2,0(a3)
f90030d4:	0046a683          	lw	a3,4(a3)
f90030d8:	00a12423          	sw	a0,8(sp)
f90030dc:	00b12623          	sw	a1,12(sp)
f90030e0:	00040513          	mv	a0,s0
f90030e4:	00048593          	mv	a1,s1
f90030e8:	87dfd0ef          	jal	ra,f9000964 <__muldf3>
f90030ec:	00058693          	mv	a3,a1
f90030f0:	00002597          	auipc	a1,0x2
f90030f4:	df058593          	addi	a1,a1,-528 # f9004ee0 <__clz_tab+0x158>
f90030f8:	00050613          	mv	a2,a0
f90030fc:	0005a503          	lw	a0,0(a1)
f9003100:	0045a583          	lw	a1,4(a1)
f9003104:	f69fd0ef          	jal	ra,f900106c <__subdf3>
f9003108:	00040613          	mv	a2,s0
f900310c:	00048693          	mv	a3,s1
f9003110:	855fd0ef          	jal	ra,f9000964 <__muldf3>
f9003114:	00058693          	mv	a3,a1
f9003118:	00002597          	auipc	a1,0x2
f900311c:	dd058593          	addi	a1,a1,-560 # f9004ee8 <__clz_tab+0x160>
f9003120:	00050613          	mv	a2,a0
f9003124:	0005a503          	lw	a0,0(a1)
f9003128:	0045a583          	lw	a1,4(a1)
f900312c:	f41fd0ef          	jal	ra,f900106c <__subdf3>
f9003130:	00050b13          	mv	s6,a0
f9003134:	00058b93          	mv	s7,a1
f9003138:	00040613          	mv	a2,s0
f900313c:	00048693          	mv	a3,s1
f9003140:	00040513          	mv	a0,s0
f9003144:	00048593          	mv	a1,s1
f9003148:	81dfd0ef          	jal	ra,f9000964 <__muldf3>
f900314c:	00050613          	mv	a2,a0
f9003150:	00058693          	mv	a3,a1
f9003154:	000b0513          	mv	a0,s6
f9003158:	000b8593          	mv	a1,s7
f900315c:	809fd0ef          	jal	ra,f9000964 <__muldf3>
f9003160:	00002697          	auipc	a3,0x2
f9003164:	d9068693          	addi	a3,a3,-624 # f9004ef0 <__clz_tab+0x168>
f9003168:	0006a603          	lw	a2,0(a3)
f900316c:	0046a683          	lw	a3,4(a3)
f9003170:	ff4fd0ef          	jal	ra,f9000964 <__muldf3>
f9003174:	00812703          	lw	a4,8(sp)
f9003178:	00c12783          	lw	a5,12(sp)
f900317c:	00050613          	mv	a2,a0
f9003180:	00058693          	mv	a3,a1
f9003184:	00070513          	mv	a0,a4
f9003188:	00078593          	mv	a1,a5
f900318c:	ee1fd0ef          	jal	ra,f900106c <__subdf3>
f9003190:	00050613          	mv	a2,a0
f9003194:	00058693          	mv	a3,a1
f9003198:	00050b13          	mv	s6,a0
f900319c:	00058b93          	mv	s7,a1
f90031a0:	00090513          	mv	a0,s2
f90031a4:	00098593          	mv	a1,s3
f90031a8:	7f0000ef          	jal	ra,f9003998 <__adddf3>
f90031ac:	00000613          	li	a2,0
f90031b0:	00098693          	mv	a3,s3
f90031b4:	00060513          	mv	a0,a2
f90031b8:	00060413          	mv	s0,a2
f90031bc:	00090613          	mv	a2,s2
f90031c0:	00058493          	mv	s1,a1
f90031c4:	ea9fd0ef          	jal	ra,f900106c <__subdf3>
f90031c8:	00050613          	mv	a2,a0
f90031cc:	00058693          	mv	a3,a1
f90031d0:	000b0513          	mv	a0,s6
f90031d4:	000b8593          	mv	a1,s7
f90031d8:	e95fd0ef          	jal	ra,f900106c <__subdf3>
f90031dc:	00050913          	mv	s2,a0
f90031e0:	00058993          	mv	s3,a1
f90031e4:	01012e03          	lw	t3,16(sp)
f90031e8:	9adff06f          	j	f9002b94 <__ieee754_pow+0x89c>
f90031ec:	00098613          	mv	a2,s3
f90031f0:	00098513          	mv	a0,s3
f90031f4:	00048693          	mv	a3,s1
f90031f8:	00048593          	mv	a1,s1
f90031fc:	f68fd0ef          	jal	ra,f9000964 <__muldf3>
f9003200:	970ff06f          	j	f9002370 <__ieee754_pow+0x78>
f9003204:	b20c9a63          	bnez	s9,f9002538 <__ieee754_pow+0x240>
f9003208:	40d606b3          	sub	a3,a2,a3
f900320c:	40d95633          	sra	a2,s2,a3
f9003210:	00d616b3          	sll	a3,a2,a3
f9003214:	000c8d13          	mv	s10,s9
f9003218:	01268463          	beq	a3,s2,f9003220 <__ieee754_pow+0xf28>
f900321c:	9c4ff06f          	j	f90023e0 <__ieee754_pow+0xe8>
f9003220:	00167613          	andi	a2,a2,1
f9003224:	00200313          	li	t1,2
f9003228:	40c30d33          	sub	s10,t1,a2
f900322c:	9b4ff06f          	j	f90023e0 <__ieee754_pow+0xe8>
f9003230:	3fe00737          	lui	a4,0x3fe00
f9003234:	00000d93          	li	s11,0
f9003238:	00000a13          	li	s4,0
f900323c:	b0f750e3          	bge	a4,a5,f9002d3c <__ieee754_pow+0xa44>
f9003240:	4147d793          	srai	a5,a5,0x14
f9003244:	a79ff06f          	j	f9002cbc <__ieee754_pow+0x9c4>
f9003248:	00002417          	auipc	s0,0x2
f900324c:	c7840413          	addi	s0,s0,-904 # f9004ec0 <__clz_tab+0x138>
f9003250:	db9ff06f          	j	f9003008 <__ieee754_pow+0xd10>
f9003254:	00100793          	li	a5,1
f9003258:	00fd0463          	beq	s10,a5,f9003260 <__ieee754_pow+0xf68>
f900325c:	914ff06f          	j	f9002370 <__ieee754_pow+0x78>
f9003260:	800007b7          	lui	a5,0x80000
f9003264:	00b7c5b3          	xor	a1,a5,a1
f9003268:	908ff06f          	j	f9002370 <__ieee754_pow+0x78>
f900326c:	00002697          	auipc	a3,0x2
f9003270:	c3468693          	addi	a3,a3,-972 # f9004ea0 <__clz_tab+0x118>
f9003274:	0006a783          	lw	a5,0(a3)
f9003278:	0046a803          	lw	a6,4(a3)
f900327c:	00002697          	auipc	a3,0x2
f9003280:	c2c68693          	addi	a3,a3,-980 # f9004ea8 <__clz_tab+0x120>
f9003284:	00f12823          	sw	a5,16(sp)
f9003288:	01012a23          	sw	a6,20(sp)
f900328c:	0006a783          	lw	a5,0(a3)
f9003290:	0046a803          	lw	a6,4(a3)
f9003294:	00002697          	auipc	a3,0x2
f9003298:	c1c68693          	addi	a3,a3,-996 # f9004eb0 <__clz_tab+0x128>
f900329c:	02f12c23          	sw	a5,56(sp)
f90032a0:	03012e23          	sw	a6,60(sp)
f90032a4:	0006a783          	lw	a5,0(a3)
f90032a8:	0046a803          	lw	a6,4(a3)
f90032ac:	000409b7          	lui	s3,0x40
f90032b0:	00f12423          	sw	a5,8(sp)
f90032b4:	01012623          	sw	a6,12(sp)
f90032b8:	00002a97          	auipc	s5,0x2
f90032bc:	bd0a8a93          	addi	s5,s5,-1072 # f9004e88 <__clz_tab+0x100>
f90032c0:	c28ff06f          	j	f90026e8 <__ieee754_pow+0x3f0>
f90032c4:	000a0613          	mv	a2,s4
f90032c8:	518000ef          	jal	ra,f90037e0 <scalbn>
f90032cc:	ce1ff06f          	j	f9002fac <__ieee754_pow+0xcb4>

f90032d0 <__ieee754_sqrt>:
f90032d0:	ff010113          	addi	sp,sp,-16
f90032d4:	7ff00737          	lui	a4,0x7ff00
f90032d8:	00812423          	sw	s0,8(sp)
f90032dc:	00912223          	sw	s1,4(sp)
f90032e0:	00112623          	sw	ra,12(sp)
f90032e4:	00b77833          	and	a6,a4,a1
f90032e8:	00058493          	mv	s1,a1
f90032ec:	00050413          	mv	s0,a0
f90032f0:	20e80863          	beq	a6,a4,f9003500 <__ieee754_sqrt+0x230>
f90032f4:	00058793          	mv	a5,a1
f90032f8:	00050693          	mv	a3,a0
f90032fc:	14b05a63          	blez	a1,f9003450 <__ieee754_sqrt+0x180>
f9003300:	4145de13          	srai	t3,a1,0x14
f9003304:	240e0e63          	beqz	t3,f9003560 <__ieee754_sqrt+0x290>
f9003308:	00100737          	lui	a4,0x100
f900330c:	fff70613          	addi	a2,a4,-1 # fffff <__stack_size+0xfdfff>
f9003310:	00c7f7b3          	and	a5,a5,a2
f9003314:	00e7e7b3          	or	a5,a5,a4
f9003318:	c01e0e13          	addi	t3,t3,-1023
f900331c:	00179713          	slli	a4,a5,0x1
f9003320:	001e7613          	andi	a2,t3,1
f9003324:	01f6d793          	srli	a5,a3,0x1f
f9003328:	00f707b3          	add	a5,a4,a5
f900332c:	00169713          	slli	a4,a3,0x1
f9003330:	00060a63          	beqz	a2,f9003344 <__ieee754_sqrt+0x74>
f9003334:	01f75713          	srli	a4,a4,0x1f
f9003338:	00179793          	slli	a5,a5,0x1
f900333c:	00e787b3          	add	a5,a5,a4
f9003340:	00269713          	slli	a4,a3,0x2
f9003344:	401e5e13          	srai	t3,t3,0x1
f9003348:	01600593          	li	a1,22
f900334c:	00000e93          	li	t4,0
f9003350:	00000693          	li	a3,0
f9003354:	00200637          	lui	a2,0x200
f9003358:	00c68533          	add	a0,a3,a2
f900335c:	01f75813          	srli	a6,a4,0x1f
f9003360:	fff58593          	addi	a1,a1,-1
f9003364:	00a7c863          	blt	a5,a0,f9003374 <__ieee754_sqrt+0xa4>
f9003368:	40a787b3          	sub	a5,a5,a0
f900336c:	00c506b3          	add	a3,a0,a2
f9003370:	00ce8eb3          	add	t4,t4,a2
f9003374:	00179793          	slli	a5,a5,0x1
f9003378:	00f807b3          	add	a5,a6,a5
f900337c:	00171713          	slli	a4,a4,0x1
f9003380:	00165613          	srli	a2,a2,0x1
f9003384:	fc059ae3          	bnez	a1,f9003358 <__ieee754_sqrt+0x88>
f9003388:	00000313          	li	t1,0
f900338c:	02000813          	li	a6,32
f9003390:	80000637          	lui	a2,0x80000
f9003394:	0240006f          	j	f90033b8 <__ieee754_sqrt+0xe8>
f9003398:	12d78e63          	beq	a5,a3,f90034d4 <__ieee754_sqrt+0x204>
f900339c:	01f75513          	srli	a0,a4,0x1f
f90033a0:	00179793          	slli	a5,a5,0x1
f90033a4:	fff80813          	addi	a6,a6,-1 # c00fffff <__freertos_irq_stack_top+0xc70f8b7f>
f90033a8:	00a787b3          	add	a5,a5,a0
f90033ac:	00171713          	slli	a4,a4,0x1
f90033b0:	00165613          	srli	a2,a2,0x1
f90033b4:	04080663          	beqz	a6,f9003400 <__ieee754_sqrt+0x130>
f90033b8:	00b60533          	add	a0,a2,a1
f90033bc:	fcf6dee3          	bge	a3,a5,f9003398 <__ieee754_sqrt+0xc8>
f90033c0:	00c505b3          	add	a1,a0,a2
f90033c4:	00068893          	mv	a7,a3
f90033c8:	0e054e63          	bltz	a0,f90034c4 <__ieee754_sqrt+0x1f4>
f90033cc:	40d787b3          	sub	a5,a5,a3
f90033d0:	00a736b3          	sltu	a3,a4,a0
f90033d4:	40d787b3          	sub	a5,a5,a3
f90033d8:	40a70733          	sub	a4,a4,a0
f90033dc:	01f75513          	srli	a0,a4,0x1f
f90033e0:	00179793          	slli	a5,a5,0x1
f90033e4:	fff80813          	addi	a6,a6,-1
f90033e8:	00c30333          	add	t1,t1,a2
f90033ec:	00088693          	mv	a3,a7
f90033f0:	00a787b3          	add	a5,a5,a0
f90033f4:	00171713          	slli	a4,a4,0x1
f90033f8:	00165613          	srli	a2,a2,0x1
f90033fc:	fa081ee3          	bnez	a6,f90033b8 <__ieee754_sqrt+0xe8>
f9003400:	00e7e7b3          	or	a5,a5,a4
f9003404:	0e079463          	bnez	a5,f90034ec <__ieee754_sqrt+0x21c>
f9003408:	00135813          	srli	a6,t1,0x1
f900340c:	401ed713          	srai	a4,t4,0x1
f9003410:	3fe004b7          	lui	s1,0x3fe00
f9003414:	001efe93          	andi	t4,t4,1
f9003418:	009704b3          	add	s1,a4,s1
f900341c:	000e8663          	beqz	t4,f9003428 <__ieee754_sqrt+0x158>
f9003420:	800007b7          	lui	a5,0x80000
f9003424:	00f86833          	or	a6,a6,a5
f9003428:	014e1713          	slli	a4,t3,0x14
f900342c:	00080413          	mv	s0,a6
f9003430:	00970733          	add	a4,a4,s1
f9003434:	00040513          	mv	a0,s0
f9003438:	00c12083          	lw	ra,12(sp)
f900343c:	00812403          	lw	s0,8(sp)
f9003440:	00412483          	lw	s1,4(sp)
f9003444:	00070593          	mv	a1,a4
f9003448:	01010113          	addi	sp,sp,16
f900344c:	00008067          	ret
f9003450:	00159713          	slli	a4,a1,0x1
f9003454:	00175713          	srli	a4,a4,0x1
f9003458:	00a76833          	or	a6,a4,a0
f900345c:	00058713          	mv	a4,a1
f9003460:	fc080ae3          	beqz	a6,f9003434 <__ieee754_sqrt+0x164>
f9003464:	0c059c63          	bnez	a1,f900353c <__ieee754_sqrt+0x26c>
f9003468:	00b6d593          	srli	a1,a3,0xb
f900346c:	feb78793          	addi	a5,a5,-21 # 7fffffeb <__freertos_irq_stack_top+0x86ff8b6b>
f9003470:	00058713          	mv	a4,a1
f9003474:	01569693          	slli	a3,a3,0x15
f9003478:	fe0588e3          	beqz	a1,f9003468 <__ieee754_sqrt+0x198>
f900347c:	0145d613          	srli	a2,a1,0x14
f9003480:	0e061a63          	bnez	a2,f9003574 <__ieee754_sqrt+0x2a4>
f9003484:	00000613          	li	a2,0
f9003488:	0080006f          	j	f9003490 <__ieee754_sqrt+0x1c0>
f900348c:	00050613          	mv	a2,a0
f9003490:	00171713          	slli	a4,a4,0x1
f9003494:	00b71593          	slli	a1,a4,0xb
f9003498:	00160513          	addi	a0,a2,1 # 80000001 <__freertos_irq_stack_top+0x86ff8b81>
f900349c:	fe05d8e3          	bgez	a1,f900348c <__ieee754_sqrt+0x1bc>
f90034a0:	02000893          	li	a7,32
f90034a4:	00068813          	mv	a6,a3
f90034a8:	40a888b3          	sub	a7,a7,a0
f90034ac:	00070593          	mv	a1,a4
f90034b0:	00a696b3          	sll	a3,a3,a0
f90034b4:	01185733          	srl	a4,a6,a7
f90034b8:	40c78e33          	sub	t3,a5,a2
f90034bc:	00b767b3          	or	a5,a4,a1
f90034c0:	e49ff06f          	j	f9003308 <__ieee754_sqrt+0x38>
f90034c4:	fff5c893          	not	a7,a1
f90034c8:	01f8d893          	srli	a7,a7,0x1f
f90034cc:	011688b3          	add	a7,a3,a7
f90034d0:	efdff06f          	j	f90033cc <__ieee754_sqrt+0xfc>
f90034d4:	eca764e3          	bltu	a4,a0,f900339c <__ieee754_sqrt+0xcc>
f90034d8:	00c505b3          	add	a1,a0,a2
f90034dc:	fe0544e3          	bltz	a0,f90034c4 <__ieee754_sqrt+0x1f4>
f90034e0:	00078893          	mv	a7,a5
f90034e4:	00000793          	li	a5,0
f90034e8:	ef1ff06f          	j	f90033d8 <__ieee754_sqrt+0x108>
f90034ec:	fff00793          	li	a5,-1
f90034f0:	06f30e63          	beq	t1,a5,f900356c <__ieee754_sqrt+0x29c>
f90034f4:	00130813          	addi	a6,t1,1
f90034f8:	00185813          	srli	a6,a6,0x1
f90034fc:	f11ff06f          	j	f900340c <__ieee754_sqrt+0x13c>
f9003500:	00050613          	mv	a2,a0
f9003504:	00058693          	mv	a3,a1
f9003508:	c5cfd0ef          	jal	ra,f9000964 <__muldf3>
f900350c:	00040613          	mv	a2,s0
f9003510:	00048693          	mv	a3,s1
f9003514:	484000ef          	jal	ra,f9003998 <__adddf3>
f9003518:	00050413          	mv	s0,a0
f900351c:	00040513          	mv	a0,s0
f9003520:	00c12083          	lw	ra,12(sp)
f9003524:	00812403          	lw	s0,8(sp)
f9003528:	00058713          	mv	a4,a1
f900352c:	00412483          	lw	s1,4(sp)
f9003530:	00070593          	mv	a1,a4
f9003534:	01010113          	addi	sp,sp,16
f9003538:	00008067          	ret
f900353c:	00050613          	mv	a2,a0
f9003540:	00058693          	mv	a3,a1
f9003544:	b29fd0ef          	jal	ra,f900106c <__subdf3>
f9003548:	00050613          	mv	a2,a0
f900354c:	00058693          	mv	a3,a1
f9003550:	4cd000ef          	jal	ra,f900421c <__divdf3>
f9003554:	00050413          	mv	s0,a0
f9003558:	00058713          	mv	a4,a1
f900355c:	ed9ff06f          	j	f9003434 <__ieee754_sqrt+0x164>
f9003560:	00058713          	mv	a4,a1
f9003564:	00000793          	li	a5,0
f9003568:	f1dff06f          	j	f9003484 <__ieee754_sqrt+0x1b4>
f900356c:	001e8e93          	addi	t4,t4,1
f9003570:	e9dff06f          	j	f900340c <__ieee754_sqrt+0x13c>
f9003574:	00068813          	mv	a6,a3
f9003578:	02000893          	li	a7,32
f900357c:	fff00613          	li	a2,-1
f9003580:	f35ff06f          	j	f90034b4 <__ieee754_sqrt+0x1e4>

f9003584 <fabs>:
f9003584:	00159593          	slli	a1,a1,0x1
f9003588:	0015d593          	srli	a1,a1,0x1
f900358c:	00008067          	ret

f9003590 <finite>:
f9003590:	00159593          	slli	a1,a1,0x1
f9003594:	0015d593          	srli	a1,a1,0x1
f9003598:	80100537          	lui	a0,0x80100
f900359c:	00a58533          	add	a0,a1,a0
f90035a0:	01f55513          	srli	a0,a0,0x1f
f90035a4:	00008067          	ret

f90035a8 <nan>:
f90035a8:	00002797          	auipc	a5,0x2
f90035ac:	a0078793          	addi	a5,a5,-1536 # f9004fa8 <__clz_tab+0x220>
f90035b0:	0007a503          	lw	a0,0(a5)
f90035b4:	0047a583          	lw	a1,4(a5)
f90035b8:	00008067          	ret

f90035bc <rint>:
f90035bc:	4145d713          	srai	a4,a1,0x14
f90035c0:	fd010113          	addi	sp,sp,-48
f90035c4:	7ff77713          	andi	a4,a4,2047
f90035c8:	02812423          	sw	s0,40(sp)
f90035cc:	02112623          	sw	ra,44(sp)
f90035d0:	02912223          	sw	s1,36(sp)
f90035d4:	03212023          	sw	s2,32(sp)
f90035d8:	01312e23          	sw	s3,28(sp)
f90035dc:	c0170613          	addi	a2,a4,-1023
f90035e0:	01300893          	li	a7,19
f90035e4:	00058793          	mv	a5,a1
f90035e8:	00050693          	mv	a3,a0
f90035ec:	00058e13          	mv	t3,a1
f90035f0:	01f5d413          	srli	s0,a1,0x1f
f90035f4:	16c8cc63          	blt	a7,a2,f900376c <rint+0x1b0>
f90035f8:	0c064863          	bltz	a2,f90036c8 <rint+0x10c>
f90035fc:	001005b7          	lui	a1,0x100
f9003600:	fff58593          	addi	a1,a1,-1 # fffff <__stack_size+0xfdfff>
f9003604:	40c5d5b3          	sra	a1,a1,a2
f9003608:	00f5f533          	and	a0,a1,a5
f900360c:	00d56533          	or	a0,a0,a3
f9003610:	00068893          	mv	a7,a3
f9003614:	00078313          	mv	t1,a5
f9003618:	08050663          	beqz	a0,f90036a4 <rint+0xe8>
f900361c:	0015d593          	srli	a1,a1,0x1
f9003620:	00f5f833          	and	a6,a1,a5
f9003624:	00d86833          	or	a6,a6,a3
f9003628:	02080663          	beqz	a6,f9003654 <rint+0x98>
f900362c:	bee70693          	addi	a3,a4,-1042
f9003630:	00040e37          	lui	t3,0x40
f9003634:	0016b693          	seqz	a3,a3
f9003638:	fff5c593          	not	a1,a1
f900363c:	80000837          	lui	a6,0x80000
f9003640:	40d006b3          	neg	a3,a3
f9003644:	00f5f7b3          	and	a5,a1,a5
f9003648:	40ce5633          	sra	a2,t3,a2
f900364c:	00d87833          	and	a6,a6,a3
f9003650:	00c7ee33          	or	t3,a5,a2
f9003654:	00002797          	auipc	a5,0x2
f9003658:	95c78793          	addi	a5,a5,-1700 # f9004fb0 <TWO52>
f900365c:	00341313          	slli	t1,s0,0x3
f9003660:	00678333          	add	t1,a5,t1
f9003664:	00032403          	lw	s0,0(t1)
f9003668:	00432483          	lw	s1,4(t1)
f900366c:	00080613          	mv	a2,a6
f9003670:	000e0693          	mv	a3,t3
f9003674:	00040513          	mv	a0,s0
f9003678:	00048593          	mv	a1,s1
f900367c:	31c000ef          	jal	ra,f9003998 <__adddf3>
f9003680:	00a12423          	sw	a0,8(sp)
f9003684:	00b12623          	sw	a1,12(sp)
f9003688:	00812503          	lw	a0,8(sp)
f900368c:	00c12583          	lw	a1,12(sp)
f9003690:	00040613          	mv	a2,s0
f9003694:	00048693          	mv	a3,s1
f9003698:	9d5fd0ef          	jal	ra,f900106c <__subdf3>
f900369c:	00050893          	mv	a7,a0
f90036a0:	00058313          	mv	t1,a1
f90036a4:	02c12083          	lw	ra,44(sp)
f90036a8:	02812403          	lw	s0,40(sp)
f90036ac:	02412483          	lw	s1,36(sp)
f90036b0:	02012903          	lw	s2,32(sp)
f90036b4:	01c12983          	lw	s3,28(sp)
f90036b8:	00088513          	mv	a0,a7
f90036bc:	00030593          	mv	a1,t1
f90036c0:	03010113          	addi	sp,sp,48
f90036c4:	00008067          	ret
f90036c8:	800004b7          	lui	s1,0x80000
f90036cc:	fff4c493          	not	s1,s1
f90036d0:	00b4f733          	and	a4,s1,a1
f90036d4:	00a76733          	or	a4,a4,a0
f90036d8:	00050893          	mv	a7,a0
f90036dc:	00058313          	mv	t1,a1
f90036e0:	fc0702e3          	beqz	a4,f90036a4 <rint+0xe8>
f90036e4:	00c59793          	slli	a5,a1,0xc
f90036e8:	00c7d793          	srli	a5,a5,0xc
f90036ec:	00a7e733          	or	a4,a5,a0
f90036f0:	40e007b3          	neg	a5,a4
f90036f4:	00e7e7b3          	or	a5,a5,a4
f90036f8:	00002697          	auipc	a3,0x2
f90036fc:	8b868693          	addi	a3,a3,-1864 # f9004fb0 <TWO52>
f9003700:	00341713          	slli	a4,s0,0x3
f9003704:	00e686b3          	add	a3,a3,a4
f9003708:	00c7d793          	srli	a5,a5,0xc
f900370c:	0006a903          	lw	s2,0(a3)
f9003710:	0046a983          	lw	s3,4(a3)
f9003714:	fffe0737          	lui	a4,0xfffe0
f9003718:	00080337          	lui	t1,0x80
f900371c:	00b77733          	and	a4,a4,a1
f9003720:	0067f333          	and	t1,a5,t1
f9003724:	00e36333          	or	t1,t1,a4
f9003728:	00030693          	mv	a3,t1
f900372c:	00050613          	mv	a2,a0
f9003730:	00098593          	mv	a1,s3
f9003734:	00090513          	mv	a0,s2
f9003738:	260000ef          	jal	ra,f9003998 <__adddf3>
f900373c:	00a12423          	sw	a0,8(sp)
f9003740:	00b12623          	sw	a1,12(sp)
f9003744:	00812503          	lw	a0,8(sp)
f9003748:	00c12583          	lw	a1,12(sp)
f900374c:	00090613          	mv	a2,s2
f9003750:	00098693          	mv	a3,s3
f9003754:	919fd0ef          	jal	ra,f900106c <__subdf3>
f9003758:	00b4f4b3          	and	s1,s1,a1
f900375c:	01f41313          	slli	t1,s0,0x1f
f9003760:	0064e333          	or	t1,s1,t1
f9003764:	00050893          	mv	a7,a0
f9003768:	f3dff06f          	j	f90036a4 <rint+0xe8>
f900376c:	03300893          	li	a7,51
f9003770:	02c8d663          	bge	a7,a2,f900379c <rint+0x1e0>
f9003774:	40000713          	li	a4,1024
f9003778:	00050893          	mv	a7,a0
f900377c:	00058313          	mv	t1,a1
f9003780:	f2e612e3          	bne	a2,a4,f90036a4 <rint+0xe8>
f9003784:	00050613          	mv	a2,a0
f9003788:	000e0693          	mv	a3,t3
f900378c:	20c000ef          	jal	ra,f9003998 <__adddf3>
f9003790:	00050893          	mv	a7,a0
f9003794:	00058313          	mv	t1,a1
f9003798:	f0dff06f          	j	f90036a4 <rint+0xe8>
f900379c:	bed70713          	addi	a4,a4,-1043 # fffdfbed <__freertos_irq_stack_top+0x6fd876d>
f90037a0:	fff00613          	li	a2,-1
f90037a4:	00e65633          	srl	a2,a2,a4
f90037a8:	00a675b3          	and	a1,a2,a0
f90037ac:	00050893          	mv	a7,a0
f90037b0:	00078313          	mv	t1,a5
f90037b4:	ee0588e3          	beqz	a1,f90036a4 <rint+0xe8>
f90037b8:	00165613          	srli	a2,a2,0x1
f90037bc:	00a677b3          	and	a5,a2,a0
f90037c0:	00050813          	mv	a6,a0
f90037c4:	e80788e3          	beqz	a5,f9003654 <rint+0x98>
f90037c8:	40000837          	lui	a6,0x40000
f90037cc:	fff64613          	not	a2,a2
f90037d0:	00a676b3          	and	a3,a2,a0
f90037d4:	40e85733          	sra	a4,a6,a4
f90037d8:	00e6e833          	or	a6,a3,a4
f90037dc:	e79ff06f          	j	f9003654 <rint+0x98>

f90037e0 <scalbn>:
f90037e0:	ff010113          	addi	sp,sp,-16
f90037e4:	4145d793          	srai	a5,a1,0x14
f90037e8:	00812423          	sw	s0,8(sp)
f90037ec:	00112623          	sw	ra,12(sp)
f90037f0:	7ff7f793          	andi	a5,a5,2047
f90037f4:	00060413          	mv	s0,a2
f90037f8:	0a079063          	bnez	a5,f9003898 <scalbn+0xb8>
f90037fc:	00159793          	slli	a5,a1,0x1
f9003800:	0017d793          	srli	a5,a5,0x1
f9003804:	00a7e7b3          	or	a5,a5,a0
f9003808:	08078063          	beqz	a5,f9003888 <scalbn+0xa8>
f900380c:	00001797          	auipc	a5,0x1
f9003810:	7b478793          	addi	a5,a5,1972 # f9004fc0 <TWO52+0x10>
f9003814:	0007a603          	lw	a2,0(a5)
f9003818:	0047a683          	lw	a3,4(a5)
f900381c:	948fd0ef          	jal	ra,f9000964 <__muldf3>
f9003820:	ffff47b7          	lui	a5,0xffff4
f9003824:	cb078793          	addi	a5,a5,-848 # ffff3cb0 <__freertos_irq_stack_top+0x6fec830>
f9003828:	00058713          	mv	a4,a1
f900382c:	12f44a63          	blt	s0,a5,f9003960 <scalbn+0x180>
f9003830:	4145d793          	srai	a5,a1,0x14
f9003834:	7ff7f793          	andi	a5,a5,2047
f9003838:	fca78793          	addi	a5,a5,-54
f900383c:	00f407b3          	add	a5,s0,a5
f9003840:	7fe00693          	li	a3,2046
f9003844:	06f6ce63          	blt	a3,a5,f90038c0 <scalbn+0xe0>
f9003848:	0ef04a63          	bgtz	a5,f900393c <scalbn+0x15c>
f900384c:	fcb00693          	li	a3,-53
f9003850:	0ad7d663          	bge	a5,a3,f90038fc <scalbn+0x11c>
f9003854:	0000c7b7          	lui	a5,0xc
f9003858:	35078793          	addi	a5,a5,848 # c350 <__stack_size+0xa350>
f900385c:	0687c263          	blt	a5,s0,f90038c0 <scalbn+0xe0>
f9003860:	00001797          	auipc	a5,0x1
f9003864:	6f878793          	addi	a5,a5,1784 # f9004f58 <__clz_tab+0x1d0>
f9003868:	0007a803          	lw	a6,0(a5)
f900386c:	0047a883          	lw	a7,4(a5)
f9003870:	1005ca63          	bltz	a1,f9003984 <scalbn+0x1a4>
f9003874:	0007a603          	lw	a2,0(a5)
f9003878:	0047a683          	lw	a3,4(a5)
f900387c:	00080513          	mv	a0,a6
f9003880:	00088593          	mv	a1,a7
f9003884:	8e0fd0ef          	jal	ra,f9000964 <__muldf3>
f9003888:	00c12083          	lw	ra,12(sp)
f900388c:	00812403          	lw	s0,8(sp)
f9003890:	01010113          	addi	sp,sp,16
f9003894:	00008067          	ret
f9003898:	7ff00693          	li	a3,2047
f900389c:	00058713          	mv	a4,a1
f90038a0:	f8d79ee3          	bne	a5,a3,f900383c <scalbn+0x5c>
f90038a4:	00050613          	mv	a2,a0
f90038a8:	00058693          	mv	a3,a1
f90038ac:	0ec000ef          	jal	ra,f9003998 <__adddf3>
f90038b0:	00c12083          	lw	ra,12(sp)
f90038b4:	00812403          	lw	s0,8(sp)
f90038b8:	01010113          	addi	sp,sp,16
f90038bc:	00008067          	ret
f90038c0:	00001797          	auipc	a5,0x1
f90038c4:	60078793          	addi	a5,a5,1536 # f9004ec0 <__clz_tab+0x138>
f90038c8:	0007a803          	lw	a6,0(a5)
f90038cc:	0047a883          	lw	a7,4(a5)
f90038d0:	fa05d2e3          	bgez	a1,f9003874 <scalbn+0x94>
f90038d4:	00001717          	auipc	a4,0x1
f90038d8:	6f470713          	addi	a4,a4,1780 # f9004fc8 <TWO52+0x18>
f90038dc:	00072803          	lw	a6,0(a4)
f90038e0:	00472883          	lw	a7,4(a4)
f90038e4:	0007a603          	lw	a2,0(a5)
f90038e8:	0047a683          	lw	a3,4(a5)
f90038ec:	00080513          	mv	a0,a6
f90038f0:	00088593          	mv	a1,a7
f90038f4:	870fd0ef          	jal	ra,f9000964 <__muldf3>
f90038f8:	f91ff06f          	j	f9003888 <scalbn+0xa8>
f90038fc:	801005b7          	lui	a1,0x80100
f9003900:	fff58593          	addi	a1,a1,-1 # 800fffff <__freertos_irq_stack_top+0x870f8b7f>
f9003904:	03678793          	addi	a5,a5,54
f9003908:	00b77733          	and	a4,a4,a1
f900390c:	01479793          	slli	a5,a5,0x14
f9003910:	00e7e7b3          	or	a5,a5,a4
f9003914:	00001717          	auipc	a4,0x1
f9003918:	6c470713          	addi	a4,a4,1732 # f9004fd8 <TWO52+0x28>
f900391c:	00072603          	lw	a2,0(a4)
f9003920:	00472683          	lw	a3,4(a4)
f9003924:	00078593          	mv	a1,a5
f9003928:	83cfd0ef          	jal	ra,f9000964 <__muldf3>
f900392c:	00c12083          	lw	ra,12(sp)
f9003930:	00812403          	lw	s0,8(sp)
f9003934:	01010113          	addi	sp,sp,16
f9003938:	00008067          	ret
f900393c:	00c12083          	lw	ra,12(sp)
f9003940:	00812403          	lw	s0,8(sp)
f9003944:	801005b7          	lui	a1,0x80100
f9003948:	fff58593          	addi	a1,a1,-1 # 800fffff <__freertos_irq_stack_top+0x870f8b7f>
f900394c:	00b77733          	and	a4,a4,a1
f9003950:	01479593          	slli	a1,a5,0x14
f9003954:	00b765b3          	or	a1,a4,a1
f9003958:	01010113          	addi	sp,sp,16
f900395c:	00008067          	ret
f9003960:	00001697          	auipc	a3,0x1
f9003964:	5f868693          	addi	a3,a3,1528 # f9004f58 <__clz_tab+0x1d0>
f9003968:	0006a603          	lw	a2,0(a3)
f900396c:	0046a683          	lw	a3,4(a3)
f9003970:	ff5fc0ef          	jal	ra,f9000964 <__muldf3>
f9003974:	00c12083          	lw	ra,12(sp)
f9003978:	00812403          	lw	s0,8(sp)
f900397c:	01010113          	addi	sp,sp,16
f9003980:	00008067          	ret
f9003984:	00001717          	auipc	a4,0x1
f9003988:	64c70713          	addi	a4,a4,1612 # f9004fd0 <TWO52+0x20>
f900398c:	00072803          	lw	a6,0(a4)
f9003990:	00472883          	lw	a7,4(a4)
f9003994:	ee1ff06f          	j	f9003874 <scalbn+0x94>

f9003998 <__adddf3>:
f9003998:	00100837          	lui	a6,0x100
f900399c:	fe010113          	addi	sp,sp,-32
f90039a0:	fff80813          	addi	a6,a6,-1 # fffff <__stack_size+0xfdfff>
f90039a4:	00b87733          	and	a4,a6,a1
f90039a8:	00912a23          	sw	s1,20(sp)
f90039ac:	00d87833          	and	a6,a6,a3
f90039b0:	0145d493          	srli	s1,a1,0x14
f90039b4:	0146d313          	srli	t1,a3,0x14
f90039b8:	00371e13          	slli	t3,a4,0x3
f90039bc:	01312623          	sw	s3,12(sp)
f90039c0:	01d55713          	srli	a4,a0,0x1d
f90039c4:	00381813          	slli	a6,a6,0x3
f90039c8:	01d65793          	srli	a5,a2,0x1d
f90039cc:	7ff4f493          	andi	s1,s1,2047
f90039d0:	7ff37313          	andi	t1,t1,2047
f90039d4:	00112e23          	sw	ra,28(sp)
f90039d8:	00812c23          	sw	s0,24(sp)
f90039dc:	01212823          	sw	s2,16(sp)
f90039e0:	01f5d993          	srli	s3,a1,0x1f
f90039e4:	01f6de93          	srli	t4,a3,0x1f
f90039e8:	01c76733          	or	a4,a4,t3
f90039ec:	00351f13          	slli	t5,a0,0x3
f90039f0:	0107e833          	or	a6,a5,a6
f90039f4:	00361f93          	slli	t6,a2,0x3
f90039f8:	40648e33          	sub	t3,s1,t1
f90039fc:	1dd98463          	beq	s3,t4,f9003bc4 <__adddf3+0x22c>
f9003a00:	17c05863          	blez	t3,f9003b70 <__adddf3+0x1d8>
f9003a04:	20030a63          	beqz	t1,f9003c18 <__adddf3+0x280>
f9003a08:	008006b7          	lui	a3,0x800
f9003a0c:	7ff00793          	li	a5,2047
f9003a10:	00d86833          	or	a6,a6,a3
f9003a14:	40f48e63          	beq	s1,a5,f9003e30 <__adddf3+0x498>
f9003a18:	03800793          	li	a5,56
f9003a1c:	3dc7ca63          	blt	a5,t3,f9003df0 <__adddf3+0x458>
f9003a20:	01f00793          	li	a5,31
f9003a24:	55c7c663          	blt	a5,t3,f9003f70 <__adddf3+0x5d8>
f9003a28:	02000513          	li	a0,32
f9003a2c:	41c50533          	sub	a0,a0,t3
f9003a30:	01cfd7b3          	srl	a5,t6,t3
f9003a34:	00a816b3          	sll	a3,a6,a0
f9003a38:	00af9933          	sll	s2,t6,a0
f9003a3c:	00f6e6b3          	or	a3,a3,a5
f9003a40:	01203933          	snez	s2,s2
f9003a44:	01c857b3          	srl	a5,a6,t3
f9003a48:	0126e933          	or	s2,a3,s2
f9003a4c:	40f70733          	sub	a4,a4,a5
f9003a50:	412f0933          	sub	s2,t5,s2
f9003a54:	012f37b3          	sltu	a5,t5,s2
f9003a58:	40f70633          	sub	a2,a4,a5
f9003a5c:	00861793          	slli	a5,a2,0x8
f9003a60:	2a07d263          	bgez	a5,f9003d04 <__adddf3+0x36c>
f9003a64:	00800737          	lui	a4,0x800
f9003a68:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fdfff>
f9003a6c:	00e67433          	and	s0,a2,a4
f9003a70:	34040e63          	beqz	s0,f9003dcc <__adddf3+0x434>
f9003a74:	00040513          	mv	a0,s0
f9003a78:	d7cfe0ef          	jal	ra,f9001ff4 <__clzsi2>
f9003a7c:	ff850713          	addi	a4,a0,-8 # 800ffff8 <__freertos_irq_stack_top+0x870f8b78>
f9003a80:	02000793          	li	a5,32
f9003a84:	40e787b3          	sub	a5,a5,a4
f9003a88:	00f957b3          	srl	a5,s2,a5
f9003a8c:	00e41633          	sll	a2,s0,a4
f9003a90:	00c7e7b3          	or	a5,a5,a2
f9003a94:	00e91933          	sll	s2,s2,a4
f9003a98:	30974c63          	blt	a4,s1,f9003db0 <__adddf3+0x418>
f9003a9c:	40970533          	sub	a0,a4,s1
f9003aa0:	00150613          	addi	a2,a0,1
f9003aa4:	01f00713          	li	a4,31
f9003aa8:	44c74663          	blt	a4,a2,f9003ef4 <__adddf3+0x55c>
f9003aac:	02000713          	li	a4,32
f9003ab0:	40c70733          	sub	a4,a4,a2
f9003ab4:	00c956b3          	srl	a3,s2,a2
f9003ab8:	00e91933          	sll	s2,s2,a4
f9003abc:	00e79733          	sll	a4,a5,a4
f9003ac0:	00d76733          	or	a4,a4,a3
f9003ac4:	01203933          	snez	s2,s2
f9003ac8:	01276933          	or	s2,a4,s2
f9003acc:	00c7d633          	srl	a2,a5,a2
f9003ad0:	00000493          	li	s1,0
f9003ad4:	00797793          	andi	a5,s2,7
f9003ad8:	02078063          	beqz	a5,f9003af8 <__adddf3+0x160>
f9003adc:	00f97713          	andi	a4,s2,15
f9003ae0:	00400793          	li	a5,4
f9003ae4:	00f70a63          	beq	a4,a5,f9003af8 <__adddf3+0x160>
f9003ae8:	00490713          	addi	a4,s2,4
f9003aec:	01273933          	sltu	s2,a4,s2
f9003af0:	01260633          	add	a2,a2,s2
f9003af4:	00070913          	mv	s2,a4
f9003af8:	00861793          	slli	a5,a2,0x8
f9003afc:	2007d863          	bgez	a5,f9003d0c <__adddf3+0x374>
f9003b00:	00148513          	addi	a0,s1,1 # 80000001 <__freertos_irq_stack_top+0x86ff8b81>
f9003b04:	7ff00793          	li	a5,2047
f9003b08:	00098593          	mv	a1,s3
f9003b0c:	24f50c63          	beq	a0,a5,f9003d64 <__adddf3+0x3cc>
f9003b10:	ff8007b7          	lui	a5,0xff800
f9003b14:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9003b18:	00f677b3          	and	a5,a2,a5
f9003b1c:	01d79893          	slli	a7,a5,0x1d
f9003b20:	00395913          	srli	s2,s2,0x3
f9003b24:	00979793          	slli	a5,a5,0x9
f9003b28:	0128e8b3          	or	a7,a7,s2
f9003b2c:	00c7d793          	srli	a5,a5,0xc
f9003b30:	7ff57513          	andi	a0,a0,2047
f9003b34:	00c79693          	slli	a3,a5,0xc
f9003b38:	01451513          	slli	a0,a0,0x14
f9003b3c:	01c12083          	lw	ra,28(sp)
f9003b40:	01812403          	lw	s0,24(sp)
f9003b44:	00c6d693          	srli	a3,a3,0xc
f9003b48:	01f59593          	slli	a1,a1,0x1f
f9003b4c:	00a6e6b3          	or	a3,a3,a0
f9003b50:	00b6e6b3          	or	a3,a3,a1
f9003b54:	01412483          	lw	s1,20(sp)
f9003b58:	01012903          	lw	s2,16(sp)
f9003b5c:	00c12983          	lw	s3,12(sp)
f9003b60:	00088513          	mv	a0,a7
f9003b64:	00068593          	mv	a1,a3
f9003b68:	02010113          	addi	sp,sp,32
f9003b6c:	00008067          	ret
f9003b70:	0c0e1463          	bnez	t3,f9003c38 <__adddf3+0x2a0>
f9003b74:	00148313          	addi	t1,s1,1
f9003b78:	7fe37313          	andi	t1,t1,2046
f9003b7c:	28031063          	bnez	t1,f9003dfc <__adddf3+0x464>
f9003b80:	01e767b3          	or	a5,a4,t5
f9003b84:	01f868b3          	or	a7,a6,t6
f9003b88:	1e049663          	bnez	s1,f9003d74 <__adddf3+0x3dc>
f9003b8c:	4c078063          	beqz	a5,f900404c <__adddf3+0x6b4>
f9003b90:	50088863          	beqz	a7,f90040a0 <__adddf3+0x708>
f9003b94:	41ff0933          	sub	s2,t5,t6
f9003b98:	410707b3          	sub	a5,a4,a6
f9003b9c:	012f3633          	sltu	a2,t5,s2
f9003ba0:	40c78633          	sub	a2,a5,a2
f9003ba4:	00861793          	slli	a5,a2,0x8
f9003ba8:	5a07d463          	bgez	a5,f9004150 <__adddf3+0x7b8>
f9003bac:	41ef8933          	sub	s2,t6,t5
f9003bb0:	40e807b3          	sub	a5,a6,a4
f9003bb4:	012fb633          	sltu	a2,t6,s2
f9003bb8:	40c78633          	sub	a2,a5,a2
f9003bbc:	000e8993          	mv	s3,t4
f9003bc0:	f15ff06f          	j	f9003ad4 <__adddf3+0x13c>
f9003bc4:	0fc05a63          	blez	t3,f9003cb8 <__adddf3+0x320>
f9003bc8:	0c030863          	beqz	t1,f9003c98 <__adddf3+0x300>
f9003bcc:	008006b7          	lui	a3,0x800
f9003bd0:	7ff00793          	li	a5,2047
f9003bd4:	00d86833          	or	a6,a6,a3
f9003bd8:	44f48e63          	beq	s1,a5,f9004034 <__adddf3+0x69c>
f9003bdc:	03800793          	li	a5,56
f9003be0:	15c7cc63          	blt	a5,t3,f9003d38 <__adddf3+0x3a0>
f9003be4:	01f00793          	li	a5,31
f9003be8:	3fc7da63          	bge	a5,t3,f9003fdc <__adddf3+0x644>
f9003bec:	fe0e0913          	addi	s2,t3,-32 # 3ffe0 <__stack_size+0x3dfe0>
f9003bf0:	02000793          	li	a5,32
f9003bf4:	012856b3          	srl	a3,a6,s2
f9003bf8:	00fe0a63          	beq	t3,a5,f9003c0c <__adddf3+0x274>
f9003bfc:	04000913          	li	s2,64
f9003c00:	41c90933          	sub	s2,s2,t3
f9003c04:	01281933          	sll	s2,a6,s2
f9003c08:	012fefb3          	or	t6,t6,s2
f9003c0c:	01f03933          	snez	s2,t6
f9003c10:	00d96933          	or	s2,s2,a3
f9003c14:	12c0006f          	j	f9003d40 <__adddf3+0x3a8>
f9003c18:	01f867b3          	or	a5,a6,t6
f9003c1c:	22078663          	beqz	a5,f9003e48 <__adddf3+0x4b0>
f9003c20:	fffe0793          	addi	a5,t3,-1
f9003c24:	44078463          	beqz	a5,f900406c <__adddf3+0x6d4>
f9003c28:	7ff00693          	li	a3,2047
f9003c2c:	20de0263          	beq	t3,a3,f9003e30 <__adddf3+0x498>
f9003c30:	00078e13          	mv	t3,a5
f9003c34:	de5ff06f          	j	f9003a18 <__adddf3+0x80>
f9003c38:	409305b3          	sub	a1,t1,s1
f9003c3c:	28049663          	bnez	s1,f9003ec8 <__adddf3+0x530>
f9003c40:	01e767b3          	or	a5,a4,t5
f9003c44:	3c078263          	beqz	a5,f9004008 <__adddf3+0x670>
f9003c48:	fff58793          	addi	a5,a1,-1
f9003c4c:	50078c63          	beqz	a5,f9004164 <__adddf3+0x7cc>
f9003c50:	7ff00693          	li	a3,2047
f9003c54:	28d58263          	beq	a1,a3,f9003ed8 <__adddf3+0x540>
f9003c58:	00078593          	mv	a1,a5
f9003c5c:	03800793          	li	a5,56
f9003c60:	32b7ce63          	blt	a5,a1,f9003f9c <__adddf3+0x604>
f9003c64:	01f00793          	li	a5,31
f9003c68:	4ab7c263          	blt	a5,a1,f900410c <__adddf3+0x774>
f9003c6c:	02000793          	li	a5,32
f9003c70:	40b787b3          	sub	a5,a5,a1
f9003c74:	00f71933          	sll	s2,a4,a5
f9003c78:	00bf56b3          	srl	a3,t5,a1
f9003c7c:	00ff17b3          	sll	a5,t5,a5
f9003c80:	00d96933          	or	s2,s2,a3
f9003c84:	00f037b3          	snez	a5,a5
f9003c88:	00b75733          	srl	a4,a4,a1
f9003c8c:	00f96933          	or	s2,s2,a5
f9003c90:	40e80833          	sub	a6,a6,a4
f9003c94:	3100006f          	j	f9003fa4 <__adddf3+0x60c>
f9003c98:	01f867b3          	or	a5,a6,t6
f9003c9c:	3e078463          	beqz	a5,f9004084 <__adddf3+0x6ec>
f9003ca0:	fffe0793          	addi	a5,t3,-1
f9003ca4:	28078263          	beqz	a5,f9003f28 <__adddf3+0x590>
f9003ca8:	7ff00693          	li	a3,2047
f9003cac:	38de0463          	beq	t3,a3,f9004034 <__adddf3+0x69c>
f9003cb0:	00078e13          	mv	t3,a5
f9003cb4:	f29ff06f          	j	f9003bdc <__adddf3+0x244>
f9003cb8:	1a0e1663          	bnez	t3,f9003e64 <__adddf3+0x4cc>
f9003cbc:	00148693          	addi	a3,s1,1
f9003cc0:	7fe6f793          	andi	a5,a3,2046
f9003cc4:	3e079a63          	bnez	a5,f90040b8 <__adddf3+0x720>
f9003cc8:	01e767b3          	or	a5,a4,t5
f9003ccc:	34049e63          	bnez	s1,f9004028 <__adddf3+0x690>
f9003cd0:	4a078863          	beqz	a5,f9004180 <__adddf3+0x7e8>
f9003cd4:	01f867b3          	or	a5,a6,t6
f9003cd8:	3c078463          	beqz	a5,f90040a0 <__adddf3+0x708>
f9003cdc:	01ff0933          	add	s2,t5,t6
f9003ce0:	010707b3          	add	a5,a4,a6
f9003ce4:	01e93f33          	sltu	t5,s2,t5
f9003ce8:	01e78633          	add	a2,a5,t5
f9003cec:	00861793          	slli	a5,a2,0x8
f9003cf0:	0007da63          	bgez	a5,f9003d04 <__adddf3+0x36c>
f9003cf4:	ff8007b7          	lui	a5,0xff800
f9003cf8:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9003cfc:	00f67633          	and	a2,a2,a5
f9003d00:	00100493          	li	s1,1
f9003d04:	00797793          	andi	a5,s2,7
f9003d08:	dc079ae3          	bnez	a5,f9003adc <__adddf3+0x144>
f9003d0c:	01d61793          	slli	a5,a2,0x1d
f9003d10:	00395893          	srli	a7,s2,0x3
f9003d14:	00f8e8b3          	or	a7,a7,a5
f9003d18:	00365793          	srli	a5,a2,0x3
f9003d1c:	7ff00713          	li	a4,2047
f9003d20:	06e48a63          	beq	s1,a4,f9003d94 <__adddf3+0x3fc>
f9003d24:	00c79793          	slli	a5,a5,0xc
f9003d28:	00c7d793          	srli	a5,a5,0xc
f9003d2c:	7ff4f513          	andi	a0,s1,2047
f9003d30:	00098593          	mv	a1,s3
f9003d34:	e01ff06f          	j	f9003b34 <__adddf3+0x19c>
f9003d38:	01f86933          	or	s2,a6,t6
f9003d3c:	01203933          	snez	s2,s2
f9003d40:	01e90933          	add	s2,s2,t5
f9003d44:	01e937b3          	sltu	a5,s2,t5
f9003d48:	00e78633          	add	a2,a5,a4
f9003d4c:	00861793          	slli	a5,a2,0x8
f9003d50:	fa07dae3          	bgez	a5,f9003d04 <__adddf3+0x36c>
f9003d54:	00148493          	addi	s1,s1,1
f9003d58:	7ff00793          	li	a5,2047
f9003d5c:	1ef49663          	bne	s1,a5,f9003f48 <__adddf3+0x5b0>
f9003d60:	00098593          	mv	a1,s3
f9003d64:	7ff00513          	li	a0,2047
f9003d68:	00000793          	li	a5,0
f9003d6c:	00000893          	li	a7,0
f9003d70:	dc5ff06f          	j	f9003b34 <__adddf3+0x19c>
f9003d74:	0a079c63          	bnez	a5,f9003e2c <__adddf3+0x494>
f9003d78:	46088463          	beqz	a7,f90041e0 <__adddf3+0x848>
f9003d7c:	00361693          	slli	a3,a2,0x3
f9003d80:	01d81793          	slli	a5,a6,0x1d
f9003d84:	0036d693          	srli	a3,a3,0x3
f9003d88:	00d7e8b3          	or	a7,a5,a3
f9003d8c:	000e8993          	mv	s3,t4
f9003d90:	00385793          	srli	a5,a6,0x3
f9003d94:	00f8e7b3          	or	a5,a7,a5
f9003d98:	fc0784e3          	beqz	a5,f9003d60 <__adddf3+0x3c8>
f9003d9c:	00000593          	li	a1,0
f9003da0:	7ff00513          	li	a0,2047
f9003da4:	000807b7          	lui	a5,0x80
f9003da8:	00000893          	li	a7,0
f9003dac:	d89ff06f          	j	f9003b34 <__adddf3+0x19c>
f9003db0:	ff800637          	lui	a2,0xff800
f9003db4:	fff60613          	addi	a2,a2,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9003db8:	00c7f633          	and	a2,a5,a2
f9003dbc:	00797793          	andi	a5,s2,7
f9003dc0:	40e484b3          	sub	s1,s1,a4
f9003dc4:	d0079ce3          	bnez	a5,f9003adc <__adddf3+0x144>
f9003dc8:	f45ff06f          	j	f9003d0c <__adddf3+0x374>
f9003dcc:	00090513          	mv	a0,s2
f9003dd0:	a24fe0ef          	jal	ra,f9001ff4 <__clzsi2>
f9003dd4:	01850713          	addi	a4,a0,24
f9003dd8:	01f00793          	li	a5,31
f9003ddc:	cae7d2e3          	bge	a5,a4,f9003a80 <__adddf3+0xe8>
f9003de0:	ff850613          	addi	a2,a0,-8
f9003de4:	00c917b3          	sll	a5,s2,a2
f9003de8:	00000913          	li	s2,0
f9003dec:	cadff06f          	j	f9003a98 <__adddf3+0x100>
f9003df0:	01f86933          	or	s2,a6,t6
f9003df4:	01203933          	snez	s2,s2
f9003df8:	c59ff06f          	j	f9003a50 <__adddf3+0xb8>
f9003dfc:	41ff0933          	sub	s2,t5,t6
f9003e00:	41070633          	sub	a2,a4,a6
f9003e04:	012f3433          	sltu	s0,t5,s2
f9003e08:	40860433          	sub	s0,a2,s0
f9003e0c:	00841793          	slli	a5,s0,0x8
f9003e10:	2c07cc63          	bltz	a5,f90040e8 <__adddf3+0x750>
f9003e14:	008968b3          	or	a7,s2,s0
f9003e18:	c4089ce3          	bnez	a7,f9003a70 <__adddf3+0xd8>
f9003e1c:	00000793          	li	a5,0
f9003e20:	00000993          	li	s3,0
f9003e24:	00000493          	li	s1,0
f9003e28:	efdff06f          	j	f9003d24 <__adddf3+0x38c>
f9003e2c:	f60898e3          	bnez	a7,f9003d9c <__adddf3+0x404>
f9003e30:	00351513          	slli	a0,a0,0x3
f9003e34:	01d71793          	slli	a5,a4,0x1d
f9003e38:	00355513          	srli	a0,a0,0x3
f9003e3c:	00a7e8b3          	or	a7,a5,a0
f9003e40:	00375793          	srli	a5,a4,0x3
f9003e44:	f51ff06f          	j	f9003d94 <__adddf3+0x3fc>
f9003e48:	00351513          	slli	a0,a0,0x3
f9003e4c:	01d71793          	slli	a5,a4,0x1d
f9003e50:	00355513          	srli	a0,a0,0x3
f9003e54:	00a7e8b3          	or	a7,a5,a0
f9003e58:	000e0493          	mv	s1,t3
f9003e5c:	00375793          	srli	a5,a4,0x3
f9003e60:	ebdff06f          	j	f9003d1c <__adddf3+0x384>
f9003e64:	40930533          	sub	a0,t1,s1
f9003e68:	14048a63          	beqz	s1,f9003fbc <__adddf3+0x624>
f9003e6c:	008006b7          	lui	a3,0x800
f9003e70:	7ff00793          	li	a5,2047
f9003e74:	00d76733          	or	a4,a4,a3
f9003e78:	38f30663          	beq	t1,a5,f9004204 <__adddf3+0x86c>
f9003e7c:	03800793          	li	a5,56
f9003e80:	28a7c063          	blt	a5,a0,f9004100 <__adddf3+0x768>
f9003e84:	01f00793          	li	a5,31
f9003e88:	32a7c663          	blt	a5,a0,f90041b4 <__adddf3+0x81c>
f9003e8c:	02000793          	li	a5,32
f9003e90:	40a787b3          	sub	a5,a5,a0
f9003e94:	00f71933          	sll	s2,a4,a5
f9003e98:	00af56b3          	srl	a3,t5,a0
f9003e9c:	00ff17b3          	sll	a5,t5,a5
f9003ea0:	00d96933          	or	s2,s2,a3
f9003ea4:	00f037b3          	snez	a5,a5
f9003ea8:	00a75733          	srl	a4,a4,a0
f9003eac:	00f96933          	or	s2,s2,a5
f9003eb0:	00e80833          	add	a6,a6,a4
f9003eb4:	01f90933          	add	s2,s2,t6
f9003eb8:	01f937b3          	sltu	a5,s2,t6
f9003ebc:	01078633          	add	a2,a5,a6
f9003ec0:	00030493          	mv	s1,t1
f9003ec4:	e89ff06f          	j	f9003d4c <__adddf3+0x3b4>
f9003ec8:	008006b7          	lui	a3,0x800
f9003ecc:	7ff00793          	li	a5,2047
f9003ed0:	00d76733          	or	a4,a4,a3
f9003ed4:	d8f314e3          	bne	t1,a5,f9003c5c <__adddf3+0x2c4>
f9003ed8:	00361793          	slli	a5,a2,0x3
f9003edc:	0037d793          	srli	a5,a5,0x3
f9003ee0:	01d81893          	slli	a7,a6,0x1d
f9003ee4:	0117e8b3          	or	a7,a5,a7
f9003ee8:	000e8993          	mv	s3,t4
f9003eec:	00385793          	srli	a5,a6,0x3
f9003ef0:	ea5ff06f          	j	f9003d94 <__adddf3+0x3fc>
f9003ef4:	fe150713          	addi	a4,a0,-31
f9003ef8:	02000693          	li	a3,32
f9003efc:	00e7d733          	srl	a4,a5,a4
f9003f00:	00d60a63          	beq	a2,a3,f9003f14 <__adddf3+0x57c>
f9003f04:	04000693          	li	a3,64
f9003f08:	40c68633          	sub	a2,a3,a2
f9003f0c:	00c79633          	sll	a2,a5,a2
f9003f10:	00c96933          	or	s2,s2,a2
f9003f14:	01203933          	snez	s2,s2
f9003f18:	00e96933          	or	s2,s2,a4
f9003f1c:	00000613          	li	a2,0
f9003f20:	00000493          	li	s1,0
f9003f24:	de1ff06f          	j	f9003d04 <__adddf3+0x36c>
f9003f28:	01ff0933          	add	s2,t5,t6
f9003f2c:	010707b3          	add	a5,a4,a6
f9003f30:	01e93633          	sltu	a2,s2,t5
f9003f34:	00c78633          	add	a2,a5,a2
f9003f38:	00861793          	slli	a5,a2,0x8
f9003f3c:	00100493          	li	s1,1
f9003f40:	dc07d2e3          	bgez	a5,f9003d04 <__adddf3+0x36c>
f9003f44:	00200493          	li	s1,2
f9003f48:	ff8007b7          	lui	a5,0xff800
f9003f4c:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f8b7f>
f9003f50:	00f677b3          	and	a5,a2,a5
f9003f54:	00195713          	srli	a4,s2,0x1
f9003f58:	00197913          	andi	s2,s2,1
f9003f5c:	01276933          	or	s2,a4,s2
f9003f60:	01f79893          	slli	a7,a5,0x1f
f9003f64:	0128e933          	or	s2,a7,s2
f9003f68:	0017d613          	srli	a2,a5,0x1
f9003f6c:	b69ff06f          	j	f9003ad4 <__adddf3+0x13c>
f9003f70:	fe0e0913          	addi	s2,t3,-32
f9003f74:	02000793          	li	a5,32
f9003f78:	012856b3          	srl	a3,a6,s2
f9003f7c:	00fe0a63          	beq	t3,a5,f9003f90 <__adddf3+0x5f8>
f9003f80:	04000913          	li	s2,64
f9003f84:	41c90933          	sub	s2,s2,t3
f9003f88:	01281933          	sll	s2,a6,s2
f9003f8c:	012fefb3          	or	t6,t6,s2
f9003f90:	01f03933          	snez	s2,t6
f9003f94:	00d96933          	or	s2,s2,a3
f9003f98:	ab9ff06f          	j	f9003a50 <__adddf3+0xb8>
f9003f9c:	01e76933          	or	s2,a4,t5
f9003fa0:	01203933          	snez	s2,s2
f9003fa4:	412f8933          	sub	s2,t6,s2
f9003fa8:	012fb7b3          	sltu	a5,t6,s2
f9003fac:	40f80633          	sub	a2,a6,a5
f9003fb0:	00030493          	mv	s1,t1
f9003fb4:	000e8993          	mv	s3,t4
f9003fb8:	aa5ff06f          	j	f9003a5c <__adddf3+0xc4>
f9003fbc:	01e767b3          	or	a5,a4,t5
f9003fc0:	1c078c63          	beqz	a5,f9004198 <__adddf3+0x800>
f9003fc4:	fff50793          	addi	a5,a0,-1
f9003fc8:	22078463          	beqz	a5,f90041f0 <__adddf3+0x858>
f9003fcc:	7ff00693          	li	a3,2047
f9003fd0:	16d50463          	beq	a0,a3,f9004138 <__adddf3+0x7a0>
f9003fd4:	00078513          	mv	a0,a5
f9003fd8:	ea5ff06f          	j	f9003e7c <__adddf3+0x4e4>
f9003fdc:	02000793          	li	a5,32
f9003fe0:	41c787b3          	sub	a5,a5,t3
f9003fe4:	00f816b3          	sll	a3,a6,a5
f9003fe8:	00ff9933          	sll	s2,t6,a5
f9003fec:	01cfd633          	srl	a2,t6,t3
f9003ff0:	00c6e6b3          	or	a3,a3,a2
f9003ff4:	01203933          	snez	s2,s2
f9003ff8:	01c857b3          	srl	a5,a6,t3
f9003ffc:	0126e933          	or	s2,a3,s2
f9004000:	00f70733          	add	a4,a4,a5
f9004004:	d3dff06f          	j	f9003d40 <__adddf3+0x3a8>
f9004008:	00361793          	slli	a5,a2,0x3
f900400c:	0037d793          	srli	a5,a5,0x3
f9004010:	01d81893          	slli	a7,a6,0x1d
f9004014:	0117e8b3          	or	a7,a5,a7
f9004018:	00058493          	mv	s1,a1
f900401c:	00385793          	srli	a5,a6,0x3
f9004020:	000e8993          	mv	s3,t4
f9004024:	cf9ff06f          	j	f9003d1c <__adddf3+0x384>
f9004028:	10078863          	beqz	a5,f9004138 <__adddf3+0x7a0>
f900402c:	01f86933          	or	s2,a6,t6
f9004030:	d60916e3          	bnez	s2,f9003d9c <__adddf3+0x404>
f9004034:	00351513          	slli	a0,a0,0x3
f9004038:	01d71793          	slli	a5,a4,0x1d
f900403c:	00355513          	srli	a0,a0,0x3
f9004040:	00f568b3          	or	a7,a0,a5
f9004044:	00375793          	srli	a5,a4,0x3
f9004048:	d4dff06f          	j	f9003d94 <__adddf3+0x3fc>
f900404c:	10088663          	beqz	a7,f9004158 <__adddf3+0x7c0>
f9004050:	00361693          	slli	a3,a2,0x3
f9004054:	01d81793          	slli	a5,a6,0x1d
f9004058:	0036d693          	srli	a3,a3,0x3
f900405c:	00d7e8b3          	or	a7,a5,a3
f9004060:	000e8993          	mv	s3,t4
f9004064:	00385793          	srli	a5,a6,0x3
f9004068:	cbdff06f          	j	f9003d24 <__adddf3+0x38c>
f900406c:	41ff0933          	sub	s2,t5,t6
f9004070:	410707b3          	sub	a5,a4,a6
f9004074:	012f3f33          	sltu	t5,t5,s2
f9004078:	41e78633          	sub	a2,a5,t5
f900407c:	00100493          	li	s1,1
f9004080:	9ddff06f          	j	f9003a5c <__adddf3+0xc4>
f9004084:	00351513          	slli	a0,a0,0x3
f9004088:	01d71793          	slli	a5,a4,0x1d
f900408c:	00355513          	srli	a0,a0,0x3
f9004090:	00f568b3          	or	a7,a0,a5
f9004094:	000e0493          	mv	s1,t3
f9004098:	00375793          	srli	a5,a4,0x3
f900409c:	c81ff06f          	j	f9003d1c <__adddf3+0x384>
f90040a0:	00351513          	slli	a0,a0,0x3
f90040a4:	01d71793          	slli	a5,a4,0x1d
f90040a8:	00355513          	srli	a0,a0,0x3
f90040ac:	00a7e8b3          	or	a7,a5,a0
f90040b0:	00375793          	srli	a5,a4,0x3
f90040b4:	c71ff06f          	j	f9003d24 <__adddf3+0x38c>
f90040b8:	7ff00793          	li	a5,2047
f90040bc:	caf682e3          	beq	a3,a5,f9003d60 <__adddf3+0x3c8>
f90040c0:	01ff0933          	add	s2,t5,t6
f90040c4:	01e93633          	sltu	a2,s2,t5
f90040c8:	010707b3          	add	a5,a4,a6
f90040cc:	00c787b3          	add	a5,a5,a2
f90040d0:	01f79893          	slli	a7,a5,0x1f
f90040d4:	00195913          	srli	s2,s2,0x1
f90040d8:	0128e933          	or	s2,a7,s2
f90040dc:	0017d613          	srli	a2,a5,0x1
f90040e0:	00068493          	mv	s1,a3
f90040e4:	c21ff06f          	j	f9003d04 <__adddf3+0x36c>
f90040e8:	41ef8933          	sub	s2,t6,t5
f90040ec:	40e80733          	sub	a4,a6,a4
f90040f0:	012fb633          	sltu	a2,t6,s2
f90040f4:	40c70433          	sub	s0,a4,a2
f90040f8:	000e8993          	mv	s3,t4
f90040fc:	975ff06f          	j	f9003a70 <__adddf3+0xd8>
f9004100:	01e76933          	or	s2,a4,t5
f9004104:	01203933          	snez	s2,s2
f9004108:	dadff06f          	j	f9003eb4 <__adddf3+0x51c>
f900410c:	fe058793          	addi	a5,a1,-32
f9004110:	02000693          	li	a3,32
f9004114:	00f757b3          	srl	a5,a4,a5
f9004118:	00d58a63          	beq	a1,a3,f900412c <__adddf3+0x794>
f900411c:	04000693          	li	a3,64
f9004120:	40b685b3          	sub	a1,a3,a1
f9004124:	00b71733          	sll	a4,a4,a1
f9004128:	00ef6f33          	or	t5,t5,a4
f900412c:	01e03933          	snez	s2,t5
f9004130:	00f96933          	or	s2,s2,a5
f9004134:	e71ff06f          	j	f9003fa4 <__adddf3+0x60c>
f9004138:	00361793          	slli	a5,a2,0x3
f900413c:	0037d793          	srli	a5,a5,0x3
f9004140:	01d81893          	slli	a7,a6,0x1d
f9004144:	0117e8b3          	or	a7,a5,a7
f9004148:	00385793          	srli	a5,a6,0x3
f900414c:	c49ff06f          	j	f9003d94 <__adddf3+0x3fc>
f9004150:	00c968b3          	or	a7,s2,a2
f9004154:	ba0898e3          	bnez	a7,f9003d04 <__adddf3+0x36c>
f9004158:	00000793          	li	a5,0
f900415c:	00000993          	li	s3,0
f9004160:	bc5ff06f          	j	f9003d24 <__adddf3+0x38c>
f9004164:	41ef8933          	sub	s2,t6,t5
f9004168:	40e807b3          	sub	a5,a6,a4
f900416c:	012fb633          	sltu	a2,t6,s2
f9004170:	40c78633          	sub	a2,a5,a2
f9004174:	000e8993          	mv	s3,t4
f9004178:	00100493          	li	s1,1
f900417c:	8e1ff06f          	j	f9003a5c <__adddf3+0xc4>
f9004180:	00361693          	slli	a3,a2,0x3
f9004184:	01d81793          	slli	a5,a6,0x1d
f9004188:	0036d693          	srli	a3,a3,0x3
f900418c:	00d7e8b3          	or	a7,a5,a3
f9004190:	00385793          	srli	a5,a6,0x3
f9004194:	b91ff06f          	j	f9003d24 <__adddf3+0x38c>
f9004198:	00361693          	slli	a3,a2,0x3
f900419c:	01d81793          	slli	a5,a6,0x1d
f90041a0:	0036d693          	srli	a3,a3,0x3
f90041a4:	00d7e8b3          	or	a7,a5,a3
f90041a8:	00050493          	mv	s1,a0
f90041ac:	00385793          	srli	a5,a6,0x3
f90041b0:	b6dff06f          	j	f9003d1c <__adddf3+0x384>
f90041b4:	fe050793          	addi	a5,a0,-32
f90041b8:	02000693          	li	a3,32
f90041bc:	00f757b3          	srl	a5,a4,a5
f90041c0:	00d50a63          	beq	a0,a3,f90041d4 <__adddf3+0x83c>
f90041c4:	04000693          	li	a3,64
f90041c8:	40a68533          	sub	a0,a3,a0
f90041cc:	00a71733          	sll	a4,a4,a0
f90041d0:	00ef6f33          	or	t5,t5,a4
f90041d4:	01e03933          	snez	s2,t5
f90041d8:	00f96933          	or	s2,s2,a5
f90041dc:	cd9ff06f          	j	f9003eb4 <__adddf3+0x51c>
f90041e0:	00000593          	li	a1,0
f90041e4:	7ff00513          	li	a0,2047
f90041e8:	000807b7          	lui	a5,0x80
f90041ec:	949ff06f          	j	f9003b34 <__adddf3+0x19c>
f90041f0:	01ff0933          	add	s2,t5,t6
f90041f4:	010707b3          	add	a5,a4,a6
f90041f8:	01f93633          	sltu	a2,s2,t6
f90041fc:	00c78633          	add	a2,a5,a2
f9004200:	d39ff06f          	j	f9003f38 <__adddf3+0x5a0>
f9004204:	00361693          	slli	a3,a2,0x3
f9004208:	01d81793          	slli	a5,a6,0x1d
f900420c:	0036d693          	srli	a3,a3,0x3
f9004210:	00d7e8b3          	or	a7,a5,a3
f9004214:	00385793          	srli	a5,a6,0x3
f9004218:	b7dff06f          	j	f9003d94 <__adddf3+0x3fc>

f900421c <__divdf3>:
f900421c:	fb010113          	addi	sp,sp,-80
f9004220:	0145d713          	srli	a4,a1,0x14
f9004224:	04812423          	sw	s0,72(sp)
f9004228:	04912223          	sw	s1,68(sp)
f900422c:	03312e23          	sw	s3,60(sp)
f9004230:	00c59413          	slli	s0,a1,0xc
f9004234:	04112623          	sw	ra,76(sp)
f9004238:	05212023          	sw	s2,64(sp)
f900423c:	03412c23          	sw	s4,56(sp)
f9004240:	03512a23          	sw	s5,52(sp)
f9004244:	03612823          	sw	s6,48(sp)
f9004248:	03712623          	sw	s7,44(sp)
f900424c:	03812423          	sw	s8,40(sp)
f9004250:	03912223          	sw	s9,36(sp)
f9004254:	03a12023          	sw	s10,32(sp)
f9004258:	01b12e23          	sw	s11,28(sp)
f900425c:	7ff77713          	andi	a4,a4,2047
f9004260:	00050493          	mv	s1,a0
f9004264:	00c45413          	srli	s0,s0,0xc
f9004268:	01f5d993          	srli	s3,a1,0x1f
f900426c:	18070263          	beqz	a4,f90043f0 <__divdf3+0x1d4>
f9004270:	7ff00793          	li	a5,2047
f9004274:	1cf70c63          	beq	a4,a5,f900444c <__divdf3+0x230>
f9004278:	01d55a93          	srli	s5,a0,0x1d
f900427c:	00341413          	slli	s0,s0,0x3
f9004280:	008ae433          	or	s0,s5,s0
f9004284:	00800ab7          	lui	s5,0x800
f9004288:	01546ab3          	or	s5,s0,s5
f900428c:	00351b93          	slli	s7,a0,0x3
f9004290:	c0170913          	addi	s2,a4,-1023
f9004294:	00000493          	li	s1,0
f9004298:	00000c13          	li	s8,0
f900429c:	0146d713          	srli	a4,a3,0x14
f90042a0:	00c69413          	slli	s0,a3,0xc
f90042a4:	7ff77713          	andi	a4,a4,2047
f90042a8:	00c45413          	srli	s0,s0,0xc
f90042ac:	01f6da13          	srli	s4,a3,0x1f
f90042b0:	0e070863          	beqz	a4,f90043a0 <__divdf3+0x184>
f90042b4:	7ff00793          	li	a5,2047
f90042b8:	04f70863          	beq	a4,a5,f9004308 <__divdf3+0xec>
f90042bc:	00341793          	slli	a5,s0,0x3
f90042c0:	01d65413          	srli	s0,a2,0x1d
f90042c4:	00f467b3          	or	a5,s0,a5
f90042c8:	c0170713          	addi	a4,a4,-1023
f90042cc:	00800437          	lui	s0,0x800
f90042d0:	0087e433          	or	s0,a5,s0
f90042d4:	00361813          	slli	a6,a2,0x3
f90042d8:	40e90933          	sub	s2,s2,a4
f90042dc:	00000693          	li	a3,0
f90042e0:	00f00793          	li	a5,15
f90042e4:	0149cb33          	xor	s6,s3,s4
f90042e8:	2697e863          	bltu	a5,s1,f9004558 <__divdf3+0x33c>
f90042ec:	00001717          	auipc	a4,0x1
f90042f0:	cf470713          	addi	a4,a4,-780 # f9004fe0 <TWO52+0x30>
f90042f4:	00249493          	slli	s1,s1,0x2
f90042f8:	00e484b3          	add	s1,s1,a4
f90042fc:	0004a783          	lw	a5,0(s1)
f9004300:	00e787b3          	add	a5,a5,a4
f9004304:	00078067          	jr	a5 # 80000 <__stack_size+0x7e000>
f9004308:	00c46833          	or	a6,s0,a2
f900430c:	80190913          	addi	s2,s2,-2047
f9004310:	18081a63          	bnez	a6,f90044a4 <__divdf3+0x288>
f9004314:	0024e493          	ori	s1,s1,2
f9004318:	00000413          	li	s0,0
f900431c:	00200693          	li	a3,2
f9004320:	fc1ff06f          	j	f90042e0 <__divdf3+0xc4>
f9004324:	7ff00713          	li	a4,2047
f9004328:	00000793          	li	a5,0
f900432c:	00000413          	li	s0,0
f9004330:	00c79793          	slli	a5,a5,0xc
f9004334:	00040513          	mv	a0,s0
f9004338:	04c12083          	lw	ra,76(sp)
f900433c:	04812403          	lw	s0,72(sp)
f9004340:	01471713          	slli	a4,a4,0x14
f9004344:	00c7d793          	srli	a5,a5,0xc
f9004348:	01fb1b13          	slli	s6,s6,0x1f
f900434c:	00e7e7b3          	or	a5,a5,a4
f9004350:	0167e7b3          	or	a5,a5,s6
f9004354:	04412483          	lw	s1,68(sp)
f9004358:	04012903          	lw	s2,64(sp)
f900435c:	03c12983          	lw	s3,60(sp)
f9004360:	03812a03          	lw	s4,56(sp)
f9004364:	03412a83          	lw	s5,52(sp)
f9004368:	03012b03          	lw	s6,48(sp)
f900436c:	02c12b83          	lw	s7,44(sp)
f9004370:	02812c03          	lw	s8,40(sp)
f9004374:	02412c83          	lw	s9,36(sp)
f9004378:	02012d03          	lw	s10,32(sp)
f900437c:	01c12d83          	lw	s11,28(sp)
f9004380:	00078593          	mv	a1,a5
f9004384:	05010113          	addi	sp,sp,80
f9004388:	00008067          	ret
f900438c:	00000b13          	li	s6,0
f9004390:	7ff00713          	li	a4,2047
f9004394:	000807b7          	lui	a5,0x80
f9004398:	00000413          	li	s0,0
f900439c:	f95ff06f          	j	f9004330 <__divdf3+0x114>
f90043a0:	00c46833          	or	a6,s0,a2
f90043a4:	0e080863          	beqz	a6,f9004494 <__divdf3+0x278>
f90043a8:	4e040663          	beqz	s0,f9004894 <__divdf3+0x678>
f90043ac:	00040513          	mv	a0,s0
f90043b0:	00c12423          	sw	a2,8(sp)
f90043b4:	c41fd0ef          	jal	ra,f9001ff4 <__clzsi2>
f90043b8:	00812603          	lw	a2,8(sp)
f90043bc:	00050693          	mv	a3,a0
f90043c0:	ff550793          	addi	a5,a0,-11
f90043c4:	01d00593          	li	a1,29
f90043c8:	ff868713          	addi	a4,a3,-8 # 7ffff8 <__stack_size+0x7fdff8>
f90043cc:	40f585b3          	sub	a1,a1,a5
f90043d0:	00b655b3          	srl	a1,a2,a1
f90043d4:	00e417b3          	sll	a5,s0,a4
f90043d8:	00f5e433          	or	s0,a1,a5
f90043dc:	00e61833          	sll	a6,a2,a4
f90043e0:	01268733          	add	a4,a3,s2
f90043e4:	3f370913          	addi	s2,a4,1011
f90043e8:	00000693          	li	a3,0
f90043ec:	ef5ff06f          	j	f90042e0 <__divdf3+0xc4>
f90043f0:	00a46ab3          	or	s5,s0,a0
f90043f4:	080a8663          	beqz	s5,f9004480 <__divdf3+0x264>
f90043f8:	00d12623          	sw	a3,12(sp)
f90043fc:	00c12423          	sw	a2,8(sp)
f9004400:	46040463          	beqz	s0,f9004868 <__divdf3+0x64c>
f9004404:	00040513          	mv	a0,s0
f9004408:	bedfd0ef          	jal	ra,f9001ff4 <__clzsi2>
f900440c:	00812603          	lw	a2,8(sp)
f9004410:	00c12683          	lw	a3,12(sp)
f9004414:	00050913          	mv	s2,a0
f9004418:	ff550713          	addi	a4,a0,-11
f900441c:	01d00a93          	li	s5,29
f9004420:	ff890b93          	addi	s7,s2,-8
f9004424:	40ea8ab3          	sub	s5,s5,a4
f9004428:	01741433          	sll	s0,s0,s7
f900442c:	0154dab3          	srl	s5,s1,s5
f9004430:	008aeab3          	or	s5,s5,s0
f9004434:	01749bb3          	sll	s7,s1,s7
f9004438:	c0d00713          	li	a4,-1011
f900443c:	41270933          	sub	s2,a4,s2
f9004440:	00000493          	li	s1,0
f9004444:	00000c13          	li	s8,0
f9004448:	e55ff06f          	j	f900429c <__divdf3+0x80>
f900444c:	00a46ab3          	or	s5,s0,a0
f9004450:	000a9c63          	bnez	s5,f9004468 <__divdf3+0x24c>
f9004454:	00000b93          	li	s7,0
f9004458:	00800493          	li	s1,8
f900445c:	7ff00913          	li	s2,2047
f9004460:	00200c13          	li	s8,2
f9004464:	e39ff06f          	j	f900429c <__divdf3+0x80>
f9004468:	00050b93          	mv	s7,a0
f900446c:	00040a93          	mv	s5,s0
f9004470:	00c00493          	li	s1,12
f9004474:	7ff00913          	li	s2,2047
f9004478:	00300c13          	li	s8,3
f900447c:	e21ff06f          	j	f900429c <__divdf3+0x80>
f9004480:	00000b93          	li	s7,0
f9004484:	00400493          	li	s1,4
f9004488:	00000913          	li	s2,0
f900448c:	00100c13          	li	s8,1
f9004490:	e0dff06f          	j	f900429c <__divdf3+0x80>
f9004494:	0014e493          	ori	s1,s1,1
f9004498:	00000413          	li	s0,0
f900449c:	00100693          	li	a3,1
f90044a0:	e41ff06f          	j	f90042e0 <__divdf3+0xc4>
f90044a4:	0034e493          	ori	s1,s1,3
f90044a8:	00060813          	mv	a6,a2
f90044ac:	00300693          	li	a3,3
f90044b0:	e31ff06f          	j	f90042e0 <__divdf3+0xc4>
f90044b4:	4a048863          	beqz	s1,f9004964 <__divdf3+0x748>
f90044b8:	00100793          	li	a5,1
f90044bc:	409787b3          	sub	a5,a5,s1
f90044c0:	03800713          	li	a4,56
f90044c4:	50f75863          	bge	a4,a5,f90049d4 <__divdf3+0x7b8>
f90044c8:	00000713          	li	a4,0
f90044cc:	00000793          	li	a5,0
f90044d0:	00000413          	li	s0,0
f90044d4:	e5dff06f          	j	f9004330 <__divdf3+0x114>
f90044d8:	000a0593          	mv	a1,s4
f90044dc:	00200793          	li	a5,2
f90044e0:	5af68e63          	beq	a3,a5,f9004a9c <__divdf3+0x880>
f90044e4:	00300793          	li	a5,3
f90044e8:	eaf682e3          	beq	a3,a5,f900438c <__divdf3+0x170>
f90044ec:	00100793          	li	a5,1
f90044f0:	00058b13          	mv	s6,a1
f90044f4:	fcf68ae3          	beq	a3,a5,f90044c8 <__divdf3+0x2ac>
f90044f8:	3ff90493          	addi	s1,s2,1023
f90044fc:	fa905ce3          	blez	s1,f90044b4 <__divdf3+0x298>
f9004500:	00787793          	andi	a5,a6,7
f9004504:	42079263          	bnez	a5,f9004928 <__divdf3+0x70c>
f9004508:	00385713          	srli	a4,a6,0x3
f900450c:	00741793          	slli	a5,s0,0x7
f9004510:	0007da63          	bgez	a5,f9004524 <__divdf3+0x308>
f9004514:	ff0007b7          	lui	a5,0xff000
f9004518:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ff8b7f>
f900451c:	00f47433          	and	s0,s0,a5
f9004520:	40090493          	addi	s1,s2,1024
f9004524:	7fe00793          	li	a5,2046
f9004528:	de97cee3          	blt	a5,s1,f9004324 <__divdf3+0x108>
f900452c:	00941793          	slli	a5,s0,0x9
f9004530:	01d41693          	slli	a3,s0,0x1d
f9004534:	00e6e433          	or	s0,a3,a4
f9004538:	00c7d793          	srli	a5,a5,0xc
f900453c:	7ff4f713          	andi	a4,s1,2047
f9004540:	df1ff06f          	j	f9004330 <__divdf3+0x114>
f9004544:	00098593          	mv	a1,s3
f9004548:	000a8413          	mv	s0,s5
f900454c:	000b8813          	mv	a6,s7
f9004550:	000c0693          	mv	a3,s8
f9004554:	f89ff06f          	j	f90044dc <__divdf3+0x2c0>
f9004558:	39546e63          	bltu	s0,s5,f90048f4 <__divdf3+0x6d8>
f900455c:	388a8a63          	beq	s5,s0,f90048f0 <__divdf3+0x6d4>
f9004560:	fff90913          	addi	s2,s2,-1
f9004564:	000b8493          	mv	s1,s7
f9004568:	00000d93          	li	s11,0
f900456c:	01885d13          	srli	s10,a6,0x18
f9004570:	00841793          	slli	a5,s0,0x8
f9004574:	00fd6d33          	or	s10,s10,a5
f9004578:	010d5a13          	srli	s4,s10,0x10
f900457c:	000a0593          	mv	a1,s4
f9004580:	010d1c93          	slli	s9,s10,0x10
f9004584:	000a8513          	mv	a0,s5
f9004588:	00881c13          	slli	s8,a6,0x8
f900458c:	010cdc93          	srli	s9,s9,0x10
f9004590:	9b9fd0ef          	jal	ra,f9001f48 <__udivsi3>
f9004594:	00050593          	mv	a1,a0
f9004598:	00050b93          	mv	s7,a0
f900459c:	000c8513          	mv	a0,s9
f90045a0:	97dfd0ef          	jal	ra,f9001f1c <__mulsi3>
f90045a4:	00050993          	mv	s3,a0
f90045a8:	000a0593          	mv	a1,s4
f90045ac:	000a8513          	mv	a0,s5
f90045b0:	9e1fd0ef          	jal	ra,f9001f90 <__umodsi3>
f90045b4:	01051513          	slli	a0,a0,0x10
f90045b8:	0104d713          	srli	a4,s1,0x10
f90045bc:	00a76533          	or	a0,a4,a0
f90045c0:	01357e63          	bgeu	a0,s3,f90045dc <__divdf3+0x3c0>
f90045c4:	01a50533          	add	a0,a0,s10
f90045c8:	fffb8793          	addi	a5,s7,-1
f90045cc:	41a56063          	bltu	a0,s10,f90049cc <__divdf3+0x7b0>
f90045d0:	3f357e63          	bgeu	a0,s3,f90049cc <__divdf3+0x7b0>
f90045d4:	ffeb8b93          	addi	s7,s7,-2
f90045d8:	01a50533          	add	a0,a0,s10
f90045dc:	413509b3          	sub	s3,a0,s3
f90045e0:	000a0593          	mv	a1,s4
f90045e4:	00098513          	mv	a0,s3
f90045e8:	961fd0ef          	jal	ra,f9001f48 <__udivsi3>
f90045ec:	00050593          	mv	a1,a0
f90045f0:	00050413          	mv	s0,a0
f90045f4:	000c8513          	mv	a0,s9
f90045f8:	925fd0ef          	jal	ra,f9001f1c <__mulsi3>
f90045fc:	00a12423          	sw	a0,8(sp)
f9004600:	000a0593          	mv	a1,s4
f9004604:	00098513          	mv	a0,s3
f9004608:	989fd0ef          	jal	ra,f9001f90 <__umodsi3>
f900460c:	01049493          	slli	s1,s1,0x10
f9004610:	00812703          	lw	a4,8(sp)
f9004614:	01051513          	slli	a0,a0,0x10
f9004618:	0104d493          	srli	s1,s1,0x10
f900461c:	00a4e533          	or	a0,s1,a0
f9004620:	00e57e63          	bgeu	a0,a4,f900463c <__divdf3+0x420>
f9004624:	01a50533          	add	a0,a0,s10
f9004628:	fff40793          	addi	a5,s0,-1 # 7fffff <__stack_size+0x7fdfff>
f900462c:	39a56c63          	bltu	a0,s10,f90049c4 <__divdf3+0x7a8>
f9004630:	38e57a63          	bgeu	a0,a4,f90049c4 <__divdf3+0x7a8>
f9004634:	ffe40413          	addi	s0,s0,-2
f9004638:	01a50533          	add	a0,a0,s10
f900463c:	010b9793          	slli	a5,s7,0x10
f9004640:	00010e37          	lui	t3,0x10
f9004644:	0087e433          	or	s0,a5,s0
f9004648:	fffe0a93          	addi	s5,t3,-1 # ffff <__stack_size+0xdfff>
f900464c:	01547833          	and	a6,s0,s5
f9004650:	015c7ab3          	and	s5,s8,s5
f9004654:	40e50bb3          	sub	s7,a0,a4
f9004658:	010c5793          	srli	a5,s8,0x10
f900465c:	01045713          	srli	a4,s0,0x10
f9004660:	00080513          	mv	a0,a6
f9004664:	000a8593          	mv	a1,s5
f9004668:	8b5fd0ef          	jal	ra,f9001f1c <__mulsi3>
f900466c:	00050893          	mv	a7,a0
f9004670:	00078593          	mv	a1,a5
f9004674:	00080513          	mv	a0,a6
f9004678:	8a5fd0ef          	jal	ra,f9001f1c <__mulsi3>
f900467c:	00050813          	mv	a6,a0
f9004680:	000a8593          	mv	a1,s5
f9004684:	00070513          	mv	a0,a4
f9004688:	895fd0ef          	jal	ra,f9001f1c <__mulsi3>
f900468c:	00050313          	mv	t1,a0
f9004690:	00078593          	mv	a1,a5
f9004694:	00070513          	mv	a0,a4
f9004698:	885fd0ef          	jal	ra,f9001f1c <__mulsi3>
f900469c:	0108d713          	srli	a4,a7,0x10
f90046a0:	00680833          	add	a6,a6,t1
f90046a4:	01070733          	add	a4,a4,a6
f90046a8:	00677463          	bgeu	a4,t1,f90046b0 <__divdf3+0x494>
f90046ac:	01c50533          	add	a0,a0,t3
f90046b0:	00010637          	lui	a2,0x10
f90046b4:	fff60613          	addi	a2,a2,-1 # ffff <__stack_size+0xdfff>
f90046b8:	01075693          	srli	a3,a4,0x10
f90046bc:	00c779b3          	and	s3,a4,a2
f90046c0:	01099993          	slli	s3,s3,0x10
f90046c4:	00c8f733          	and	a4,a7,a2
f90046c8:	00a68533          	add	a0,a3,a0
f90046cc:	00e989b3          	add	s3,s3,a4
f90046d0:	1eabec63          	bltu	s7,a0,f90048c8 <__divdf3+0x6ac>
f90046d4:	1eab8863          	beq	s7,a0,f90048c4 <__divdf3+0x6a8>
f90046d8:	413d89b3          	sub	s3,s11,s3
f90046dc:	40ab8533          	sub	a0,s7,a0
f90046e0:	013dbbb3          	sltu	s7,s11,s3
f90046e4:	00f12423          	sw	a5,8(sp)
f90046e8:	41750bb3          	sub	s7,a0,s7
f90046ec:	3ff90493          	addi	s1,s2,1023
f90046f0:	257d0e63          	beq	s10,s7,f900494c <__divdf3+0x730>
f90046f4:	000a0593          	mv	a1,s4
f90046f8:	000b8513          	mv	a0,s7
f90046fc:	84dfd0ef          	jal	ra,f9001f48 <__udivsi3>
f9004700:	00050593          	mv	a1,a0
f9004704:	00050d93          	mv	s11,a0
f9004708:	000c8513          	mv	a0,s9
f900470c:	811fd0ef          	jal	ra,f9001f1c <__mulsi3>
f9004710:	00a12623          	sw	a0,12(sp)
f9004714:	000a0593          	mv	a1,s4
f9004718:	000b8513          	mv	a0,s7
f900471c:	875fd0ef          	jal	ra,f9001f90 <__umodsi3>
f9004720:	00c12703          	lw	a4,12(sp)
f9004724:	01051513          	slli	a0,a0,0x10
f9004728:	0109d693          	srli	a3,s3,0x10
f900472c:	00a6e533          	or	a0,a3,a0
f9004730:	00812783          	lw	a5,8(sp)
f9004734:	00e57e63          	bgeu	a0,a4,f9004750 <__divdf3+0x534>
f9004738:	01a50533          	add	a0,a0,s10
f900473c:	fffd8693          	addi	a3,s11,-1
f9004740:	31a56c63          	bltu	a0,s10,f9004a58 <__divdf3+0x83c>
f9004744:	30e57a63          	bgeu	a0,a4,f9004a58 <__divdf3+0x83c>
f9004748:	ffed8d93          	addi	s11,s11,-2
f900474c:	01a50533          	add	a0,a0,s10
f9004750:	40e50bb3          	sub	s7,a0,a4
f9004754:	000a0593          	mv	a1,s4
f9004758:	000b8513          	mv	a0,s7
f900475c:	00f12623          	sw	a5,12(sp)
f9004760:	fe8fd0ef          	jal	ra,f9001f48 <__udivsi3>
f9004764:	00050593          	mv	a1,a0
f9004768:	00a12423          	sw	a0,8(sp)
f900476c:	000c8513          	mv	a0,s9
f9004770:	facfd0ef          	jal	ra,f9001f1c <__mulsi3>
f9004774:	00050c93          	mv	s9,a0
f9004778:	000a0593          	mv	a1,s4
f900477c:	000b8513          	mv	a0,s7
f9004780:	811fd0ef          	jal	ra,f9001f90 <__umodsi3>
f9004784:	01099993          	slli	s3,s3,0x10
f9004788:	01051513          	slli	a0,a0,0x10
f900478c:	0109d993          	srli	s3,s3,0x10
f9004790:	00a9e9b3          	or	s3,s3,a0
f9004794:	00812803          	lw	a6,8(sp)
f9004798:	00c12783          	lw	a5,12(sp)
f900479c:	0199fe63          	bgeu	s3,s9,f90047b8 <__divdf3+0x59c>
f90047a0:	01a989b3          	add	s3,s3,s10
f90047a4:	fff80713          	addi	a4,a6,-1
f90047a8:	2ba9ec63          	bltu	s3,s10,f9004a60 <__divdf3+0x844>
f90047ac:	2b99fa63          	bgeu	s3,s9,f9004a60 <__divdf3+0x844>
f90047b0:	ffe80813          	addi	a6,a6,-2
f90047b4:	01a989b3          	add	s3,s3,s10
f90047b8:	010d9713          	slli	a4,s11,0x10
f90047bc:	01076833          	or	a6,a4,a6
f90047c0:	01081713          	slli	a4,a6,0x10
f90047c4:	01075713          	srli	a4,a4,0x10
f90047c8:	419989b3          	sub	s3,s3,s9
f90047cc:	01085e13          	srli	t3,a6,0x10
f90047d0:	00070513          	mv	a0,a4
f90047d4:	000a8593          	mv	a1,s5
f90047d8:	f44fd0ef          	jal	ra,f9001f1c <__mulsi3>
f90047dc:	00050893          	mv	a7,a0
f90047e0:	00078593          	mv	a1,a5
f90047e4:	00070513          	mv	a0,a4
f90047e8:	f34fd0ef          	jal	ra,f9001f1c <__mulsi3>
f90047ec:	00050713          	mv	a4,a0
f90047f0:	000a8593          	mv	a1,s5
f90047f4:	000e0513          	mv	a0,t3
f90047f8:	f24fd0ef          	jal	ra,f9001f1c <__mulsi3>
f90047fc:	00050313          	mv	t1,a0
f9004800:	00078593          	mv	a1,a5
f9004804:	000e0513          	mv	a0,t3
f9004808:	f14fd0ef          	jal	ra,f9001f1c <__mulsi3>
f900480c:	0108d793          	srli	a5,a7,0x10
f9004810:	00670733          	add	a4,a4,t1
f9004814:	00e787b3          	add	a5,a5,a4
f9004818:	0067f663          	bgeu	a5,t1,f9004824 <__divdf3+0x608>
f900481c:	00010737          	lui	a4,0x10
f9004820:	00e50533          	add	a0,a0,a4
f9004824:	000106b7          	lui	a3,0x10
f9004828:	fff68693          	addi	a3,a3,-1 # ffff <__stack_size+0xdfff>
f900482c:	0107d713          	srli	a4,a5,0x10
f9004830:	00d7f7b3          	and	a5,a5,a3
f9004834:	01079793          	slli	a5,a5,0x10
f9004838:	00d8f8b3          	and	a7,a7,a3
f900483c:	00a70533          	add	a0,a4,a0
f9004840:	011787b3          	add	a5,a5,a7
f9004844:	0ca9f463          	bgeu	s3,a0,f900490c <__divdf3+0x6f0>
f9004848:	013d09b3          	add	s3,s10,s3
f900484c:	fff80713          	addi	a4,a6,-1
f9004850:	25a9e063          	bltu	s3,s10,f9004a90 <__divdf3+0x874>
f9004854:	20a9ea63          	bltu	s3,a0,f9004a68 <__divdf3+0x84c>
f9004858:	24a98c63          	beq	s3,a0,f9004ab0 <__divdf3+0x894>
f900485c:	00070813          	mv	a6,a4
f9004860:	00186813          	ori	a6,a6,1
f9004864:	c99ff06f          	j	f90044fc <__divdf3+0x2e0>
f9004868:	f8cfd0ef          	jal	ra,f9001ff4 <__clzsi2>
f900486c:	01550713          	addi	a4,a0,21
f9004870:	01c00593          	li	a1,28
f9004874:	02050913          	addi	s2,a0,32
f9004878:	00812603          	lw	a2,8(sp)
f900487c:	00c12683          	lw	a3,12(sp)
f9004880:	b8e5dee3          	bge	a1,a4,f900441c <__divdf3+0x200>
f9004884:	ff850413          	addi	s0,a0,-8
f9004888:	00849ab3          	sll	s5,s1,s0
f900488c:	00000b93          	li	s7,0
f9004890:	ba9ff06f          	j	f9004438 <__divdf3+0x21c>
f9004894:	00060513          	mv	a0,a2
f9004898:	00c12423          	sw	a2,8(sp)
f900489c:	f58fd0ef          	jal	ra,f9001ff4 <__clzsi2>
f90048a0:	01550793          	addi	a5,a0,21
f90048a4:	01c00713          	li	a4,28
f90048a8:	02050693          	addi	a3,a0,32
f90048ac:	00812603          	lw	a2,8(sp)
f90048b0:	b0f75ae3          	bge	a4,a5,f90043c4 <__divdf3+0x1a8>
f90048b4:	ff850793          	addi	a5,a0,-8
f90048b8:	00000813          	li	a6,0
f90048bc:	00f61433          	sll	s0,a2,a5
f90048c0:	b21ff06f          	j	f90043e0 <__divdf3+0x1c4>
f90048c4:	e13dfae3          	bgeu	s11,s3,f90046d8 <__divdf3+0x4bc>
f90048c8:	018d8db3          	add	s11,s11,s8
f90048cc:	018db733          	sltu	a4,s11,s8
f90048d0:	01a70733          	add	a4,a4,s10
f90048d4:	00eb8bb3          	add	s7,s7,a4
f90048d8:	fff40713          	addi	a4,s0,-1
f90048dc:	037d7e63          	bgeu	s10,s7,f9004918 <__divdf3+0x6fc>
f90048e0:	16abe063          	bltu	s7,a0,f9004a40 <__divdf3+0x824>
f90048e4:	15750c63          	beq	a0,s7,f9004a3c <__divdf3+0x820>
f90048e8:	00070413          	mv	s0,a4
f90048ec:	dedff06f          	j	f90046d8 <__divdf3+0x4bc>
f90048f0:	c70be8e3          	bltu	s7,a6,f9004560 <__divdf3+0x344>
f90048f4:	01fa9493          	slli	s1,s5,0x1f
f90048f8:	001bd793          	srli	a5,s7,0x1
f90048fc:	001ada93          	srli	s5,s5,0x1
f9004900:	00f4e4b3          	or	s1,s1,a5
f9004904:	01fb9d93          	slli	s11,s7,0x1f
f9004908:	c65ff06f          	j	f900456c <__divdf3+0x350>
f900490c:	f4a99ae3          	bne	s3,a0,f9004860 <__divdf3+0x644>
f9004910:	be0786e3          	beqz	a5,f90044fc <__divdf3+0x2e0>
f9004914:	f35ff06f          	j	f9004848 <__divdf3+0x62c>
f9004918:	fd7d18e3          	bne	s10,s7,f90048e8 <__divdf3+0x6cc>
f900491c:	fd8df2e3          	bgeu	s11,s8,f90048e0 <__divdf3+0x6c4>
f9004920:	00070413          	mv	s0,a4
f9004924:	db5ff06f          	j	f90046d8 <__divdf3+0x4bc>
f9004928:	00f87793          	andi	a5,a6,15
f900492c:	00400713          	li	a4,4
f9004930:	bce78ce3          	beq	a5,a4,f9004508 <__divdf3+0x2ec>
f9004934:	ffc83793          	sltiu	a5,a6,-4
f9004938:	00480713          	addi	a4,a6,4
f900493c:	0017c793          	xori	a5,a5,1
f9004940:	00375713          	srli	a4,a4,0x3
f9004944:	00f40433          	add	s0,s0,a5
f9004948:	bc5ff06f          	j	f900450c <__divdf3+0x2f0>
f900494c:	00000713          	li	a4,0
f9004950:	00100793          	li	a5,1
f9004954:	fe9048e3          	bgtz	s1,f9004944 <__divdf3+0x728>
f9004958:	fff00813          	li	a6,-1
f900495c:	b4049ee3          	bnez	s1,f90044b8 <__divdf3+0x29c>
f9004960:	c0100913          	li	s2,-1023
f9004964:	00100793          	li	a5,1
f9004968:	41e90713          	addi	a4,s2,1054
f900496c:	00e416b3          	sll	a3,s0,a4
f9004970:	00f85633          	srl	a2,a6,a5
f9004974:	00e81833          	sll	a6,a6,a4
f9004978:	01003833          	snez	a6,a6
f900497c:	00c6e733          	or	a4,a3,a2
f9004980:	01076733          	or	a4,a4,a6
f9004984:	00777693          	andi	a3,a4,7
f9004988:	00f45433          	srl	s0,s0,a5
f900498c:	02068063          	beqz	a3,f90049ac <__divdf3+0x790>
f9004990:	00f77793          	andi	a5,a4,15
f9004994:	00400693          	li	a3,4
f9004998:	00d78a63          	beq	a5,a3,f90049ac <__divdf3+0x790>
f900499c:	00470793          	addi	a5,a4,4 # 10004 <__stack_size+0xe004>
f90049a0:	00e7b733          	sltu	a4,a5,a4
f90049a4:	00e40433          	add	s0,s0,a4
f90049a8:	00078713          	mv	a4,a5
f90049ac:	00841793          	slli	a5,s0,0x8
f90049b0:	0607d863          	bgez	a5,f9004a20 <__divdf3+0x804>
f90049b4:	00100713          	li	a4,1
f90049b8:	00000793          	li	a5,0
f90049bc:	00000413          	li	s0,0
f90049c0:	971ff06f          	j	f9004330 <__divdf3+0x114>
f90049c4:	00078413          	mv	s0,a5
f90049c8:	c75ff06f          	j	f900463c <__divdf3+0x420>
f90049cc:	00078b93          	mv	s7,a5
f90049d0:	c0dff06f          	j	f90045dc <__divdf3+0x3c0>
f90049d4:	01f00713          	li	a4,31
f90049d8:	f8f758e3          	bge	a4,a5,f9004968 <__divdf3+0x74c>
f90049dc:	fe100713          	li	a4,-31
f90049e0:	40970733          	sub	a4,a4,s1
f90049e4:	02000693          	li	a3,32
f90049e8:	00e454b3          	srl	s1,s0,a4
f90049ec:	00d78863          	beq	a5,a3,f90049fc <__divdf3+0x7e0>
f90049f0:	43e90793          	addi	a5,s2,1086
f90049f4:	00f417b3          	sll	a5,s0,a5
f90049f8:	00f86833          	or	a6,a6,a5
f90049fc:	01003733          	snez	a4,a6
f9004a00:	00976733          	or	a4,a4,s1
f9004a04:	00777413          	andi	s0,a4,7
f9004a08:	00000793          	li	a5,0
f9004a0c:	02040063          	beqz	s0,f9004a2c <__divdf3+0x810>
f9004a10:	00f77793          	andi	a5,a4,15
f9004a14:	00400693          	li	a3,4
f9004a18:	00000413          	li	s0,0
f9004a1c:	f8d790e3          	bne	a5,a3,f900499c <__divdf3+0x780>
f9004a20:	00941793          	slli	a5,s0,0x9
f9004a24:	00c7d793          	srli	a5,a5,0xc
f9004a28:	01d41413          	slli	s0,s0,0x1d
f9004a2c:	00375713          	srli	a4,a4,0x3
f9004a30:	00876433          	or	s0,a4,s0
f9004a34:	00000713          	li	a4,0
f9004a38:	8f9ff06f          	j	f9004330 <__divdf3+0x114>
f9004a3c:	eb3df6e3          	bgeu	s11,s3,f90048e8 <__divdf3+0x6cc>
f9004a40:	018d8db3          	add	s11,s11,s8
f9004a44:	018db733          	sltu	a4,s11,s8
f9004a48:	01a70733          	add	a4,a4,s10
f9004a4c:	ffe40413          	addi	s0,s0,-2
f9004a50:	00eb8bb3          	add	s7,s7,a4
f9004a54:	c85ff06f          	j	f90046d8 <__divdf3+0x4bc>
f9004a58:	00068d93          	mv	s11,a3
f9004a5c:	cf5ff06f          	j	f9004750 <__divdf3+0x534>
f9004a60:	00070813          	mv	a6,a4
f9004a64:	d55ff06f          	j	f90047b8 <__divdf3+0x59c>
f9004a68:	001c1713          	slli	a4,s8,0x1
f9004a6c:	01873c33          	sltu	s8,a4,s8
f9004a70:	01ac0d33          	add	s10,s8,s10
f9004a74:	01a989b3          	add	s3,s3,s10
f9004a78:	ffe80813          	addi	a6,a6,-2
f9004a7c:	00070c13          	mv	s8,a4
f9004a80:	dea990e3          	bne	s3,a0,f9004860 <__divdf3+0x644>
f9004a84:	a7878ce3          	beq	a5,s8,f90044fc <__divdf3+0x2e0>
f9004a88:	00186813          	ori	a6,a6,1
f9004a8c:	a71ff06f          	j	f90044fc <__divdf3+0x2e0>
f9004a90:	00070813          	mv	a6,a4
f9004a94:	fea988e3          	beq	s3,a0,f9004a84 <__divdf3+0x868>
f9004a98:	dc9ff06f          	j	f9004860 <__divdf3+0x644>
f9004a9c:	00058b13          	mv	s6,a1
f9004aa0:	7ff00713          	li	a4,2047
f9004aa4:	00000793          	li	a5,0
f9004aa8:	00000413          	li	s0,0
f9004aac:	885ff06f          	j	f9004330 <__divdf3+0x114>
f9004ab0:	fafc6ce3          	bltu	s8,a5,f9004a68 <__divdf3+0x84c>
f9004ab4:	00070813          	mv	a6,a4
f9004ab8:	fd8798e3          	bne	a5,s8,f9004a88 <__divdf3+0x86c>
f9004abc:	a41ff06f          	j	f90044fc <__divdf3+0x2e0>

f9004ac0 <__eqdf2>:
f9004ac0:	0145d713          	srli	a4,a1,0x14
f9004ac4:	001007b7          	lui	a5,0x100
f9004ac8:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004acc:	0146d813          	srli	a6,a3,0x14
f9004ad0:	7ff77713          	andi	a4,a4,2047
f9004ad4:	7ff00893          	li	a7,2047
f9004ad8:	00b7fe33          	and	t3,a5,a1
f9004adc:	00050e93          	mv	t4,a0
f9004ae0:	00d7f7b3          	and	a5,a5,a3
f9004ae4:	01f5d593          	srli	a1,a1,0x1f
f9004ae8:	00060f13          	mv	t5,a2
f9004aec:	7ff87813          	andi	a6,a6,2047
f9004af0:	01f6d693          	srli	a3,a3,0x1f
f9004af4:	01170e63          	beq	a4,a7,f9004b10 <__eqdf2+0x50>
f9004af8:	00100313          	li	t1,1
f9004afc:	01180663          	beq	a6,a7,f9004b08 <__eqdf2+0x48>
f9004b00:	01071463          	bne	a4,a6,f9004b08 <__eqdf2+0x48>
f9004b04:	02fe0263          	beq	t3,a5,f9004b28 <__eqdf2+0x68>
f9004b08:	00030513          	mv	a0,t1
f9004b0c:	00008067          	ret
f9004b10:	00ae68b3          	or	a7,t3,a0
f9004b14:	00100313          	li	t1,1
f9004b18:	fe0898e3          	bnez	a7,f9004b08 <__eqdf2+0x48>
f9004b1c:	fee816e3          	bne	a6,a4,f9004b08 <__eqdf2+0x48>
f9004b20:	00c7e7b3          	or	a5,a5,a2
f9004b24:	fe0792e3          	bnez	a5,f9004b08 <__eqdf2+0x48>
f9004b28:	00100313          	li	t1,1
f9004b2c:	fdee9ee3          	bne	t4,t5,f9004b08 <__eqdf2+0x48>
f9004b30:	00000313          	li	t1,0
f9004b34:	fcd58ae3          	beq	a1,a3,f9004b08 <__eqdf2+0x48>
f9004b38:	00100313          	li	t1,1
f9004b3c:	fc0716e3          	bnez	a4,f9004b08 <__eqdf2+0x48>
f9004b40:	00ae6533          	or	a0,t3,a0
f9004b44:	00a03333          	snez	t1,a0
f9004b48:	fc1ff06f          	j	f9004b08 <__eqdf2+0x48>

f9004b4c <__gedf2>:
f9004b4c:	0145d713          	srli	a4,a1,0x14
f9004b50:	001007b7          	lui	a5,0x100
f9004b54:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004b58:	0146d813          	srli	a6,a3,0x14
f9004b5c:	7ff77713          	andi	a4,a4,2047
f9004b60:	7ff00893          	li	a7,2047
f9004b64:	00b7f333          	and	t1,a5,a1
f9004b68:	00050e13          	mv	t3,a0
f9004b6c:	00d7f7b3          	and	a5,a5,a3
f9004b70:	01f5d593          	srli	a1,a1,0x1f
f9004b74:	00060e93          	mv	t4,a2
f9004b78:	7ff87813          	andi	a6,a6,2047
f9004b7c:	01f6d693          	srli	a3,a3,0x1f
f9004b80:	05170263          	beq	a4,a7,f9004bc4 <__gedf2+0x78>
f9004b84:	03180863          	beq	a6,a7,f9004bb4 <__gedf2+0x68>
f9004b88:	04071463          	bnez	a4,f9004bd0 <__gedf2+0x84>
f9004b8c:	00a36533          	or	a0,t1,a0
f9004b90:	00081663          	bnez	a6,f9004b9c <__gedf2+0x50>
f9004b94:	00c7e633          	or	a2,a5,a2
f9004b98:	06060263          	beqz	a2,f9004bfc <__gedf2+0xb0>
f9004b9c:	04050a63          	beqz	a0,f9004bf0 <__gedf2+0xa4>
f9004ba0:	06d58c63          	beq	a1,a3,f9004c18 <__gedf2+0xcc>
f9004ba4:	00100693          	li	a3,1
f9004ba8:	04059663          	bnez	a1,f9004bf4 <__gedf2+0xa8>
f9004bac:	00068513          	mv	a0,a3
f9004bb0:	00008067          	ret
f9004bb4:	00c7e8b3          	or	a7,a5,a2
f9004bb8:	fc0888e3          	beqz	a7,f9004b88 <__gedf2+0x3c>
f9004bbc:	ffe00693          	li	a3,-2
f9004bc0:	fedff06f          	j	f9004bac <__gedf2+0x60>
f9004bc4:	00a36533          	or	a0,t1,a0
f9004bc8:	fe051ae3          	bnez	a0,f9004bbc <__gedf2+0x70>
f9004bcc:	02e80e63          	beq	a6,a4,f9004c08 <__gedf2+0xbc>
f9004bd0:	00081663          	bnez	a6,f9004bdc <__gedf2+0x90>
f9004bd4:	00c7e633          	or	a2,a5,a2
f9004bd8:	fc0606e3          	beqz	a2,f9004ba4 <__gedf2+0x58>
f9004bdc:	fcd594e3          	bne	a1,a3,f9004ba4 <__gedf2+0x58>
f9004be0:	02e85c63          	bge	a6,a4,f9004c18 <__gedf2+0xcc>
f9004be4:	00069863          	bnez	a3,f9004bf4 <__gedf2+0xa8>
f9004be8:	00100693          	li	a3,1
f9004bec:	fc1ff06f          	j	f9004bac <__gedf2+0x60>
f9004bf0:	fa069ee3          	bnez	a3,f9004bac <__gedf2+0x60>
f9004bf4:	fff00693          	li	a3,-1
f9004bf8:	fb5ff06f          	j	f9004bac <__gedf2+0x60>
f9004bfc:	00000693          	li	a3,0
f9004c00:	fa0506e3          	beqz	a0,f9004bac <__gedf2+0x60>
f9004c04:	fa1ff06f          	j	f9004ba4 <__gedf2+0x58>
f9004c08:	00c7e633          	or	a2,a5,a2
f9004c0c:	fc0608e3          	beqz	a2,f9004bdc <__gedf2+0x90>
f9004c10:	ffe00693          	li	a3,-2
f9004c14:	f99ff06f          	j	f9004bac <__gedf2+0x60>
f9004c18:	01074a63          	blt	a4,a6,f9004c2c <__gedf2+0xe0>
f9004c1c:	f867e4e3          	bltu	a5,t1,f9004ba4 <__gedf2+0x58>
f9004c20:	00f30c63          	beq	t1,a5,f9004c38 <__gedf2+0xec>
f9004c24:	00000693          	li	a3,0
f9004c28:	f8f372e3          	bgeu	t1,a5,f9004bac <__gedf2+0x60>
f9004c2c:	fc0584e3          	beqz	a1,f9004bf4 <__gedf2+0xa8>
f9004c30:	00058693          	mv	a3,a1
f9004c34:	f79ff06f          	j	f9004bac <__gedf2+0x60>
f9004c38:	f7cee6e3          	bltu	t4,t3,f9004ba4 <__gedf2+0x58>
f9004c3c:	00000693          	li	a3,0
f9004c40:	f7de76e3          	bgeu	t3,t4,f9004bac <__gedf2+0x60>
f9004c44:	fe9ff06f          	j	f9004c2c <__gedf2+0xe0>

f9004c48 <__unorddf2>:
f9004c48:	0145d713          	srli	a4,a1,0x14
f9004c4c:	001007b7          	lui	a5,0x100
f9004c50:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004c54:	fff74713          	not	a4,a4
f9004c58:	0146d813          	srli	a6,a3,0x14
f9004c5c:	00b7f5b3          	and	a1,a5,a1
f9004c60:	00d7f7b3          	and	a5,a5,a3
f9004c64:	01571693          	slli	a3,a4,0x15
f9004c68:	7ff87813          	andi	a6,a6,2047
f9004c6c:	02068063          	beqz	a3,f9004c8c <__unorddf2+0x44>
f9004c70:	7ff00713          	li	a4,2047
f9004c74:	00000513          	li	a0,0
f9004c78:	00e80463          	beq	a6,a4,f9004c80 <__unorddf2+0x38>
f9004c7c:	00008067          	ret
f9004c80:	00c7e7b3          	or	a5,a5,a2
f9004c84:	00f03533          	snez	a0,a5
f9004c88:	00008067          	ret
f9004c8c:	00a5e5b3          	or	a1,a1,a0
f9004c90:	00100513          	li	a0,1
f9004c94:	fc058ee3          	beqz	a1,f9004c70 <__unorddf2+0x28>
f9004c98:	00008067          	ret

f9004c9c <__errno>:
f9004c9c:	81418793          	addi	a5,gp,-2028 # f900544c <_impure_ptr>
f9004ca0:	0007a503          	lw	a0,0(a5)
f9004ca4:	00008067          	ret
