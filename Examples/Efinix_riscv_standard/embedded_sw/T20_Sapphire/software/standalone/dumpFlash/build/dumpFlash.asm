
build/dumpFlash.elf:     file format elf32-littleriscv


Disassembly of section .init:

f9000000 <_start>:
f9000000:	00006197          	auipc	gp,0x6
f9000004:	df818193          	addi	gp,gp,-520 # f9005df8 <__global_pointer$>

f9000008 <init>:
f9000008:	00007117          	auipc	sp,0x7
f900000c:	62810113          	addi	sp,sp,1576 # f9007630 <__freertos_irq_stack_top>
f9000010:	00005517          	auipc	a0,0x5
f9000014:	e4450513          	addi	a0,a0,-444 # f9004e54 <_data>
f9000018:	00005597          	auipc	a1,0x5
f900001c:	e3c58593          	addi	a1,a1,-452 # f9004e54 <_data>
f9000020:	83418613          	addi	a2,gp,-1996 # f900562c <__bss_start>
f9000024:	00c5fc63          	bgeu	a1,a2,f900003c <init+0x34>
f9000028:	00052283          	lw	t0,0(a0)
f900002c:	0055a023          	sw	t0,0(a1)
f9000030:	00450513          	addi	a0,a0,4
f9000034:	00458593          	addi	a1,a1,4
f9000038:	fec5e8e3          	bltu	a1,a2,f9000028 <init+0x20>
f900003c:	83418513          	addi	a0,gp,-1996 # f900562c <__bss_start>
f9000040:	83818593          	addi	a1,gp,-1992 # f9005630 <_end>
f9000044:	00b57863          	bgeu	a0,a1,f9000054 <init+0x4c>
f9000048:	00052023          	sw	zero,0(a0)
f900004c:	00450513          	addi	a0,a0,4
f9000050:	feb56ce3          	bltu	a0,a1,f9000048 <init+0x40>
f9000054:	0c0000ef          	jal	ra,f9000114 <__libc_init_array>
f9000058:	358000ef          	jal	ra,f90003b0 <main>

f900005c <mainDone>:
f900005c:	0000006f          	j	f900005c <mainDone>

f9000060 <_init>:
f9000060:	00008067          	ret

Disassembly of section .text:

f9000064 <strcpy>:
f9000064:	00b567b3          	or	a5,a0,a1
f9000068:	0037f793          	andi	a5,a5,3
f900006c:	08079263          	bnez	a5,f90000f0 <strcpy+0x8c>
f9000070:	0005a703          	lw	a4,0(a1)
f9000074:	7f7f86b7          	lui	a3,0x7f7f8
f9000078:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__stack_size+0x7f7f5f7f>
f900007c:	00d777b3          	and	a5,a4,a3
f9000080:	00d787b3          	add	a5,a5,a3
f9000084:	00e7e7b3          	or	a5,a5,a4
f9000088:	00d7e7b3          	or	a5,a5,a3
f900008c:	fff00613          	li	a2,-1
f9000090:	06c79e63          	bne	a5,a2,f900010c <strcpy+0xa8>
f9000094:	00050613          	mv	a2,a0
f9000098:	fff00813          	li	a6,-1
f900009c:	00460613          	addi	a2,a2,4
f90000a0:	00458593          	addi	a1,a1,4
f90000a4:	fee62e23          	sw	a4,-4(a2)
f90000a8:	0005a703          	lw	a4,0(a1)
f90000ac:	00d777b3          	and	a5,a4,a3
f90000b0:	00d787b3          	add	a5,a5,a3
f90000b4:	00e7e7b3          	or	a5,a5,a4
f90000b8:	00d7e7b3          	or	a5,a5,a3
f90000bc:	ff0780e3          	beq	a5,a6,f900009c <strcpy+0x38>
f90000c0:	0005c783          	lbu	a5,0(a1)
f90000c4:	0015c703          	lbu	a4,1(a1)
f90000c8:	0025c683          	lbu	a3,2(a1)
f90000cc:	00f60023          	sb	a5,0(a2)
f90000d0:	00078a63          	beqz	a5,f90000e4 <strcpy+0x80>
f90000d4:	00e600a3          	sb	a4,1(a2)
f90000d8:	00070663          	beqz	a4,f90000e4 <strcpy+0x80>
f90000dc:	00d60123          	sb	a3,2(a2)
f90000e0:	00069463          	bnez	a3,f90000e8 <strcpy+0x84>
f90000e4:	00008067          	ret
f90000e8:	000601a3          	sb	zero,3(a2)
f90000ec:	00008067          	ret
f90000f0:	00050793          	mv	a5,a0
f90000f4:	0005c703          	lbu	a4,0(a1)
f90000f8:	00178793          	addi	a5,a5,1
f90000fc:	00158593          	addi	a1,a1,1
f9000100:	fee78fa3          	sb	a4,-1(a5)
f9000104:	fe0718e3          	bnez	a4,f90000f4 <strcpy+0x90>
f9000108:	00008067          	ret
f900010c:	00050613          	mv	a2,a0
f9000110:	fb1ff06f          	j	f90000c0 <strcpy+0x5c>

f9000114 <__libc_init_array>:
f9000114:	ff010113          	addi	sp,sp,-16
f9000118:	00812423          	sw	s0,8(sp)
f900011c:	01212023          	sw	s2,0(sp)
f9000120:	00005417          	auipc	s0,0x5
f9000124:	d3440413          	addi	s0,s0,-716 # f9004e54 <_data>
f9000128:	00005917          	auipc	s2,0x5
f900012c:	d2c90913          	addi	s2,s2,-724 # f9004e54 <_data>
f9000130:	40890933          	sub	s2,s2,s0
f9000134:	00112623          	sw	ra,12(sp)
f9000138:	00912223          	sw	s1,4(sp)
f900013c:	40295913          	srai	s2,s2,0x2
f9000140:	00090e63          	beqz	s2,f900015c <__libc_init_array+0x48>
f9000144:	00000493          	li	s1,0
f9000148:	00042783          	lw	a5,0(s0)
f900014c:	00148493          	addi	s1,s1,1
f9000150:	00440413          	addi	s0,s0,4
f9000154:	000780e7          	jalr	a5
f9000158:	fe9918e3          	bne	s2,s1,f9000148 <__libc_init_array+0x34>
f900015c:	00005417          	auipc	s0,0x5
f9000160:	cf840413          	addi	s0,s0,-776 # f9004e54 <_data>
f9000164:	00005917          	auipc	s2,0x5
f9000168:	cf090913          	addi	s2,s2,-784 # f9004e54 <_data>
f900016c:	40890933          	sub	s2,s2,s0
f9000170:	40295913          	srai	s2,s2,0x2
f9000174:	00090e63          	beqz	s2,f9000190 <__libc_init_array+0x7c>
f9000178:	00000493          	li	s1,0
f900017c:	00042783          	lw	a5,0(s0)
f9000180:	00148493          	addi	s1,s1,1
f9000184:	00440413          	addi	s0,s0,4
f9000188:	000780e7          	jalr	a5
f900018c:	fe9918e3          	bne	s2,s1,f900017c <__libc_init_array+0x68>
f9000190:	00c12083          	lw	ra,12(sp)
f9000194:	00812403          	lw	s0,8(sp)
f9000198:	00412483          	lw	s1,4(sp)
f900019c:	00012903          	lw	s2,0(sp)
f90001a0:	01010113          	addi	sp,sp,16
f90001a4:	00008067          	ret

f90001a8 <memset>:
f90001a8:	00f00313          	li	t1,15
f90001ac:	00050713          	mv	a4,a0
f90001b0:	02c37e63          	bgeu	t1,a2,f90001ec <memset+0x44>
f90001b4:	00f77793          	andi	a5,a4,15
f90001b8:	0a079063          	bnez	a5,f9000258 <memset+0xb0>
f90001bc:	08059263          	bnez	a1,f9000240 <memset+0x98>
f90001c0:	ff067693          	andi	a3,a2,-16
f90001c4:	00f67613          	andi	a2,a2,15
f90001c8:	00e686b3          	add	a3,a3,a4
f90001cc:	00b72023          	sw	a1,0(a4)
f90001d0:	00b72223          	sw	a1,4(a4)
f90001d4:	00b72423          	sw	a1,8(a4)
f90001d8:	00b72623          	sw	a1,12(a4)
f90001dc:	01070713          	addi	a4,a4,16
f90001e0:	fed766e3          	bltu	a4,a3,f90001cc <memset+0x24>
f90001e4:	00061463          	bnez	a2,f90001ec <memset+0x44>
f90001e8:	00008067          	ret
f90001ec:	40c306b3          	sub	a3,t1,a2
f90001f0:	00269693          	slli	a3,a3,0x2
f90001f4:	00000297          	auipc	t0,0x0
f90001f8:	005686b3          	add	a3,a3,t0
f90001fc:	00c68067          	jr	12(a3)
f9000200:	00b70723          	sb	a1,14(a4)
f9000204:	00b706a3          	sb	a1,13(a4)
f9000208:	00b70623          	sb	a1,12(a4)
f900020c:	00b705a3          	sb	a1,11(a4)
f9000210:	00b70523          	sb	a1,10(a4)
f9000214:	00b704a3          	sb	a1,9(a4)
f9000218:	00b70423          	sb	a1,8(a4)
f900021c:	00b703a3          	sb	a1,7(a4)
f9000220:	00b70323          	sb	a1,6(a4)
f9000224:	00b702a3          	sb	a1,5(a4)
f9000228:	00b70223          	sb	a1,4(a4)
f900022c:	00b701a3          	sb	a1,3(a4)
f9000230:	00b70123          	sb	a1,2(a4)
f9000234:	00b700a3          	sb	a1,1(a4)
f9000238:	00b70023          	sb	a1,0(a4)
f900023c:	00008067          	ret
f9000240:	0ff5f593          	andi	a1,a1,255
f9000244:	00859693          	slli	a3,a1,0x8
f9000248:	00d5e5b3          	or	a1,a1,a3
f900024c:	01059693          	slli	a3,a1,0x10
f9000250:	00d5e5b3          	or	a1,a1,a3
f9000254:	f6dff06f          	j	f90001c0 <memset+0x18>
f9000258:	00279693          	slli	a3,a5,0x2
f900025c:	00000297          	auipc	t0,0x0
f9000260:	005686b3          	add	a3,a3,t0
f9000264:	00008293          	mv	t0,ra
f9000268:	fa0680e7          	jalr	-96(a3)
f900026c:	00028093          	mv	ra,t0
f9000270:	ff078793          	addi	a5,a5,-16
f9000274:	40f70733          	sub	a4,a4,a5
f9000278:	00f60633          	add	a2,a2,a5
f900027c:	f6c378e3          	bgeu	t1,a2,f90001ec <memset+0x44>
f9000280:	f3dff06f          	j	f90001bc <memset+0x14>

f9000284 <strcat>:
f9000284:	ff010113          	addi	sp,sp,-16
f9000288:	00812423          	sw	s0,8(sp)
f900028c:	00112623          	sw	ra,12(sp)
f9000290:	00357793          	andi	a5,a0,3
f9000294:	00050413          	mv	s0,a0
f9000298:	06079663          	bnez	a5,f9000304 <strcat+0x80>
f900029c:	00052703          	lw	a4,0(a0)
f90002a0:	feff0637          	lui	a2,0xfeff0
f90002a4:	eff60613          	addi	a2,a2,-257 # fefefeff <__freertos_irq_stack_top+0x5fe88cf>
f90002a8:	00c707b3          	add	a5,a4,a2
f90002ac:	808086b7          	lui	a3,0x80808
f90002b0:	fff74713          	not	a4,a4
f90002b4:	08068693          	addi	a3,a3,128 # 80808080 <__freertos_irq_stack_top+0x87800a50>
f90002b8:	00e7f7b3          	and	a5,a5,a4
f90002bc:	00d7f7b3          	and	a5,a5,a3
f90002c0:	04079263          	bnez	a5,f9000304 <strcat+0x80>
f90002c4:	00450513          	addi	a0,a0,4
f90002c8:	00052703          	lw	a4,0(a0)
f90002cc:	00c707b3          	add	a5,a4,a2
f90002d0:	fff74713          	not	a4,a4
f90002d4:	00e7f7b3          	and	a5,a5,a4
f90002d8:	00d7f7b3          	and	a5,a5,a3
f90002dc:	02079463          	bnez	a5,f9000304 <strcat+0x80>
f90002e0:	00450513          	addi	a0,a0,4
f90002e4:	00052703          	lw	a4,0(a0)
f90002e8:	00c707b3          	add	a5,a4,a2
f90002ec:	fff74713          	not	a4,a4
f90002f0:	00e7f7b3          	and	a5,a5,a4
f90002f4:	00d7f7b3          	and	a5,a5,a3
f90002f8:	fc0786e3          	beqz	a5,f90002c4 <strcat+0x40>
f90002fc:	0080006f          	j	f9000304 <strcat+0x80>
f9000300:	00150513          	addi	a0,a0,1
f9000304:	00054783          	lbu	a5,0(a0)
f9000308:	fe079ce3          	bnez	a5,f9000300 <strcat+0x7c>
f900030c:	d59ff0ef          	jal	ra,f9000064 <strcpy>
f9000310:	00040513          	mv	a0,s0
f9000314:	00c12083          	lw	ra,12(sp)
f9000318:	00812403          	lw	s0,8(sp)
f900031c:	01010113          	addi	sp,sp,16
f9000320:	00008067          	ret

f9000324 <strlen>:
f9000324:	00357793          	andi	a5,a0,3
f9000328:	00050713          	mv	a4,a0
f900032c:	04079c63          	bnez	a5,f9000384 <strlen+0x60>
f9000330:	7f7f86b7          	lui	a3,0x7f7f8
f9000334:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <__stack_size+0x7f7f5f7f>
f9000338:	fff00593          	li	a1,-1
f900033c:	00470713          	addi	a4,a4,4
f9000340:	ffc72603          	lw	a2,-4(a4)
f9000344:	00d677b3          	and	a5,a2,a3
f9000348:	00d787b3          	add	a5,a5,a3
f900034c:	00c7e7b3          	or	a5,a5,a2
f9000350:	00d7e7b3          	or	a5,a5,a3
f9000354:	feb784e3          	beq	a5,a1,f900033c <strlen+0x18>
f9000358:	ffc74683          	lbu	a3,-4(a4)
f900035c:	40a707b3          	sub	a5,a4,a0
f9000360:	ffd74603          	lbu	a2,-3(a4)
f9000364:	ffe74503          	lbu	a0,-2(a4)
f9000368:	04068063          	beqz	a3,f90003a8 <strlen+0x84>
f900036c:	02060a63          	beqz	a2,f90003a0 <strlen+0x7c>
f9000370:	00a03533          	snez	a0,a0
f9000374:	00f50533          	add	a0,a0,a5
f9000378:	ffe50513          	addi	a0,a0,-2
f900037c:	00008067          	ret
f9000380:	fa0688e3          	beqz	a3,f9000330 <strlen+0xc>
f9000384:	00074783          	lbu	a5,0(a4)
f9000388:	00170713          	addi	a4,a4,1
f900038c:	00377693          	andi	a3,a4,3
f9000390:	fe0798e3          	bnez	a5,f9000380 <strlen+0x5c>
f9000394:	40a70733          	sub	a4,a4,a0
f9000398:	fff70513          	addi	a0,a4,-1
f900039c:	00008067          	ret
f90003a0:	ffd78513          	addi	a0,a5,-3
f90003a4:	00008067          	ret
f90003a8:	ffc78513          	addi	a0,a5,-4
f90003ac:	00008067          	ret

f90003b0 <main>:
f90003b0:	ee010113          	addi	sp,sp,-288
f90003b4:	10000613          	li	a2,256
f90003b8:	00000593          	li	a1,0
f90003bc:	01010513          	addi	a0,sp,16
f90003c0:	10112e23          	sw	ra,284(sp)
f90003c4:	10812c23          	sw	s0,280(sp)
f90003c8:	10912a23          	sw	s1,276(sp)
f90003cc:	11212823          	sw	s2,272(sp)
f90003d0:	dd9ff0ef          	jal	ra,f90001a8 <memset>
f90003d4:	fff00793          	li	a5,-1
f90003d8:	00f10823          	sb	a5,16(sp)
f90003dc:	06b00713          	li	a4,107
f90003e0:	f80107b7          	lui	a5,0xf8010
f90003e4:	00e7a423          	sw	a4,8(a5) # f8010008 <__freertos_irq_stack_top+0xff0089d8>
f90003e8:	00700713          	li	a4,7
f90003ec:	00e7a623          	sw	a4,12(a5)
f90003f0:	f8015437          	lui	s0,0xf8015
f90003f4:	00f00793          	li	a5,15
f90003f8:	00f42423          	sw	a5,8(s0) # f8015008 <__freertos_irq_stack_top+0xff00d9d8>
f90003fc:	00042223          	sw	zero,4(s0)
f9000400:	01d000ef          	jal	ra,f9000c1c <spiInit>
f9000404:	204000ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000408:	0ab00513          	li	a0,171
f900040c:	260000ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000410:	00000513          	li	a0,0
f9000414:	258000ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000418:	00000513          	li	a0,0
f900041c:	250000ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000420:	00000513          	li	a0,0
f9000424:	248000ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000428:	208000ef          	jal	ra,f9000630 <spi_read.constprop.4>
f900042c:	00a12623          	sw	a0,12(sp)
f9000430:	1b0000ef          	jal	ra,f90005e0 <spi_diselect.constprop.2>
f9000434:	00c12583          	lw	a1,12(sp)
f9000438:	f9005537          	lui	a0,0xf9005
f900043c:	e9050513          	addi	a0,a0,-368 # f9004e90 <__freertos_irq_stack_top+0xffffd860>
f9000440:	2bc000ef          	jal	ra,f90006fc <bsp_printf>
f9000444:	f9005537          	lui	a0,0xf9005
f9000448:	ea850513          	addi	a0,a0,-344 # f9004ea8 <__freertos_irq_stack_top+0xffffd878>
f900044c:	2b0000ef          	jal	ra,f90006fc <bsp_printf>
f9000450:	00100793          	li	a5,1
f9000454:	00f42423          	sw	a5,8(s0)
f9000458:	00042223          	sw	zero,4(s0)
f900045c:	01010593          	addi	a1,sp,16
f9000460:	00000513          	li	a0,0
f9000464:	7e0000ef          	jal	ra,f9000c44 <spiReadSector>
f9000468:	00000413          	li	s0,0
f900046c:	f9005937          	lui	s2,0xf9005
f9000470:	10000493          	li	s1,256
f9000474:	00f47793          	andi	a5,s0,15
f9000478:	00079863          	bnez	a5,f9000488 <main+0xd8>
f900047c:	00040593          	mv	a1,s0
f9000480:	ecc90513          	addi	a0,s2,-308 # f9004ecc <__freertos_irq_stack_top+0xffffd89c>
f9000484:	278000ef          	jal	ra,f90006fc <bsp_printf>
f9000488:	01010793          	addi	a5,sp,16
f900048c:	008787b3          	add	a5,a5,s0
f9000490:	0007c503          	lbu	a0,0(a5)
f9000494:	00140413          	addi	s0,s0,1
f9000498:	214000ef          	jal	ra,f90006ac <uart_writeHex2.constprop.0>
f900049c:	02000513          	li	a0,32
f90004a0:	1f0000ef          	jal	ra,f9000690 <uart_write.constprop.8>
f90004a4:	fc9418e3          	bne	s0,s1,f9000474 <main+0xc4>
f90004a8:	f9005537          	lui	a0,0xf9005
f90004ac:	ed850513          	addi	a0,a0,-296 # f9004ed8 <__freertos_irq_stack_top+0xffffd8a8>
f90004b0:	24c000ef          	jal	ra,f90006fc <bsp_printf>
f90004b4:	f80157b7          	lui	a5,0xf8015
f90004b8:	00100713          	li	a4,1
f90004bc:	00e7a423          	sw	a4,8(a5) # f8015008 <__freertos_irq_stack_top+0xff00d9d8>
f90004c0:	00e7a223          	sw	a4,4(a5)
f90004c4:	01010593          	addi	a1,sp,16
f90004c8:	00000513          	li	a0,0
f90004cc:	778000ef          	jal	ra,f9000c44 <spiReadSector>
f90004d0:	00000413          	li	s0,0
f90004d4:	f9005937          	lui	s2,0xf9005
f90004d8:	10000493          	li	s1,256
f90004dc:	00f47793          	andi	a5,s0,15
f90004e0:	00079863          	bnez	a5,f90004f0 <main+0x140>
f90004e4:	00040593          	mv	a1,s0
f90004e8:	ecc90513          	addi	a0,s2,-308 # f9004ecc <__freertos_irq_stack_top+0xffffd89c>
f90004ec:	210000ef          	jal	ra,f90006fc <bsp_printf>
f90004f0:	01010793          	addi	a5,sp,16
f90004f4:	008787b3          	add	a5,a5,s0
f90004f8:	0007c503          	lbu	a0,0(a5)
f90004fc:	00140413          	addi	s0,s0,1
f9000500:	1ac000ef          	jal	ra,f90006ac <uart_writeHex2.constprop.0>
f9000504:	02000513          	li	a0,32
f9000508:	188000ef          	jal	ra,f9000690 <uart_write.constprop.8>
f900050c:	fc9418e3          	bne	s0,s1,f90004dc <main+0x12c>
f9000510:	f9005537          	lui	a0,0xf9005
f9000514:	efc50513          	addi	a0,a0,-260 # f9004efc <__freertos_irq_stack_top+0xffffd8cc>
f9000518:	1e4000ef          	jal	ra,f90006fc <bsp_printf>
f900051c:	11c12083          	lw	ra,284(sp)
f9000520:	11812403          	lw	s0,280(sp)
f9000524:	11412483          	lw	s1,276(sp)
f9000528:	11012903          	lw	s2,272(sp)
f900052c:	12010113          	addi	sp,sp,288
f9000530:	00008067          	ret

f9000534 <itos>:
f9000534:	41f55793          	srai	a5,a0,0x1f
f9000538:	fe010113          	addi	sp,sp,-32
f900053c:	00a7c733          	xor	a4,a5,a0
f9000540:	00112e23          	sw	ra,28(sp)
f9000544:	40f70733          	sub	a4,a4,a5
f9000548:	00000693          	li	a3,0
f900054c:	00a00893          	li	a7,10
f9000550:	00900313          	li	t1,9
f9000554:	03176633          	rem	a2,a4,a7
f9000558:	00168793          	addi	a5,a3,1
f900055c:	00f58833          	add	a6,a1,a5
f9000560:	03060613          	addi	a2,a2,48
f9000564:	fec80fa3          	sb	a2,-1(a6)
f9000568:	03174633          	div	a2,a4,a7
f900056c:	04e34263          	blt	t1,a4,f90005b0 <itos+0x7c>
f9000570:	00055863          	bgez	a0,f9000580 <itos+0x4c>
f9000574:	02d00713          	li	a4,45
f9000578:	00268793          	addi	a5,a3,2
f900057c:	00e80023          	sb	a4,0(a6)
f9000580:	00f587b3          	add	a5,a1,a5
f9000584:	00078023          	sb	zero,0(a5)
f9000588:	00058513          	mv	a0,a1
f900058c:	00b12623          	sw	a1,12(sp)
f9000590:	d95ff0ef          	jal	ra,f9000324 <strlen>
f9000594:	00c12583          	lw	a1,12(sp)
f9000598:	fff50513          	addi	a0,a0,-1
f900059c:	00000793          	li	a5,0
f90005a0:	00a7ce63          	blt	a5,a0,f90005bc <itos+0x88>
f90005a4:	01c12083          	lw	ra,28(sp)
f90005a8:	02010113          	addi	sp,sp,32
f90005ac:	00008067          	ret
f90005b0:	00078693          	mv	a3,a5
f90005b4:	00060713          	mv	a4,a2
f90005b8:	f9dff06f          	j	f9000554 <itos+0x20>
f90005bc:	00a58733          	add	a4,a1,a0
f90005c0:	00f586b3          	add	a3,a1,a5
f90005c4:	00074803          	lbu	a6,0(a4)
f90005c8:	0006c603          	lbu	a2,0(a3)
f90005cc:	00178793          	addi	a5,a5,1
f90005d0:	01068023          	sb	a6,0(a3)
f90005d4:	00c70023          	sb	a2,0(a4)
f90005d8:	fff50513          	addi	a0,a0,-1
f90005dc:	fc5ff06f          	j	f90005a0 <itos+0x6c>

f90005e0 <spi_diselect.constprop.2>:
f90005e0:	00010737          	lui	a4,0x10
f90005e4:	f80146b7          	lui	a3,0xf8014
f90005e8:	fff70713          	addi	a4,a4,-1 # ffff <__stack_size+0xdfff>
f90005ec:	0046a783          	lw	a5,4(a3) # f8014004 <__freertos_irq_stack_top+0xff00c9d4>
f90005f0:	00e7f7b3          	and	a5,a5,a4
f90005f4:	fe078ce3          	beqz	a5,f90005ec <spi_diselect.constprop.2+0xc>
f90005f8:	000017b7          	lui	a5,0x1
f90005fc:	80078793          	addi	a5,a5,-2048 # 800 <CUSTOM2+0x7a5>
f9000600:	00f6a023          	sw	a5,0(a3)
f9000604:	00008067          	ret

f9000608 <spi_select.constprop.3>:
f9000608:	00010737          	lui	a4,0x10
f900060c:	f80146b7          	lui	a3,0xf8014
f9000610:	fff70713          	addi	a4,a4,-1 # ffff <__stack_size+0xdfff>
f9000614:	0046a783          	lw	a5,4(a3) # f8014004 <__freertos_irq_stack_top+0xff00c9d4>
f9000618:	00e7f7b3          	and	a5,a5,a4
f900061c:	fe078ce3          	beqz	a5,f9000614 <spi_select.constprop.3+0xc>
f9000620:	000017b7          	lui	a5,0x1
f9000624:	88078793          	addi	a5,a5,-1920 # 880 <CUSTOM2+0x825>
f9000628:	00f6a023          	sw	a5,0(a3)
f900062c:	00008067          	ret

f9000630 <spi_read.constprop.4>:
f9000630:	00010737          	lui	a4,0x10
f9000634:	f80146b7          	lui	a3,0xf8014
f9000638:	fff70713          	addi	a4,a4,-1 # ffff <__stack_size+0xdfff>
f900063c:	0046a783          	lw	a5,4(a3) # f8014004 <__freertos_irq_stack_top+0xff00c9d4>
f9000640:	00e7f7b3          	and	a5,a5,a4
f9000644:	fe078ce3          	beqz	a5,f900063c <spi_read.constprop.4+0xc>
f9000648:	20000793          	li	a5,512
f900064c:	00f6a023          	sw	a5,0(a3)
f9000650:	f8014737          	lui	a4,0xf8014
f9000654:	00472783          	lw	a5,4(a4) # f8014004 <__freertos_irq_stack_top+0xff00c9d4>
f9000658:	0107d793          	srli	a5,a5,0x10
f900065c:	fe078ce3          	beqz	a5,f9000654 <spi_read.constprop.4+0x24>
f9000660:	00072503          	lw	a0,0(a4)
f9000664:	0ff57513          	andi	a0,a0,255
f9000668:	00008067          	ret

f900066c <spi_write.constprop.5>:
f900066c:	00010737          	lui	a4,0x10
f9000670:	f80146b7          	lui	a3,0xf8014
f9000674:	fff70713          	addi	a4,a4,-1 # ffff <__stack_size+0xdfff>
f9000678:	0046a783          	lw	a5,4(a3) # f8014004 <__freertos_irq_stack_top+0xff00c9d4>
f900067c:	00e7f7b3          	and	a5,a5,a4
f9000680:	fe078ce3          	beqz	a5,f9000678 <spi_write.constprop.5+0xc>
f9000684:	10056513          	ori	a0,a0,256
f9000688:	00a6a023          	sw	a0,0(a3)
f900068c:	00008067          	ret

f9000690 <uart_write.constprop.8>:
f9000690:	f8010737          	lui	a4,0xf8010
f9000694:	00472783          	lw	a5,4(a4) # f8010004 <__freertos_irq_stack_top+0xff0089d4>
f9000698:	0107d793          	srli	a5,a5,0x10
f900069c:	0ff7f793          	andi	a5,a5,255
f90006a0:	fe078ae3          	beqz	a5,f9000694 <uart_write.constprop.8+0x4>
f90006a4:	00a72023          	sw	a0,0(a4)
f90006a8:	00008067          	ret

f90006ac <uart_writeHex2.constprop.0>:
f90006ac:	ff010113          	addi	sp,sp,-16
f90006b0:	00812423          	sw	s0,8(sp)
f90006b4:	00455793          	srli	a5,a0,0x4
f90006b8:	00112623          	sw	ra,12(sp)
f90006bc:	00900713          	li	a4,9
f90006c0:	00050413          	mv	s0,a0
f90006c4:	03078513          	addi	a0,a5,48
f90006c8:	00f77463          	bgeu	a4,a5,f90006d0 <uart_writeHex2.constprop.0+0x24>
f90006cc:	03778513          	addi	a0,a5,55
f90006d0:	fc1ff0ef          	jal	ra,f9000690 <uart_write.constprop.8>
f90006d4:	00f47793          	andi	a5,s0,15
f90006d8:	00900713          	li	a4,9
f90006dc:	03778513          	addi	a0,a5,55
f90006e0:	00f76463          	bltu	a4,a5,f90006e8 <uart_writeHex2.constprop.0+0x3c>
f90006e4:	03078513          	addi	a0,a5,48
f90006e8:	00812403          	lw	s0,8(sp)
f90006ec:	00c12083          	lw	ra,12(sp)
f90006f0:	01010113          	addi	sp,sp,16
f90006f4:	f9dff06f          	j	f9000690 <uart_write.constprop.8>

f90006f8 <_putchar>:
f90006f8:	f99ff06f          	j	f9000690 <uart_write.constprop.8>

f90006fc <bsp_printf>:
f90006fc:	f7010113          	addi	sp,sp,-144
f9000700:	08f12223          	sw	a5,132(sp)
f9000704:	07410793          	addi	a5,sp,116
f9000708:	00f12823          	sw	a5,16(sp)
f900070c:	05a12223          	sw	s10,68(sp)
f9000710:	05b12023          	sw	s11,64(sp)
f9000714:	8181ad03          	lw	s10,-2024(gp) # f9005610 <_impure_ptr+0x4>
f9000718:	81c1ad83          	lw	s11,-2020(gp) # f9005614 <_impure_ptr+0x8>
f900071c:	09012423          	sw	a6,136(sp)
f9000720:	8241a803          	lw	a6,-2012(gp) # f900561c <_impure_ptr+0x10>
f9000724:	8201a783          	lw	a5,-2016(gp) # f9005618 <_impure_ptr+0xc>
f9000728:	05412c23          	sw	s4,88(sp)
f900072c:	05512a23          	sw	s5,84(sp)
f9000730:	f9005a37          	lui	s4,0xf9005
f9000734:	f9005ab7          	lui	s5,0xf9005
f9000738:	06912223          	sw	s1,100(sp)
f900073c:	05812623          	sw	s8,76(sp)
f9000740:	06112623          	sw	ra,108(sp)
f9000744:	06812423          	sw	s0,104(sp)
f9000748:	07212023          	sw	s2,96(sp)
f900074c:	05312e23          	sw	s3,92(sp)
f9000750:	05612823          	sw	s6,80(sp)
f9000754:	05912423          	sw	s9,72(sp)
f9000758:	00050c13          	mv	s8,a0
f900075c:	06b12a23          	sw	a1,116(sp)
f9000760:	06c12c23          	sw	a2,120(sp)
f9000764:	06d12e23          	sw	a3,124(sp)
f9000768:	08e12023          	sw	a4,128(sp)
f900076c:	09112623          	sw	a7,140(sp)
f9000770:	00000493          	li	s1,0
f9000774:	00f12023          	sw	a5,0(sp)
f9000778:	01012223          	sw	a6,4(sp)
f900077c:	e58a0a13          	addi	s4,s4,-424 # f9004e58 <__freertos_irq_stack_top+0xffffd828>
f9000780:	e6ca8a93          	addi	s5,s5,-404 # f9004e6c <__freertos_irq_stack_top+0xffffd83c>
f9000784:	009c07b3          	add	a5,s8,s1
f9000788:	0007c503          	lbu	a0,0(a5)
f900078c:	02051e63          	bnez	a0,f90007c8 <bsp_printf+0xcc>
f9000790:	06c12083          	lw	ra,108(sp)
f9000794:	06812403          	lw	s0,104(sp)
f9000798:	06412483          	lw	s1,100(sp)
f900079c:	06012903          	lw	s2,96(sp)
f90007a0:	05c12983          	lw	s3,92(sp)
f90007a4:	05812a03          	lw	s4,88(sp)
f90007a8:	05412a83          	lw	s5,84(sp)
f90007ac:	05012b03          	lw	s6,80(sp)
f90007b0:	04c12c03          	lw	s8,76(sp)
f90007b4:	04812c83          	lw	s9,72(sp)
f90007b8:	04412d03          	lw	s10,68(sp)
f90007bc:	04012d83          	lw	s11,64(sp)
f90007c0:	09010113          	addi	sp,sp,144
f90007c4:	00008067          	ret
f90007c8:	02500793          	li	a5,37
f90007cc:	04f51063          	bne	a0,a5,f900080c <bsp_printf+0x110>
f90007d0:	06300713          	li	a4,99
f90007d4:	07300693          	li	a3,115
f90007d8:	06400613          	li	a2,100
f90007dc:	05800593          	li	a1,88
f90007e0:	07800513          	li	a0,120
f90007e4:	06600813          	li	a6,102
f90007e8:	00148493          	addi	s1,s1,1
f90007ec:	009c07b3          	add	a5,s8,s1
f90007f0:	0007c783          	lbu	a5,0(a5)
f90007f4:	02078e63          	beqz	a5,f9000830 <bsp_printf+0x134>
f90007f8:	00e79e63          	bne	a5,a4,f9000814 <bsp_printf+0x118>
f90007fc:	01012783          	lw	a5,16(sp)
f9000800:	0007c503          	lbu	a0,0(a5)
f9000804:	00478713          	addi	a4,a5,4
f9000808:	00e12823          	sw	a4,16(sp)
f900080c:	eedff0ef          	jal	ra,f90006f8 <_putchar>
f9000810:	0200006f          	j	f9000830 <bsp_printf+0x134>
f9000814:	02d79863          	bne	a5,a3,f9000844 <bsp_printf+0x148>
f9000818:	01012783          	lw	a5,16(sp)
f900081c:	0007a403          	lw	s0,0(a5)
f9000820:	00478713          	addi	a4,a5,4
f9000824:	00e12823          	sw	a4,16(sp)
f9000828:	00044503          	lbu	a0,0(s0)
f900082c:	00051663          	bnez	a0,f9000838 <bsp_printf+0x13c>
f9000830:	00148493          	addi	s1,s1,1
f9000834:	f51ff06f          	j	f9000784 <bsp_printf+0x88>
f9000838:	00140413          	addi	s0,s0,1
f900083c:	ebdff0ef          	jal	ra,f90006f8 <_putchar>
f9000840:	fe9ff06f          	j	f9000828 <bsp_printf+0x12c>
f9000844:	06c79263          	bne	a5,a2,f90008a8 <bsp_printf+0x1ac>
f9000848:	01012783          	lw	a5,16(sp)
f900084c:	0007a903          	lw	s2,0(a5)
f9000850:	00478713          	addi	a4,a5,4
f9000854:	00e12823          	sw	a4,16(sp)
f9000858:	00095863          	bgez	s2,f9000868 <bsp_printf+0x16c>
f900085c:	02d00513          	li	a0,45
f9000860:	e99ff0ef          	jal	ra,f90006f8 <_putchar>
f9000864:	41200933          	neg	s2,s2
f9000868:	02010413          	addi	s0,sp,32
f900086c:	00040993          	mv	s3,s0
f9000870:	00a00713          	li	a4,10
f9000874:	00091e63          	bnez	s2,f9000890 <bsp_printf+0x194>
f9000878:	01340c63          	beq	s0,s3,f9000890 <bsp_printf+0x194>
f900087c:	fff40413          	addi	s0,s0,-1
f9000880:	00044503          	lbu	a0,0(s0)
f9000884:	e75ff0ef          	jal	ra,f90006f8 <_putchar>
f9000888:	ff341ae3          	bne	s0,s3,f900087c <bsp_printf+0x180>
f900088c:	fa5ff06f          	j	f9000830 <bsp_printf+0x134>
f9000890:	02e967b3          	rem	a5,s2,a4
f9000894:	00140413          	addi	s0,s0,1
f9000898:	03078793          	addi	a5,a5,48
f900089c:	fef40fa3          	sb	a5,-1(s0)
f90008a0:	02e94933          	div	s2,s2,a4
f90008a4:	fd1ff06f          	j	f9000874 <bsp_printf+0x178>
f90008a8:	02b79e63          	bne	a5,a1,f90008e4 <bsp_printf+0x1e8>
f90008ac:	01012783          	lw	a5,16(sp)
f90008b0:	01c00413          	li	s0,28
f90008b4:	ffc00913          	li	s2,-4
f90008b8:	0007a983          	lw	s3,0(a5)
f90008bc:	00478713          	addi	a4,a5,4
f90008c0:	00e12823          	sw	a4,16(sp)
f90008c4:	0089d7b3          	srl	a5,s3,s0
f90008c8:	00f7f793          	andi	a5,a5,15
f90008cc:	00fa87b3          	add	a5,s5,a5
f90008d0:	0007c503          	lbu	a0,0(a5)
f90008d4:	ffc40413          	addi	s0,s0,-4
f90008d8:	e21ff0ef          	jal	ra,f90006f8 <_putchar>
f90008dc:	ff2414e3          	bne	s0,s2,f90008c4 <bsp_printf+0x1c8>
f90008e0:	f51ff06f          	j	f9000830 <bsp_printf+0x134>
f90008e4:	02a79e63          	bne	a5,a0,f9000920 <bsp_printf+0x224>
f90008e8:	01012783          	lw	a5,16(sp)
f90008ec:	01c00413          	li	s0,28
f90008f0:	ffc00913          	li	s2,-4
f90008f4:	0007a983          	lw	s3,0(a5)
f90008f8:	00478713          	addi	a4,a5,4
f90008fc:	00e12823          	sw	a4,16(sp)
f9000900:	0089d7b3          	srl	a5,s3,s0
f9000904:	00f7f793          	andi	a5,a5,15
f9000908:	00fa07b3          	add	a5,s4,a5
f900090c:	0007c503          	lbu	a0,0(a5)
f9000910:	ffc40413          	addi	s0,s0,-4
f9000914:	de5ff0ef          	jal	ra,f90006f8 <_putchar>
f9000918:	ff2414e3          	bne	s0,s2,f9000900 <bsp_printf+0x204>
f900091c:	f15ff06f          	j	f9000830 <bsp_printf+0x134>
f9000920:	ed0794e3          	bne	a5,a6,f90007e8 <bsp_printf+0xec>
f9000924:	01012783          	lw	a5,16(sp)
f9000928:	02010413          	addi	s0,sp,32
f900092c:	01510b13          	addi	s6,sp,21
f9000930:	00778793          	addi	a5,a5,7
f9000934:	ff87f793          	andi	a5,a5,-8
f9000938:	0007a903          	lw	s2,0(a5)
f900093c:	0047a983          	lw	s3,4(a5)
f9000940:	00878713          	addi	a4,a5,8
f9000944:	00090513          	mv	a0,s2
f9000948:	00098593          	mv	a1,s3
f900094c:	00e12823          	sw	a4,16(sp)
f9000950:	340010ef          	jal	ra,f9001c90 <__fixdfsi>
f9000954:	00050c93          	mv	s9,a0
f9000958:	3bc010ef          	jal	ra,f9001d14 <__floatsidf>
f900095c:	00050613          	mv	a2,a0
f9000960:	00058693          	mv	a3,a1
f9000964:	00090513          	mv	a0,s2
f9000968:	00098593          	mv	a1,s3
f900096c:	2a9000ef          	jal	ra,f9001414 <__subdf3>
f9000970:	00058993          	mv	s3,a1
f9000974:	00050913          	mv	s2,a0
f9000978:	00040593          	mv	a1,s0
f900097c:	000c8513          	mv	a0,s9
f9000980:	bb5ff0ef          	jal	ra,f9000534 <itos>
f9000984:	02e00793          	li	a5,46
f9000988:	00098593          	mv	a1,s3
f900098c:	00090513          	mv	a0,s2
f9000990:	00f10a23          	sb	a5,20(sp)
f9000994:	73c010ef          	jal	ra,f90020d0 <__truncdfsf2>
f9000998:	638010ef          	jal	ra,f9001fd0 <__extendsfdf2>
f900099c:	000d0613          	mv	a2,s10
f90009a0:	000d8693          	mv	a3,s11
f90009a4:	41c000ef          	jal	ra,f9000dc0 <__muldf3>
f90009a8:	728010ef          	jal	ra,f90020d0 <__truncdfsf2>
f90009ac:	00000593          	li	a1,0
f90009b0:	00050993          	mv	s3,a0
f90009b4:	4e4010ef          	jal	ra,f9001e98 <__lesf2>
f90009b8:	00055c63          	bgez	a0,f90009d0 <bsp_printf+0x2d4>
f90009bc:	02d00793          	li	a5,45
f90009c0:	00f10aa3          	sb	a5,21(sp)
f90009c4:	800007b7          	lui	a5,0x80000
f90009c8:	0137c9b3          	xor	s3,a5,s3
f90009cc:	01610b13          	addi	s6,sp,22
f90009d0:	00400913          	li	s2,4
f90009d4:	03000c93          	li	s9,48
f90009d8:	fff90913          	addi	s2,s2,-1
f90009dc:	00090513          	mv	a0,s2
f90009e0:	334010ef          	jal	ra,f9001d14 <__floatsidf>
f90009e4:	00050613          	mv	a2,a0
f90009e8:	00058693          	mv	a3,a1
f90009ec:	00012503          	lw	a0,0(sp)
f90009f0:	00412583          	lw	a1,4(sp)
f90009f4:	165010ef          	jal	ra,f9002358 <pow>
f90009f8:	00a12423          	sw	a0,8(sp)
f90009fc:	00098513          	mv	a0,s3
f9000a00:	00b12623          	sw	a1,12(sp)
f9000a04:	5cc010ef          	jal	ra,f9001fd0 <__extendsfdf2>
f9000a08:	00812603          	lw	a2,8(sp)
f9000a0c:	00c12683          	lw	a3,12(sp)
f9000a10:	2b0000ef          	jal	ra,f9000cc0 <__ledf2>
f9000a14:	00055e63          	bgez	a0,f9000a30 <bsp_printf+0x334>
f9000a18:	00000593          	li	a1,0
f9000a1c:	00098513          	mv	a0,s3
f9000a20:	3b4010ef          	jal	ra,f9001dd4 <__gesf2>
f9000a24:	00a05663          	blez	a0,f9000a30 <bsp_printf+0x334>
f9000a28:	019b0023          	sb	s9,0(s6)
f9000a2c:	001b0b13          	addi	s6,s6,1
f9000a30:	fa0914e3          	bnez	s2,f90009d8 <bsp_printf+0x2dc>
f9000a34:	00098513          	mv	a0,s3
f9000a38:	524010ef          	jal	ra,f9001f5c <__fixsfsi>
f9000a3c:	000b0593          	mv	a1,s6
f9000a40:	af5ff0ef          	jal	ra,f9000534 <itos>
f9000a44:	01514703          	lbu	a4,21(sp)
f9000a48:	02d00793          	li	a5,45
f9000a4c:	02f71063          	bne	a4,a5,f9000a6c <bsp_printf+0x370>
f9000a50:	01410793          	addi	a5,sp,20
f9000a54:	01c10713          	addi	a4,sp,28
f9000a58:	0027c683          	lbu	a3,2(a5) # 80000002 <__freertos_irq_stack_top+0x86ff89d2>
f9000a5c:	00178793          	addi	a5,a5,1
f9000a60:	00d78023          	sb	a3,0(a5)
f9000a64:	fef71ae3          	bne	a4,a5,f9000a58 <bsp_printf+0x35c>
f9000a68:	00100913          	li	s2,1
f9000a6c:	01410593          	addi	a1,sp,20
f9000a70:	00040513          	mv	a0,s0
f9000a74:	811ff0ef          	jal	ra,f9000284 <strcat>
f9000a78:	02014703          	lbu	a4,32(sp)
f9000a7c:	02d00793          	li	a5,45
f9000a80:	02f70463          	beq	a4,a5,f9000aa8 <bsp_printf+0x3ac>
f9000a84:	00100793          	li	a5,1
f9000a88:	02f91063          	bne	s2,a5,f9000aa8 <bsp_printf+0x3ac>
f9000a8c:	03410793          	addi	a5,sp,52
f9000a90:	fff7c703          	lbu	a4,-1(a5)
f9000a94:	fff78793          	addi	a5,a5,-1
f9000a98:	00e780a3          	sb	a4,1(a5)
f9000a9c:	fef41ae3          	bne	s0,a5,f9000a90 <bsp_printf+0x394>
f9000aa0:	02d00793          	li	a5,45
f9000aa4:	02f10023          	sb	a5,32(sp)
f9000aa8:	00044503          	lbu	a0,0(s0)
f9000aac:	d80502e3          	beqz	a0,f9000830 <bsp_printf+0x134>
f9000ab0:	00140413          	addi	s0,s0,1
f9000ab4:	c45ff0ef          	jal	ra,f90006f8 <_putchar>
f9000ab8:	ff1ff06f          	j	f9000aa8 <bsp_printf+0x3ac>

f9000abc <WaitBusy>:
f9000abc:	fe010113          	addi	sp,sp,-32
f9000ac0:	00912a23          	sw	s1,20(sp)
f9000ac4:	000184b7          	lui	s1,0x18
f9000ac8:	00812c23          	sw	s0,24(sp)
f9000acc:	01212823          	sw	s2,16(sp)
f9000ad0:	00112e23          	sw	ra,28(sp)
f9000ad4:	19000413          	li	s0,400
f9000ad8:	f8b0c937          	lui	s2,0xf8b0c
f9000adc:	6a048493          	addi	s1,s1,1696 # 186a0 <__stack_size+0x166a0>
f9000ae0:	ff892703          	lw	a4,-8(s2) # f8b0bff8 <__freertos_irq_stack_top+0xffb049c8>
f9000ae4:	00970733          	add	a4,a4,s1
f9000ae8:	ff892783          	lw	a5,-8(s2)
f9000aec:	40f707b3          	sub	a5,a4,a5
f9000af0:	fe07dce3          	bgez	a5,f9000ae8 <WaitBusy+0x2c>
f9000af4:	b15ff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000af8:	00500513          	li	a0,5
f9000afc:	b71ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000b00:	b31ff0ef          	jal	ra,f9000630 <spi_read.constprop.4>
f9000b04:	00a12623          	sw	a0,12(sp)
f9000b08:	ad9ff0ef          	jal	ra,f90005e0 <spi_diselect.constprop.2>
f9000b0c:	00c12503          	lw	a0,12(sp)
f9000b10:	00157513          	andi	a0,a0,1
f9000b14:	02050a63          	beqz	a0,f9000b48 <WaitBusy+0x8c>
f9000b18:	fff40413          	addi	s0,s0,-1
f9000b1c:	01041413          	slli	s0,s0,0x10
f9000b20:	01045413          	srli	s0,s0,0x10
f9000b24:	fa041ee3          	bnez	s0,f9000ae0 <WaitBusy+0x24>
f9000b28:	01812403          	lw	s0,24(sp)
f9000b2c:	01c12083          	lw	ra,28(sp)
f9000b30:	01412483          	lw	s1,20(sp)
f9000b34:	01012903          	lw	s2,16(sp)
f9000b38:	f9005537          	lui	a0,0xf9005
f9000b3c:	e8050513          	addi	a0,a0,-384 # f9004e80 <__freertos_irq_stack_top+0xffffd850>
f9000b40:	02010113          	addi	sp,sp,32
f9000b44:	bb9ff06f          	j	f90006fc <bsp_printf>
f9000b48:	01c12083          	lw	ra,28(sp)
f9000b4c:	01812403          	lw	s0,24(sp)
f9000b50:	01412483          	lw	s1,20(sp)
f9000b54:	01012903          	lw	s2,16(sp)
f9000b58:	02010113          	addi	sp,sp,32
f9000b5c:	00008067          	ret

f9000b60 <WriteEnableLatch>:
f9000b60:	ff010113          	addi	sp,sp,-16
f9000b64:	00112623          	sw	ra,12(sp)
f9000b68:	aa1ff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000b6c:	00600513          	li	a0,6
f9000b70:	afdff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000b74:	00c12083          	lw	ra,12(sp)
f9000b78:	01010113          	addi	sp,sp,16
f9000b7c:	a65ff06f          	j	f90005e0 <spi_diselect.constprop.2>

f9000b80 <GlobalLock>:
f9000b80:	ff010113          	addi	sp,sp,-16
f9000b84:	00112623          	sw	ra,12(sp)
f9000b88:	fd9ff0ef          	jal	ra,f9000b60 <WriteEnableLatch>
f9000b8c:	a7dff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000b90:	07e00513          	li	a0,126
f9000b94:	ad9ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000b98:	00c12083          	lw	ra,12(sp)
f9000b9c:	01010113          	addi	sp,sp,16
f9000ba0:	a41ff06f          	j	f90005e0 <spi_diselect.constprop.2>

f9000ba4 <GlobalUnlock>:
f9000ba4:	ff010113          	addi	sp,sp,-16
f9000ba8:	00112623          	sw	ra,12(sp)
f9000bac:	fb5ff0ef          	jal	ra,f9000b60 <WriteEnableLatch>
f9000bb0:	a59ff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000bb4:	09800513          	li	a0,152
f9000bb8:	ab5ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000bbc:	00c12083          	lw	ra,12(sp)
f9000bc0:	01010113          	addi	sp,sp,16
f9000bc4:	a1dff06f          	j	f90005e0 <spi_diselect.constprop.2>

f9000bc8 <SectorErase>:
f9000bc8:	ff010113          	addi	sp,sp,-16
f9000bcc:	00112623          	sw	ra,12(sp)
f9000bd0:	00812423          	sw	s0,8(sp)
f9000bd4:	00050413          	mv	s0,a0
f9000bd8:	f89ff0ef          	jal	ra,f9000b60 <WriteEnableLatch>
f9000bdc:	a2dff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000be0:	02000513          	li	a0,32
f9000be4:	a89ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000be8:	01045513          	srli	a0,s0,0x10
f9000bec:	0ff57513          	andi	a0,a0,255
f9000bf0:	a7dff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000bf4:	00845513          	srli	a0,s0,0x8
f9000bf8:	0ff57513          	andi	a0,a0,255
f9000bfc:	a71ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c00:	0ff47513          	andi	a0,s0,255
f9000c04:	a69ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c08:	9d9ff0ef          	jal	ra,f90005e0 <spi_diselect.constprop.2>
f9000c0c:	00812403          	lw	s0,8(sp)
f9000c10:	00c12083          	lw	ra,12(sp)
f9000c14:	01010113          	addi	sp,sp,16
f9000c18:	ea5ff06f          	j	f9000abc <WaitBusy>

f9000c1c <spiInit>:
f9000c1c:	f80147b7          	lui	a5,0xf8014
f9000c20:	00300713          	li	a4,3
f9000c24:	00e7a423          	sw	a4,8(a5) # f8014008 <__freertos_irq_stack_top+0xff00c9d8>
f9000c28:	01300713          	li	a4,19
f9000c2c:	02e7a023          	sw	a4,32(a5)
f9000c30:	00500713          	li	a4,5
f9000c34:	02e7a223          	sw	a4,36(a5)
f9000c38:	02e7a423          	sw	a4,40(a5)
f9000c3c:	02e7a623          	sw	a4,44(a5)
f9000c40:	00008067          	ret

f9000c44 <spiReadSector>:
f9000c44:	ff010113          	addi	sp,sp,-16
f9000c48:	00112623          	sw	ra,12(sp)
f9000c4c:	00812423          	sw	s0,8(sp)
f9000c50:	00912223          	sw	s1,4(sp)
f9000c54:	00050413          	mv	s0,a0
f9000c58:	01212023          	sw	s2,0(sp)
f9000c5c:	00058913          	mv	s2,a1
f9000c60:	9a9ff0ef          	jal	ra,f9000608 <spi_select.constprop.3>
f9000c64:	00300513          	li	a0,3
f9000c68:	a05ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c6c:	01045513          	srli	a0,s0,0x10
f9000c70:	0ff57513          	andi	a0,a0,255
f9000c74:	9f9ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c78:	00845513          	srli	a0,s0,0x8
f9000c7c:	0ff57513          	andi	a0,a0,255
f9000c80:	9edff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c84:	0ff47513          	andi	a0,s0,255
f9000c88:	9e5ff0ef          	jal	ra,f900066c <spi_write.constprop.5>
f9000c8c:	00000413          	li	s0,0
f9000c90:	10000493          	li	s1,256
f9000c94:	99dff0ef          	jal	ra,f9000630 <spi_read.constprop.4>
f9000c98:	008907b3          	add	a5,s2,s0
f9000c9c:	00a78023          	sb	a0,0(a5)
f9000ca0:	00140413          	addi	s0,s0,1
f9000ca4:	fe9418e3          	bne	s0,s1,f9000c94 <spiReadSector+0x50>
f9000ca8:	00812403          	lw	s0,8(sp)
f9000cac:	00c12083          	lw	ra,12(sp)
f9000cb0:	00412483          	lw	s1,4(sp)
f9000cb4:	00012903          	lw	s2,0(sp)
f9000cb8:	01010113          	addi	sp,sp,16
f9000cbc:	925ff06f          	j	f90005e0 <spi_diselect.constprop.2>

f9000cc0 <__ledf2>:
f9000cc0:	0145d713          	srli	a4,a1,0x14
f9000cc4:	001007b7          	lui	a5,0x100
f9000cc8:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9000ccc:	0146d813          	srli	a6,a3,0x14
f9000cd0:	7ff77713          	andi	a4,a4,2047
f9000cd4:	7ff00893          	li	a7,2047
f9000cd8:	00b7f333          	and	t1,a5,a1
f9000cdc:	00050e13          	mv	t3,a0
f9000ce0:	00d7f7b3          	and	a5,a5,a3
f9000ce4:	01f5d593          	srli	a1,a1,0x1f
f9000ce8:	00060e93          	mv	t4,a2
f9000cec:	7ff87813          	andi	a6,a6,2047
f9000cf0:	01f6d693          	srli	a3,a3,0x1f
f9000cf4:	05170a63          	beq	a4,a7,f9000d48 <__ledf2+0x88>
f9000cf8:	03180263          	beq	a6,a7,f9000d1c <__ledf2+0x5c>
f9000cfc:	04071c63          	bnez	a4,f9000d54 <__ledf2+0x94>
f9000d00:	00a36533          	or	a0,t1,a0
f9000d04:	02081663          	bnez	a6,f9000d30 <__ledf2+0x70>
f9000d08:	00c7e633          	or	a2,a5,a2
f9000d0c:	02061263          	bnez	a2,f9000d30 <__ledf2+0x70>
f9000d10:	00000693          	li	a3,0
f9000d14:	06050263          	beqz	a0,f9000d78 <__ledf2+0xb8>
f9000d18:	0200006f          	j	f9000d38 <__ledf2+0x78>
f9000d1c:	00c7e8b3          	or	a7,a5,a2
f9000d20:	fc088ee3          	beqz	a7,f9000cfc <__ledf2+0x3c>
f9000d24:	00200693          	li	a3,2
f9000d28:	00068513          	mv	a0,a3
f9000d2c:	00008067          	ret
f9000d30:	04050263          	beqz	a0,f9000d74 <__ledf2+0xb4>
f9000d34:	04d58e63          	beq	a1,a3,f9000d90 <__ledf2+0xd0>
f9000d38:	00100693          	li	a3,1
f9000d3c:	02058e63          	beqz	a1,f9000d78 <__ledf2+0xb8>
f9000d40:	fff00693          	li	a3,-1
f9000d44:	0340006f          	j	f9000d78 <__ledf2+0xb8>
f9000d48:	00a36533          	or	a0,t1,a0
f9000d4c:	fc051ce3          	bnez	a0,f9000d24 <__ledf2+0x64>
f9000d50:	02e80863          	beq	a6,a4,f9000d80 <__ledf2+0xc0>
f9000d54:	00081663          	bnez	a6,f9000d60 <__ledf2+0xa0>
f9000d58:	00c7e633          	or	a2,a5,a2
f9000d5c:	fc060ee3          	beqz	a2,f9000d38 <__ledf2+0x78>
f9000d60:	fcd59ce3          	bne	a1,a3,f9000d38 <__ledf2+0x78>
f9000d64:	02e85663          	bge	a6,a4,f9000d90 <__ledf2+0xd0>
f9000d68:	fc069ce3          	bnez	a3,f9000d40 <__ledf2+0x80>
f9000d6c:	00100693          	li	a3,1
f9000d70:	0080006f          	j	f9000d78 <__ledf2+0xb8>
f9000d74:	fc0686e3          	beqz	a3,f9000d40 <__ledf2+0x80>
f9000d78:	00068513          	mv	a0,a3
f9000d7c:	00008067          	ret
f9000d80:	00c7e633          	or	a2,a5,a2
f9000d84:	fc060ee3          	beqz	a2,f9000d60 <__ledf2+0xa0>
f9000d88:	00200693          	li	a3,2
f9000d8c:	f9dff06f          	j	f9000d28 <__ledf2+0x68>
f9000d90:	01074a63          	blt	a4,a6,f9000da4 <__ledf2+0xe4>
f9000d94:	fa67e2e3          	bltu	a5,t1,f9000d38 <__ledf2+0x78>
f9000d98:	00f30c63          	beq	t1,a5,f9000db0 <__ledf2+0xf0>
f9000d9c:	00000693          	li	a3,0
f9000da0:	fcf37ce3          	bgeu	t1,a5,f9000d78 <__ledf2+0xb8>
f9000da4:	f8058ee3          	beqz	a1,f9000d40 <__ledf2+0x80>
f9000da8:	00058693          	mv	a3,a1
f9000dac:	fcdff06f          	j	f9000d78 <__ledf2+0xb8>
f9000db0:	f9cee4e3          	bltu	t4,t3,f9000d38 <__ledf2+0x78>
f9000db4:	00000693          	li	a3,0
f9000db8:	fdde70e3          	bgeu	t3,t4,f9000d78 <__ledf2+0xb8>
f9000dbc:	fe9ff06f          	j	f9000da4 <__ledf2+0xe4>

f9000dc0 <__muldf3>:
f9000dc0:	fc010113          	addi	sp,sp,-64
f9000dc4:	0145d793          	srli	a5,a1,0x14
f9000dc8:	02812c23          	sw	s0,56(sp)
f9000dcc:	03212823          	sw	s2,48(sp)
f9000dd0:	03412423          	sw	s4,40(sp)
f9000dd4:	00c59413          	slli	s0,a1,0xc
f9000dd8:	02112e23          	sw	ra,60(sp)
f9000ddc:	02912a23          	sw	s1,52(sp)
f9000de0:	03312623          	sw	s3,44(sp)
f9000de4:	03512223          	sw	s5,36(sp)
f9000de8:	03612023          	sw	s6,32(sp)
f9000dec:	01712e23          	sw	s7,28(sp)
f9000df0:	7ff7f793          	andi	a5,a5,2047
f9000df4:	00050913          	mv	s2,a0
f9000df8:	00c45413          	srli	s0,s0,0xc
f9000dfc:	01f5da13          	srli	s4,a1,0x1f
f9000e00:	14078c63          	beqz	a5,f9000f58 <__muldf3+0x198>
f9000e04:	7ff00713          	li	a4,2047
f9000e08:	20e78863          	beq	a5,a4,f9001018 <__muldf3+0x258>
f9000e0c:	00341513          	slli	a0,s0,0x3
f9000e10:	01d95413          	srli	s0,s2,0x1d
f9000e14:	00a46433          	or	s0,s0,a0
f9000e18:	00800537          	lui	a0,0x800
f9000e1c:	00a46433          	or	s0,s0,a0
f9000e20:	00391493          	slli	s1,s2,0x3
f9000e24:	c0178b13          	addi	s6,a5,-1023
f9000e28:	00000993          	li	s3,0
f9000e2c:	00000b93          	li	s7,0
f9000e30:	0146d793          	srli	a5,a3,0x14
f9000e34:	00c69913          	slli	s2,a3,0xc
f9000e38:	7ff7f793          	andi	a5,a5,2047
f9000e3c:	00c95913          	srli	s2,s2,0xc
f9000e40:	01f6da93          	srli	s5,a3,0x1f
f9000e44:	18078263          	beqz	a5,f9000fc8 <__muldf3+0x208>
f9000e48:	7ff00713          	li	a4,2047
f9000e4c:	04e78c63          	beq	a5,a4,f9000ea4 <__muldf3+0xe4>
f9000e50:	00391513          	slli	a0,s2,0x3
f9000e54:	01d65913          	srli	s2,a2,0x1d
f9000e58:	00a96933          	or	s2,s2,a0
f9000e5c:	c0178793          	addi	a5,a5,-1023
f9000e60:	00800537          	lui	a0,0x800
f9000e64:	00a96933          	or	s2,s2,a0
f9000e68:	00361593          	slli	a1,a2,0x3
f9000e6c:	00fb0b33          	add	s6,s6,a5
f9000e70:	00000813          	li	a6,0
f9000e74:	015a46b3          	xor	a3,s4,s5
f9000e78:	00f00793          	li	a5,15
f9000e7c:	00068513          	mv	a0,a3
f9000e80:	001b0613          	addi	a2,s6,1
f9000e84:	2137ec63          	bltu	a5,s3,f900109c <__muldf3+0x2dc>
f9000e88:	00004797          	auipc	a5,0x4
f9000e8c:	08078793          	addi	a5,a5,128 # f9004f08 <_data+0xb4>
f9000e90:	00299993          	slli	s3,s3,0x2
f9000e94:	00f989b3          	add	s3,s3,a5
f9000e98:	0009a703          	lw	a4,0(s3)
f9000e9c:	00f70733          	add	a4,a4,a5
f9000ea0:	00070067          	jr	a4
f9000ea4:	00c965b3          	or	a1,s2,a2
f9000ea8:	7ffb0b13          	addi	s6,s6,2047
f9000eac:	1c059063          	bnez	a1,f900106c <__muldf3+0x2ac>
f9000eb0:	0029e993          	ori	s3,s3,2
f9000eb4:	00000913          	li	s2,0
f9000eb8:	00200813          	li	a6,2
f9000ebc:	fb9ff06f          	j	f9000e74 <__muldf3+0xb4>
f9000ec0:	00000693          	li	a3,0
f9000ec4:	7ff00793          	li	a5,2047
f9000ec8:	00080437          	lui	s0,0x80
f9000ecc:	00000493          	li	s1,0
f9000ed0:	00c41413          	slli	s0,s0,0xc
f9000ed4:	01479793          	slli	a5,a5,0x14
f9000ed8:	00c45413          	srli	s0,s0,0xc
f9000edc:	01f69693          	slli	a3,a3,0x1f
f9000ee0:	00f46433          	or	s0,s0,a5
f9000ee4:	00d46433          	or	s0,s0,a3
f9000ee8:	00040593          	mv	a1,s0
f9000eec:	03c12083          	lw	ra,60(sp)
f9000ef0:	03812403          	lw	s0,56(sp)
f9000ef4:	00048513          	mv	a0,s1
f9000ef8:	03012903          	lw	s2,48(sp)
f9000efc:	03412483          	lw	s1,52(sp)
f9000f00:	02c12983          	lw	s3,44(sp)
f9000f04:	02812a03          	lw	s4,40(sp)
f9000f08:	02412a83          	lw	s5,36(sp)
f9000f0c:	02012b03          	lw	s6,32(sp)
f9000f10:	01c12b83          	lw	s7,28(sp)
f9000f14:	04010113          	addi	sp,sp,64
f9000f18:	00008067          	ret
f9000f1c:	000a8513          	mv	a0,s5
f9000f20:	00090413          	mv	s0,s2
f9000f24:	00058493          	mv	s1,a1
f9000f28:	00080b93          	mv	s7,a6
f9000f2c:	00200793          	li	a5,2
f9000f30:	14fb8c63          	beq	s7,a5,f9001088 <__muldf3+0x2c8>
f9000f34:	00300793          	li	a5,3
f9000f38:	f8fb84e3          	beq	s7,a5,f9000ec0 <__muldf3+0x100>
f9000f3c:	00100793          	li	a5,1
f9000f40:	00050693          	mv	a3,a0
f9000f44:	4cfb9463          	bne	s7,a5,f900140c <__muldf3+0x64c>
f9000f48:	00000793          	li	a5,0
f9000f4c:	00000413          	li	s0,0
f9000f50:	00000493          	li	s1,0
f9000f54:	f7dff06f          	j	f9000ed0 <__muldf3+0x110>
f9000f58:	00a464b3          	or	s1,s0,a0
f9000f5c:	0e048e63          	beqz	s1,f9001058 <__muldf3+0x298>
f9000f60:	00d12623          	sw	a3,12(sp)
f9000f64:	00c12423          	sw	a2,8(sp)
f9000f68:	38040863          	beqz	s0,f90012f8 <__muldf3+0x538>
f9000f6c:	00040513          	mv	a0,s0
f9000f70:	354010ef          	jal	ra,f90022c4 <__clzsi2>
f9000f74:	00812603          	lw	a2,8(sp)
f9000f78:	00c12683          	lw	a3,12(sp)
f9000f7c:	00050793          	mv	a5,a0
f9000f80:	ff550593          	addi	a1,a0,-11 # 7ffff5 <__stack_size+0x7fdff5>
f9000f84:	01d00713          	li	a4,29
f9000f88:	ff878493          	addi	s1,a5,-8
f9000f8c:	40b70733          	sub	a4,a4,a1
f9000f90:	00941433          	sll	s0,s0,s1
f9000f94:	00e95733          	srl	a4,s2,a4
f9000f98:	00876433          	or	s0,a4,s0
f9000f9c:	009914b3          	sll	s1,s2,s1
f9000fa0:	c0d00b13          	li	s6,-1011
f9000fa4:	40fb0b33          	sub	s6,s6,a5
f9000fa8:	0146d793          	srli	a5,a3,0x14
f9000fac:	00c69913          	slli	s2,a3,0xc
f9000fb0:	7ff7f793          	andi	a5,a5,2047
f9000fb4:	00000993          	li	s3,0
f9000fb8:	00000b93          	li	s7,0
f9000fbc:	00c95913          	srli	s2,s2,0xc
f9000fc0:	01f6da93          	srli	s5,a3,0x1f
f9000fc4:	e80792e3          	bnez	a5,f9000e48 <__muldf3+0x88>
f9000fc8:	00c965b3          	or	a1,s2,a2
f9000fcc:	06058463          	beqz	a1,f9001034 <__muldf3+0x274>
f9000fd0:	2e090c63          	beqz	s2,f90012c8 <__muldf3+0x508>
f9000fd4:	00090513          	mv	a0,s2
f9000fd8:	00c12423          	sw	a2,8(sp)
f9000fdc:	2e8010ef          	jal	ra,f90022c4 <__clzsi2>
f9000fe0:	00812603          	lw	a2,8(sp)
f9000fe4:	00050793          	mv	a5,a0
f9000fe8:	ff550693          	addi	a3,a0,-11
f9000fec:	01d00713          	li	a4,29
f9000ff0:	ff878593          	addi	a1,a5,-8
f9000ff4:	40d70733          	sub	a4,a4,a3
f9000ff8:	00b91933          	sll	s2,s2,a1
f9000ffc:	00e65733          	srl	a4,a2,a4
f9001000:	01276933          	or	s2,a4,s2
f9001004:	00b615b3          	sll	a1,a2,a1
f9001008:	40fb07b3          	sub	a5,s6,a5
f900100c:	c0d78b13          	addi	s6,a5,-1011
f9001010:	00000813          	li	a6,0
f9001014:	e61ff06f          	j	f9000e74 <__muldf3+0xb4>
f9001018:	00a464b3          	or	s1,s0,a0
f900101c:	02049463          	bnez	s1,f9001044 <__muldf3+0x284>
f9001020:	00000413          	li	s0,0
f9001024:	00800993          	li	s3,8
f9001028:	7ff00b13          	li	s6,2047
f900102c:	00200b93          	li	s7,2
f9001030:	e01ff06f          	j	f9000e30 <__muldf3+0x70>
f9001034:	0019e993          	ori	s3,s3,1
f9001038:	00000913          	li	s2,0
f900103c:	00100813          	li	a6,1
f9001040:	e35ff06f          	j	f9000e74 <__muldf3+0xb4>
f9001044:	00050493          	mv	s1,a0
f9001048:	00c00993          	li	s3,12
f900104c:	7ff00b13          	li	s6,2047
f9001050:	00300b93          	li	s7,3
f9001054:	dddff06f          	j	f9000e30 <__muldf3+0x70>
f9001058:	00000413          	li	s0,0
f900105c:	00400993          	li	s3,4
f9001060:	00000b13          	li	s6,0
f9001064:	00100b93          	li	s7,1
f9001068:	dc9ff06f          	j	f9000e30 <__muldf3+0x70>
f900106c:	0039e993          	ori	s3,s3,3
f9001070:	00060593          	mv	a1,a2
f9001074:	00300813          	li	a6,3
f9001078:	dfdff06f          	j	f9000e74 <__muldf3+0xb4>
f900107c:	00200793          	li	a5,2
f9001080:	000a0513          	mv	a0,s4
f9001084:	eafb98e3          	bne	s7,a5,f9000f34 <__muldf3+0x174>
f9001088:	00050693          	mv	a3,a0
f900108c:	7ff00793          	li	a5,2047
f9001090:	00000413          	li	s0,0
f9001094:	00000493          	li	s1,0
f9001098:	e39ff06f          	j	f9000ed0 <__muldf3+0x110>
f900109c:	00010e37          	lui	t3,0x10
f90010a0:	fffe0713          	addi	a4,t3,-1 # ffff <__stack_size+0xdfff>
f90010a4:	0104d793          	srli	a5,s1,0x10
f90010a8:	0105d813          	srli	a6,a1,0x10
f90010ac:	00e4f4b3          	and	s1,s1,a4
f90010b0:	00e5f5b3          	and	a1,a1,a4
f90010b4:	02958733          	mul	a4,a1,s1
f90010b8:	02b78333          	mul	t1,a5,a1
f90010bc:	01075513          	srli	a0,a4,0x10
f90010c0:	029808b3          	mul	a7,a6,s1
f90010c4:	006888b3          	add	a7,a7,t1
f90010c8:	01150533          	add	a0,a0,a7
f90010cc:	03078f33          	mul	t5,a5,a6
f90010d0:	00657463          	bgeu	a0,t1,f90010d8 <__muldf3+0x318>
f90010d4:	01cf0f33          	add	t5,t5,t3
f90010d8:	00010eb7          	lui	t4,0x10
f90010dc:	fffe8893          	addi	a7,t4,-1 # ffff <__stack_size+0xdfff>
f90010e0:	01095293          	srli	t0,s2,0x10
f90010e4:	01197933          	and	s2,s2,a7
f90010e8:	01157333          	and	t1,a0,a7
f90010ec:	01177733          	and	a4,a4,a7
f90010f0:	01031313          	slli	t1,t1,0x10
f90010f4:	029908b3          	mul	a7,s2,s1
f90010f8:	00e30333          	add	t1,t1,a4
f90010fc:	01055513          	srli	a0,a0,0x10
f9001100:	03278fb3          	mul	t6,a5,s2
f9001104:	0108de13          	srli	t3,a7,0x10
f9001108:	029284b3          	mul	s1,t0,s1
f900110c:	01f484b3          	add	s1,s1,t6
f9001110:	009e04b3          	add	s1,t3,s1
f9001114:	02578733          	mul	a4,a5,t0
f9001118:	01f4f463          	bgeu	s1,t6,f9001120 <__muldf3+0x360>
f900111c:	01d70733          	add	a4,a4,t4
f9001120:	000109b7          	lui	s3,0x10
f9001124:	fff98e13          	addi	t3,s3,-1 # ffff <__stack_size+0xdfff>
f9001128:	01c477b3          	and	a5,s0,t3
f900112c:	01c4feb3          	and	t4,s1,t3
f9001130:	01045f93          	srli	t6,s0,0x10
f9001134:	0104d493          	srli	s1,s1,0x10
f9001138:	01c8f8b3          	and	a7,a7,t3
f900113c:	02f583b3          	mul	t2,a1,a5
f9001140:	00e48e33          	add	t3,s1,a4
f9001144:	010e9e93          	slli	t4,t4,0x10
f9001148:	011e8eb3          	add	t4,t4,a7
f900114c:	01d50533          	add	a0,a0,t4
f9001150:	02f80733          	mul	a4,a6,a5
f9001154:	0103d893          	srli	a7,t2,0x10
f9001158:	02bf85b3          	mul	a1,t6,a1
f900115c:	00b70733          	add	a4,a4,a1
f9001160:	00e888b3          	add	a7,a7,a4
f9001164:	03f80833          	mul	a6,a6,t6
f9001168:	00b8f463          	bgeu	a7,a1,f9001170 <__muldf3+0x3b0>
f900116c:	01380833          	add	a6,a6,s3
f9001170:	00010737          	lui	a4,0x10
f9001174:	fff70413          	addi	s0,a4,-1 # ffff <__stack_size+0xdfff>
f9001178:	0088f5b3          	and	a1,a7,s0
f900117c:	0108d893          	srli	a7,a7,0x10
f9001180:	010888b3          	add	a7,a7,a6
f9001184:	0083f3b3          	and	t2,t2,s0
f9001188:	01059593          	slli	a1,a1,0x10
f900118c:	02f90833          	mul	a6,s2,a5
f9001190:	007585b3          	add	a1,a1,t2
f9001194:	032f8933          	mul	s2,t6,s2
f9001198:	01085413          	srli	s0,a6,0x10
f900119c:	02f287b3          	mul	a5,t0,a5
f90011a0:	012787b3          	add	a5,a5,s2
f90011a4:	00f407b3          	add	a5,s0,a5
f90011a8:	03f28fb3          	mul	t6,t0,t6
f90011ac:	0127f463          	bgeu	a5,s2,f90011b4 <__muldf3+0x3f4>
f90011b0:	00ef8fb3          	add	t6,t6,a4
f90011b4:	000102b7          	lui	t0,0x10
f90011b8:	fff28293          	addi	t0,t0,-1 # ffff <__stack_size+0xdfff>
f90011bc:	0057f733          	and	a4,a5,t0
f90011c0:	00587833          	and	a6,a6,t0
f90011c4:	01071713          	slli	a4,a4,0x10
f90011c8:	01e50533          	add	a0,a0,t5
f90011cc:	01070733          	add	a4,a4,a6
f90011d0:	01d53eb3          	sltu	t4,a0,t4
f90011d4:	01c70733          	add	a4,a4,t3
f90011d8:	00b50533          	add	a0,a0,a1
f90011dc:	01d70433          	add	s0,a4,t4
f90011e0:	00b535b3          	sltu	a1,a0,a1
f90011e4:	01140833          	add	a6,s0,a7
f90011e8:	00b80f33          	add	t5,a6,a1
f90011ec:	01c73733          	sltu	a4,a4,t3
f90011f0:	01d43433          	sltu	s0,s0,t4
f90011f4:	00876433          	or	s0,a4,s0
f90011f8:	0107d793          	srli	a5,a5,0x10
f90011fc:	011838b3          	sltu	a7,a6,a7
f9001200:	00bf35b3          	sltu	a1,t5,a1
f9001204:	00f40433          	add	s0,s0,a5
f9001208:	00b8e5b3          	or	a1,a7,a1
f900120c:	00951493          	slli	s1,a0,0x9
f9001210:	00b40433          	add	s0,s0,a1
f9001214:	01f40433          	add	s0,s0,t6
f9001218:	0064e4b3          	or	s1,s1,t1
f900121c:	00941713          	slli	a4,s0,0x9
f9001220:	009034b3          	snez	s1,s1
f9001224:	017f5413          	srli	s0,t5,0x17
f9001228:	01755513          	srli	a0,a0,0x17
f900122c:	009f1793          	slli	a5,t5,0x9
f9001230:	00a4e4b3          	or	s1,s1,a0
f9001234:	00876433          	or	s0,a4,s0
f9001238:	00f4e4b3          	or	s1,s1,a5
f900123c:	00741793          	slli	a5,s0,0x7
f9001240:	0207d063          	bgez	a5,f9001260 <__muldf3+0x4a0>
f9001244:	0014d793          	srli	a5,s1,0x1
f9001248:	0014f493          	andi	s1,s1,1
f900124c:	01f41713          	slli	a4,s0,0x1f
f9001250:	0097e4b3          	or	s1,a5,s1
f9001254:	00e4e4b3          	or	s1,s1,a4
f9001258:	00145413          	srli	s0,s0,0x1
f900125c:	00060b13          	mv	s6,a2
f9001260:	3ffb0713          	addi	a4,s6,1023
f9001264:	0ce05063          	blez	a4,f9001324 <__muldf3+0x564>
f9001268:	0074f793          	andi	a5,s1,7
f900126c:	02078063          	beqz	a5,f900128c <__muldf3+0x4cc>
f9001270:	00f4f793          	andi	a5,s1,15
f9001274:	00400613          	li	a2,4
f9001278:	00c78a63          	beq	a5,a2,f900128c <__muldf3+0x4cc>
f900127c:	00448793          	addi	a5,s1,4
f9001280:	0097b4b3          	sltu	s1,a5,s1
f9001284:	00940433          	add	s0,s0,s1
f9001288:	00078493          	mv	s1,a5
f900128c:	00741793          	slli	a5,s0,0x7
f9001290:	0007da63          	bgez	a5,f90012a4 <__muldf3+0x4e4>
f9001294:	ff0007b7          	lui	a5,0xff000
f9001298:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ff89cf>
f900129c:	00f47433          	and	s0,s0,a5
f90012a0:	400b0713          	addi	a4,s6,1024
f90012a4:	7fe00793          	li	a5,2046
f90012a8:	14e7ca63          	blt	a5,a4,f90013fc <__muldf3+0x63c>
f90012ac:	0034d793          	srli	a5,s1,0x3
f90012b0:	01d41493          	slli	s1,s0,0x1d
f90012b4:	00941413          	slli	s0,s0,0x9
f90012b8:	00f4e4b3          	or	s1,s1,a5
f90012bc:	00c45413          	srli	s0,s0,0xc
f90012c0:	7ff77793          	andi	a5,a4,2047
f90012c4:	c0dff06f          	j	f9000ed0 <__muldf3+0x110>
f90012c8:	00060513          	mv	a0,a2
f90012cc:	00c12423          	sw	a2,8(sp)
f90012d0:	7f5000ef          	jal	ra,f90022c4 <__clzsi2>
f90012d4:	01550693          	addi	a3,a0,21
f90012d8:	01c00713          	li	a4,28
f90012dc:	02050793          	addi	a5,a0,32
f90012e0:	00812603          	lw	a2,8(sp)
f90012e4:	d0d754e3          	bge	a4,a3,f9000fec <__muldf3+0x22c>
f90012e8:	ff850513          	addi	a0,a0,-8
f90012ec:	00000593          	li	a1,0
f90012f0:	00a61933          	sll	s2,a2,a0
f90012f4:	d15ff06f          	j	f9001008 <__muldf3+0x248>
f90012f8:	7cd000ef          	jal	ra,f90022c4 <__clzsi2>
f90012fc:	01550593          	addi	a1,a0,21
f9001300:	01c00713          	li	a4,28
f9001304:	02050793          	addi	a5,a0,32
f9001308:	00812603          	lw	a2,8(sp)
f900130c:	00c12683          	lw	a3,12(sp)
f9001310:	c6b75ae3          	bge	a4,a1,f9000f84 <__muldf3+0x1c4>
f9001314:	ff850513          	addi	a0,a0,-8
f9001318:	00000493          	li	s1,0
f900131c:	00a91433          	sll	s0,s2,a0
f9001320:	c81ff06f          	j	f9000fa0 <__muldf3+0x1e0>
f9001324:	00100613          	li	a2,1
f9001328:	40e60633          	sub	a2,a2,a4
f900132c:	06071063          	bnez	a4,f900138c <__muldf3+0x5cc>
f9001330:	41eb0793          	addi	a5,s6,1054
f9001334:	00f49733          	sll	a4,s1,a5
f9001338:	00f417b3          	sll	a5,s0,a5
f900133c:	00c4d4b3          	srl	s1,s1,a2
f9001340:	0097e4b3          	or	s1,a5,s1
f9001344:	00e03733          	snez	a4,a4
f9001348:	00e4e4b3          	or	s1,s1,a4
f900134c:	0074f793          	andi	a5,s1,7
f9001350:	00c45633          	srl	a2,s0,a2
f9001354:	02078063          	beqz	a5,f9001374 <__muldf3+0x5b4>
f9001358:	00f4f793          	andi	a5,s1,15
f900135c:	00400713          	li	a4,4
f9001360:	00e78a63          	beq	a5,a4,f9001374 <__muldf3+0x5b4>
f9001364:	00448793          	addi	a5,s1,4
f9001368:	0097b4b3          	sltu	s1,a5,s1
f900136c:	00960633          	add	a2,a2,s1
f9001370:	00078493          	mv	s1,a5
f9001374:	00861793          	slli	a5,a2,0x8
f9001378:	0607d463          	bgez	a5,f90013e0 <__muldf3+0x620>
f900137c:	00100793          	li	a5,1
f9001380:	00000413          	li	s0,0
f9001384:	00000493          	li	s1,0
f9001388:	b49ff06f          	j	f9000ed0 <__muldf3+0x110>
f900138c:	03800793          	li	a5,56
f9001390:	bac7cce3          	blt	a5,a2,f9000f48 <__muldf3+0x188>
f9001394:	01f00793          	li	a5,31
f9001398:	f8c7dce3          	bge	a5,a2,f9001330 <__muldf3+0x570>
f900139c:	fe100793          	li	a5,-31
f90013a0:	40e78733          	sub	a4,a5,a4
f90013a4:	02000793          	li	a5,32
f90013a8:	00e45733          	srl	a4,s0,a4
f90013ac:	00f60863          	beq	a2,a5,f90013bc <__muldf3+0x5fc>
f90013b0:	43eb0793          	addi	a5,s6,1086
f90013b4:	00f417b3          	sll	a5,s0,a5
f90013b8:	00f4e4b3          	or	s1,s1,a5
f90013bc:	009034b3          	snez	s1,s1
f90013c0:	00e4e4b3          	or	s1,s1,a4
f90013c4:	0074f613          	andi	a2,s1,7
f90013c8:	00000413          	li	s0,0
f90013cc:	02060063          	beqz	a2,f90013ec <__muldf3+0x62c>
f90013d0:	00f4f793          	andi	a5,s1,15
f90013d4:	00400713          	li	a4,4
f90013d8:	00000613          	li	a2,0
f90013dc:	f8e794e3          	bne	a5,a4,f9001364 <__muldf3+0x5a4>
f90013e0:	00961413          	slli	s0,a2,0x9
f90013e4:	00c45413          	srli	s0,s0,0xc
f90013e8:	01d61613          	slli	a2,a2,0x1d
f90013ec:	0034d493          	srli	s1,s1,0x3
f90013f0:	00c4e4b3          	or	s1,s1,a2
f90013f4:	00000793          	li	a5,0
f90013f8:	ad9ff06f          	j	f9000ed0 <__muldf3+0x110>
f90013fc:	7ff00793          	li	a5,2047
f9001400:	00000413          	li	s0,0
f9001404:	00000493          	li	s1,0
f9001408:	ac9ff06f          	j	f9000ed0 <__muldf3+0x110>
f900140c:	00060b13          	mv	s6,a2
f9001410:	e51ff06f          	j	f9001260 <__muldf3+0x4a0>

f9001414 <__subdf3>:
f9001414:	00100737          	lui	a4,0x100
f9001418:	fff70713          	addi	a4,a4,-1 # fffff <__stack_size+0xfdfff>
f900141c:	fe010113          	addi	sp,sp,-32
f9001420:	00b77333          	and	t1,a4,a1
f9001424:	0146d893          	srli	a7,a3,0x14
f9001428:	00d77733          	and	a4,a4,a3
f900142c:	01d65e93          	srli	t4,a2,0x1d
f9001430:	00812c23          	sw	s0,24(sp)
f9001434:	00912a23          	sw	s1,20(sp)
f9001438:	00331313          	slli	t1,t1,0x3
f900143c:	0145d493          	srli	s1,a1,0x14
f9001440:	01d55793          	srli	a5,a0,0x1d
f9001444:	00371713          	slli	a4,a4,0x3
f9001448:	00112e23          	sw	ra,28(sp)
f900144c:	01212823          	sw	s2,16(sp)
f9001450:	01312623          	sw	s3,12(sp)
f9001454:	7ff8f893          	andi	a7,a7,2047
f9001458:	7ff00e13          	li	t3,2047
f900145c:	00eee733          	or	a4,t4,a4
f9001460:	7ff4f493          	andi	s1,s1,2047
f9001464:	01f5d413          	srli	s0,a1,0x1f
f9001468:	0067e333          	or	t1,a5,t1
f900146c:	00351f13          	slli	t5,a0,0x3
f9001470:	01f6d693          	srli	a3,a3,0x1f
f9001474:	00361e93          	slli	t4,a2,0x3
f9001478:	1dc88663          	beq	a7,t3,f9001644 <__subdf3+0x230>
f900147c:	0016c693          	xori	a3,a3,1
f9001480:	411485b3          	sub	a1,s1,a7
f9001484:	16d40863          	beq	s0,a3,f90015f4 <__subdf3+0x1e0>
f9001488:	1cb05863          	blez	a1,f9001658 <__subdf3+0x244>
f900148c:	20088463          	beqz	a7,f9001694 <__subdf3+0x280>
f9001490:	008007b7          	lui	a5,0x800
f9001494:	00f76733          	or	a4,a4,a5
f9001498:	67c48a63          	beq	s1,t3,f9001b0c <__subdf3+0x6f8>
f900149c:	03800793          	li	a5,56
f90014a0:	3eb7c263          	blt	a5,a1,f9001884 <__subdf3+0x470>
f90014a4:	01f00793          	li	a5,31
f90014a8:	54b7ca63          	blt	a5,a1,f90019fc <__subdf3+0x5e8>
f90014ac:	02000793          	li	a5,32
f90014b0:	40b787b3          	sub	a5,a5,a1
f90014b4:	00bed9b3          	srl	s3,t4,a1
f90014b8:	00f71833          	sll	a6,a4,a5
f90014bc:	00fe9eb3          	sll	t4,t4,a5
f90014c0:	01386833          	or	a6,a6,s3
f90014c4:	00b75733          	srl	a4,a4,a1
f90014c8:	01d039b3          	snez	s3,t4
f90014cc:	01386833          	or	a6,a6,s3
f90014d0:	40e30333          	sub	t1,t1,a4
f90014d4:	410f09b3          	sub	s3,t5,a6
f90014d8:	013f37b3          	sltu	a5,t5,s3
f90014dc:	40f30633          	sub	a2,t1,a5
f90014e0:	00861793          	slli	a5,a2,0x8
f90014e4:	2a07d863          	bgez	a5,f9001794 <__subdf3+0x380>
f90014e8:	00800937          	lui	s2,0x800
f90014ec:	fff90913          	addi	s2,s2,-1 # 7fffff <__stack_size+0x7fdfff>
f90014f0:	01267933          	and	s2,a2,s2
f90014f4:	36090663          	beqz	s2,f9001860 <__subdf3+0x44c>
f90014f8:	00090513          	mv	a0,s2
f90014fc:	5c9000ef          	jal	ra,f90022c4 <__clzsi2>
f9001500:	ff850713          	addi	a4,a0,-8
f9001504:	02000793          	li	a5,32
f9001508:	40e787b3          	sub	a5,a5,a4
f900150c:	00f9d7b3          	srl	a5,s3,a5
f9001510:	00e91633          	sll	a2,s2,a4
f9001514:	00c7e7b3          	or	a5,a5,a2
f9001518:	00e999b3          	sll	s3,s3,a4
f900151c:	32974463          	blt	a4,s1,f9001844 <__subdf3+0x430>
f9001520:	40970733          	sub	a4,a4,s1
f9001524:	00170613          	addi	a2,a4,1
f9001528:	01f00693          	li	a3,31
f900152c:	44c6ca63          	blt	a3,a2,f9001980 <__subdf3+0x56c>
f9001530:	02000713          	li	a4,32
f9001534:	40c70733          	sub	a4,a4,a2
f9001538:	00c9d6b3          	srl	a3,s3,a2
f900153c:	00e99833          	sll	a6,s3,a4
f9001540:	00e79733          	sll	a4,a5,a4
f9001544:	00d76733          	or	a4,a4,a3
f9001548:	01003833          	snez	a6,a6
f900154c:	010769b3          	or	s3,a4,a6
f9001550:	00c7d633          	srl	a2,a5,a2
f9001554:	00000493          	li	s1,0
f9001558:	0079f793          	andi	a5,s3,7
f900155c:	02078063          	beqz	a5,f900157c <__subdf3+0x168>
f9001560:	00f9f693          	andi	a3,s3,15
f9001564:	00400793          	li	a5,4
f9001568:	00f68a63          	beq	a3,a5,f900157c <__subdf3+0x168>
f900156c:	00498693          	addi	a3,s3,4
f9001570:	0136b833          	sltu	a6,a3,s3
f9001574:	01060633          	add	a2,a2,a6
f9001578:	00068993          	mv	s3,a3
f900157c:	00861793          	slli	a5,a2,0x8
f9001580:	2007de63          	bgez	a5,f900179c <__subdf3+0x388>
f9001584:	00148713          	addi	a4,s1,1
f9001588:	7ff00793          	li	a5,2047
f900158c:	00147413          	andi	s0,s0,1
f9001590:	26f70463          	beq	a4,a5,f90017f8 <__subdf3+0x3e4>
f9001594:	ff8007b7          	lui	a5,0xff800
f9001598:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f900159c:	00f677b3          	and	a5,a2,a5
f90015a0:	01d79813          	slli	a6,a5,0x1d
f90015a4:	0039d993          	srli	s3,s3,0x3
f90015a8:	00979793          	slli	a5,a5,0x9
f90015ac:	01386833          	or	a6,a6,s3
f90015b0:	00c7d793          	srli	a5,a5,0xc
f90015b4:	7ff77713          	andi	a4,a4,2047
f90015b8:	00c79693          	slli	a3,a5,0xc
f90015bc:	01471713          	slli	a4,a4,0x14
f90015c0:	00c6d693          	srli	a3,a3,0xc
f90015c4:	01f41413          	slli	s0,s0,0x1f
f90015c8:	00e6e6b3          	or	a3,a3,a4
f90015cc:	0086e6b3          	or	a3,a3,s0
f90015d0:	01c12083          	lw	ra,28(sp)
f90015d4:	01812403          	lw	s0,24(sp)
f90015d8:	01412483          	lw	s1,20(sp)
f90015dc:	01012903          	lw	s2,16(sp)
f90015e0:	00c12983          	lw	s3,12(sp)
f90015e4:	00080513          	mv	a0,a6
f90015e8:	00068593          	mv	a1,a3
f90015ec:	02010113          	addi	sp,sp,32
f90015f0:	00008067          	ret
f90015f4:	0ab05e63          	blez	a1,f90016b0 <__subdf3+0x29c>
f90015f8:	14088a63          	beqz	a7,f900174c <__subdf3+0x338>
f90015fc:	008007b7          	lui	a5,0x800
f9001600:	00f76733          	or	a4,a4,a5
f9001604:	33c48c63          	beq	s1,t3,f900193c <__subdf3+0x528>
f9001608:	03800793          	li	a5,56
f900160c:	1cb7c063          	blt	a5,a1,f90017cc <__subdf3+0x3b8>
f9001610:	01f00793          	li	a5,31
f9001614:	44b7da63          	bge	a5,a1,f9001a68 <__subdf3+0x654>
f9001618:	fe058813          	addi	a6,a1,-32
f900161c:	02000793          	li	a5,32
f9001620:	010759b3          	srl	s3,a4,a6
f9001624:	00f58a63          	beq	a1,a5,f9001638 <__subdf3+0x224>
f9001628:	04000793          	li	a5,64
f900162c:	40b785b3          	sub	a1,a5,a1
f9001630:	00b71733          	sll	a4,a4,a1
f9001634:	00eeeeb3          	or	t4,t4,a4
f9001638:	01d03833          	snez	a6,t4
f900163c:	01386833          	or	a6,a6,s3
f9001640:	1940006f          	j	f90017d4 <__subdf3+0x3c0>
f9001644:	01d767b3          	or	a5,a4,t4
f9001648:	80148593          	addi	a1,s1,-2047
f900164c:	00079463          	bnez	a5,f9001654 <__subdf3+0x240>
f9001650:	0016c693          	xori	a3,a3,1
f9001654:	04d40e63          	beq	s0,a3,f90016b0 <__subdf3+0x29c>
f9001658:	08059a63          	bnez	a1,f90016ec <__subdf3+0x2d8>
f900165c:	00148793          	addi	a5,s1,1
f9001660:	7fe7f793          	andi	a5,a5,2046
f9001664:	24079263          	bnez	a5,f90018a8 <__subdf3+0x494>
f9001668:	01e367b3          	or	a5,t1,t5
f900166c:	01d76833          	or	a6,a4,t4
f9001670:	18049c63          	bnez	s1,f9001808 <__subdf3+0x3f4>
f9001674:	46078063          	beqz	a5,f9001ad4 <__subdf3+0x6c0>
f9001678:	4c081e63          	bnez	a6,f9001b54 <__subdf3+0x740>
f900167c:	00351813          	slli	a6,a0,0x3
f9001680:	01d31693          	slli	a3,t1,0x1d
f9001684:	00385813          	srli	a6,a6,0x3
f9001688:	0106e833          	or	a6,a3,a6
f900168c:	00335793          	srli	a5,t1,0x3
f9001690:	1280006f          	j	f90017b8 <__subdf3+0x3a4>
f9001694:	01d767b3          	or	a5,a4,t4
f9001698:	1e078c63          	beqz	a5,f9001890 <__subdf3+0x47c>
f900169c:	fff58793          	addi	a5,a1,-1
f90016a0:	44078a63          	beqz	a5,f9001af4 <__subdf3+0x6e0>
f90016a4:	29c58c63          	beq	a1,t3,f900193c <__subdf3+0x528>
f90016a8:	00078593          	mv	a1,a5
f90016ac:	df1ff06f          	j	f900149c <__subdf3+0x88>
f90016b0:	22059263          	bnez	a1,f90018d4 <__subdf3+0x4c0>
f90016b4:	00148693          	addi	a3,s1,1
f90016b8:	7fe6f793          	andi	a5,a3,2046
f90016bc:	0a079663          	bnez	a5,f9001768 <__subdf3+0x354>
f90016c0:	01e367b3          	or	a5,t1,t5
f90016c4:	3e049663          	bnez	s1,f9001ab0 <__subdf3+0x69c>
f90016c8:	50078863          	beqz	a5,f9001bd8 <__subdf3+0x7c4>
f90016cc:	01d767b3          	or	a5,a4,t4
f90016d0:	52079063          	bnez	a5,f9001bf0 <__subdf3+0x7dc>
f90016d4:	00351513          	slli	a0,a0,0x3
f90016d8:	01d31813          	slli	a6,t1,0x1d
f90016dc:	00355513          	srli	a0,a0,0x3
f90016e0:	00a86833          	or	a6,a6,a0
f90016e4:	00335793          	srli	a5,t1,0x3
f90016e8:	0d00006f          	j	f90017b8 <__subdf3+0x3a4>
f90016ec:	409885b3          	sub	a1,a7,s1
f90016f0:	26049263          	bnez	s1,f9001954 <__subdf3+0x540>
f90016f4:	01e367b3          	or	a5,t1,t5
f90016f8:	38078e63          	beqz	a5,f9001a94 <__subdf3+0x680>
f90016fc:	fff58793          	addi	a5,a1,-1
f9001700:	4a078e63          	beqz	a5,f9001bbc <__subdf3+0x7a8>
f9001704:	7ff00513          	li	a0,2047
f9001708:	24a58e63          	beq	a1,a0,f9001964 <__subdf3+0x550>
f900170c:	00078593          	mv	a1,a5
f9001710:	03800793          	li	a5,56
f9001714:	30b7ca63          	blt	a5,a1,f9001a28 <__subdf3+0x614>
f9001718:	01f00793          	li	a5,31
f900171c:	46b7ca63          	blt	a5,a1,f9001b90 <__subdf3+0x77c>
f9001720:	02000793          	li	a5,32
f9001724:	40b787b3          	sub	a5,a5,a1
f9001728:	00f31833          	sll	a6,t1,a5
f900172c:	00bf5633          	srl	a2,t5,a1
f9001730:	00ff17b3          	sll	a5,t5,a5
f9001734:	00c86833          	or	a6,a6,a2
f9001738:	00f039b3          	snez	s3,a5
f900173c:	00b35333          	srl	t1,t1,a1
f9001740:	01386833          	or	a6,a6,s3
f9001744:	40670733          	sub	a4,a4,t1
f9001748:	2e80006f          	j	f9001a30 <__subdf3+0x61c>
f900174c:	01d767b3          	or	a5,a4,t4
f9001750:	14078063          	beqz	a5,f9001890 <__subdf3+0x47c>
f9001754:	fff58793          	addi	a5,a1,-1
f9001758:	24078e63          	beqz	a5,f90019b4 <__subdf3+0x5a0>
f900175c:	37c58063          	beq	a1,t3,f9001abc <__subdf3+0x6a8>
f9001760:	00078593          	mv	a1,a5
f9001764:	ea5ff06f          	j	f9001608 <__subdf3+0x1f4>
f9001768:	7ff00793          	li	a5,2047
f900176c:	08f68463          	beq	a3,a5,f90017f4 <__subdf3+0x3e0>
f9001770:	01df0eb3          	add	t4,t5,t4
f9001774:	01eeb633          	sltu	a2,t4,t5
f9001778:	00e307b3          	add	a5,t1,a4
f900177c:	00c787b3          	add	a5,a5,a2
f9001780:	01f79813          	slli	a6,a5,0x1f
f9001784:	001ede93          	srli	t4,t4,0x1
f9001788:	01d869b3          	or	s3,a6,t4
f900178c:	0017d613          	srli	a2,a5,0x1
f9001790:	00068493          	mv	s1,a3
f9001794:	0079f793          	andi	a5,s3,7
f9001798:	dc0794e3          	bnez	a5,f9001560 <__subdf3+0x14c>
f900179c:	01d61793          	slli	a5,a2,0x1d
f90017a0:	0039d813          	srli	a6,s3,0x3
f90017a4:	00f86833          	or	a6,a6,a5
f90017a8:	00048593          	mv	a1,s1
f90017ac:	00365793          	srli	a5,a2,0x3
f90017b0:	7ff00713          	li	a4,2047
f90017b4:	06e58a63          	beq	a1,a4,f9001828 <__subdf3+0x414>
f90017b8:	00c79793          	slli	a5,a5,0xc
f90017bc:	00c7d793          	srli	a5,a5,0xc
f90017c0:	7ff5f713          	andi	a4,a1,2047
f90017c4:	00147413          	andi	s0,s0,1
f90017c8:	df1ff06f          	j	f90015b8 <__subdf3+0x1a4>
f90017cc:	01d76733          	or	a4,a4,t4
f90017d0:	00e03833          	snez	a6,a4
f90017d4:	01e809b3          	add	s3,a6,t5
f90017d8:	01e9b7b3          	sltu	a5,s3,t5
f90017dc:	00678633          	add	a2,a5,t1
f90017e0:	00861793          	slli	a5,a2,0x8
f90017e4:	fa07d8e3          	bgez	a5,f9001794 <__subdf3+0x380>
f90017e8:	00148493          	addi	s1,s1,1
f90017ec:	7ff00793          	li	a5,2047
f90017f0:	1ef49263          	bne	s1,a5,f90019d4 <__subdf3+0x5c0>
f90017f4:	00147413          	andi	s0,s0,1
f90017f8:	7ff00713          	li	a4,2047
f90017fc:	00000793          	li	a5,0
f9001800:	00000813          	li	a6,0
f9001804:	db5ff06f          	j	f90015b8 <__subdf3+0x1a4>
f9001808:	12079863          	bnez	a5,f9001938 <__subdf3+0x524>
f900180c:	46080063          	beqz	a6,f9001c6c <__subdf3+0x858>
f9001810:	00361813          	slli	a6,a2,0x3
f9001814:	01d71793          	slli	a5,a4,0x1d
f9001818:	00385813          	srli	a6,a6,0x3
f900181c:	00f86833          	or	a6,a6,a5
f9001820:	00068413          	mv	s0,a3
f9001824:	00375793          	srli	a5,a4,0x3
f9001828:	00f867b3          	or	a5,a6,a5
f900182c:	fc0784e3          	beqz	a5,f90017f4 <__subdf3+0x3e0>
f9001830:	00000413          	li	s0,0
f9001834:	7ff00713          	li	a4,2047
f9001838:	000807b7          	lui	a5,0x80
f900183c:	00000813          	li	a6,0
f9001840:	d79ff06f          	j	f90015b8 <__subdf3+0x1a4>
f9001844:	ff800637          	lui	a2,0xff800
f9001848:	fff60613          	addi	a2,a2,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f900184c:	00c7f633          	and	a2,a5,a2
f9001850:	0079f793          	andi	a5,s3,7
f9001854:	40e484b3          	sub	s1,s1,a4
f9001858:	d00794e3          	bnez	a5,f9001560 <__subdf3+0x14c>
f900185c:	f41ff06f          	j	f900179c <__subdf3+0x388>
f9001860:	00098513          	mv	a0,s3
f9001864:	261000ef          	jal	ra,f90022c4 <__clzsi2>
f9001868:	01850713          	addi	a4,a0,24
f900186c:	01f00793          	li	a5,31
f9001870:	c8e7dae3          	bge	a5,a4,f9001504 <__subdf3+0xf0>
f9001874:	ff850613          	addi	a2,a0,-8
f9001878:	00c997b3          	sll	a5,s3,a2
f900187c:	00000993          	li	s3,0
f9001880:	c9dff06f          	j	f900151c <__subdf3+0x108>
f9001884:	01d76833          	or	a6,a4,t4
f9001888:	01003833          	snez	a6,a6
f900188c:	c49ff06f          	j	f90014d4 <__subdf3+0xc0>
f9001890:	00351813          	slli	a6,a0,0x3
f9001894:	01d31793          	slli	a5,t1,0x1d
f9001898:	00385813          	srli	a6,a6,0x3
f900189c:	00f86833          	or	a6,a6,a5
f90018a0:	00335793          	srli	a5,t1,0x3
f90018a4:	f0dff06f          	j	f90017b0 <__subdf3+0x39c>
f90018a8:	41df09b3          	sub	s3,t5,t4
f90018ac:	40e30933          	sub	s2,t1,a4
f90018b0:	013f3633          	sltu	a2,t5,s3
f90018b4:	40c90933          	sub	s2,s2,a2
f90018b8:	00891793          	slli	a5,s2,0x8
f90018bc:	2607c463          	bltz	a5,f9001b24 <__subdf3+0x710>
f90018c0:	0129e833          	or	a6,s3,s2
f90018c4:	c20818e3          	bnez	a6,f90014f4 <__subdf3+0xe0>
f90018c8:	00000793          	li	a5,0
f90018cc:	00000413          	li	s0,0
f90018d0:	ee9ff06f          	j	f90017b8 <__subdf3+0x3a4>
f90018d4:	409885b3          	sub	a1,a7,s1
f90018d8:	16048863          	beqz	s1,f9001a48 <__subdf3+0x634>
f90018dc:	008006b7          	lui	a3,0x800
f90018e0:	7ff00793          	li	a5,2047
f90018e4:	00d36333          	or	t1,t1,a3
f90018e8:	24f88a63          	beq	a7,a5,f9001b3c <__subdf3+0x728>
f90018ec:	03800793          	li	a5,56
f90018f0:	28b7ca63          	blt	a5,a1,f9001b84 <__subdf3+0x770>
f90018f4:	01f00793          	li	a5,31
f90018f8:	34b7c463          	blt	a5,a1,f9001c40 <__subdf3+0x82c>
f90018fc:	02000793          	li	a5,32
f9001900:	40b787b3          	sub	a5,a5,a1
f9001904:	00f31833          	sll	a6,t1,a5
f9001908:	00bf56b3          	srl	a3,t5,a1
f900190c:	00ff17b3          	sll	a5,t5,a5
f9001910:	00d86833          	or	a6,a6,a3
f9001914:	00f039b3          	snez	s3,a5
f9001918:	00b35333          	srl	t1,t1,a1
f900191c:	01386833          	or	a6,a6,s3
f9001920:	00670733          	add	a4,a4,t1
f9001924:	01d809b3          	add	s3,a6,t4
f9001928:	01d9b7b3          	sltu	a5,s3,t4
f900192c:	00e78633          	add	a2,a5,a4
f9001930:	00088493          	mv	s1,a7
f9001934:	eadff06f          	j	f90017e0 <__subdf3+0x3cc>
f9001938:	ee081ce3          	bnez	a6,f9001830 <__subdf3+0x41c>
f900193c:	00351813          	slli	a6,a0,0x3
f9001940:	01d31793          	slli	a5,t1,0x1d
f9001944:	00385813          	srli	a6,a6,0x3
f9001948:	00f86833          	or	a6,a6,a5
f900194c:	00335793          	srli	a5,t1,0x3
f9001950:	ed9ff06f          	j	f9001828 <__subdf3+0x414>
f9001954:	00800537          	lui	a0,0x800
f9001958:	7ff00793          	li	a5,2047
f900195c:	00a36333          	or	t1,t1,a0
f9001960:	daf898e3          	bne	a7,a5,f9001710 <__subdf3+0x2fc>
f9001964:	00361613          	slli	a2,a2,0x3
f9001968:	01d71813          	slli	a6,a4,0x1d
f900196c:	00365613          	srli	a2,a2,0x3
f9001970:	00c86833          	or	a6,a6,a2
f9001974:	00375793          	srli	a5,a4,0x3
f9001978:	00068413          	mv	s0,a3
f900197c:	eadff06f          	j	f9001828 <__subdf3+0x414>
f9001980:	fe170713          	addi	a4,a4,-31
f9001984:	02000693          	li	a3,32
f9001988:	00e7d733          	srl	a4,a5,a4
f900198c:	00d60a63          	beq	a2,a3,f90019a0 <__subdf3+0x58c>
f9001990:	04000693          	li	a3,64
f9001994:	40c68633          	sub	a2,a3,a2
f9001998:	00c79633          	sll	a2,a5,a2
f900199c:	00c9e9b3          	or	s3,s3,a2
f90019a0:	01303833          	snez	a6,s3
f90019a4:	00e869b3          	or	s3,a6,a4
f90019a8:	00000613          	li	a2,0
f90019ac:	00000493          	li	s1,0
f90019b0:	de5ff06f          	j	f9001794 <__subdf3+0x380>
f90019b4:	01df09b3          	add	s3,t5,t4
f90019b8:	00e307b3          	add	a5,t1,a4
f90019bc:	01e9bf33          	sltu	t5,s3,t5
f90019c0:	01e78633          	add	a2,a5,t5
f90019c4:	00861793          	slli	a5,a2,0x8
f90019c8:	00100493          	li	s1,1
f90019cc:	dc07d4e3          	bgez	a5,f9001794 <__subdf3+0x380>
f90019d0:	00200493          	li	s1,2
f90019d4:	ff8007b7          	lui	a5,0xff800
f90019d8:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f90019dc:	00f677b3          	and	a5,a2,a5
f90019e0:	0019d713          	srli	a4,s3,0x1
f90019e4:	0019f813          	andi	a6,s3,1
f90019e8:	01076833          	or	a6,a4,a6
f90019ec:	01f79993          	slli	s3,a5,0x1f
f90019f0:	0109e9b3          	or	s3,s3,a6
f90019f4:	0017d613          	srli	a2,a5,0x1
f90019f8:	b61ff06f          	j	f9001558 <__subdf3+0x144>
f90019fc:	fe058813          	addi	a6,a1,-32
f9001a00:	02000793          	li	a5,32
f9001a04:	010759b3          	srl	s3,a4,a6
f9001a08:	00f58a63          	beq	a1,a5,f9001a1c <__subdf3+0x608>
f9001a0c:	04000793          	li	a5,64
f9001a10:	40b785b3          	sub	a1,a5,a1
f9001a14:	00b71733          	sll	a4,a4,a1
f9001a18:	00eeeeb3          	or	t4,t4,a4
f9001a1c:	01d03833          	snez	a6,t4
f9001a20:	01386833          	or	a6,a6,s3
f9001a24:	ab1ff06f          	j	f90014d4 <__subdf3+0xc0>
f9001a28:	01e36333          	or	t1,t1,t5
f9001a2c:	00603833          	snez	a6,t1
f9001a30:	410e89b3          	sub	s3,t4,a6
f9001a34:	013eb7b3          	sltu	a5,t4,s3
f9001a38:	40f70633          	sub	a2,a4,a5
f9001a3c:	00088493          	mv	s1,a7
f9001a40:	00068413          	mv	s0,a3
f9001a44:	a9dff06f          	j	f90014e0 <__subdf3+0xcc>
f9001a48:	01e367b3          	or	a5,t1,t5
f9001a4c:	1c078863          	beqz	a5,f9001c1c <__subdf3+0x808>
f9001a50:	fff58793          	addi	a5,a1,-1
f9001a54:	22078463          	beqz	a5,f9001c7c <__subdf3+0x868>
f9001a58:	7ff00693          	li	a3,2047
f9001a5c:	0ed58063          	beq	a1,a3,f9001b3c <__subdf3+0x728>
f9001a60:	00078593          	mv	a1,a5
f9001a64:	e89ff06f          	j	f90018ec <__subdf3+0x4d8>
f9001a68:	02000793          	li	a5,32
f9001a6c:	40b787b3          	sub	a5,a5,a1
f9001a70:	00bed9b3          	srl	s3,t4,a1
f9001a74:	00f71833          	sll	a6,a4,a5
f9001a78:	00fe9eb3          	sll	t4,t4,a5
f9001a7c:	01386833          	or	a6,a6,s3
f9001a80:	00b75733          	srl	a4,a4,a1
f9001a84:	01d039b3          	snez	s3,t4
f9001a88:	01386833          	or	a6,a6,s3
f9001a8c:	00e30333          	add	t1,t1,a4
f9001a90:	d45ff06f          	j	f90017d4 <__subdf3+0x3c0>
f9001a94:	00361813          	slli	a6,a2,0x3
f9001a98:	01d71793          	slli	a5,a4,0x1d
f9001a9c:	00385813          	srli	a6,a6,0x3
f9001aa0:	0107e833          	or	a6,a5,a6
f9001aa4:	00068413          	mv	s0,a3
f9001aa8:	00375793          	srli	a5,a4,0x3
f9001aac:	d05ff06f          	j	f90017b0 <__subdf3+0x39c>
f9001ab0:	08078663          	beqz	a5,f9001b3c <__subdf3+0x728>
f9001ab4:	01d76733          	or	a4,a4,t4
f9001ab8:	d6071ce3          	bnez	a4,f9001830 <__subdf3+0x41c>
f9001abc:	00351513          	slli	a0,a0,0x3
f9001ac0:	01d31813          	slli	a6,t1,0x1d
f9001ac4:	00355513          	srli	a0,a0,0x3
f9001ac8:	00a86833          	or	a6,a6,a0
f9001acc:	00335793          	srli	a5,t1,0x3
f9001ad0:	d59ff06f          	j	f9001828 <__subdf3+0x414>
f9001ad4:	de080ae3          	beqz	a6,f90018c8 <__subdf3+0x4b4>
f9001ad8:	00361813          	slli	a6,a2,0x3
f9001adc:	01d71793          	slli	a5,a4,0x1d
f9001ae0:	00385813          	srli	a6,a6,0x3
f9001ae4:	00f86833          	or	a6,a6,a5
f9001ae8:	00068413          	mv	s0,a3
f9001aec:	00375793          	srli	a5,a4,0x3
f9001af0:	cc9ff06f          	j	f90017b8 <__subdf3+0x3a4>
f9001af4:	41df09b3          	sub	s3,t5,t4
f9001af8:	40e307b3          	sub	a5,t1,a4
f9001afc:	013f3f33          	sltu	t5,t5,s3
f9001b00:	41e78633          	sub	a2,a5,t5
f9001b04:	00100493          	li	s1,1
f9001b08:	9d9ff06f          	j	f90014e0 <__subdf3+0xcc>
f9001b0c:	00351813          	slli	a6,a0,0x3
f9001b10:	01d31693          	slli	a3,t1,0x1d
f9001b14:	00385813          	srli	a6,a6,0x3
f9001b18:	0106e833          	or	a6,a3,a6
f9001b1c:	00335793          	srli	a5,t1,0x3
f9001b20:	d09ff06f          	j	f9001828 <__subdf3+0x414>
f9001b24:	41ee89b3          	sub	s3,t4,t5
f9001b28:	40670633          	sub	a2,a4,t1
f9001b2c:	013eb933          	sltu	s2,t4,s3
f9001b30:	41260933          	sub	s2,a2,s2
f9001b34:	00068413          	mv	s0,a3
f9001b38:	9bdff06f          	j	f90014f4 <__subdf3+0xe0>
f9001b3c:	00361613          	slli	a2,a2,0x3
f9001b40:	01d71813          	slli	a6,a4,0x1d
f9001b44:	00365613          	srli	a2,a2,0x3
f9001b48:	00c86833          	or	a6,a6,a2
f9001b4c:	00375793          	srli	a5,a4,0x3
f9001b50:	cd9ff06f          	j	f9001828 <__subdf3+0x414>
f9001b54:	41df09b3          	sub	s3,t5,t4
f9001b58:	40e307b3          	sub	a5,t1,a4
f9001b5c:	013f3633          	sltu	a2,t5,s3
f9001b60:	40c78633          	sub	a2,a5,a2
f9001b64:	00861793          	slli	a5,a2,0x8
f9001b68:	0c07d663          	bgez	a5,f9001c34 <__subdf3+0x820>
f9001b6c:	41ee89b3          	sub	s3,t4,t5
f9001b70:	406707b3          	sub	a5,a4,t1
f9001b74:	013ebeb3          	sltu	t4,t4,s3
f9001b78:	41d78633          	sub	a2,a5,t4
f9001b7c:	00068413          	mv	s0,a3
f9001b80:	9d9ff06f          	j	f9001558 <__subdf3+0x144>
f9001b84:	01e36333          	or	t1,t1,t5
f9001b88:	00603833          	snez	a6,t1
f9001b8c:	d99ff06f          	j	f9001924 <__subdf3+0x510>
f9001b90:	fe058813          	addi	a6,a1,-32
f9001b94:	02000793          	li	a5,32
f9001b98:	010359b3          	srl	s3,t1,a6
f9001b9c:	00f58a63          	beq	a1,a5,f9001bb0 <__subdf3+0x79c>
f9001ba0:	04000793          	li	a5,64
f9001ba4:	40b785b3          	sub	a1,a5,a1
f9001ba8:	00b31333          	sll	t1,t1,a1
f9001bac:	006f6f33          	or	t5,t5,t1
f9001bb0:	01e03833          	snez	a6,t5
f9001bb4:	01386833          	or	a6,a6,s3
f9001bb8:	e79ff06f          	j	f9001a30 <__subdf3+0x61c>
f9001bbc:	41ee89b3          	sub	s3,t4,t5
f9001bc0:	406707b3          	sub	a5,a4,t1
f9001bc4:	013ebeb3          	sltu	t4,t4,s3
f9001bc8:	41d78633          	sub	a2,a5,t4
f9001bcc:	00068413          	mv	s0,a3
f9001bd0:	00100493          	li	s1,1
f9001bd4:	90dff06f          	j	f90014e0 <__subdf3+0xcc>
f9001bd8:	00361813          	slli	a6,a2,0x3
f9001bdc:	01d71793          	slli	a5,a4,0x1d
f9001be0:	00385813          	srli	a6,a6,0x3
f9001be4:	00f86833          	or	a6,a6,a5
f9001be8:	00375793          	srli	a5,a4,0x3
f9001bec:	bcdff06f          	j	f90017b8 <__subdf3+0x3a4>
f9001bf0:	01df09b3          	add	s3,t5,t4
f9001bf4:	00e307b3          	add	a5,t1,a4
f9001bf8:	01e9bf33          	sltu	t5,s3,t5
f9001bfc:	01e78633          	add	a2,a5,t5
f9001c00:	00861793          	slli	a5,a2,0x8
f9001c04:	b807d8e3          	bgez	a5,f9001794 <__subdf3+0x380>
f9001c08:	ff8007b7          	lui	a5,0xff800
f9001c0c:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f9001c10:	00f67633          	and	a2,a2,a5
f9001c14:	00100493          	li	s1,1
f9001c18:	b7dff06f          	j	f9001794 <__subdf3+0x380>
f9001c1c:	00361613          	slli	a2,a2,0x3
f9001c20:	01d71813          	slli	a6,a4,0x1d
f9001c24:	00365613          	srli	a2,a2,0x3
f9001c28:	00c86833          	or	a6,a6,a2
f9001c2c:	00375793          	srli	a5,a4,0x3
f9001c30:	b81ff06f          	j	f90017b0 <__subdf3+0x39c>
f9001c34:	00c9e833          	or	a6,s3,a2
f9001c38:	c80808e3          	beqz	a6,f90018c8 <__subdf3+0x4b4>
f9001c3c:	b59ff06f          	j	f9001794 <__subdf3+0x380>
f9001c40:	fe058813          	addi	a6,a1,-32
f9001c44:	02000793          	li	a5,32
f9001c48:	010359b3          	srl	s3,t1,a6
f9001c4c:	00f58a63          	beq	a1,a5,f9001c60 <__subdf3+0x84c>
f9001c50:	04000793          	li	a5,64
f9001c54:	40b785b3          	sub	a1,a5,a1
f9001c58:	00b31333          	sll	t1,t1,a1
f9001c5c:	006f6f33          	or	t5,t5,t1
f9001c60:	01e03833          	snez	a6,t5
f9001c64:	01386833          	or	a6,a6,s3
f9001c68:	cbdff06f          	j	f9001924 <__subdf3+0x510>
f9001c6c:	00000413          	li	s0,0
f9001c70:	7ff00713          	li	a4,2047
f9001c74:	000807b7          	lui	a5,0x80
f9001c78:	941ff06f          	j	f90015b8 <__subdf3+0x1a4>
f9001c7c:	01df09b3          	add	s3,t5,t4
f9001c80:	00e307b3          	add	a5,t1,a4
f9001c84:	01d9beb3          	sltu	t4,s3,t4
f9001c88:	01d78633          	add	a2,a5,t4
f9001c8c:	d39ff06f          	j	f90019c4 <__subdf3+0x5b0>

f9001c90 <__fixdfsi>:
f9001c90:	0145d793          	srli	a5,a1,0x14
f9001c94:	001006b7          	lui	a3,0x100
f9001c98:	fff68713          	addi	a4,a3,-1 # fffff <__stack_size+0xfdfff>
f9001c9c:	7ff7f793          	andi	a5,a5,2047
f9001ca0:	3fe00613          	li	a2,1022
f9001ca4:	00b77733          	and	a4,a4,a1
f9001ca8:	01f5d593          	srli	a1,a1,0x1f
f9001cac:	00f65e63          	bge	a2,a5,f9001cc8 <__fixdfsi+0x38>
f9001cb0:	41d00613          	li	a2,1053
f9001cb4:	00f65e63          	bge	a2,a5,f9001cd0 <__fixdfsi+0x40>
f9001cb8:	80000537          	lui	a0,0x80000
f9001cbc:	fff54513          	not	a0,a0
f9001cc0:	00a58533          	add	a0,a1,a0
f9001cc4:	00008067          	ret
f9001cc8:	00000513          	li	a0,0
f9001ccc:	00008067          	ret
f9001cd0:	43300613          	li	a2,1075
f9001cd4:	40f60633          	sub	a2,a2,a5
f9001cd8:	01f00813          	li	a6,31
f9001cdc:	00d76733          	or	a4,a4,a3
f9001ce0:	02c85063          	bge	a6,a2,f9001d00 <__fixdfsi+0x70>
f9001ce4:	41300693          	li	a3,1043
f9001ce8:	40f687b3          	sub	a5,a3,a5
f9001cec:	00f757b3          	srl	a5,a4,a5
f9001cf0:	40f00533          	neg	a0,a5
f9001cf4:	fc059ce3          	bnez	a1,f9001ccc <__fixdfsi+0x3c>
f9001cf8:	00078513          	mv	a0,a5
f9001cfc:	00008067          	ret
f9001d00:	bed78793          	addi	a5,a5,-1043 # 7fbed <__stack_size+0x7dbed>
f9001d04:	00f717b3          	sll	a5,a4,a5
f9001d08:	00c55533          	srl	a0,a0,a2
f9001d0c:	00a7e7b3          	or	a5,a5,a0
f9001d10:	fe1ff06f          	j	f9001cf0 <__fixdfsi+0x60>

f9001d14 <__floatsidf>:
f9001d14:	ff010113          	addi	sp,sp,-16
f9001d18:	00112623          	sw	ra,12(sp)
f9001d1c:	00812423          	sw	s0,8(sp)
f9001d20:	00912223          	sw	s1,4(sp)
f9001d24:	04050a63          	beqz	a0,f9001d78 <__floatsidf+0x64>
f9001d28:	41f55793          	srai	a5,a0,0x1f
f9001d2c:	00a7c4b3          	xor	s1,a5,a0
f9001d30:	40f484b3          	sub	s1,s1,a5
f9001d34:	00050413          	mv	s0,a0
f9001d38:	00048513          	mv	a0,s1
f9001d3c:	588000ef          	jal	ra,f90022c4 <__clzsi2>
f9001d40:	41e00693          	li	a3,1054
f9001d44:	40a686b3          	sub	a3,a3,a0
f9001d48:	00a00793          	li	a5,10
f9001d4c:	01f45413          	srli	s0,s0,0x1f
f9001d50:	7ff6f693          	andi	a3,a3,2047
f9001d54:	06a7c463          	blt	a5,a0,f9001dbc <__floatsidf+0xa8>
f9001d58:	00b00713          	li	a4,11
f9001d5c:	40a70733          	sub	a4,a4,a0
f9001d60:	00e4d7b3          	srl	a5,s1,a4
f9001d64:	01550513          	addi	a0,a0,21 # 80000015 <__freertos_irq_stack_top+0x86ff89e5>
f9001d68:	00c79793          	slli	a5,a5,0xc
f9001d6c:	00a494b3          	sll	s1,s1,a0
f9001d70:	00c7d793          	srli	a5,a5,0xc
f9001d74:	0140006f          	j	f9001d88 <__floatsidf+0x74>
f9001d78:	00000413          	li	s0,0
f9001d7c:	00000693          	li	a3,0
f9001d80:	00000793          	li	a5,0
f9001d84:	00000493          	li	s1,0
f9001d88:	00c79793          	slli	a5,a5,0xc
f9001d8c:	01469693          	slli	a3,a3,0x14
f9001d90:	00c7d793          	srli	a5,a5,0xc
f9001d94:	01f41413          	slli	s0,s0,0x1f
f9001d98:	00d7e7b3          	or	a5,a5,a3
f9001d9c:	0087e7b3          	or	a5,a5,s0
f9001da0:	00c12083          	lw	ra,12(sp)
f9001da4:	00812403          	lw	s0,8(sp)
f9001da8:	00048513          	mv	a0,s1
f9001dac:	00078593          	mv	a1,a5
f9001db0:	00412483          	lw	s1,4(sp)
f9001db4:	01010113          	addi	sp,sp,16
f9001db8:	00008067          	ret
f9001dbc:	ff550513          	addi	a0,a0,-11
f9001dc0:	00a497b3          	sll	a5,s1,a0
f9001dc4:	00c79793          	slli	a5,a5,0xc
f9001dc8:	00c7d793          	srli	a5,a5,0xc
f9001dcc:	00000493          	li	s1,0
f9001dd0:	fb9ff06f          	j	f9001d88 <__floatsidf+0x74>

f9001dd4 <__gesf2>:
f9001dd4:	01755693          	srli	a3,a0,0x17
f9001dd8:	008007b7          	lui	a5,0x800
f9001ddc:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fdfff>
f9001de0:	0175d613          	srli	a2,a1,0x17
f9001de4:	0ff6f693          	andi	a3,a3,255
f9001de8:	0ff00813          	li	a6,255
f9001dec:	00a7f8b3          	and	a7,a5,a0
f9001df0:	01f55713          	srli	a4,a0,0x1f
f9001df4:	00b7f7b3          	and	a5,a5,a1
f9001df8:	0ff67613          	andi	a2,a2,255
f9001dfc:	01f5d513          	srli	a0,a1,0x1f
f9001e00:	03068a63          	beq	a3,a6,f9001e34 <__gesf2+0x60>
f9001e04:	03060263          	beq	a2,a6,f9001e28 <__gesf2+0x54>
f9001e08:	02069a63          	bnez	a3,f9001e3c <__gesf2+0x68>
f9001e0c:	00061463          	bnez	a2,f9001e14 <__gesf2+0x40>
f9001e10:	04078a63          	beqz	a5,f9001e64 <__gesf2+0x90>
f9001e14:	04088263          	beqz	a7,f9001e58 <__gesf2+0x84>
f9001e18:	06a70063          	beq	a4,a0,f9001e78 <__gesf2+0xa4>
f9001e1c:	00100513          	li	a0,1
f9001e20:	02071e63          	bnez	a4,f9001e5c <__gesf2+0x88>
f9001e24:	00008067          	ret
f9001e28:	fe0780e3          	beqz	a5,f9001e08 <__gesf2+0x34>
f9001e2c:	ffe00513          	li	a0,-2
f9001e30:	00008067          	ret
f9001e34:	fe089ce3          	bnez	a7,f9001e2c <__gesf2+0x58>
f9001e38:	02d60c63          	beq	a2,a3,f9001e70 <__gesf2+0x9c>
f9001e3c:	00061463          	bnez	a2,f9001e44 <__gesf2+0x70>
f9001e40:	fc078ee3          	beqz	a5,f9001e1c <__gesf2+0x48>
f9001e44:	fca71ce3          	bne	a4,a0,f9001e1c <__gesf2+0x48>
f9001e48:	02d65a63          	bge	a2,a3,f9001e7c <__gesf2+0xa8>
f9001e4c:	00051863          	bnez	a0,f9001e5c <__gesf2+0x88>
f9001e50:	00100513          	li	a0,1
f9001e54:	00008067          	ret
f9001e58:	fc0516e3          	bnez	a0,f9001e24 <__gesf2+0x50>
f9001e5c:	fff00513          	li	a0,-1
f9001e60:	00008067          	ret
f9001e64:	00000513          	li	a0,0
f9001e68:	fa089ae3          	bnez	a7,f9001e1c <__gesf2+0x48>
f9001e6c:	00008067          	ret
f9001e70:	fc078ae3          	beqz	a5,f9001e44 <__gesf2+0x70>
f9001e74:	fb9ff06f          	j	f9001e2c <__gesf2+0x58>
f9001e78:	00000693          	li	a3,0
f9001e7c:	00c6c863          	blt	a3,a2,f9001e8c <__gesf2+0xb8>
f9001e80:	f917eee3          	bltu	a5,a7,f9001e1c <__gesf2+0x48>
f9001e84:	00000513          	li	a0,0
f9001e88:	f8f8fee3          	bgeu	a7,a5,f9001e24 <__gesf2+0x50>
f9001e8c:	fc0708e3          	beqz	a4,f9001e5c <__gesf2+0x88>
f9001e90:	00070513          	mv	a0,a4
f9001e94:	00008067          	ret

f9001e98 <__lesf2>:
f9001e98:	01755693          	srli	a3,a0,0x17
f9001e9c:	008007b7          	lui	a5,0x800
f9001ea0:	fff78793          	addi	a5,a5,-1 # 7fffff <__stack_size+0x7fdfff>
f9001ea4:	0175d613          	srli	a2,a1,0x17
f9001ea8:	0ff6f693          	andi	a3,a3,255
f9001eac:	0ff00813          	li	a6,255
f9001eb0:	00a7f8b3          	and	a7,a5,a0
f9001eb4:	01f55713          	srli	a4,a0,0x1f
f9001eb8:	00b7f7b3          	and	a5,a5,a1
f9001ebc:	0ff67613          	andi	a2,a2,255
f9001ec0:	01f5d513          	srli	a0,a1,0x1f
f9001ec4:	05068263          	beq	a3,a6,f9001f08 <__lesf2+0x70>
f9001ec8:	01060e63          	beq	a2,a6,f9001ee4 <__lesf2+0x4c>
f9001ecc:	04069263          	bnez	a3,f9001f10 <__lesf2+0x78>
f9001ed0:	02061063          	bnez	a2,f9001ef0 <__lesf2+0x58>
f9001ed4:	00079e63          	bnez	a5,f9001ef0 <__lesf2+0x58>
f9001ed8:	00000513          	li	a0,0
f9001edc:	00089e63          	bnez	a7,f9001ef8 <__lesf2+0x60>
f9001ee0:	00008067          	ret
f9001ee4:	fe0784e3          	beqz	a5,f9001ecc <__lesf2+0x34>
f9001ee8:	00200513          	li	a0,2
f9001eec:	00008067          	ret
f9001ef0:	02088e63          	beqz	a7,f9001f2c <__lesf2+0x94>
f9001ef4:	04a70463          	beq	a4,a0,f9001f3c <__lesf2+0xa4>
f9001ef8:	00100513          	li	a0,1
f9001efc:	fe0702e3          	beqz	a4,f9001ee0 <__lesf2+0x48>
f9001f00:	fff00513          	li	a0,-1
f9001f04:	00008067          	ret
f9001f08:	fe0890e3          	bnez	a7,f9001ee8 <__lesf2+0x50>
f9001f0c:	02d60463          	beq	a2,a3,f9001f34 <__lesf2+0x9c>
f9001f10:	00061463          	bnez	a2,f9001f18 <__lesf2+0x80>
f9001f14:	fe0782e3          	beqz	a5,f9001ef8 <__lesf2+0x60>
f9001f18:	fea710e3          	bne	a4,a0,f9001ef8 <__lesf2+0x60>
f9001f1c:	02d65263          	bge	a2,a3,f9001f40 <__lesf2+0xa8>
f9001f20:	fe0510e3          	bnez	a0,f9001f00 <__lesf2+0x68>
f9001f24:	00100513          	li	a0,1
f9001f28:	00008067          	ret
f9001f2c:	fc050ae3          	beqz	a0,f9001f00 <__lesf2+0x68>
f9001f30:	00008067          	ret
f9001f34:	fe0782e3          	beqz	a5,f9001f18 <__lesf2+0x80>
f9001f38:	fb1ff06f          	j	f9001ee8 <__lesf2+0x50>
f9001f3c:	00000693          	li	a3,0
f9001f40:	00c6c863          	blt	a3,a2,f9001f50 <__lesf2+0xb8>
f9001f44:	fb17eae3          	bltu	a5,a7,f9001ef8 <__lesf2+0x60>
f9001f48:	00000513          	li	a0,0
f9001f4c:	f8f8fae3          	bgeu	a7,a5,f9001ee0 <__lesf2+0x48>
f9001f50:	fa0708e3          	beqz	a4,f9001f00 <__lesf2+0x68>
f9001f54:	00070513          	mv	a0,a4
f9001f58:	00008067          	ret

f9001f5c <__fixsfsi>:
f9001f5c:	00800637          	lui	a2,0x800
f9001f60:	01755713          	srli	a4,a0,0x17
f9001f64:	fff60793          	addi	a5,a2,-1 # 7fffff <__stack_size+0x7fdfff>
f9001f68:	0ff77713          	andi	a4,a4,255
f9001f6c:	07e00593          	li	a1,126
f9001f70:	00a7f6b3          	and	a3,a5,a0
f9001f74:	01f55793          	srli	a5,a0,0x1f
f9001f78:	00e5fe63          	bgeu	a1,a4,f9001f94 <__fixsfsi+0x38>
f9001f7c:	09d00593          	li	a1,157
f9001f80:	00e5fe63          	bgeu	a1,a4,f9001f9c <__fixsfsi+0x40>
f9001f84:	80000537          	lui	a0,0x80000
f9001f88:	fff54513          	not	a0,a0
f9001f8c:	00a78533          	add	a0,a5,a0
f9001f90:	00008067          	ret
f9001f94:	00000513          	li	a0,0
f9001f98:	00008067          	ret
f9001f9c:	09500593          	li	a1,149
f9001fa0:	00c6e6b3          	or	a3,a3,a2
f9001fa4:	02e5c063          	blt	a1,a4,f9001fc4 <__fixsfsi+0x68>
f9001fa8:	09600613          	li	a2,150
f9001fac:	40e60733          	sub	a4,a2,a4
f9001fb0:	00e6d733          	srl	a4,a3,a4
f9001fb4:	40e00533          	neg	a0,a4
f9001fb8:	fe0790e3          	bnez	a5,f9001f98 <__fixsfsi+0x3c>
f9001fbc:	00070513          	mv	a0,a4
f9001fc0:	00008067          	ret
f9001fc4:	f6a70713          	addi	a4,a4,-150
f9001fc8:	00e69733          	sll	a4,a3,a4
f9001fcc:	fe9ff06f          	j	f9001fb4 <__fixsfsi+0x58>

f9001fd0 <__extendsfdf2>:
f9001fd0:	01755713          	srli	a4,a0,0x17
f9001fd4:	0ff77713          	andi	a4,a4,255
f9001fd8:	ff010113          	addi	sp,sp,-16
f9001fdc:	00170793          	addi	a5,a4,1
f9001fe0:	00812423          	sw	s0,8(sp)
f9001fe4:	00912223          	sw	s1,4(sp)
f9001fe8:	00951413          	slli	s0,a0,0x9
f9001fec:	00112623          	sw	ra,12(sp)
f9001ff0:	0fe7f793          	andi	a5,a5,254
f9001ff4:	00945413          	srli	s0,s0,0x9
f9001ff8:	01f55493          	srli	s1,a0,0x1f
f9001ffc:	04078263          	beqz	a5,f9002040 <__extendsfdf2+0x70>
f9002000:	00345793          	srli	a5,s0,0x3
f9002004:	38070713          	addi	a4,a4,896
f9002008:	01d41413          	slli	s0,s0,0x1d
f900200c:	00c79793          	slli	a5,a5,0xc
f9002010:	01471713          	slli	a4,a4,0x14
f9002014:	00c7d793          	srli	a5,a5,0xc
f9002018:	01f49513          	slli	a0,s1,0x1f
f900201c:	00e7e7b3          	or	a5,a5,a4
f9002020:	00a7e7b3          	or	a5,a5,a0
f9002024:	00c12083          	lw	ra,12(sp)
f9002028:	00040513          	mv	a0,s0
f900202c:	00812403          	lw	s0,8(sp)
f9002030:	00412483          	lw	s1,4(sp)
f9002034:	00078593          	mv	a1,a5
f9002038:	01010113          	addi	sp,sp,16
f900203c:	00008067          	ret
f9002040:	04071263          	bnez	a4,f9002084 <__extendsfdf2+0xb4>
f9002044:	06040863          	beqz	s0,f90020b4 <__extendsfdf2+0xe4>
f9002048:	00040513          	mv	a0,s0
f900204c:	278000ef          	jal	ra,f90022c4 <__clzsi2>
f9002050:	00a00793          	li	a5,10
f9002054:	06a7c663          	blt	a5,a0,f90020c0 <__extendsfdf2+0xf0>
f9002058:	00b00713          	li	a4,11
f900205c:	40a70733          	sub	a4,a4,a0
f9002060:	01550793          	addi	a5,a0,21 # 80000015 <__freertos_irq_stack_top+0x86ff89e5>
f9002064:	00e45733          	srl	a4,s0,a4
f9002068:	00f41433          	sll	s0,s0,a5
f900206c:	00c71793          	slli	a5,a4,0xc
f9002070:	38900713          	li	a4,905
f9002074:	40a70733          	sub	a4,a4,a0
f9002078:	00c7d793          	srli	a5,a5,0xc
f900207c:	7ff77713          	andi	a4,a4,2047
f9002080:	f8dff06f          	j	f900200c <__extendsfdf2+0x3c>
f9002084:	02040263          	beqz	s0,f90020a8 <__extendsfdf2+0xd8>
f9002088:	00345713          	srli	a4,s0,0x3
f900208c:	000807b7          	lui	a5,0x80
f9002090:	00f767b3          	or	a5,a4,a5
f9002094:	00c79793          	slli	a5,a5,0xc
f9002098:	01d41413          	slli	s0,s0,0x1d
f900209c:	00c7d793          	srli	a5,a5,0xc
f90020a0:	7ff00713          	li	a4,2047
f90020a4:	f69ff06f          	j	f900200c <__extendsfdf2+0x3c>
f90020a8:	7ff00713          	li	a4,2047
f90020ac:	00000793          	li	a5,0
f90020b0:	f5dff06f          	j	f900200c <__extendsfdf2+0x3c>
f90020b4:	00000713          	li	a4,0
f90020b8:	00000793          	li	a5,0
f90020bc:	f51ff06f          	j	f900200c <__extendsfdf2+0x3c>
f90020c0:	ff550713          	addi	a4,a0,-11
f90020c4:	00e41733          	sll	a4,s0,a4
f90020c8:	00000413          	li	s0,0
f90020cc:	fa1ff06f          	j	f900206c <__extendsfdf2+0x9c>

f90020d0 <__truncdfsf2>:
f90020d0:	0145d693          	srli	a3,a1,0x14
f90020d4:	00c59793          	slli	a5,a1,0xc
f90020d8:	7ff6f693          	andi	a3,a3,2047
f90020dc:	00c7d793          	srli	a5,a5,0xc
f90020e0:	00168613          	addi	a2,a3,1
f90020e4:	00379793          	slli	a5,a5,0x3
f90020e8:	01d55713          	srli	a4,a0,0x1d
f90020ec:	7fe67613          	andi	a2,a2,2046
f90020f0:	01f5d593          	srli	a1,a1,0x1f
f90020f4:	00f76733          	or	a4,a4,a5
f90020f8:	00351893          	slli	a7,a0,0x3
f90020fc:	0a060463          	beqz	a2,f90021a4 <__truncdfsf2+0xd4>
f9002100:	c8068813          	addi	a6,a3,-896
f9002104:	0fe00793          	li	a5,254
f9002108:	0307d463          	bge	a5,a6,f9002130 <__truncdfsf2+0x60>
f900210c:	00000793          	li	a5,0
f9002110:	00979513          	slli	a0,a5,0x9
f9002114:	0ff00693          	li	a3,255
f9002118:	01769693          	slli	a3,a3,0x17
f900211c:	00955513          	srli	a0,a0,0x9
f9002120:	01f59593          	slli	a1,a1,0x1f
f9002124:	00d56533          	or	a0,a0,a3
f9002128:	00b56533          	or	a0,a0,a1
f900212c:	00008067          	ret
f9002130:	0f005e63          	blez	a6,f900222c <__truncdfsf2+0x15c>
f9002134:	00651793          	slli	a5,a0,0x6
f9002138:	00371713          	slli	a4,a4,0x3
f900213c:	00f037b3          	snez	a5,a5
f9002140:	00e7e7b3          	or	a5,a5,a4
f9002144:	01d8d893          	srli	a7,a7,0x1d
f9002148:	0117e7b3          	or	a5,a5,a7
f900214c:	0077f713          	andi	a4,a5,7
f9002150:	16070663          	beqz	a4,f90022bc <__truncdfsf2+0x1ec>
f9002154:	00f7f713          	andi	a4,a5,15
f9002158:	00400693          	li	a3,4
f900215c:	00d70463          	beq	a4,a3,f9002164 <__truncdfsf2+0x94>
f9002160:	00478793          	addi	a5,a5,4 # 80004 <__stack_size+0x7e004>
f9002164:	04000737          	lui	a4,0x4000
f9002168:	00e7f733          	and	a4,a5,a4
f900216c:	14070863          	beqz	a4,f90022bc <__truncdfsf2+0x1ec>
f9002170:	00180713          	addi	a4,a6,1
f9002174:	0ff00613          	li	a2,255
f9002178:	0ff77693          	andi	a3,a4,255
f900217c:	f8c708e3          	beq	a4,a2,f900210c <__truncdfsf2+0x3c>
f9002180:	00679793          	slli	a5,a5,0x6
f9002184:	0097d793          	srli	a5,a5,0x9
f9002188:	00979513          	slli	a0,a5,0x9
f900218c:	01769693          	slli	a3,a3,0x17
f9002190:	00955513          	srli	a0,a0,0x9
f9002194:	01f59593          	slli	a1,a1,0x1f
f9002198:	00d56533          	or	a0,a0,a3
f900219c:	00b56533          	or	a0,a0,a1
f90021a0:	00008067          	ret
f90021a4:	011767b3          	or	a5,a4,a7
f90021a8:	02069a63          	bnez	a3,f90021dc <__truncdfsf2+0x10c>
f90021ac:	04078e63          	beqz	a5,f9002208 <__truncdfsf2+0x138>
f90021b0:	00500793          	li	a5,5
f90021b4:	00679793          	slli	a5,a5,0x6
f90021b8:	0097d793          	srli	a5,a5,0x9
f90021bc:	00979513          	slli	a0,a5,0x9
f90021c0:	0ff6f693          	andi	a3,a3,255
f90021c4:	01769693          	slli	a3,a3,0x17
f90021c8:	00955513          	srli	a0,a0,0x9
f90021cc:	01f59593          	slli	a1,a1,0x1f
f90021d0:	00d56533          	or	a0,a0,a3
f90021d4:	00b56533          	or	a0,a0,a1
f90021d8:	00008067          	ret
f90021dc:	f20788e3          	beqz	a5,f900210c <__truncdfsf2+0x3c>
f90021e0:	004007b7          	lui	a5,0x400
f90021e4:	00979513          	slli	a0,a5,0x9
f90021e8:	0ff00693          	li	a3,255
f90021ec:	01769693          	slli	a3,a3,0x17
f90021f0:	00000593          	li	a1,0
f90021f4:	00955513          	srli	a0,a0,0x9
f90021f8:	01f59593          	slli	a1,a1,0x1f
f90021fc:	00d56533          	or	a0,a0,a3
f9002200:	00b56533          	or	a0,a0,a1
f9002204:	00008067          	ret
f9002208:	00000793          	li	a5,0
f900220c:	00979513          	slli	a0,a5,0x9
f9002210:	00000693          	li	a3,0
f9002214:	01769693          	slli	a3,a3,0x17
f9002218:	00955513          	srli	a0,a0,0x9
f900221c:	01f59593          	slli	a1,a1,0x1f
f9002220:	00d56533          	or	a0,a0,a3
f9002224:	00b56533          	or	a0,a0,a1
f9002228:	00008067          	ret
f900222c:	fe900793          	li	a5,-23
f9002230:	06f84263          	blt	a6,a5,f9002294 <__truncdfsf2+0x1c4>
f9002234:	01e00793          	li	a5,30
f9002238:	00800637          	lui	a2,0x800
f900223c:	410787b3          	sub	a5,a5,a6
f9002240:	01f00513          	li	a0,31
f9002244:	00c76633          	or	a2,a4,a2
f9002248:	04f55a63          	bge	a0,a5,f900229c <__truncdfsf2+0x1cc>
f900224c:	ffe00713          	li	a4,-2
f9002250:	41070733          	sub	a4,a4,a6
f9002254:	02000513          	li	a0,32
f9002258:	00e65733          	srl	a4,a2,a4
f900225c:	00a78863          	beq	a5,a0,f900226c <__truncdfsf2+0x19c>
f9002260:	ca268693          	addi	a3,a3,-862
f9002264:	00d616b3          	sll	a3,a2,a3
f9002268:	00d8e8b3          	or	a7,a7,a3
f900226c:	011037b3          	snez	a5,a7
f9002270:	00e7e7b3          	or	a5,a5,a4
f9002274:	0077f713          	andi	a4,a5,7
f9002278:	00000813          	li	a6,0
f900227c:	ec071ce3          	bnez	a4,f9002154 <__truncdfsf2+0x84>
f9002280:	00579713          	slli	a4,a5,0x5
f9002284:	00100693          	li	a3,1
f9002288:	ee074ce3          	bltz	a4,f9002180 <__truncdfsf2+0xb0>
f900228c:	00000693          	li	a3,0
f9002290:	f25ff06f          	j	f90021b4 <__truncdfsf2+0xe4>
f9002294:	00000693          	li	a3,0
f9002298:	f19ff06f          	j	f90021b0 <__truncdfsf2+0xe0>
f900229c:	c8268693          	addi	a3,a3,-894
f90022a0:	00d89733          	sll	a4,a7,a3
f90022a4:	00e03733          	snez	a4,a4
f90022a8:	00d616b3          	sll	a3,a2,a3
f90022ac:	00f8d8b3          	srl	a7,a7,a5
f90022b0:	00d767b3          	or	a5,a4,a3
f90022b4:	00f8e7b3          	or	a5,a7,a5
f90022b8:	fbdff06f          	j	f9002274 <__truncdfsf2+0x1a4>
f90022bc:	00080693          	mv	a3,a6
f90022c0:	ef5ff06f          	j	f90021b4 <__truncdfsf2+0xe4>

f90022c4 <__clzsi2>:
f90022c4:	000107b7          	lui	a5,0x10
f90022c8:	04f57463          	bgeu	a0,a5,f9002310 <__clzsi2+0x4c>
f90022cc:	0ff00793          	li	a5,255
f90022d0:	02000713          	li	a4,32
f90022d4:	00a7ee63          	bltu	a5,a0,f90022f0 <__clzsi2+0x2c>
f90022d8:	00003797          	auipc	a5,0x3
f90022dc:	c7078793          	addi	a5,a5,-912 # f9004f48 <__clz_tab>
f90022e0:	00a787b3          	add	a5,a5,a0
f90022e4:	0007c503          	lbu	a0,0(a5)
f90022e8:	40a70533          	sub	a0,a4,a0
f90022ec:	00008067          	ret
f90022f0:	00855513          	srli	a0,a0,0x8
f90022f4:	00003797          	auipc	a5,0x3
f90022f8:	c5478793          	addi	a5,a5,-940 # f9004f48 <__clz_tab>
f90022fc:	00a787b3          	add	a5,a5,a0
f9002300:	0007c503          	lbu	a0,0(a5)
f9002304:	01800713          	li	a4,24
f9002308:	40a70533          	sub	a0,a4,a0
f900230c:	00008067          	ret
f9002310:	010007b7          	lui	a5,0x1000
f9002314:	02f56263          	bltu	a0,a5,f9002338 <__clzsi2+0x74>
f9002318:	01855513          	srli	a0,a0,0x18
f900231c:	00003797          	auipc	a5,0x3
f9002320:	c2c78793          	addi	a5,a5,-980 # f9004f48 <__clz_tab>
f9002324:	00a787b3          	add	a5,a5,a0
f9002328:	0007c503          	lbu	a0,0(a5)
f900232c:	00800713          	li	a4,8
f9002330:	40a70533          	sub	a0,a4,a0
f9002334:	00008067          	ret
f9002338:	01055513          	srli	a0,a0,0x10
f900233c:	00003797          	auipc	a5,0x3
f9002340:	c0c78793          	addi	a5,a5,-1012 # f9004f48 <__clz_tab>
f9002344:	00a787b3          	add	a5,a5,a0
f9002348:	0007c503          	lbu	a0,0(a5)
f900234c:	01000713          	li	a4,16
f9002350:	40a70533          	sub	a0,a4,a0
f9002354:	00008067          	ret

f9002358 <pow>:
f9002358:	fe010113          	addi	sp,sp,-32
f900235c:	00812c23          	sw	s0,24(sp)
f9002360:	00912a23          	sw	s1,20(sp)
f9002364:	01212823          	sw	s2,16(sp)
f9002368:	01312623          	sw	s3,12(sp)
f900236c:	01412423          	sw	s4,8(sp)
f9002370:	01512223          	sw	s5,4(sp)
f9002374:	00112e23          	sw	ra,28(sp)
f9002378:	00050913          	mv	s2,a0
f900237c:	00058993          	mv	s3,a1
f9002380:	00060413          	mv	s0,a2
f9002384:	00068493          	mv	s1,a3
f9002388:	240000ef          	jal	ra,f90025c8 <__ieee754_pow>
f900238c:	81018793          	addi	a5,gp,-2032 # f9005608 <__fdlib_version>
f9002390:	0007a703          	lw	a4,0(a5)
f9002394:	fff00793          	li	a5,-1
f9002398:	00050a13          	mv	s4,a0
f900239c:	00058a93          	mv	s5,a1
f90023a0:	08f70663          	beq	a4,a5,f900242c <pow+0xd4>
f90023a4:	00040613          	mv	a2,s0
f90023a8:	00048693          	mv	a3,s1
f90023ac:	00040513          	mv	a0,s0
f90023b0:	00048593          	mv	a1,s1
f90023b4:	23d020ef          	jal	ra,f9004df0 <__unorddf2>
f90023b8:	06051a63          	bnez	a0,f900242c <pow+0xd4>
f90023bc:	00090613          	mv	a2,s2
f90023c0:	00098693          	mv	a3,s3
f90023c4:	00090513          	mv	a0,s2
f90023c8:	00098593          	mv	a1,s3
f90023cc:	225020ef          	jal	ra,f9004df0 <__unorddf2>
f90023d0:	00000613          	li	a2,0
f90023d4:	00000693          	li	a3,0
f90023d8:	0e051063          	bnez	a0,f90024b8 <pow+0x160>
f90023dc:	00090513          	mv	a0,s2
f90023e0:	00098593          	mv	a1,s3
f90023e4:	085020ef          	jal	ra,f9004c68 <__eqdf2>
f90023e8:	06051863          	bnez	a0,f9002458 <pow+0x100>
f90023ec:	00000613          	li	a2,0
f90023f0:	00000693          	li	a3,0
f90023f4:	00040513          	mv	a0,s0
f90023f8:	00048593          	mv	a1,s1
f90023fc:	06d020ef          	jal	ra,f9004c68 <__eqdf2>
f9002400:	0c050463          	beqz	a0,f90024c8 <pow+0x170>
f9002404:	00040513          	mv	a0,s0
f9002408:	00048593          	mv	a1,s1
f900240c:	454010ef          	jal	ra,f9003860 <finite>
f9002410:	00050e63          	beqz	a0,f900242c <pow+0xd4>
f9002414:	00000613          	li	a2,0
f9002418:	00000693          	li	a3,0
f900241c:	00040513          	mv	a0,s0
f9002420:	00048593          	mv	a1,s1
f9002424:	89dfe0ef          	jal	ra,f9000cc0 <__ledf2>
f9002428:	12054263          	bltz	a0,f900254c <pow+0x1f4>
f900242c:	01c12083          	lw	ra,28(sp)
f9002430:	01812403          	lw	s0,24(sp)
f9002434:	000a0513          	mv	a0,s4
f9002438:	000a8593          	mv	a1,s5
f900243c:	01412483          	lw	s1,20(sp)
f9002440:	01012903          	lw	s2,16(sp)
f9002444:	00c12983          	lw	s3,12(sp)
f9002448:	00812a03          	lw	s4,8(sp)
f900244c:	00412a83          	lw	s5,4(sp)
f9002450:	02010113          	addi	sp,sp,32
f9002454:	00008067          	ret
f9002458:	000a0513          	mv	a0,s4
f900245c:	000a8593          	mv	a1,s5
f9002460:	400010ef          	jal	ra,f9003860 <finite>
f9002464:	06050c63          	beqz	a0,f90024dc <pow+0x184>
f9002468:	00000613          	li	a2,0
f900246c:	00000693          	li	a3,0
f9002470:	000a0513          	mv	a0,s4
f9002474:	000a8593          	mv	a1,s5
f9002478:	7f0020ef          	jal	ra,f9004c68 <__eqdf2>
f900247c:	fa0518e3          	bnez	a0,f900242c <pow+0xd4>
f9002480:	00090513          	mv	a0,s2
f9002484:	00098593          	mv	a1,s3
f9002488:	3d8010ef          	jal	ra,f9003860 <finite>
f900248c:	fa0500e3          	beqz	a0,f900242c <pow+0xd4>
f9002490:	00040513          	mv	a0,s0
f9002494:	00048593          	mv	a1,s1
f9002498:	3c8010ef          	jal	ra,f9003860 <finite>
f900249c:	f80508e3          	beqz	a0,f900242c <pow+0xd4>
f90024a0:	1a5020ef          	jal	ra,f9004e44 <__errno>
f90024a4:	02200793          	li	a5,34
f90024a8:	00f52023          	sw	a5,0(a0)
f90024ac:	00000a13          	li	s4,0
f90024b0:	00000a93          	li	s5,0
f90024b4:	f79ff06f          	j	f900242c <pow+0xd4>
f90024b8:	00040513          	mv	a0,s0
f90024bc:	00048593          	mv	a1,s1
f90024c0:	7a8020ef          	jal	ra,f9004c68 <__eqdf2>
f90024c4:	f60514e3          	bnez	a0,f900242c <pow+0xd4>
f90024c8:	00003797          	auipc	a5,0x3
f90024cc:	b8078793          	addi	a5,a5,-1152 # f9005048 <__clz_tab+0x100>
f90024d0:	0007aa03          	lw	s4,0(a5)
f90024d4:	0047aa83          	lw	s5,4(a5)
f90024d8:	f55ff06f          	j	f900242c <pow+0xd4>
f90024dc:	00090513          	mv	a0,s2
f90024e0:	00098593          	mv	a1,s3
f90024e4:	37c010ef          	jal	ra,f9003860 <finite>
f90024e8:	f80500e3          	beqz	a0,f9002468 <pow+0x110>
f90024ec:	00040513          	mv	a0,s0
f90024f0:	00048593          	mv	a1,s1
f90024f4:	36c010ef          	jal	ra,f9003860 <finite>
f90024f8:	f60508e3          	beqz	a0,f9002468 <pow+0x110>
f90024fc:	000a0613          	mv	a2,s4
f9002500:	000a8693          	mv	a3,s5
f9002504:	000a0513          	mv	a0,s4
f9002508:	000a8593          	mv	a1,s5
f900250c:	0e5020ef          	jal	ra,f9004df0 <__unorddf2>
f9002510:	08051663          	bnez	a0,f900259c <pow+0x244>
f9002514:	131020ef          	jal	ra,f9004e44 <__errno>
f9002518:	02200793          	li	a5,34
f900251c:	00f52023          	sw	a5,0(a0)
f9002520:	00000613          	li	a2,0
f9002524:	00000693          	li	a3,0
f9002528:	00090513          	mv	a0,s2
f900252c:	00098593          	mv	a1,s3
f9002530:	f90fe0ef          	jal	ra,f9000cc0 <__ledf2>
f9002534:	02054c63          	bltz	a0,f900256c <pow+0x214>
f9002538:	00003797          	auipc	a5,0x3
f900253c:	b2078793          	addi	a5,a5,-1248 # f9005058 <__clz_tab+0x110>
f9002540:	0007aa03          	lw	s4,0(a5)
f9002544:	0047aa83          	lw	s5,4(a5)
f9002548:	ee5ff06f          	j	f900242c <pow+0xd4>
f900254c:	0f9020ef          	jal	ra,f9004e44 <__errno>
f9002550:	02100793          	li	a5,33
f9002554:	00f52023          	sw	a5,0(a0)
f9002558:	00003797          	auipc	a5,0x3
f900255c:	af878793          	addi	a5,a5,-1288 # f9005050 <__clz_tab+0x108>
f9002560:	0007aa03          	lw	s4,0(a5)
f9002564:	0047aa83          	lw	s5,4(a5)
f9002568:	ec5ff06f          	j	f900242c <pow+0xd4>
f900256c:	00040513          	mv	a0,s0
f9002570:	00048593          	mv	a1,s1
f9002574:	318010ef          	jal	ra,f900388c <rint>
f9002578:	00040613          	mv	a2,s0
f900257c:	00048693          	mv	a3,s1
f9002580:	6e8020ef          	jal	ra,f9004c68 <__eqdf2>
f9002584:	fa050ae3          	beqz	a0,f9002538 <pow+0x1e0>
f9002588:	00003797          	auipc	a5,0x3
f900258c:	ac878793          	addi	a5,a5,-1336 # f9005050 <__clz_tab+0x108>
f9002590:	0007aa03          	lw	s4,0(a5)
f9002594:	0047aa83          	lw	s5,4(a5)
f9002598:	e95ff06f          	j	f900242c <pow+0xd4>
f900259c:	0a9020ef          	jal	ra,f9004e44 <__errno>
f90025a0:	02100793          	li	a5,33
f90025a4:	00000613          	li	a2,0
f90025a8:	00000693          	li	a3,0
f90025ac:	00f52023          	sw	a5,0(a0)
f90025b0:	00068593          	mv	a1,a3
f90025b4:	00060513          	mv	a0,a2
f90025b8:	735010ef          	jal	ra,f90044ec <__divdf3>
f90025bc:	00050a13          	mv	s4,a0
f90025c0:	00058a93          	mv	s5,a1
f90025c4:	e69ff06f          	j	f900242c <pow+0xd4>

f90025c8 <__ieee754_pow>:
f90025c8:	80000837          	lui	a6,0x80000
f90025cc:	f8010113          	addi	sp,sp,-128
f90025d0:	fff84813          	not	a6,a6
f90025d4:	07212823          	sw	s2,112(sp)
f90025d8:	0106f933          	and	s2,a3,a6
f90025dc:	06112e23          	sw	ra,124(sp)
f90025e0:	06812c23          	sw	s0,120(sp)
f90025e4:	06912a23          	sw	s1,116(sp)
f90025e8:	07312623          	sw	s3,108(sp)
f90025ec:	07412423          	sw	s4,104(sp)
f90025f0:	07512223          	sw	s5,100(sp)
f90025f4:	07612023          	sw	s6,96(sp)
f90025f8:	05712e23          	sw	s7,92(sp)
f90025fc:	05812c23          	sw	s8,88(sp)
f9002600:	05912a23          	sw	s9,84(sp)
f9002604:	05a12823          	sw	s10,80(sp)
f9002608:	05b12623          	sw	s11,76(sp)
f900260c:	00c967b3          	or	a5,s2,a2
f9002610:	10078063          	beqz	a5,f9002710 <__ieee754_pow+0x148>
f9002614:	00b87433          	and	s0,a6,a1
f9002618:	7ff007b7          	lui	a5,0x7ff00
f900261c:	00058a93          	mv	s5,a1
f9002620:	00050a13          	mv	s4,a0
f9002624:	0487dc63          	bge	a5,s0,f900267c <__ieee754_pow+0xb4>
f9002628:	c0100837          	lui	a6,0xc0100
f900262c:	01040833          	add	a6,s0,a6
f9002630:	00a86833          	or	a6,a6,a0
f9002634:	3ff005b7          	lui	a1,0x3ff00
f9002638:	00000513          	li	a0,0
f900263c:	0e081463          	bnez	a6,f9002724 <__ieee754_pow+0x15c>
f9002640:	07c12083          	lw	ra,124(sp)
f9002644:	07812403          	lw	s0,120(sp)
f9002648:	07412483          	lw	s1,116(sp)
f900264c:	07012903          	lw	s2,112(sp)
f9002650:	06c12983          	lw	s3,108(sp)
f9002654:	06812a03          	lw	s4,104(sp)
f9002658:	06412a83          	lw	s5,100(sp)
f900265c:	06012b03          	lw	s6,96(sp)
f9002660:	05c12b83          	lw	s7,92(sp)
f9002664:	05812c03          	lw	s8,88(sp)
f9002668:	05412c83          	lw	s9,84(sp)
f900266c:	05012d03          	lw	s10,80(sp)
f9002670:	04c12d83          	lw	s11,76(sp)
f9002674:	08010113          	addi	sp,sp,128
f9002678:	00008067          	ret
f900267c:	0af40063          	beq	s0,a5,f900271c <__ieee754_pow+0x154>
f9002680:	fb27c4e3          	blt	a5,s2,f9002628 <__ieee754_pow+0x60>
f9002684:	7ff007b7          	lui	a5,0x7ff00
f9002688:	24f90e63          	beq	s2,a5,f90028e4 <__ieee754_pow+0x31c>
f900268c:	00058493          	mv	s1,a1
f9002690:	00050993          	mv	s3,a0
f9002694:	00060c93          	mv	s9,a2
f9002698:	00068d93          	mv	s11,a3
f900269c:	00000d13          	li	s10,0
f90026a0:	0c0ac463          	bltz	s5,f9002768 <__ieee754_pow+0x1a0>
f90026a4:	100c9463          	bnez	s9,f90027ac <__ieee754_pow+0x1e4>
f90026a8:	7ff006b7          	lui	a3,0x7ff00
f90026ac:	1ad90663          	beq	s2,a3,f9002858 <__ieee754_pow+0x290>
f90026b0:	3ff006b7          	lui	a3,0x3ff00
f90026b4:	1cd90a63          	beq	s2,a3,f9002888 <__ieee754_pow+0x2c0>
f90026b8:	400006b7          	lui	a3,0x40000
f90026bc:	60dd80e3          	beq	s11,a3,f90034bc <__ieee754_pow+0xef4>
f90026c0:	3fe006b7          	lui	a3,0x3fe00
f90026c4:	0edd9463          	bne	s11,a3,f90027ac <__ieee754_pow+0x1e4>
f90026c8:	0e0ac263          	bltz	s5,f90027ac <__ieee754_pow+0x1e4>
f90026cc:	07812403          	lw	s0,120(sp)
f90026d0:	07c12083          	lw	ra,124(sp)
f90026d4:	07012903          	lw	s2,112(sp)
f90026d8:	06812a03          	lw	s4,104(sp)
f90026dc:	06412a83          	lw	s5,100(sp)
f90026e0:	06012b03          	lw	s6,96(sp)
f90026e4:	05c12b83          	lw	s7,92(sp)
f90026e8:	05812c03          	lw	s8,88(sp)
f90026ec:	05412c83          	lw	s9,84(sp)
f90026f0:	05012d03          	lw	s10,80(sp)
f90026f4:	04c12d83          	lw	s11,76(sp)
f90026f8:	00098513          	mv	a0,s3
f90026fc:	00048593          	mv	a1,s1
f9002700:	06c12983          	lw	s3,108(sp)
f9002704:	07412483          	lw	s1,116(sp)
f9002708:	08010113          	addi	sp,sp,128
f900270c:	6950006f          	j	f90035a0 <__ieee754_sqrt>
f9002710:	00000513          	li	a0,0
f9002714:	3ff005b7          	lui	a1,0x3ff00
f9002718:	f29ff06f          	j	f9002640 <__ieee754_pow+0x78>
f900271c:	00051463          	bnez	a0,f9002724 <__ieee754_pow+0x15c>
f9002720:	f72452e3          	bge	s0,s2,f9002684 <__ieee754_pow+0xbc>
f9002724:	07812403          	lw	s0,120(sp)
f9002728:	07c12083          	lw	ra,124(sp)
f900272c:	07412483          	lw	s1,116(sp)
f9002730:	07012903          	lw	s2,112(sp)
f9002734:	06c12983          	lw	s3,108(sp)
f9002738:	06812a03          	lw	s4,104(sp)
f900273c:	06412a83          	lw	s5,100(sp)
f9002740:	06012b03          	lw	s6,96(sp)
f9002744:	05c12b83          	lw	s7,92(sp)
f9002748:	05812c03          	lw	s8,88(sp)
f900274c:	05412c83          	lw	s9,84(sp)
f9002750:	05012d03          	lw	s10,80(sp)
f9002754:	04c12d83          	lw	s11,76(sp)
f9002758:	00002517          	auipc	a0,0x2
f900275c:	77c50513          	addi	a0,a0,1916 # f9004ed4 <_data+0x80>
f9002760:	08010113          	addi	sp,sp,128
f9002764:	1140106f          	j	f9003878 <nan>
f9002768:	434006b7          	lui	a3,0x43400
f900276c:	18d95063          	bge	s2,a3,f90028ec <__ieee754_pow+0x324>
f9002770:	3ff006b7          	lui	a3,0x3ff00
f9002774:	02d94a63          	blt	s2,a3,f90027a8 <__ieee754_pow+0x1e0>
f9002778:	41495693          	srai	a3,s2,0x14
f900277c:	c0168693          	addi	a3,a3,-1023 # 3feffc01 <__stack_size+0x3fefdc01>
f9002780:	01400613          	li	a2,20
f9002784:	54d658e3          	bge	a2,a3,f90034d4 <__ieee754_pow+0xf0c>
f9002788:	03400613          	li	a2,52
f900278c:	40d606b3          	sub	a3,a2,a3
f9002790:	00dcd633          	srl	a2,s9,a3
f9002794:	00d616b3          	sll	a3,a2,a3
f9002798:	01969863          	bne	a3,s9,f90027a8 <__ieee754_pow+0x1e0>
f900279c:	00167613          	andi	a2,a2,1
f90027a0:	00200313          	li	t1,2
f90027a4:	40c30d33          	sub	s10,t1,a2
f90027a8:	f00c84e3          	beqz	s9,f90026b0 <__ieee754_pow+0xe8>
f90027ac:	00098513          	mv	a0,s3
f90027b0:	00048593          	mv	a1,s1
f90027b4:	0a0010ef          	jal	ra,f9003854 <fabs>
f90027b8:	040a0c63          	beqz	s4,f9002810 <__ieee754_pow+0x248>
f90027bc:	01f4de13          	srli	t3,s1,0x1f
f90027c0:	fffe0e13          	addi	t3,t3,-1
f90027c4:	01cd66b3          	or	a3,s10,t3
f90027c8:	12068663          	beqz	a3,f90028f4 <__ieee754_pow+0x32c>
f90027cc:	41e006b7          	lui	a3,0x41e00
f90027d0:	1526d463          	bge	a3,s2,f9002918 <__ieee754_pow+0x350>
f90027d4:	43f006b7          	lui	a3,0x43f00
f90027d8:	3526dce3          	bge	a3,s2,f9003330 <__ieee754_pow+0xd68>
f90027dc:	3ff00737          	lui	a4,0x3ff00
f90027e0:	0ce45a63          	bge	s0,a4,f90028b4 <__ieee754_pow+0x2ec>
f90027e4:	080ddc63          	bgez	s11,f900287c <__ieee754_pow+0x2b4>
f90027e8:	00003797          	auipc	a5,0x3
f90027ec:	89878793          	addi	a5,a5,-1896 # f9005080 <__clz_tab+0x138>
f90027f0:	0007a603          	lw	a2,0(a5)
f90027f4:	0047a683          	lw	a3,4(a5)
f90027f8:	00060513          	mv	a0,a2
f90027fc:	00068593          	mv	a1,a3
f9002800:	dc0fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002804:	e3dff06f          	j	f9002640 <__ieee754_pow+0x78>
f9002808:	04c010ef          	jal	ra,f9003854 <fabs>
f900280c:	0e0a1463          	bnez	s4,f90028f4 <__ieee754_pow+0x32c>
f9002810:	00040a63          	beqz	s0,f9002824 <__ieee754_pow+0x25c>
f9002814:	00249693          	slli	a3,s1,0x2
f9002818:	0026d693          	srli	a3,a3,0x2
f900281c:	3ff00637          	lui	a2,0x3ff00
f9002820:	f8c69ee3          	bne	a3,a2,f90027bc <__ieee754_pow+0x1f4>
f9002824:	080dcc63          	bltz	s11,f90028bc <__ieee754_pow+0x2f4>
f9002828:	e00adce3          	bgez	s5,f9002640 <__ieee754_pow+0x78>
f900282c:	c01007b7          	lui	a5,0xc0100
f9002830:	00f407b3          	add	a5,s0,a5
f9002834:	01a7e7b3          	or	a5,a5,s10
f9002838:	4e0796e3          	bnez	a5,f9003524 <__ieee754_pow+0xf5c>
f900283c:	00050613          	mv	a2,a0
f9002840:	00058693          	mv	a3,a1
f9002844:	bd1fe0ef          	jal	ra,f9001414 <__subdf3>
f9002848:	00050613          	mv	a2,a0
f900284c:	00058693          	mv	a3,a1
f9002850:	49d010ef          	jal	ra,f90044ec <__divdf3>
f9002854:	dedff06f          	j	f9002640 <__ieee754_pow+0x78>
f9002858:	c0100537          	lui	a0,0xc0100
f900285c:	00a40533          	add	a0,s0,a0
f9002860:	01356533          	or	a0,a0,s3
f9002864:	ea0506e3          	beqz	a0,f9002710 <__ieee754_pow+0x148>
f9002868:	3ff00737          	lui	a4,0x3ff00
f900286c:	2ae442e3          	blt	s0,a4,f9003310 <__ieee754_pow+0xd48>
f9002870:	000d8593          	mv	a1,s11
f9002874:	00000513          	li	a0,0
f9002878:	dc0dd4e3          	bgez	s11,f9002640 <__ieee754_pow+0x78>
f900287c:	00000513          	li	a0,0
f9002880:	00000593          	li	a1,0
f9002884:	dbdff06f          	j	f9002640 <__ieee754_pow+0x78>
f9002888:	00098513          	mv	a0,s3
f900288c:	00048593          	mv	a1,s1
f9002890:	da0dd8e3          	bgez	s11,f9002640 <__ieee754_pow+0x78>
f9002894:	00002797          	auipc	a5,0x2
f9002898:	7b478793          	addi	a5,a5,1972 # f9005048 <__clz_tab+0x100>
f900289c:	0007a503          	lw	a0,0(a5)
f90028a0:	0047a583          	lw	a1,4(a5)
f90028a4:	00098613          	mv	a2,s3
f90028a8:	00048693          	mv	a3,s1
f90028ac:	441010ef          	jal	ra,f90044ec <__divdf3>
f90028b0:	d91ff06f          	j	f9002640 <__ieee754_pow+0x78>
f90028b4:	f3b04ae3          	bgtz	s11,f90027e8 <__ieee754_pow+0x220>
f90028b8:	fc5ff06f          	j	f900287c <__ieee754_pow+0x2b4>
f90028bc:	00002717          	auipc	a4,0x2
f90028c0:	78c70713          	addi	a4,a4,1932 # f9005048 <__clz_tab+0x100>
f90028c4:	00050c93          	mv	s9,a0
f90028c8:	00058793          	mv	a5,a1
f90028cc:	00072503          	lw	a0,0(a4)
f90028d0:	00472583          	lw	a1,4(a4)
f90028d4:	000c8613          	mv	a2,s9
f90028d8:	00078693          	mv	a3,a5
f90028dc:	411010ef          	jal	ra,f90044ec <__divdf3>
f90028e0:	f49ff06f          	j	f9002828 <__ieee754_pow+0x260>
f90028e4:	da0604e3          	beqz	a2,f900268c <__ieee754_pow+0xc4>
f90028e8:	d41ff06f          	j	f9002628 <__ieee754_pow+0x60>
f90028ec:	00200d13          	li	s10,2
f90028f0:	db5ff06f          	j	f90026a4 <__ieee754_pow+0xdc>
f90028f4:	00098613          	mv	a2,s3
f90028f8:	00048693          	mv	a3,s1
f90028fc:	00098513          	mv	a0,s3
f9002900:	00048593          	mv	a1,s1
f9002904:	b11fe0ef          	jal	ra,f9001414 <__subdf3>
f9002908:	00050613          	mv	a2,a0
f900290c:	00058693          	mv	a3,a1
f9002910:	3dd010ef          	jal	ra,f90044ec <__divdf3>
f9002914:	d2dff06f          	j	f9002640 <__ieee754_pow+0x78>
f9002918:	7ff006b7          	lui	a3,0x7ff00
f900291c:	0096f4b3          	and	s1,a3,s1
f9002920:	00000613          	li	a2,0
f9002924:	02049463          	bnez	s1,f900294c <__ieee754_pow+0x384>
f9002928:	00002697          	auipc	a3,0x2
f900292c:	79068693          	addi	a3,a3,1936 # f90050b8 <__clz_tab+0x170>
f9002930:	0006a603          	lw	a2,0(a3)
f9002934:	0046a683          	lw	a3,4(a3)
f9002938:	01c12423          	sw	t3,8(sp)
f900293c:	c84fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002940:	00812e03          	lw	t3,8(sp)
f9002944:	00058413          	mv	s0,a1
f9002948:	fcb00613          	li	a2,-53
f900294c:	001005b7          	lui	a1,0x100
f9002950:	41445e93          	srai	t4,s0,0x14
f9002954:	fff58813          	addi	a6,a1,-1 # fffff <__stack_size+0xfdfff>
f9002958:	0003a6b7          	lui	a3,0x3a
f900295c:	c01e8e93          	addi	t4,t4,-1023
f9002960:	01047833          	and	a6,s0,a6
f9002964:	3ff00c37          	lui	s8,0x3ff00
f9002968:	88e68693          	addi	a3,a3,-1906 # 3988e <__stack_size+0x3788e>
f900296c:	00ce8eb3          	add	t4,t4,a2
f9002970:	01886c33          	or	s8,a6,s8
f9002974:	1b06d8e3          	bge	a3,a6,f9003324 <__ieee754_pow+0xd5c>
f9002978:	000bb6b7          	lui	a3,0xbb
f900297c:	67968693          	addi	a3,a3,1657 # bb679 <__stack_size+0xb9679>
f9002980:	3b06dee3          	bge	a3,a6,f900353c <__ieee754_pow+0xf74>
f9002984:	00002a97          	auipc	s5,0x2
f9002988:	6c4a8a93          	addi	s5,s5,1732 # f9005048 <__clz_tab+0x100>
f900298c:	001e8e93          	addi	t4,t4,1
f9002990:	40bc0c33          	sub	s8,s8,a1
f9002994:	000aa783          	lw	a5,0(s5)
f9002998:	004aa803          	lw	a6,4(s5)
f900299c:	00012823          	sw	zero,16(sp)
f90029a0:	00012a23          	sw	zero,20(sp)
f90029a4:	02012c23          	sw	zero,56(sp)
f90029a8:	02012e23          	sw	zero,60(sp)
f90029ac:	00000993          	li	s3,0
f90029b0:	00f12423          	sw	a5,8(sp)
f90029b4:	01012623          	sw	a6,12(sp)
f90029b8:	00812403          	lw	s0,8(sp)
f90029bc:	00c12483          	lw	s1,12(sp)
f90029c0:	000c0593          	mv	a1,s8
f90029c4:	00040613          	mv	a2,s0
f90029c8:	00048693          	mv	a3,s1
f90029cc:	03d12a23          	sw	t4,52(sp)
f90029d0:	03c12823          	sw	t3,48(sp)
f90029d4:	00050913          	mv	s2,a0
f90029d8:	a3dfe0ef          	jal	ra,f9001414 <__subdf3>
f90029dc:	00050b13          	mv	s6,a0
f90029e0:	00058b93          	mv	s7,a1
f90029e4:	00040613          	mv	a2,s0
f90029e8:	00048693          	mv	a3,s1
f90029ec:	00090513          	mv	a0,s2
f90029f0:	000c0593          	mv	a1,s8
f90029f4:	00812423          	sw	s0,8(sp)
f90029f8:	00912623          	sw	s1,12(sp)
f90029fc:	26c010ef          	jal	ra,f9003c68 <__adddf3>
f9002a00:	00050613          	mv	a2,a0
f9002a04:	00058693          	mv	a3,a1
f9002a08:	000aa503          	lw	a0,0(s5)
f9002a0c:	004aa583          	lw	a1,4(s5)
f9002a10:	00000493          	li	s1,0
f9002a14:	2d9010ef          	jal	ra,f90044ec <__divdf3>
f9002a18:	00050613          	mv	a2,a0
f9002a1c:	00058693          	mv	a3,a1
f9002a20:	00a12c23          	sw	a0,24(sp)
f9002a24:	00b12e23          	sw	a1,28(sp)
f9002a28:	000b0513          	mv	a0,s6
f9002a2c:	000b8593          	mv	a1,s7
f9002a30:	b90fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002a34:	401c5f13          	srai	t5,s8,0x1
f9002a38:	200006b7          	lui	a3,0x20000
f9002a3c:	00df6f33          	or	t5,t5,a3
f9002a40:	000806b7          	lui	a3,0x80
f9002a44:	00df0f33          	add	t5,t5,a3
f9002a48:	013f09b3          	add	s3,t5,s3
f9002a4c:	00050a13          	mv	s4,a0
f9002a50:	00098693          	mv	a3,s3
f9002a54:	00000613          	li	a2,0
f9002a58:	00048513          	mv	a0,s1
f9002a5c:	00058413          	mv	s0,a1
f9002a60:	b60fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002a64:	00050613          	mv	a2,a0
f9002a68:	00058693          	mv	a3,a1
f9002a6c:	000b0513          	mv	a0,s6
f9002a70:	000b8593          	mv	a1,s7
f9002a74:	9a1fe0ef          	jal	ra,f9001414 <__subdf3>
f9002a78:	00812603          	lw	a2,8(sp)
f9002a7c:	00c12683          	lw	a3,12(sp)
f9002a80:	00050b13          	mv	s6,a0
f9002a84:	00058b93          	mv	s7,a1
f9002a88:	00000513          	li	a0,0
f9002a8c:	00098593          	mv	a1,s3
f9002a90:	985fe0ef          	jal	ra,f9001414 <__subdf3>
f9002a94:	00050613          	mv	a2,a0
f9002a98:	00058693          	mv	a3,a1
f9002a9c:	00090513          	mv	a0,s2
f9002aa0:	000c0593          	mv	a1,s8
f9002aa4:	971fe0ef          	jal	ra,f9001414 <__subdf3>
f9002aa8:	00048613          	mv	a2,s1
f9002aac:	00040693          	mv	a3,s0
f9002ab0:	b10fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002ab4:	00050613          	mv	a2,a0
f9002ab8:	00058693          	mv	a3,a1
f9002abc:	000b0513          	mv	a0,s6
f9002ac0:	000b8593          	mv	a1,s7
f9002ac4:	951fe0ef          	jal	ra,f9001414 <__subdf3>
f9002ac8:	01812803          	lw	a6,24(sp)
f9002acc:	01c12883          	lw	a7,28(sp)
f9002ad0:	00002b97          	auipc	s7,0x2
f9002ad4:	620b8b93          	addi	s7,s7,1568 # f90050f0 <__clz_tab+0x1a8>
f9002ad8:	00080613          	mv	a2,a6
f9002adc:	00088693          	mv	a3,a7
f9002ae0:	ae0fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002ae4:	000a0613          	mv	a2,s4
f9002ae8:	00040693          	mv	a3,s0
f9002aec:	00a12423          	sw	a0,8(sp)
f9002af0:	00b12623          	sw	a1,12(sp)
f9002af4:	000a0513          	mv	a0,s4
f9002af8:	00040593          	mv	a1,s0
f9002afc:	ac4fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002b00:	00002697          	auipc	a3,0x2
f9002b04:	5c068693          	addi	a3,a3,1472 # f90050c0 <__clz_tab+0x178>
f9002b08:	0006a603          	lw	a2,0(a3)
f9002b0c:	0046a683          	lw	a3,4(a3)
f9002b10:	00050913          	mv	s2,a0
f9002b14:	00058993          	mv	s3,a1
f9002b18:	aa8fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002b1c:	00002697          	auipc	a3,0x2
f9002b20:	5ac68693          	addi	a3,a3,1452 # f90050c8 <__clz_tab+0x180>
f9002b24:	0006a603          	lw	a2,0(a3)
f9002b28:	0046a683          	lw	a3,4(a3)
f9002b2c:	00000b13          	li	s6,0
f9002b30:	00000c13          	li	s8,0
f9002b34:	134010ef          	jal	ra,f9003c68 <__adddf3>
f9002b38:	00090613          	mv	a2,s2
f9002b3c:	00098693          	mv	a3,s3
f9002b40:	a80fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002b44:	00002697          	auipc	a3,0x2
f9002b48:	58c68693          	addi	a3,a3,1420 # f90050d0 <__clz_tab+0x188>
f9002b4c:	0006a603          	lw	a2,0(a3)
f9002b50:	0046a683          	lw	a3,4(a3)
f9002b54:	114010ef          	jal	ra,f9003c68 <__adddf3>
f9002b58:	00090613          	mv	a2,s2
f9002b5c:	00098693          	mv	a3,s3
f9002b60:	a60fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002b64:	00002697          	auipc	a3,0x2
f9002b68:	57468693          	addi	a3,a3,1396 # f90050d8 <__clz_tab+0x190>
f9002b6c:	0006a603          	lw	a2,0(a3)
f9002b70:	0046a683          	lw	a3,4(a3)
f9002b74:	0f4010ef          	jal	ra,f9003c68 <__adddf3>
f9002b78:	00090613          	mv	a2,s2
f9002b7c:	00098693          	mv	a3,s3
f9002b80:	a40fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002b84:	00002697          	auipc	a3,0x2
f9002b88:	55c68693          	addi	a3,a3,1372 # f90050e0 <__clz_tab+0x198>
f9002b8c:	0006a603          	lw	a2,0(a3)
f9002b90:	0046a683          	lw	a3,4(a3)
f9002b94:	0d4010ef          	jal	ra,f9003c68 <__adddf3>
f9002b98:	00090613          	mv	a2,s2
f9002b9c:	00098693          	mv	a3,s3
f9002ba0:	a20fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002ba4:	00002697          	auipc	a3,0x2
f9002ba8:	54468693          	addi	a3,a3,1348 # f90050e8 <__clz_tab+0x1a0>
f9002bac:	0006a603          	lw	a2,0(a3)
f9002bb0:	0046a683          	lw	a3,4(a3)
f9002bb4:	0b4010ef          	jal	ra,f9003c68 <__adddf3>
f9002bb8:	00090613          	mv	a2,s2
f9002bbc:	00098693          	mv	a3,s3
f9002bc0:	00a12c23          	sw	a0,24(sp)
f9002bc4:	00b12e23          	sw	a1,28(sp)
f9002bc8:	00090513          	mv	a0,s2
f9002bcc:	00098593          	mv	a1,s3
f9002bd0:	9f0fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002bd4:	01812703          	lw	a4,24(sp)
f9002bd8:	01c12783          	lw	a5,28(sp)
f9002bdc:	00050613          	mv	a2,a0
f9002be0:	00058693          	mv	a3,a1
f9002be4:	00070513          	mv	a0,a4
f9002be8:	00078593          	mv	a1,a5
f9002bec:	9d4fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002bf0:	00050913          	mv	s2,a0
f9002bf4:	00058993          	mv	s3,a1
f9002bf8:	00048613          	mv	a2,s1
f9002bfc:	00040693          	mv	a3,s0
f9002c00:	000a0513          	mv	a0,s4
f9002c04:	00040593          	mv	a1,s0
f9002c08:	060010ef          	jal	ra,f9003c68 <__adddf3>
f9002c0c:	00812603          	lw	a2,8(sp)
f9002c10:	00c12683          	lw	a3,12(sp)
f9002c14:	9acfe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002c18:	00090613          	mv	a2,s2
f9002c1c:	00098693          	mv	a3,s3
f9002c20:	048010ef          	jal	ra,f9003c68 <__adddf3>
f9002c24:	00050913          	mv	s2,a0
f9002c28:	00058993          	mv	s3,a1
f9002c2c:	00048613          	mv	a2,s1
f9002c30:	00040693          	mv	a3,s0
f9002c34:	00048513          	mv	a0,s1
f9002c38:	00040593          	mv	a1,s0
f9002c3c:	984fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002c40:	000ba603          	lw	a2,0(s7)
f9002c44:	004ba683          	lw	a3,4(s7)
f9002c48:	02a12423          	sw	a0,40(sp)
f9002c4c:	02b12623          	sw	a1,44(sp)
f9002c50:	018010ef          	jal	ra,f9003c68 <__adddf3>
f9002c54:	00090613          	mv	a2,s2
f9002c58:	00098693          	mv	a3,s3
f9002c5c:	01212c23          	sw	s2,24(sp)
f9002c60:	01312e23          	sw	s3,28(sp)
f9002c64:	004010ef          	jal	ra,f9003c68 <__adddf3>
f9002c68:	00058913          	mv	s2,a1
f9002c6c:	000b0613          	mv	a2,s6
f9002c70:	00058693          	mv	a3,a1
f9002c74:	00048513          	mv	a0,s1
f9002c78:	00040593          	mv	a1,s0
f9002c7c:	944fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002c80:	000ba603          	lw	a2,0(s7)
f9002c84:	004ba683          	lw	a3,4(s7)
f9002c88:	02a12023          	sw	a0,32(sp)
f9002c8c:	02b12223          	sw	a1,36(sp)
f9002c90:	000b0513          	mv	a0,s6
f9002c94:	00090593          	mv	a1,s2
f9002c98:	f7cfe0ef          	jal	ra,f9001414 <__subdf3>
f9002c9c:	02812f03          	lw	t5,40(sp)
f9002ca0:	02c12f83          	lw	t6,44(sp)
f9002ca4:	000f0613          	mv	a2,t5
f9002ca8:	000f8693          	mv	a3,t6
f9002cac:	f68fe0ef          	jal	ra,f9001414 <__subdf3>
f9002cb0:	00050613          	mv	a2,a0
f9002cb4:	00058693          	mv	a3,a1
f9002cb8:	01812503          	lw	a0,24(sp)
f9002cbc:	01c12583          	lw	a1,28(sp)
f9002cc0:	f54fe0ef          	jal	ra,f9001414 <__subdf3>
f9002cc4:	000a0613          	mv	a2,s4
f9002cc8:	00040693          	mv	a3,s0
f9002ccc:	8f4fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002cd0:	00050413          	mv	s0,a0
f9002cd4:	00058493          	mv	s1,a1
f9002cd8:	00812503          	lw	a0,8(sp)
f9002cdc:	00c12583          	lw	a1,12(sp)
f9002ce0:	000b0613          	mv	a2,s6
f9002ce4:	00090693          	mv	a3,s2
f9002ce8:	8d8fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002cec:	00050613          	mv	a2,a0
f9002cf0:	00058693          	mv	a3,a1
f9002cf4:	00040513          	mv	a0,s0
f9002cf8:	00048593          	mv	a1,s1
f9002cfc:	76d000ef          	jal	ra,f9003c68 <__adddf3>
f9002d00:	02012b03          	lw	s6,32(sp)
f9002d04:	02412b83          	lw	s7,36(sp)
f9002d08:	00050413          	mv	s0,a0
f9002d0c:	00058493          	mv	s1,a1
f9002d10:	00050613          	mv	a2,a0
f9002d14:	00058693          	mv	a3,a1
f9002d18:	000b0513          	mv	a0,s6
f9002d1c:	000b8593          	mv	a1,s7
f9002d20:	749000ef          	jal	ra,f9003c68 <__adddf3>
f9002d24:	00002697          	auipc	a3,0x2
f9002d28:	3d468693          	addi	a3,a3,980 # f90050f8 <__clz_tab+0x1b0>
f9002d2c:	0006a603          	lw	a2,0(a3)
f9002d30:	0046a683          	lw	a3,4(a3)
f9002d34:	000c0513          	mv	a0,s8
f9002d38:	00058a13          	mv	s4,a1
f9002d3c:	884fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002d40:	00050913          	mv	s2,a0
f9002d44:	00058993          	mv	s3,a1
f9002d48:	000b0613          	mv	a2,s6
f9002d4c:	000b8693          	mv	a3,s7
f9002d50:	000c0513          	mv	a0,s8
f9002d54:	000a0593          	mv	a1,s4
f9002d58:	ebcfe0ef          	jal	ra,f9001414 <__subdf3>
f9002d5c:	00050613          	mv	a2,a0
f9002d60:	00058693          	mv	a3,a1
f9002d64:	00040513          	mv	a0,s0
f9002d68:	00048593          	mv	a1,s1
f9002d6c:	ea8fe0ef          	jal	ra,f9001414 <__subdf3>
f9002d70:	00002697          	auipc	a3,0x2
f9002d74:	39068693          	addi	a3,a3,912 # f9005100 <__clz_tab+0x1b8>
f9002d78:	0006a603          	lw	a2,0(a3)
f9002d7c:	0046a683          	lw	a3,4(a3)
f9002d80:	840fe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002d84:	00002697          	auipc	a3,0x2
f9002d88:	38468693          	addi	a3,a3,900 # f9005108 <__clz_tab+0x1c0>
f9002d8c:	0006a603          	lw	a2,0(a3)
f9002d90:	0046a683          	lw	a3,4(a3)
f9002d94:	00050413          	mv	s0,a0
f9002d98:	00058493          	mv	s1,a1
f9002d9c:	000c0513          	mv	a0,s8
f9002da0:	000a0593          	mv	a1,s4
f9002da4:	81cfe0ef          	jal	ra,f9000dc0 <__muldf3>
f9002da8:	00050613          	mv	a2,a0
f9002dac:	00058693          	mv	a3,a1
f9002db0:	00040513          	mv	a0,s0
f9002db4:	00048593          	mv	a1,s1
f9002db8:	6b1000ef          	jal	ra,f9003c68 <__adddf3>
f9002dbc:	03812603          	lw	a2,56(sp)
f9002dc0:	03c12683          	lw	a3,60(sp)
f9002dc4:	6a5000ef          	jal	ra,f9003c68 <__adddf3>
f9002dc8:	03412e83          	lw	t4,52(sp)
f9002dcc:	00050b13          	mv	s6,a0
f9002dd0:	00058b93          	mv	s7,a1
f9002dd4:	000e8513          	mv	a0,t4
f9002dd8:	f3dfe0ef          	jal	ra,f9001d14 <__floatsidf>
f9002ddc:	00050413          	mv	s0,a0
f9002de0:	00058493          	mv	s1,a1
f9002de4:	000b0613          	mv	a2,s6
f9002de8:	000b8693          	mv	a3,s7
f9002dec:	00090513          	mv	a0,s2
f9002df0:	00098593          	mv	a1,s3
f9002df4:	675000ef          	jal	ra,f9003c68 <__adddf3>
f9002df8:	01012603          	lw	a2,16(sp)
f9002dfc:	01412683          	lw	a3,20(sp)
f9002e00:	669000ef          	jal	ra,f9003c68 <__adddf3>
f9002e04:	00040613          	mv	a2,s0
f9002e08:	00048693          	mv	a3,s1
f9002e0c:	65d000ef          	jal	ra,f9003c68 <__adddf3>
f9002e10:	00000613          	li	a2,0
f9002e14:	00060513          	mv	a0,a2
f9002e18:	00048693          	mv	a3,s1
f9002e1c:	00040613          	mv	a2,s0
f9002e20:	00058493          	mv	s1,a1
f9002e24:	00050413          	mv	s0,a0
f9002e28:	decfe0ef          	jal	ra,f9001414 <__subdf3>
f9002e2c:	01012603          	lw	a2,16(sp)
f9002e30:	01412683          	lw	a3,20(sp)
f9002e34:	de0fe0ef          	jal	ra,f9001414 <__subdf3>
f9002e38:	00090613          	mv	a2,s2
f9002e3c:	00098693          	mv	a3,s3
f9002e40:	dd4fe0ef          	jal	ra,f9001414 <__subdf3>
f9002e44:	00050613          	mv	a2,a0
f9002e48:	00058693          	mv	a3,a1
f9002e4c:	000b0513          	mv	a0,s6
f9002e50:	000b8593          	mv	a1,s7
f9002e54:	dc0fe0ef          	jal	ra,f9001414 <__subdf3>
f9002e58:	03012e03          	lw	t3,48(sp)
f9002e5c:	00050913          	mv	s2,a0
f9002e60:	00058993          	mv	s3,a1
f9002e64:	fffd0313          	addi	t1,s10,-1
f9002e68:	01c36e33          	or	t3,t1,t3
f9002e6c:	480e1863          	bnez	t3,f90032fc <__ieee754_pow+0xd34>
f9002e70:	00002697          	auipc	a3,0x2
f9002e74:	20868693          	addi	a3,a3,520 # f9005078 <__clz_tab+0x130>
f9002e78:	0006a783          	lw	a5,0(a3)
f9002e7c:	0046a803          	lw	a6,4(a3)
f9002e80:	00f12423          	sw	a5,8(sp)
f9002e84:	01012623          	sw	a6,12(sp)
f9002e88:	00000c13          	li	s8,0
f9002e8c:	000c0613          	mv	a2,s8
f9002e90:	000d8693          	mv	a3,s11
f9002e94:	000c8513          	mv	a0,s9
f9002e98:	000d8593          	mv	a1,s11
f9002e9c:	d78fe0ef          	jal	ra,f9001414 <__subdf3>
f9002ea0:	00040613          	mv	a2,s0
f9002ea4:	00048693          	mv	a3,s1
f9002ea8:	f19fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9002eac:	00050b13          	mv	s6,a0
f9002eb0:	00058b93          	mv	s7,a1
f9002eb4:	000c8613          	mv	a2,s9
f9002eb8:	000d8693          	mv	a3,s11
f9002ebc:	00090513          	mv	a0,s2
f9002ec0:	00098593          	mv	a1,s3
f9002ec4:	efdfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9002ec8:	00050613          	mv	a2,a0
f9002ecc:	00058693          	mv	a3,a1
f9002ed0:	000b0513          	mv	a0,s6
f9002ed4:	000b8593          	mv	a1,s7
f9002ed8:	591000ef          	jal	ra,f9003c68 <__adddf3>
f9002edc:	00050913          	mv	s2,a0
f9002ee0:	00058993          	mv	s3,a1
f9002ee4:	000c0613          	mv	a2,s8
f9002ee8:	000d8693          	mv	a3,s11
f9002eec:	00040513          	mv	a0,s0
f9002ef0:	00048593          	mv	a1,s1
f9002ef4:	ecdfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9002ef8:	00050613          	mv	a2,a0
f9002efc:	00058693          	mv	a3,a1
f9002f00:	00050413          	mv	s0,a0
f9002f04:	00058493          	mv	s1,a1
f9002f08:	00090513          	mv	a0,s2
f9002f0c:	00098593          	mv	a1,s3
f9002f10:	559000ef          	jal	ra,f9003c68 <__adddf3>
f9002f14:	409007b7          	lui	a5,0x40900
f9002f18:	00050a13          	mv	s4,a0
f9002f1c:	00058b13          	mv	s6,a1
f9002f20:	00058b93          	mv	s7,a1
f9002f24:	36f5c463          	blt	a1,a5,f900328c <__ieee754_pow+0xcc4>
f9002f28:	40f587b3          	sub	a5,a1,a5
f9002f2c:	00a7e7b3          	or	a5,a5,a0
f9002f30:	5e079463          	bnez	a5,f9003518 <__ieee754_pow+0xf50>
f9002f34:	00002797          	auipc	a5,0x2
f9002f38:	1dc78793          	addi	a5,a5,476 # f9005110 <__clz_tab+0x1c8>
f9002f3c:	0007a603          	lw	a2,0(a5)
f9002f40:	0047a683          	lw	a3,4(a5)
f9002f44:	00090513          	mv	a0,s2
f9002f48:	00098593          	mv	a1,s3
f9002f4c:	51d000ef          	jal	ra,f9003c68 <__adddf3>
f9002f50:	00050d13          	mv	s10,a0
f9002f54:	00058d93          	mv	s11,a1
f9002f58:	00040613          	mv	a2,s0
f9002f5c:	00048693          	mv	a3,s1
f9002f60:	000a0513          	mv	a0,s4
f9002f64:	000b0593          	mv	a1,s6
f9002f68:	cacfe0ef          	jal	ra,f9001414 <__subdf3>
f9002f6c:	00050613          	mv	a2,a0
f9002f70:	00058693          	mv	a3,a1
f9002f74:	000d0513          	mv	a0,s10
f9002f78:	000d8593          	mv	a1,s11
f9002f7c:	579010ef          	jal	ra,f9004cf4 <__gedf2>
f9002f80:	58a04c63          	bgtz	a0,f9003518 <__ieee754_pow+0xf50>
f9002f84:	414bd793          	srai	a5,s7,0x14
f9002f88:	7ff7f793          	andi	a5,a5,2047
f9002f8c:	00100537          	lui	a0,0x100
f9002f90:	c0278793          	addi	a5,a5,-1022
f9002f94:	40f557b3          	sra	a5,a0,a5
f9002f98:	017787b3          	add	a5,a5,s7
f9002f9c:	4147d713          	srai	a4,a5,0x14
f9002fa0:	7ff77713          	andi	a4,a4,2047
f9002fa4:	c0170713          	addi	a4,a4,-1023
f9002fa8:	fff50a13          	addi	s4,a0,-1 # fffff <__stack_size+0xfdfff>
f9002fac:	40ea55b3          	sra	a1,s4,a4
f9002fb0:	fff5c593          	not	a1,a1
f9002fb4:	00f5f5b3          	and	a1,a1,a5
f9002fb8:	0147fa33          	and	s4,a5,s4
f9002fbc:	01400793          	li	a5,20
f9002fc0:	00aa6a33          	or	s4,s4,a0
f9002fc4:	40e78733          	sub	a4,a5,a4
f9002fc8:	00000613          	li	a2,0
f9002fcc:	00058693          	mv	a3,a1
f9002fd0:	40ea5a33          	sra	s4,s4,a4
f9002fd4:	000bd463          	bgez	s7,f9002fdc <__ieee754_pow+0xa14>
f9002fd8:	41400a33          	neg	s4,s4
f9002fdc:	00040513          	mv	a0,s0
f9002fe0:	00048593          	mv	a1,s1
f9002fe4:	c30fe0ef          	jal	ra,f9001414 <__subdf3>
f9002fe8:	00050613          	mv	a2,a0
f9002fec:	00058693          	mv	a3,a1
f9002ff0:	00050413          	mv	s0,a0
f9002ff4:	00058493          	mv	s1,a1
f9002ff8:	00090513          	mv	a0,s2
f9002ffc:	00098593          	mv	a1,s3
f9003000:	469000ef          	jal	ra,f9003c68 <__adddf3>
f9003004:	00058b13          	mv	s6,a1
f9003008:	014a1d93          	slli	s11,s4,0x14
f900300c:	00002717          	auipc	a4,0x2
f9003010:	11470713          	addi	a4,a4,276 # f9005120 <__clz_tab+0x1d8>
f9003014:	00072603          	lw	a2,0(a4)
f9003018:	00472683          	lw	a3,4(a4)
f900301c:	00000c13          	li	s8,0
f9003020:	000c0513          	mv	a0,s8
f9003024:	000b0593          	mv	a1,s6
f9003028:	d99fd0ef          	jal	ra,f9000dc0 <__muldf3>
f900302c:	000b0d13          	mv	s10,s6
f9003030:	00058b93          	mv	s7,a1
f9003034:	00050b13          	mv	s6,a0
f9003038:	00040613          	mv	a2,s0
f900303c:	00048693          	mv	a3,s1
f9003040:	000c0513          	mv	a0,s8
f9003044:	000d0593          	mv	a1,s10
f9003048:	bccfe0ef          	jal	ra,f9001414 <__subdf3>
f900304c:	00050613          	mv	a2,a0
f9003050:	00058693          	mv	a3,a1
f9003054:	00090513          	mv	a0,s2
f9003058:	00098593          	mv	a1,s3
f900305c:	bb8fe0ef          	jal	ra,f9001414 <__subdf3>
f9003060:	00002717          	auipc	a4,0x2
f9003064:	0c870713          	addi	a4,a4,200 # f9005128 <__clz_tab+0x1e0>
f9003068:	00072603          	lw	a2,0(a4)
f900306c:	00472683          	lw	a3,4(a4)
f9003070:	d51fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003074:	00002717          	auipc	a4,0x2
f9003078:	0bc70713          	addi	a4,a4,188 # f9005130 <__clz_tab+0x1e8>
f900307c:	00072603          	lw	a2,0(a4)
f9003080:	00472683          	lw	a3,4(a4)
f9003084:	00050413          	mv	s0,a0
f9003088:	00058493          	mv	s1,a1
f900308c:	000c0513          	mv	a0,s8
f9003090:	000d0593          	mv	a1,s10
f9003094:	d2dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003098:	00050613          	mv	a2,a0
f900309c:	00058693          	mv	a3,a1
f90030a0:	00040513          	mv	a0,s0
f90030a4:	00048593          	mv	a1,s1
f90030a8:	3c1000ef          	jal	ra,f9003c68 <__adddf3>
f90030ac:	00050913          	mv	s2,a0
f90030b0:	00058993          	mv	s3,a1
f90030b4:	00050613          	mv	a2,a0
f90030b8:	00058693          	mv	a3,a1
f90030bc:	000b0513          	mv	a0,s6
f90030c0:	000b8593          	mv	a1,s7
f90030c4:	3a5000ef          	jal	ra,f9003c68 <__adddf3>
f90030c8:	000b0613          	mv	a2,s6
f90030cc:	000b8693          	mv	a3,s7
f90030d0:	00050413          	mv	s0,a0
f90030d4:	00058493          	mv	s1,a1
f90030d8:	b3cfe0ef          	jal	ra,f9001414 <__subdf3>
f90030dc:	00050613          	mv	a2,a0
f90030e0:	00058693          	mv	a3,a1
f90030e4:	00090513          	mv	a0,s2
f90030e8:	00098593          	mv	a1,s3
f90030ec:	b28fe0ef          	jal	ra,f9001414 <__subdf3>
f90030f0:	00050b13          	mv	s6,a0
f90030f4:	00058b93          	mv	s7,a1
f90030f8:	00040613          	mv	a2,s0
f90030fc:	00048693          	mv	a3,s1
f9003100:	00040513          	mv	a0,s0
f9003104:	00048593          	mv	a1,s1
f9003108:	cb9fd0ef          	jal	ra,f9000dc0 <__muldf3>
f900310c:	00002797          	auipc	a5,0x2
f9003110:	02c78793          	addi	a5,a5,44 # f9005138 <__clz_tab+0x1f0>
f9003114:	0007a603          	lw	a2,0(a5)
f9003118:	0047a683          	lw	a3,4(a5)
f900311c:	00050913          	mv	s2,a0
f9003120:	00058993          	mv	s3,a1
f9003124:	c9dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003128:	00002797          	auipc	a5,0x2
f900312c:	01878793          	addi	a5,a5,24 # f9005140 <__clz_tab+0x1f8>
f9003130:	0007a603          	lw	a2,0(a5)
f9003134:	0047a683          	lw	a3,4(a5)
f9003138:	adcfe0ef          	jal	ra,f9001414 <__subdf3>
f900313c:	00090613          	mv	a2,s2
f9003140:	00098693          	mv	a3,s3
f9003144:	c7dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003148:	00002797          	auipc	a5,0x2
f900314c:	00078793          	mv	a5,a5
f9003150:	0007a603          	lw	a2,0(a5) # f9005148 <__clz_tab+0x200>
f9003154:	0047a683          	lw	a3,4(a5)
f9003158:	311000ef          	jal	ra,f9003c68 <__adddf3>
f900315c:	00090613          	mv	a2,s2
f9003160:	00098693          	mv	a3,s3
f9003164:	c5dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003168:	00002797          	auipc	a5,0x2
f900316c:	fe878793          	addi	a5,a5,-24 # f9005150 <__clz_tab+0x208>
f9003170:	0007a603          	lw	a2,0(a5)
f9003174:	0047a683          	lw	a3,4(a5)
f9003178:	a9cfe0ef          	jal	ra,f9001414 <__subdf3>
f900317c:	00090613          	mv	a2,s2
f9003180:	00098693          	mv	a3,s3
f9003184:	c3dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003188:	00002797          	auipc	a5,0x2
f900318c:	fd078793          	addi	a5,a5,-48 # f9005158 <__clz_tab+0x210>
f9003190:	0007a603          	lw	a2,0(a5)
f9003194:	0047a683          	lw	a3,4(a5)
f9003198:	2d1000ef          	jal	ra,f9003c68 <__adddf3>
f900319c:	00090613          	mv	a2,s2
f90031a0:	00098693          	mv	a3,s3
f90031a4:	c1dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f90031a8:	00050613          	mv	a2,a0
f90031ac:	00058693          	mv	a3,a1
f90031b0:	00040513          	mv	a0,s0
f90031b4:	00048593          	mv	a1,s1
f90031b8:	a5cfe0ef          	jal	ra,f9001414 <__subdf3>
f90031bc:	00050613          	mv	a2,a0
f90031c0:	00058693          	mv	a3,a1
f90031c4:	00050c13          	mv	s8,a0
f90031c8:	00058c93          	mv	s9,a1
f90031cc:	00040513          	mv	a0,s0
f90031d0:	00048593          	mv	a1,s1
f90031d4:	bedfd0ef          	jal	ra,f9000dc0 <__muldf3>
f90031d8:	00002697          	auipc	a3,0x2
f90031dc:	f8868693          	addi	a3,a3,-120 # f9005160 <__clz_tab+0x218>
f90031e0:	0006a603          	lw	a2,0(a3)
f90031e4:	0046a683          	lw	a3,4(a3)
f90031e8:	00050913          	mv	s2,a0
f90031ec:	00058993          	mv	s3,a1
f90031f0:	000c0513          	mv	a0,s8
f90031f4:	000c8593          	mv	a1,s9
f90031f8:	a1cfe0ef          	jal	ra,f9001414 <__subdf3>
f90031fc:	00050613          	mv	a2,a0
f9003200:	00058693          	mv	a3,a1
f9003204:	00090513          	mv	a0,s2
f9003208:	00098593          	mv	a1,s3
f900320c:	2e0010ef          	jal	ra,f90044ec <__divdf3>
f9003210:	00050913          	mv	s2,a0
f9003214:	00058993          	mv	s3,a1
f9003218:	000b0613          	mv	a2,s6
f900321c:	000b8693          	mv	a3,s7
f9003220:	00040513          	mv	a0,s0
f9003224:	00048593          	mv	a1,s1
f9003228:	b99fd0ef          	jal	ra,f9000dc0 <__muldf3>
f900322c:	000b0613          	mv	a2,s6
f9003230:	000b8693          	mv	a3,s7
f9003234:	235000ef          	jal	ra,f9003c68 <__adddf3>
f9003238:	00050613          	mv	a2,a0
f900323c:	00058693          	mv	a3,a1
f9003240:	00090513          	mv	a0,s2
f9003244:	00098593          	mv	a1,s3
f9003248:	9ccfe0ef          	jal	ra,f9001414 <__subdf3>
f900324c:	00040613          	mv	a2,s0
f9003250:	00048693          	mv	a3,s1
f9003254:	9c0fe0ef          	jal	ra,f9001414 <__subdf3>
f9003258:	00058693          	mv	a3,a1
f900325c:	00050613          	mv	a2,a0
f9003260:	004aa583          	lw	a1,4(s5)
f9003264:	000aa503          	lw	a0,0(s5)
f9003268:	9acfe0ef          	jal	ra,f9001414 <__subdf3>
f900326c:	00bd87b3          	add	a5,s11,a1
f9003270:	4147d693          	srai	a3,a5,0x14
f9003274:	32d05063          	blez	a3,f9003594 <__ieee754_pow+0xfcc>
f9003278:	00078593          	mv	a1,a5
f900327c:	00812603          	lw	a2,8(sp)
f9003280:	00c12683          	lw	a3,12(sp)
f9003284:	b3dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003288:	bb8ff06f          	j	f9002640 <__ieee754_pow+0x78>
f900328c:	00159793          	slli	a5,a1,0x1
f9003290:	4090d6b7          	lui	a3,0x4090d
f9003294:	0017d793          	srli	a5,a5,0x1
f9003298:	bff68693          	addi	a3,a3,-1025 # 4090cbff <__stack_size+0x4090abff>
f900329c:	26f6d263          	bge	a3,a5,f9003500 <__ieee754_pow+0xf38>
f90032a0:	3f6f37b7          	lui	a5,0x3f6f3
f90032a4:	40078793          	addi	a5,a5,1024 # 3f6f3400 <__stack_size+0x3f6f1400>
f90032a8:	00f587b3          	add	a5,a1,a5
f90032ac:	00a7e7b3          	or	a5,a5,a0
f90032b0:	02079063          	bnez	a5,f90032d0 <__ieee754_pow+0xd08>
f90032b4:	00040613          	mv	a2,s0
f90032b8:	00048693          	mv	a3,s1
f90032bc:	958fe0ef          	jal	ra,f9001414 <__subdf3>
f90032c0:	00090613          	mv	a2,s2
f90032c4:	00098693          	mv	a3,s3
f90032c8:	22d010ef          	jal	ra,f9004cf4 <__gedf2>
f90032cc:	ca054ce3          	bltz	a0,f9002f84 <__ieee754_pow+0x9bc>
f90032d0:	00002417          	auipc	s0,0x2
f90032d4:	e4840413          	addi	s0,s0,-440 # f9005118 <__clz_tab+0x1d0>
f90032d8:	00042603          	lw	a2,0(s0)
f90032dc:	00442683          	lw	a3,4(s0)
f90032e0:	00812503          	lw	a0,8(sp)
f90032e4:	00c12583          	lw	a1,12(sp)
f90032e8:	ad9fd0ef          	jal	ra,f9000dc0 <__muldf3>
f90032ec:	00042603          	lw	a2,0(s0)
f90032f0:	00442683          	lw	a3,4(s0)
f90032f4:	acdfd0ef          	jal	ra,f9000dc0 <__muldf3>
f90032f8:	b48ff06f          	j	f9002640 <__ieee754_pow+0x78>
f90032fc:	000aa783          	lw	a5,0(s5)
f9003300:	004aa803          	lw	a6,4(s5)
f9003304:	00f12423          	sw	a5,8(sp)
f9003308:	01012623          	sw	a6,12(sp)
f900330c:	b7dff06f          	j	f9002e88 <__ieee754_pow+0x8c0>
f9003310:	d60dd663          	bgez	s11,f900287c <__ieee754_pow+0x2b4>
f9003314:	800005b7          	lui	a1,0x80000
f9003318:	00000513          	li	a0,0
f900331c:	01b5c5b3          	xor	a1,a1,s11
f9003320:	b20ff06f          	j	f9002640 <__ieee754_pow+0x78>
f9003324:	00002a97          	auipc	s5,0x2
f9003328:	d24a8a93          	addi	s5,s5,-732 # f9005048 <__clz_tab+0x100>
f900332c:	e68ff06f          	j	f9002994 <__ieee754_pow+0x3cc>
f9003330:	3ff006b7          	lui	a3,0x3ff00
f9003334:	ffe68613          	addi	a2,a3,-2 # 3feffffe <__stack_size+0x3fefdffe>
f9003338:	ca865663          	bge	a2,s0,f90027e4 <__ieee754_pow+0x21c>
f900333c:	d686cc63          	blt	a3,s0,f90028b4 <__ieee754_pow+0x2ec>
f9003340:	00002a97          	auipc	s5,0x2
f9003344:	d08a8a93          	addi	s5,s5,-760 # f9005048 <__clz_tab+0x100>
f9003348:	000aa603          	lw	a2,0(s5)
f900334c:	004aa683          	lw	a3,4(s5)
f9003350:	01c12823          	sw	t3,16(sp)
f9003354:	8c0fe0ef          	jal	ra,f9001414 <__subdf3>
f9003358:	00002697          	auipc	a3,0x2
f900335c:	d3068693          	addi	a3,a3,-720 # f9005088 <__clz_tab+0x140>
f9003360:	0006a603          	lw	a2,0(a3)
f9003364:	0046a683          	lw	a3,4(a3)
f9003368:	00050413          	mv	s0,a0
f900336c:	00058493          	mv	s1,a1
f9003370:	a51fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003374:	00002697          	auipc	a3,0x2
f9003378:	d1c68693          	addi	a3,a3,-740 # f9005090 <__clz_tab+0x148>
f900337c:	0006a603          	lw	a2,0(a3)
f9003380:	0046a683          	lw	a3,4(a3)
f9003384:	00050913          	mv	s2,a0
f9003388:	00058993          	mv	s3,a1
f900338c:	00040513          	mv	a0,s0
f9003390:	00048593          	mv	a1,s1
f9003394:	a2dfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003398:	00002697          	auipc	a3,0x2
f900339c:	d0068693          	addi	a3,a3,-768 # f9005098 <__clz_tab+0x150>
f90033a0:	0006a603          	lw	a2,0(a3)
f90033a4:	0046a683          	lw	a3,4(a3)
f90033a8:	00a12423          	sw	a0,8(sp)
f90033ac:	00b12623          	sw	a1,12(sp)
f90033b0:	00040513          	mv	a0,s0
f90033b4:	00048593          	mv	a1,s1
f90033b8:	a09fd0ef          	jal	ra,f9000dc0 <__muldf3>
f90033bc:	00058693          	mv	a3,a1
f90033c0:	00002597          	auipc	a1,0x2
f90033c4:	ce058593          	addi	a1,a1,-800 # f90050a0 <__clz_tab+0x158>
f90033c8:	00050613          	mv	a2,a0
f90033cc:	0005a503          	lw	a0,0(a1)
f90033d0:	0045a583          	lw	a1,4(a1)
f90033d4:	840fe0ef          	jal	ra,f9001414 <__subdf3>
f90033d8:	00040613          	mv	a2,s0
f90033dc:	00048693          	mv	a3,s1
f90033e0:	9e1fd0ef          	jal	ra,f9000dc0 <__muldf3>
f90033e4:	00058693          	mv	a3,a1
f90033e8:	00002597          	auipc	a1,0x2
f90033ec:	cc058593          	addi	a1,a1,-832 # f90050a8 <__clz_tab+0x160>
f90033f0:	00050613          	mv	a2,a0
f90033f4:	0005a503          	lw	a0,0(a1)
f90033f8:	0045a583          	lw	a1,4(a1)
f90033fc:	818fe0ef          	jal	ra,f9001414 <__subdf3>
f9003400:	00050b13          	mv	s6,a0
f9003404:	00058b93          	mv	s7,a1
f9003408:	00040613          	mv	a2,s0
f900340c:	00048693          	mv	a3,s1
f9003410:	00040513          	mv	a0,s0
f9003414:	00048593          	mv	a1,s1
f9003418:	9a9fd0ef          	jal	ra,f9000dc0 <__muldf3>
f900341c:	00050613          	mv	a2,a0
f9003420:	00058693          	mv	a3,a1
f9003424:	000b0513          	mv	a0,s6
f9003428:	000b8593          	mv	a1,s7
f900342c:	995fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003430:	00002697          	auipc	a3,0x2
f9003434:	c8068693          	addi	a3,a3,-896 # f90050b0 <__clz_tab+0x168>
f9003438:	0006a603          	lw	a2,0(a3)
f900343c:	0046a683          	lw	a3,4(a3)
f9003440:	981fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003444:	00812703          	lw	a4,8(sp)
f9003448:	00c12783          	lw	a5,12(sp)
f900344c:	00050613          	mv	a2,a0
f9003450:	00058693          	mv	a3,a1
f9003454:	00070513          	mv	a0,a4
f9003458:	00078593          	mv	a1,a5
f900345c:	fb9fd0ef          	jal	ra,f9001414 <__subdf3>
f9003460:	00050613          	mv	a2,a0
f9003464:	00058693          	mv	a3,a1
f9003468:	00050b13          	mv	s6,a0
f900346c:	00058b93          	mv	s7,a1
f9003470:	00090513          	mv	a0,s2
f9003474:	00098593          	mv	a1,s3
f9003478:	7f0000ef          	jal	ra,f9003c68 <__adddf3>
f900347c:	00000613          	li	a2,0
f9003480:	00098693          	mv	a3,s3
f9003484:	00060513          	mv	a0,a2
f9003488:	00060413          	mv	s0,a2
f900348c:	00090613          	mv	a2,s2
f9003490:	00058493          	mv	s1,a1
f9003494:	f81fd0ef          	jal	ra,f9001414 <__subdf3>
f9003498:	00050613          	mv	a2,a0
f900349c:	00058693          	mv	a3,a1
f90034a0:	000b0513          	mv	a0,s6
f90034a4:	000b8593          	mv	a1,s7
f90034a8:	f6dfd0ef          	jal	ra,f9001414 <__subdf3>
f90034ac:	00050913          	mv	s2,a0
f90034b0:	00058993          	mv	s3,a1
f90034b4:	01012e03          	lw	t3,16(sp)
f90034b8:	9adff06f          	j	f9002e64 <__ieee754_pow+0x89c>
f90034bc:	00098613          	mv	a2,s3
f90034c0:	00098513          	mv	a0,s3
f90034c4:	00048693          	mv	a3,s1
f90034c8:	00048593          	mv	a1,s1
f90034cc:	8f5fd0ef          	jal	ra,f9000dc0 <__muldf3>
f90034d0:	970ff06f          	j	f9002640 <__ieee754_pow+0x78>
f90034d4:	b20c9a63          	bnez	s9,f9002808 <__ieee754_pow+0x240>
f90034d8:	40d606b3          	sub	a3,a2,a3
f90034dc:	40d95633          	sra	a2,s2,a3
f90034e0:	00d616b3          	sll	a3,a2,a3
f90034e4:	000c8d13          	mv	s10,s9
f90034e8:	01268463          	beq	a3,s2,f90034f0 <__ieee754_pow+0xf28>
f90034ec:	9c4ff06f          	j	f90026b0 <__ieee754_pow+0xe8>
f90034f0:	00167613          	andi	a2,a2,1
f90034f4:	00200313          	li	t1,2
f90034f8:	40c30d33          	sub	s10,t1,a2
f90034fc:	9b4ff06f          	j	f90026b0 <__ieee754_pow+0xe8>
f9003500:	3fe00737          	lui	a4,0x3fe00
f9003504:	00000d93          	li	s11,0
f9003508:	00000a13          	li	s4,0
f900350c:	b0f750e3          	bge	a4,a5,f900300c <__ieee754_pow+0xa44>
f9003510:	4147d793          	srai	a5,a5,0x14
f9003514:	a79ff06f          	j	f9002f8c <__ieee754_pow+0x9c4>
f9003518:	00002417          	auipc	s0,0x2
f900351c:	b6840413          	addi	s0,s0,-1176 # f9005080 <__clz_tab+0x138>
f9003520:	db9ff06f          	j	f90032d8 <__ieee754_pow+0xd10>
f9003524:	00100793          	li	a5,1
f9003528:	00fd0463          	beq	s10,a5,f9003530 <__ieee754_pow+0xf68>
f900352c:	914ff06f          	j	f9002640 <__ieee754_pow+0x78>
f9003530:	800007b7          	lui	a5,0x80000
f9003534:	00b7c5b3          	xor	a1,a5,a1
f9003538:	908ff06f          	j	f9002640 <__ieee754_pow+0x78>
f900353c:	00002697          	auipc	a3,0x2
f9003540:	b2468693          	addi	a3,a3,-1244 # f9005060 <__clz_tab+0x118>
f9003544:	0006a783          	lw	a5,0(a3)
f9003548:	0046a803          	lw	a6,4(a3)
f900354c:	00002697          	auipc	a3,0x2
f9003550:	b1c68693          	addi	a3,a3,-1252 # f9005068 <__clz_tab+0x120>
f9003554:	00f12823          	sw	a5,16(sp)
f9003558:	01012a23          	sw	a6,20(sp)
f900355c:	0006a783          	lw	a5,0(a3)
f9003560:	0046a803          	lw	a6,4(a3)
f9003564:	00002697          	auipc	a3,0x2
f9003568:	b0c68693          	addi	a3,a3,-1268 # f9005070 <__clz_tab+0x128>
f900356c:	02f12c23          	sw	a5,56(sp)
f9003570:	03012e23          	sw	a6,60(sp)
f9003574:	0006a783          	lw	a5,0(a3)
f9003578:	0046a803          	lw	a6,4(a3)
f900357c:	000409b7          	lui	s3,0x40
f9003580:	00f12423          	sw	a5,8(sp)
f9003584:	01012623          	sw	a6,12(sp)
f9003588:	00002a97          	auipc	s5,0x2
f900358c:	ac0a8a93          	addi	s5,s5,-1344 # f9005048 <__clz_tab+0x100>
f9003590:	c28ff06f          	j	f90029b8 <__ieee754_pow+0x3f0>
f9003594:	000a0613          	mv	a2,s4
f9003598:	518000ef          	jal	ra,f9003ab0 <scalbn>
f900359c:	ce1ff06f          	j	f900327c <__ieee754_pow+0xcb4>

f90035a0 <__ieee754_sqrt>:
f90035a0:	ff010113          	addi	sp,sp,-16
f90035a4:	7ff00737          	lui	a4,0x7ff00
f90035a8:	00812423          	sw	s0,8(sp)
f90035ac:	00912223          	sw	s1,4(sp)
f90035b0:	00112623          	sw	ra,12(sp)
f90035b4:	00b77833          	and	a6,a4,a1
f90035b8:	00058493          	mv	s1,a1
f90035bc:	00050413          	mv	s0,a0
f90035c0:	20e80863          	beq	a6,a4,f90037d0 <__ieee754_sqrt+0x230>
f90035c4:	00058793          	mv	a5,a1
f90035c8:	00050693          	mv	a3,a0
f90035cc:	14b05a63          	blez	a1,f9003720 <__ieee754_sqrt+0x180>
f90035d0:	4145de13          	srai	t3,a1,0x14
f90035d4:	240e0e63          	beqz	t3,f9003830 <__ieee754_sqrt+0x290>
f90035d8:	00100737          	lui	a4,0x100
f90035dc:	fff70613          	addi	a2,a4,-1 # fffff <__stack_size+0xfdfff>
f90035e0:	00c7f7b3          	and	a5,a5,a2
f90035e4:	00e7e7b3          	or	a5,a5,a4
f90035e8:	c01e0e13          	addi	t3,t3,-1023
f90035ec:	00179713          	slli	a4,a5,0x1
f90035f0:	001e7613          	andi	a2,t3,1
f90035f4:	01f6d793          	srli	a5,a3,0x1f
f90035f8:	00f707b3          	add	a5,a4,a5
f90035fc:	00169713          	slli	a4,a3,0x1
f9003600:	00060a63          	beqz	a2,f9003614 <__ieee754_sqrt+0x74>
f9003604:	01f75713          	srli	a4,a4,0x1f
f9003608:	00179793          	slli	a5,a5,0x1
f900360c:	00e787b3          	add	a5,a5,a4
f9003610:	00269713          	slli	a4,a3,0x2
f9003614:	401e5e13          	srai	t3,t3,0x1
f9003618:	01600593          	li	a1,22
f900361c:	00000e93          	li	t4,0
f9003620:	00000693          	li	a3,0
f9003624:	00200637          	lui	a2,0x200
f9003628:	00c68533          	add	a0,a3,a2
f900362c:	01f75813          	srli	a6,a4,0x1f
f9003630:	fff58593          	addi	a1,a1,-1
f9003634:	00a7c863          	blt	a5,a0,f9003644 <__ieee754_sqrt+0xa4>
f9003638:	40a787b3          	sub	a5,a5,a0
f900363c:	00c506b3          	add	a3,a0,a2
f9003640:	00ce8eb3          	add	t4,t4,a2
f9003644:	00179793          	slli	a5,a5,0x1
f9003648:	00f807b3          	add	a5,a6,a5
f900364c:	00171713          	slli	a4,a4,0x1
f9003650:	00165613          	srli	a2,a2,0x1
f9003654:	fc059ae3          	bnez	a1,f9003628 <__ieee754_sqrt+0x88>
f9003658:	00000313          	li	t1,0
f900365c:	02000813          	li	a6,32
f9003660:	80000637          	lui	a2,0x80000
f9003664:	0240006f          	j	f9003688 <__ieee754_sqrt+0xe8>
f9003668:	12d78e63          	beq	a5,a3,f90037a4 <__ieee754_sqrt+0x204>
f900366c:	01f75513          	srli	a0,a4,0x1f
f9003670:	00179793          	slli	a5,a5,0x1
f9003674:	fff80813          	addi	a6,a6,-1 # c00fffff <__freertos_irq_stack_top+0xc70f89cf>
f9003678:	00a787b3          	add	a5,a5,a0
f900367c:	00171713          	slli	a4,a4,0x1
f9003680:	00165613          	srli	a2,a2,0x1
f9003684:	04080663          	beqz	a6,f90036d0 <__ieee754_sqrt+0x130>
f9003688:	00b60533          	add	a0,a2,a1
f900368c:	fcf6dee3          	bge	a3,a5,f9003668 <__ieee754_sqrt+0xc8>
f9003690:	00c505b3          	add	a1,a0,a2
f9003694:	00068893          	mv	a7,a3
f9003698:	0e054e63          	bltz	a0,f9003794 <__ieee754_sqrt+0x1f4>
f900369c:	40d787b3          	sub	a5,a5,a3
f90036a0:	00a736b3          	sltu	a3,a4,a0
f90036a4:	40d787b3          	sub	a5,a5,a3
f90036a8:	40a70733          	sub	a4,a4,a0
f90036ac:	01f75513          	srli	a0,a4,0x1f
f90036b0:	00179793          	slli	a5,a5,0x1
f90036b4:	fff80813          	addi	a6,a6,-1
f90036b8:	00c30333          	add	t1,t1,a2
f90036bc:	00088693          	mv	a3,a7
f90036c0:	00a787b3          	add	a5,a5,a0
f90036c4:	00171713          	slli	a4,a4,0x1
f90036c8:	00165613          	srli	a2,a2,0x1
f90036cc:	fa081ee3          	bnez	a6,f9003688 <__ieee754_sqrt+0xe8>
f90036d0:	00e7e7b3          	or	a5,a5,a4
f90036d4:	0e079463          	bnez	a5,f90037bc <__ieee754_sqrt+0x21c>
f90036d8:	00135813          	srli	a6,t1,0x1
f90036dc:	401ed713          	srai	a4,t4,0x1
f90036e0:	3fe004b7          	lui	s1,0x3fe00
f90036e4:	001efe93          	andi	t4,t4,1
f90036e8:	009704b3          	add	s1,a4,s1
f90036ec:	000e8663          	beqz	t4,f90036f8 <__ieee754_sqrt+0x158>
f90036f0:	800007b7          	lui	a5,0x80000
f90036f4:	00f86833          	or	a6,a6,a5
f90036f8:	014e1713          	slli	a4,t3,0x14
f90036fc:	00080413          	mv	s0,a6
f9003700:	00970733          	add	a4,a4,s1
f9003704:	00040513          	mv	a0,s0
f9003708:	00c12083          	lw	ra,12(sp)
f900370c:	00812403          	lw	s0,8(sp)
f9003710:	00412483          	lw	s1,4(sp)
f9003714:	00070593          	mv	a1,a4
f9003718:	01010113          	addi	sp,sp,16
f900371c:	00008067          	ret
f9003720:	00159713          	slli	a4,a1,0x1
f9003724:	00175713          	srli	a4,a4,0x1
f9003728:	00a76833          	or	a6,a4,a0
f900372c:	00058713          	mv	a4,a1
f9003730:	fc080ae3          	beqz	a6,f9003704 <__ieee754_sqrt+0x164>
f9003734:	0c059c63          	bnez	a1,f900380c <__ieee754_sqrt+0x26c>
f9003738:	00b6d593          	srli	a1,a3,0xb
f900373c:	feb78793          	addi	a5,a5,-21 # 7fffffeb <__freertos_irq_stack_top+0x86ff89bb>
f9003740:	00058713          	mv	a4,a1
f9003744:	01569693          	slli	a3,a3,0x15
f9003748:	fe0588e3          	beqz	a1,f9003738 <__ieee754_sqrt+0x198>
f900374c:	0145d613          	srli	a2,a1,0x14
f9003750:	0e061a63          	bnez	a2,f9003844 <__ieee754_sqrt+0x2a4>
f9003754:	00000613          	li	a2,0
f9003758:	0080006f          	j	f9003760 <__ieee754_sqrt+0x1c0>
f900375c:	00050613          	mv	a2,a0
f9003760:	00171713          	slli	a4,a4,0x1
f9003764:	00b71593          	slli	a1,a4,0xb
f9003768:	00160513          	addi	a0,a2,1 # 80000001 <__freertos_irq_stack_top+0x86ff89d1>
f900376c:	fe05d8e3          	bgez	a1,f900375c <__ieee754_sqrt+0x1bc>
f9003770:	02000893          	li	a7,32
f9003774:	00068813          	mv	a6,a3
f9003778:	40a888b3          	sub	a7,a7,a0
f900377c:	00070593          	mv	a1,a4
f9003780:	00a696b3          	sll	a3,a3,a0
f9003784:	01185733          	srl	a4,a6,a7
f9003788:	40c78e33          	sub	t3,a5,a2
f900378c:	00b767b3          	or	a5,a4,a1
f9003790:	e49ff06f          	j	f90035d8 <__ieee754_sqrt+0x38>
f9003794:	fff5c893          	not	a7,a1
f9003798:	01f8d893          	srli	a7,a7,0x1f
f900379c:	011688b3          	add	a7,a3,a7
f90037a0:	efdff06f          	j	f900369c <__ieee754_sqrt+0xfc>
f90037a4:	eca764e3          	bltu	a4,a0,f900366c <__ieee754_sqrt+0xcc>
f90037a8:	00c505b3          	add	a1,a0,a2
f90037ac:	fe0544e3          	bltz	a0,f9003794 <__ieee754_sqrt+0x1f4>
f90037b0:	00078893          	mv	a7,a5
f90037b4:	00000793          	li	a5,0
f90037b8:	ef1ff06f          	j	f90036a8 <__ieee754_sqrt+0x108>
f90037bc:	fff00793          	li	a5,-1
f90037c0:	06f30e63          	beq	t1,a5,f900383c <__ieee754_sqrt+0x29c>
f90037c4:	00130813          	addi	a6,t1,1
f90037c8:	00185813          	srli	a6,a6,0x1
f90037cc:	f11ff06f          	j	f90036dc <__ieee754_sqrt+0x13c>
f90037d0:	00050613          	mv	a2,a0
f90037d4:	00058693          	mv	a3,a1
f90037d8:	de8fd0ef          	jal	ra,f9000dc0 <__muldf3>
f90037dc:	00040613          	mv	a2,s0
f90037e0:	00048693          	mv	a3,s1
f90037e4:	484000ef          	jal	ra,f9003c68 <__adddf3>
f90037e8:	00050413          	mv	s0,a0
f90037ec:	00040513          	mv	a0,s0
f90037f0:	00c12083          	lw	ra,12(sp)
f90037f4:	00812403          	lw	s0,8(sp)
f90037f8:	00058713          	mv	a4,a1
f90037fc:	00412483          	lw	s1,4(sp)
f9003800:	00070593          	mv	a1,a4
f9003804:	01010113          	addi	sp,sp,16
f9003808:	00008067          	ret
f900380c:	00050613          	mv	a2,a0
f9003810:	00058693          	mv	a3,a1
f9003814:	c01fd0ef          	jal	ra,f9001414 <__subdf3>
f9003818:	00050613          	mv	a2,a0
f900381c:	00058693          	mv	a3,a1
f9003820:	4cd000ef          	jal	ra,f90044ec <__divdf3>
f9003824:	00050413          	mv	s0,a0
f9003828:	00058713          	mv	a4,a1
f900382c:	ed9ff06f          	j	f9003704 <__ieee754_sqrt+0x164>
f9003830:	00058713          	mv	a4,a1
f9003834:	00000793          	li	a5,0
f9003838:	f1dff06f          	j	f9003754 <__ieee754_sqrt+0x1b4>
f900383c:	001e8e93          	addi	t4,t4,1
f9003840:	e9dff06f          	j	f90036dc <__ieee754_sqrt+0x13c>
f9003844:	00068813          	mv	a6,a3
f9003848:	02000893          	li	a7,32
f900384c:	fff00613          	li	a2,-1
f9003850:	f35ff06f          	j	f9003784 <__ieee754_sqrt+0x1e4>

f9003854 <fabs>:
f9003854:	00159593          	slli	a1,a1,0x1
f9003858:	0015d593          	srli	a1,a1,0x1
f900385c:	00008067          	ret

f9003860 <finite>:
f9003860:	00159593          	slli	a1,a1,0x1
f9003864:	0015d593          	srli	a1,a1,0x1
f9003868:	80100537          	lui	a0,0x80100
f900386c:	00a58533          	add	a0,a1,a0
f9003870:	01f55513          	srli	a0,a0,0x1f
f9003874:	00008067          	ret

f9003878 <nan>:
f9003878:	00002797          	auipc	a5,0x2
f900387c:	8f078793          	addi	a5,a5,-1808 # f9005168 <__clz_tab+0x220>
f9003880:	0007a503          	lw	a0,0(a5)
f9003884:	0047a583          	lw	a1,4(a5)
f9003888:	00008067          	ret

f900388c <rint>:
f900388c:	4145d713          	srai	a4,a1,0x14
f9003890:	fd010113          	addi	sp,sp,-48
f9003894:	7ff77713          	andi	a4,a4,2047
f9003898:	02812423          	sw	s0,40(sp)
f900389c:	02112623          	sw	ra,44(sp)
f90038a0:	02912223          	sw	s1,36(sp)
f90038a4:	03212023          	sw	s2,32(sp)
f90038a8:	01312e23          	sw	s3,28(sp)
f90038ac:	c0170613          	addi	a2,a4,-1023
f90038b0:	01300893          	li	a7,19
f90038b4:	00058793          	mv	a5,a1
f90038b8:	00050693          	mv	a3,a0
f90038bc:	00058e13          	mv	t3,a1
f90038c0:	01f5d413          	srli	s0,a1,0x1f
f90038c4:	16c8cc63          	blt	a7,a2,f9003a3c <rint+0x1b0>
f90038c8:	0c064863          	bltz	a2,f9003998 <rint+0x10c>
f90038cc:	001005b7          	lui	a1,0x100
f90038d0:	fff58593          	addi	a1,a1,-1 # fffff <__stack_size+0xfdfff>
f90038d4:	40c5d5b3          	sra	a1,a1,a2
f90038d8:	00f5f533          	and	a0,a1,a5
f90038dc:	00d56533          	or	a0,a0,a3
f90038e0:	00068893          	mv	a7,a3
f90038e4:	00078313          	mv	t1,a5
f90038e8:	08050663          	beqz	a0,f9003974 <rint+0xe8>
f90038ec:	0015d593          	srli	a1,a1,0x1
f90038f0:	00f5f833          	and	a6,a1,a5
f90038f4:	00d86833          	or	a6,a6,a3
f90038f8:	02080663          	beqz	a6,f9003924 <rint+0x98>
f90038fc:	bee70693          	addi	a3,a4,-1042
f9003900:	00040e37          	lui	t3,0x40
f9003904:	0016b693          	seqz	a3,a3
f9003908:	fff5c593          	not	a1,a1
f900390c:	80000837          	lui	a6,0x80000
f9003910:	40d006b3          	neg	a3,a3
f9003914:	00f5f7b3          	and	a5,a1,a5
f9003918:	40ce5633          	sra	a2,t3,a2
f900391c:	00d87833          	and	a6,a6,a3
f9003920:	00c7ee33          	or	t3,a5,a2
f9003924:	00002797          	auipc	a5,0x2
f9003928:	84c78793          	addi	a5,a5,-1972 # f9005170 <TWO52>
f900392c:	00341313          	slli	t1,s0,0x3
f9003930:	00678333          	add	t1,a5,t1
f9003934:	00032403          	lw	s0,0(t1)
f9003938:	00432483          	lw	s1,4(t1)
f900393c:	00080613          	mv	a2,a6
f9003940:	000e0693          	mv	a3,t3
f9003944:	00040513          	mv	a0,s0
f9003948:	00048593          	mv	a1,s1
f900394c:	31c000ef          	jal	ra,f9003c68 <__adddf3>
f9003950:	00a12423          	sw	a0,8(sp)
f9003954:	00b12623          	sw	a1,12(sp)
f9003958:	00812503          	lw	a0,8(sp)
f900395c:	00c12583          	lw	a1,12(sp)
f9003960:	00040613          	mv	a2,s0
f9003964:	00048693          	mv	a3,s1
f9003968:	aadfd0ef          	jal	ra,f9001414 <__subdf3>
f900396c:	00050893          	mv	a7,a0
f9003970:	00058313          	mv	t1,a1
f9003974:	02c12083          	lw	ra,44(sp)
f9003978:	02812403          	lw	s0,40(sp)
f900397c:	02412483          	lw	s1,36(sp)
f9003980:	02012903          	lw	s2,32(sp)
f9003984:	01c12983          	lw	s3,28(sp)
f9003988:	00088513          	mv	a0,a7
f900398c:	00030593          	mv	a1,t1
f9003990:	03010113          	addi	sp,sp,48
f9003994:	00008067          	ret
f9003998:	800004b7          	lui	s1,0x80000
f900399c:	fff4c493          	not	s1,s1
f90039a0:	00b4f733          	and	a4,s1,a1
f90039a4:	00a76733          	or	a4,a4,a0
f90039a8:	00050893          	mv	a7,a0
f90039ac:	00058313          	mv	t1,a1
f90039b0:	fc0702e3          	beqz	a4,f9003974 <rint+0xe8>
f90039b4:	00c59793          	slli	a5,a1,0xc
f90039b8:	00c7d793          	srli	a5,a5,0xc
f90039bc:	00a7e733          	or	a4,a5,a0
f90039c0:	40e007b3          	neg	a5,a4
f90039c4:	00e7e7b3          	or	a5,a5,a4
f90039c8:	00001697          	auipc	a3,0x1
f90039cc:	7a868693          	addi	a3,a3,1960 # f9005170 <TWO52>
f90039d0:	00341713          	slli	a4,s0,0x3
f90039d4:	00e686b3          	add	a3,a3,a4
f90039d8:	00c7d793          	srli	a5,a5,0xc
f90039dc:	0006a903          	lw	s2,0(a3)
f90039e0:	0046a983          	lw	s3,4(a3)
f90039e4:	fffe0737          	lui	a4,0xfffe0
f90039e8:	00080337          	lui	t1,0x80
f90039ec:	00b77733          	and	a4,a4,a1
f90039f0:	0067f333          	and	t1,a5,t1
f90039f4:	00e36333          	or	t1,t1,a4
f90039f8:	00030693          	mv	a3,t1
f90039fc:	00050613          	mv	a2,a0
f9003a00:	00098593          	mv	a1,s3
f9003a04:	00090513          	mv	a0,s2
f9003a08:	260000ef          	jal	ra,f9003c68 <__adddf3>
f9003a0c:	00a12423          	sw	a0,8(sp)
f9003a10:	00b12623          	sw	a1,12(sp)
f9003a14:	00812503          	lw	a0,8(sp)
f9003a18:	00c12583          	lw	a1,12(sp)
f9003a1c:	00090613          	mv	a2,s2
f9003a20:	00098693          	mv	a3,s3
f9003a24:	9f1fd0ef          	jal	ra,f9001414 <__subdf3>
f9003a28:	00b4f4b3          	and	s1,s1,a1
f9003a2c:	01f41313          	slli	t1,s0,0x1f
f9003a30:	0064e333          	or	t1,s1,t1
f9003a34:	00050893          	mv	a7,a0
f9003a38:	f3dff06f          	j	f9003974 <rint+0xe8>
f9003a3c:	03300893          	li	a7,51
f9003a40:	02c8d663          	bge	a7,a2,f9003a6c <rint+0x1e0>
f9003a44:	40000713          	li	a4,1024
f9003a48:	00050893          	mv	a7,a0
f9003a4c:	00058313          	mv	t1,a1
f9003a50:	f2e612e3          	bne	a2,a4,f9003974 <rint+0xe8>
f9003a54:	00050613          	mv	a2,a0
f9003a58:	000e0693          	mv	a3,t3
f9003a5c:	20c000ef          	jal	ra,f9003c68 <__adddf3>
f9003a60:	00050893          	mv	a7,a0
f9003a64:	00058313          	mv	t1,a1
f9003a68:	f0dff06f          	j	f9003974 <rint+0xe8>
f9003a6c:	bed70713          	addi	a4,a4,-1043 # fffdfbed <__freertos_irq_stack_top+0x6fd85bd>
f9003a70:	fff00613          	li	a2,-1
f9003a74:	00e65633          	srl	a2,a2,a4
f9003a78:	00a675b3          	and	a1,a2,a0
f9003a7c:	00050893          	mv	a7,a0
f9003a80:	00078313          	mv	t1,a5
f9003a84:	ee0588e3          	beqz	a1,f9003974 <rint+0xe8>
f9003a88:	00165613          	srli	a2,a2,0x1
f9003a8c:	00a677b3          	and	a5,a2,a0
f9003a90:	00050813          	mv	a6,a0
f9003a94:	e80788e3          	beqz	a5,f9003924 <rint+0x98>
f9003a98:	40000837          	lui	a6,0x40000
f9003a9c:	fff64613          	not	a2,a2
f9003aa0:	00a676b3          	and	a3,a2,a0
f9003aa4:	40e85733          	sra	a4,a6,a4
f9003aa8:	00e6e833          	or	a6,a3,a4
f9003aac:	e79ff06f          	j	f9003924 <rint+0x98>

f9003ab0 <scalbn>:
f9003ab0:	ff010113          	addi	sp,sp,-16
f9003ab4:	4145d793          	srai	a5,a1,0x14
f9003ab8:	00812423          	sw	s0,8(sp)
f9003abc:	00112623          	sw	ra,12(sp)
f9003ac0:	7ff7f793          	andi	a5,a5,2047
f9003ac4:	00060413          	mv	s0,a2
f9003ac8:	0a079063          	bnez	a5,f9003b68 <scalbn+0xb8>
f9003acc:	00159793          	slli	a5,a1,0x1
f9003ad0:	0017d793          	srli	a5,a5,0x1
f9003ad4:	00a7e7b3          	or	a5,a5,a0
f9003ad8:	08078063          	beqz	a5,f9003b58 <scalbn+0xa8>
f9003adc:	00001797          	auipc	a5,0x1
f9003ae0:	6a478793          	addi	a5,a5,1700 # f9005180 <TWO52+0x10>
f9003ae4:	0007a603          	lw	a2,0(a5)
f9003ae8:	0047a683          	lw	a3,4(a5)
f9003aec:	ad4fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003af0:	ffff47b7          	lui	a5,0xffff4
f9003af4:	cb078793          	addi	a5,a5,-848 # ffff3cb0 <__freertos_irq_stack_top+0x6fec680>
f9003af8:	00058713          	mv	a4,a1
f9003afc:	12f44a63          	blt	s0,a5,f9003c30 <scalbn+0x180>
f9003b00:	4145d793          	srai	a5,a1,0x14
f9003b04:	7ff7f793          	andi	a5,a5,2047
f9003b08:	fca78793          	addi	a5,a5,-54
f9003b0c:	00f407b3          	add	a5,s0,a5
f9003b10:	7fe00693          	li	a3,2046
f9003b14:	06f6ce63          	blt	a3,a5,f9003b90 <scalbn+0xe0>
f9003b18:	0ef04a63          	bgtz	a5,f9003c0c <scalbn+0x15c>
f9003b1c:	fcb00693          	li	a3,-53
f9003b20:	0ad7d663          	bge	a5,a3,f9003bcc <scalbn+0x11c>
f9003b24:	0000c7b7          	lui	a5,0xc
f9003b28:	35078793          	addi	a5,a5,848 # c350 <__stack_size+0xa350>
f9003b2c:	0687c263          	blt	a5,s0,f9003b90 <scalbn+0xe0>
f9003b30:	00001797          	auipc	a5,0x1
f9003b34:	5e878793          	addi	a5,a5,1512 # f9005118 <__clz_tab+0x1d0>
f9003b38:	0007a803          	lw	a6,0(a5)
f9003b3c:	0047a883          	lw	a7,4(a5)
f9003b40:	1005ca63          	bltz	a1,f9003c54 <scalbn+0x1a4>
f9003b44:	0007a603          	lw	a2,0(a5)
f9003b48:	0047a683          	lw	a3,4(a5)
f9003b4c:	00080513          	mv	a0,a6
f9003b50:	00088593          	mv	a1,a7
f9003b54:	a6cfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003b58:	00c12083          	lw	ra,12(sp)
f9003b5c:	00812403          	lw	s0,8(sp)
f9003b60:	01010113          	addi	sp,sp,16
f9003b64:	00008067          	ret
f9003b68:	7ff00693          	li	a3,2047
f9003b6c:	00058713          	mv	a4,a1
f9003b70:	f8d79ee3          	bne	a5,a3,f9003b0c <scalbn+0x5c>
f9003b74:	00050613          	mv	a2,a0
f9003b78:	00058693          	mv	a3,a1
f9003b7c:	0ec000ef          	jal	ra,f9003c68 <__adddf3>
f9003b80:	00c12083          	lw	ra,12(sp)
f9003b84:	00812403          	lw	s0,8(sp)
f9003b88:	01010113          	addi	sp,sp,16
f9003b8c:	00008067          	ret
f9003b90:	00001797          	auipc	a5,0x1
f9003b94:	4f078793          	addi	a5,a5,1264 # f9005080 <__clz_tab+0x138>
f9003b98:	0007a803          	lw	a6,0(a5)
f9003b9c:	0047a883          	lw	a7,4(a5)
f9003ba0:	fa05d2e3          	bgez	a1,f9003b44 <scalbn+0x94>
f9003ba4:	00001717          	auipc	a4,0x1
f9003ba8:	5e470713          	addi	a4,a4,1508 # f9005188 <TWO52+0x18>
f9003bac:	00072803          	lw	a6,0(a4)
f9003bb0:	00472883          	lw	a7,4(a4)
f9003bb4:	0007a603          	lw	a2,0(a5)
f9003bb8:	0047a683          	lw	a3,4(a5)
f9003bbc:	00080513          	mv	a0,a6
f9003bc0:	00088593          	mv	a1,a7
f9003bc4:	9fcfd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003bc8:	f91ff06f          	j	f9003b58 <scalbn+0xa8>
f9003bcc:	801005b7          	lui	a1,0x80100
f9003bd0:	fff58593          	addi	a1,a1,-1 # 800fffff <__freertos_irq_stack_top+0x870f89cf>
f9003bd4:	03678793          	addi	a5,a5,54
f9003bd8:	00b77733          	and	a4,a4,a1
f9003bdc:	01479793          	slli	a5,a5,0x14
f9003be0:	00e7e7b3          	or	a5,a5,a4
f9003be4:	00001717          	auipc	a4,0x1
f9003be8:	5b470713          	addi	a4,a4,1460 # f9005198 <TWO52+0x28>
f9003bec:	00072603          	lw	a2,0(a4)
f9003bf0:	00472683          	lw	a3,4(a4)
f9003bf4:	00078593          	mv	a1,a5
f9003bf8:	9c8fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003bfc:	00c12083          	lw	ra,12(sp)
f9003c00:	00812403          	lw	s0,8(sp)
f9003c04:	01010113          	addi	sp,sp,16
f9003c08:	00008067          	ret
f9003c0c:	00c12083          	lw	ra,12(sp)
f9003c10:	00812403          	lw	s0,8(sp)
f9003c14:	801005b7          	lui	a1,0x80100
f9003c18:	fff58593          	addi	a1,a1,-1 # 800fffff <__freertos_irq_stack_top+0x870f89cf>
f9003c1c:	00b77733          	and	a4,a4,a1
f9003c20:	01479593          	slli	a1,a5,0x14
f9003c24:	00b765b3          	or	a1,a4,a1
f9003c28:	01010113          	addi	sp,sp,16
f9003c2c:	00008067          	ret
f9003c30:	00001697          	auipc	a3,0x1
f9003c34:	4e868693          	addi	a3,a3,1256 # f9005118 <__clz_tab+0x1d0>
f9003c38:	0006a603          	lw	a2,0(a3)
f9003c3c:	0046a683          	lw	a3,4(a3)
f9003c40:	980fd0ef          	jal	ra,f9000dc0 <__muldf3>
f9003c44:	00c12083          	lw	ra,12(sp)
f9003c48:	00812403          	lw	s0,8(sp)
f9003c4c:	01010113          	addi	sp,sp,16
f9003c50:	00008067          	ret
f9003c54:	00001717          	auipc	a4,0x1
f9003c58:	53c70713          	addi	a4,a4,1340 # f9005190 <TWO52+0x20>
f9003c5c:	00072803          	lw	a6,0(a4)
f9003c60:	00472883          	lw	a7,4(a4)
f9003c64:	ee1ff06f          	j	f9003b44 <scalbn+0x94>

f9003c68 <__adddf3>:
f9003c68:	00100837          	lui	a6,0x100
f9003c6c:	fe010113          	addi	sp,sp,-32
f9003c70:	fff80813          	addi	a6,a6,-1 # fffff <__stack_size+0xfdfff>
f9003c74:	00b87733          	and	a4,a6,a1
f9003c78:	00912a23          	sw	s1,20(sp)
f9003c7c:	00d87833          	and	a6,a6,a3
f9003c80:	0145d493          	srli	s1,a1,0x14
f9003c84:	0146d313          	srli	t1,a3,0x14
f9003c88:	00371e13          	slli	t3,a4,0x3
f9003c8c:	01312623          	sw	s3,12(sp)
f9003c90:	01d55713          	srli	a4,a0,0x1d
f9003c94:	00381813          	slli	a6,a6,0x3
f9003c98:	01d65793          	srli	a5,a2,0x1d
f9003c9c:	7ff4f493          	andi	s1,s1,2047
f9003ca0:	7ff37313          	andi	t1,t1,2047
f9003ca4:	00112e23          	sw	ra,28(sp)
f9003ca8:	00812c23          	sw	s0,24(sp)
f9003cac:	01212823          	sw	s2,16(sp)
f9003cb0:	01f5d993          	srli	s3,a1,0x1f
f9003cb4:	01f6de93          	srli	t4,a3,0x1f
f9003cb8:	01c76733          	or	a4,a4,t3
f9003cbc:	00351f13          	slli	t5,a0,0x3
f9003cc0:	0107e833          	or	a6,a5,a6
f9003cc4:	00361f93          	slli	t6,a2,0x3
f9003cc8:	40648e33          	sub	t3,s1,t1
f9003ccc:	1dd98463          	beq	s3,t4,f9003e94 <__adddf3+0x22c>
f9003cd0:	17c05863          	blez	t3,f9003e40 <__adddf3+0x1d8>
f9003cd4:	20030a63          	beqz	t1,f9003ee8 <__adddf3+0x280>
f9003cd8:	008006b7          	lui	a3,0x800
f9003cdc:	7ff00793          	li	a5,2047
f9003ce0:	00d86833          	or	a6,a6,a3
f9003ce4:	40f48e63          	beq	s1,a5,f9004100 <__adddf3+0x498>
f9003ce8:	03800793          	li	a5,56
f9003cec:	3dc7ca63          	blt	a5,t3,f90040c0 <__adddf3+0x458>
f9003cf0:	01f00793          	li	a5,31
f9003cf4:	55c7c663          	blt	a5,t3,f9004240 <__adddf3+0x5d8>
f9003cf8:	02000513          	li	a0,32
f9003cfc:	41c50533          	sub	a0,a0,t3
f9003d00:	01cfd7b3          	srl	a5,t6,t3
f9003d04:	00a816b3          	sll	a3,a6,a0
f9003d08:	00af9933          	sll	s2,t6,a0
f9003d0c:	00f6e6b3          	or	a3,a3,a5
f9003d10:	01203933          	snez	s2,s2
f9003d14:	01c857b3          	srl	a5,a6,t3
f9003d18:	0126e933          	or	s2,a3,s2
f9003d1c:	40f70733          	sub	a4,a4,a5
f9003d20:	412f0933          	sub	s2,t5,s2
f9003d24:	012f37b3          	sltu	a5,t5,s2
f9003d28:	40f70633          	sub	a2,a4,a5
f9003d2c:	00861793          	slli	a5,a2,0x8
f9003d30:	2a07d263          	bgez	a5,f9003fd4 <__adddf3+0x36c>
f9003d34:	00800737          	lui	a4,0x800
f9003d38:	fff70713          	addi	a4,a4,-1 # 7fffff <__stack_size+0x7fdfff>
f9003d3c:	00e67433          	and	s0,a2,a4
f9003d40:	34040e63          	beqz	s0,f900409c <__adddf3+0x434>
f9003d44:	00040513          	mv	a0,s0
f9003d48:	d7cfe0ef          	jal	ra,f90022c4 <__clzsi2>
f9003d4c:	ff850713          	addi	a4,a0,-8 # 800ffff8 <__freertos_irq_stack_top+0x870f89c8>
f9003d50:	02000793          	li	a5,32
f9003d54:	40e787b3          	sub	a5,a5,a4
f9003d58:	00f957b3          	srl	a5,s2,a5
f9003d5c:	00e41633          	sll	a2,s0,a4
f9003d60:	00c7e7b3          	or	a5,a5,a2
f9003d64:	00e91933          	sll	s2,s2,a4
f9003d68:	30974c63          	blt	a4,s1,f9004080 <__adddf3+0x418>
f9003d6c:	40970533          	sub	a0,a4,s1
f9003d70:	00150613          	addi	a2,a0,1
f9003d74:	01f00713          	li	a4,31
f9003d78:	44c74663          	blt	a4,a2,f90041c4 <__adddf3+0x55c>
f9003d7c:	02000713          	li	a4,32
f9003d80:	40c70733          	sub	a4,a4,a2
f9003d84:	00c956b3          	srl	a3,s2,a2
f9003d88:	00e91933          	sll	s2,s2,a4
f9003d8c:	00e79733          	sll	a4,a5,a4
f9003d90:	00d76733          	or	a4,a4,a3
f9003d94:	01203933          	snez	s2,s2
f9003d98:	01276933          	or	s2,a4,s2
f9003d9c:	00c7d633          	srl	a2,a5,a2
f9003da0:	00000493          	li	s1,0
f9003da4:	00797793          	andi	a5,s2,7
f9003da8:	02078063          	beqz	a5,f9003dc8 <__adddf3+0x160>
f9003dac:	00f97713          	andi	a4,s2,15
f9003db0:	00400793          	li	a5,4
f9003db4:	00f70a63          	beq	a4,a5,f9003dc8 <__adddf3+0x160>
f9003db8:	00490713          	addi	a4,s2,4
f9003dbc:	01273933          	sltu	s2,a4,s2
f9003dc0:	01260633          	add	a2,a2,s2
f9003dc4:	00070913          	mv	s2,a4
f9003dc8:	00861793          	slli	a5,a2,0x8
f9003dcc:	2007d863          	bgez	a5,f9003fdc <__adddf3+0x374>
f9003dd0:	00148513          	addi	a0,s1,1 # 80000001 <__freertos_irq_stack_top+0x86ff89d1>
f9003dd4:	7ff00793          	li	a5,2047
f9003dd8:	00098593          	mv	a1,s3
f9003ddc:	24f50c63          	beq	a0,a5,f9004034 <__adddf3+0x3cc>
f9003de0:	ff8007b7          	lui	a5,0xff800
f9003de4:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f9003de8:	00f677b3          	and	a5,a2,a5
f9003dec:	01d79893          	slli	a7,a5,0x1d
f9003df0:	00395913          	srli	s2,s2,0x3
f9003df4:	00979793          	slli	a5,a5,0x9
f9003df8:	0128e8b3          	or	a7,a7,s2
f9003dfc:	00c7d793          	srli	a5,a5,0xc
f9003e00:	7ff57513          	andi	a0,a0,2047
f9003e04:	00c79693          	slli	a3,a5,0xc
f9003e08:	01451513          	slli	a0,a0,0x14
f9003e0c:	01c12083          	lw	ra,28(sp)
f9003e10:	01812403          	lw	s0,24(sp)
f9003e14:	00c6d693          	srli	a3,a3,0xc
f9003e18:	01f59593          	slli	a1,a1,0x1f
f9003e1c:	00a6e6b3          	or	a3,a3,a0
f9003e20:	00b6e6b3          	or	a3,a3,a1
f9003e24:	01412483          	lw	s1,20(sp)
f9003e28:	01012903          	lw	s2,16(sp)
f9003e2c:	00c12983          	lw	s3,12(sp)
f9003e30:	00088513          	mv	a0,a7
f9003e34:	00068593          	mv	a1,a3
f9003e38:	02010113          	addi	sp,sp,32
f9003e3c:	00008067          	ret
f9003e40:	0c0e1463          	bnez	t3,f9003f08 <__adddf3+0x2a0>
f9003e44:	00148313          	addi	t1,s1,1
f9003e48:	7fe37313          	andi	t1,t1,2046
f9003e4c:	28031063          	bnez	t1,f90040cc <__adddf3+0x464>
f9003e50:	01e767b3          	or	a5,a4,t5
f9003e54:	01f868b3          	or	a7,a6,t6
f9003e58:	1e049663          	bnez	s1,f9004044 <__adddf3+0x3dc>
f9003e5c:	4c078063          	beqz	a5,f900431c <__adddf3+0x6b4>
f9003e60:	50088863          	beqz	a7,f9004370 <__adddf3+0x708>
f9003e64:	41ff0933          	sub	s2,t5,t6
f9003e68:	410707b3          	sub	a5,a4,a6
f9003e6c:	012f3633          	sltu	a2,t5,s2
f9003e70:	40c78633          	sub	a2,a5,a2
f9003e74:	00861793          	slli	a5,a2,0x8
f9003e78:	5a07d463          	bgez	a5,f9004420 <__adddf3+0x7b8>
f9003e7c:	41ef8933          	sub	s2,t6,t5
f9003e80:	40e807b3          	sub	a5,a6,a4
f9003e84:	012fb633          	sltu	a2,t6,s2
f9003e88:	40c78633          	sub	a2,a5,a2
f9003e8c:	000e8993          	mv	s3,t4
f9003e90:	f15ff06f          	j	f9003da4 <__adddf3+0x13c>
f9003e94:	0fc05a63          	blez	t3,f9003f88 <__adddf3+0x320>
f9003e98:	0c030863          	beqz	t1,f9003f68 <__adddf3+0x300>
f9003e9c:	008006b7          	lui	a3,0x800
f9003ea0:	7ff00793          	li	a5,2047
f9003ea4:	00d86833          	or	a6,a6,a3
f9003ea8:	44f48e63          	beq	s1,a5,f9004304 <__adddf3+0x69c>
f9003eac:	03800793          	li	a5,56
f9003eb0:	15c7cc63          	blt	a5,t3,f9004008 <__adddf3+0x3a0>
f9003eb4:	01f00793          	li	a5,31
f9003eb8:	3fc7da63          	bge	a5,t3,f90042ac <__adddf3+0x644>
f9003ebc:	fe0e0913          	addi	s2,t3,-32 # 3ffe0 <__stack_size+0x3dfe0>
f9003ec0:	02000793          	li	a5,32
f9003ec4:	012856b3          	srl	a3,a6,s2
f9003ec8:	00fe0a63          	beq	t3,a5,f9003edc <__adddf3+0x274>
f9003ecc:	04000913          	li	s2,64
f9003ed0:	41c90933          	sub	s2,s2,t3
f9003ed4:	01281933          	sll	s2,a6,s2
f9003ed8:	012fefb3          	or	t6,t6,s2
f9003edc:	01f03933          	snez	s2,t6
f9003ee0:	00d96933          	or	s2,s2,a3
f9003ee4:	12c0006f          	j	f9004010 <__adddf3+0x3a8>
f9003ee8:	01f867b3          	or	a5,a6,t6
f9003eec:	22078663          	beqz	a5,f9004118 <__adddf3+0x4b0>
f9003ef0:	fffe0793          	addi	a5,t3,-1
f9003ef4:	44078463          	beqz	a5,f900433c <__adddf3+0x6d4>
f9003ef8:	7ff00693          	li	a3,2047
f9003efc:	20de0263          	beq	t3,a3,f9004100 <__adddf3+0x498>
f9003f00:	00078e13          	mv	t3,a5
f9003f04:	de5ff06f          	j	f9003ce8 <__adddf3+0x80>
f9003f08:	409305b3          	sub	a1,t1,s1
f9003f0c:	28049663          	bnez	s1,f9004198 <__adddf3+0x530>
f9003f10:	01e767b3          	or	a5,a4,t5
f9003f14:	3c078263          	beqz	a5,f90042d8 <__adddf3+0x670>
f9003f18:	fff58793          	addi	a5,a1,-1
f9003f1c:	50078c63          	beqz	a5,f9004434 <__adddf3+0x7cc>
f9003f20:	7ff00693          	li	a3,2047
f9003f24:	28d58263          	beq	a1,a3,f90041a8 <__adddf3+0x540>
f9003f28:	00078593          	mv	a1,a5
f9003f2c:	03800793          	li	a5,56
f9003f30:	32b7ce63          	blt	a5,a1,f900426c <__adddf3+0x604>
f9003f34:	01f00793          	li	a5,31
f9003f38:	4ab7c263          	blt	a5,a1,f90043dc <__adddf3+0x774>
f9003f3c:	02000793          	li	a5,32
f9003f40:	40b787b3          	sub	a5,a5,a1
f9003f44:	00f71933          	sll	s2,a4,a5
f9003f48:	00bf56b3          	srl	a3,t5,a1
f9003f4c:	00ff17b3          	sll	a5,t5,a5
f9003f50:	00d96933          	or	s2,s2,a3
f9003f54:	00f037b3          	snez	a5,a5
f9003f58:	00b75733          	srl	a4,a4,a1
f9003f5c:	00f96933          	or	s2,s2,a5
f9003f60:	40e80833          	sub	a6,a6,a4
f9003f64:	3100006f          	j	f9004274 <__adddf3+0x60c>
f9003f68:	01f867b3          	or	a5,a6,t6
f9003f6c:	3e078463          	beqz	a5,f9004354 <__adddf3+0x6ec>
f9003f70:	fffe0793          	addi	a5,t3,-1
f9003f74:	28078263          	beqz	a5,f90041f8 <__adddf3+0x590>
f9003f78:	7ff00693          	li	a3,2047
f9003f7c:	38de0463          	beq	t3,a3,f9004304 <__adddf3+0x69c>
f9003f80:	00078e13          	mv	t3,a5
f9003f84:	f29ff06f          	j	f9003eac <__adddf3+0x244>
f9003f88:	1a0e1663          	bnez	t3,f9004134 <__adddf3+0x4cc>
f9003f8c:	00148693          	addi	a3,s1,1
f9003f90:	7fe6f793          	andi	a5,a3,2046
f9003f94:	3e079a63          	bnez	a5,f9004388 <__adddf3+0x720>
f9003f98:	01e767b3          	or	a5,a4,t5
f9003f9c:	34049e63          	bnez	s1,f90042f8 <__adddf3+0x690>
f9003fa0:	4a078863          	beqz	a5,f9004450 <__adddf3+0x7e8>
f9003fa4:	01f867b3          	or	a5,a6,t6
f9003fa8:	3c078463          	beqz	a5,f9004370 <__adddf3+0x708>
f9003fac:	01ff0933          	add	s2,t5,t6
f9003fb0:	010707b3          	add	a5,a4,a6
f9003fb4:	01e93f33          	sltu	t5,s2,t5
f9003fb8:	01e78633          	add	a2,a5,t5
f9003fbc:	00861793          	slli	a5,a2,0x8
f9003fc0:	0007da63          	bgez	a5,f9003fd4 <__adddf3+0x36c>
f9003fc4:	ff8007b7          	lui	a5,0xff800
f9003fc8:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f9003fcc:	00f67633          	and	a2,a2,a5
f9003fd0:	00100493          	li	s1,1
f9003fd4:	00797793          	andi	a5,s2,7
f9003fd8:	dc079ae3          	bnez	a5,f9003dac <__adddf3+0x144>
f9003fdc:	01d61793          	slli	a5,a2,0x1d
f9003fe0:	00395893          	srli	a7,s2,0x3
f9003fe4:	00f8e8b3          	or	a7,a7,a5
f9003fe8:	00365793          	srli	a5,a2,0x3
f9003fec:	7ff00713          	li	a4,2047
f9003ff0:	06e48a63          	beq	s1,a4,f9004064 <__adddf3+0x3fc>
f9003ff4:	00c79793          	slli	a5,a5,0xc
f9003ff8:	00c7d793          	srli	a5,a5,0xc
f9003ffc:	7ff4f513          	andi	a0,s1,2047
f9004000:	00098593          	mv	a1,s3
f9004004:	e01ff06f          	j	f9003e04 <__adddf3+0x19c>
f9004008:	01f86933          	or	s2,a6,t6
f900400c:	01203933          	snez	s2,s2
f9004010:	01e90933          	add	s2,s2,t5
f9004014:	01e937b3          	sltu	a5,s2,t5
f9004018:	00e78633          	add	a2,a5,a4
f900401c:	00861793          	slli	a5,a2,0x8
f9004020:	fa07dae3          	bgez	a5,f9003fd4 <__adddf3+0x36c>
f9004024:	00148493          	addi	s1,s1,1
f9004028:	7ff00793          	li	a5,2047
f900402c:	1ef49663          	bne	s1,a5,f9004218 <__adddf3+0x5b0>
f9004030:	00098593          	mv	a1,s3
f9004034:	7ff00513          	li	a0,2047
f9004038:	00000793          	li	a5,0
f900403c:	00000893          	li	a7,0
f9004040:	dc5ff06f          	j	f9003e04 <__adddf3+0x19c>
f9004044:	0a079c63          	bnez	a5,f90040fc <__adddf3+0x494>
f9004048:	46088463          	beqz	a7,f90044b0 <__adddf3+0x848>
f900404c:	00361693          	slli	a3,a2,0x3
f9004050:	01d81793          	slli	a5,a6,0x1d
f9004054:	0036d693          	srli	a3,a3,0x3
f9004058:	00d7e8b3          	or	a7,a5,a3
f900405c:	000e8993          	mv	s3,t4
f9004060:	00385793          	srli	a5,a6,0x3
f9004064:	00f8e7b3          	or	a5,a7,a5
f9004068:	fc0784e3          	beqz	a5,f9004030 <__adddf3+0x3c8>
f900406c:	00000593          	li	a1,0
f9004070:	7ff00513          	li	a0,2047
f9004074:	000807b7          	lui	a5,0x80
f9004078:	00000893          	li	a7,0
f900407c:	d89ff06f          	j	f9003e04 <__adddf3+0x19c>
f9004080:	ff800637          	lui	a2,0xff800
f9004084:	fff60613          	addi	a2,a2,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f9004088:	00c7f633          	and	a2,a5,a2
f900408c:	00797793          	andi	a5,s2,7
f9004090:	40e484b3          	sub	s1,s1,a4
f9004094:	d0079ce3          	bnez	a5,f9003dac <__adddf3+0x144>
f9004098:	f45ff06f          	j	f9003fdc <__adddf3+0x374>
f900409c:	00090513          	mv	a0,s2
f90040a0:	a24fe0ef          	jal	ra,f90022c4 <__clzsi2>
f90040a4:	01850713          	addi	a4,a0,24
f90040a8:	01f00793          	li	a5,31
f90040ac:	cae7d2e3          	bge	a5,a4,f9003d50 <__adddf3+0xe8>
f90040b0:	ff850613          	addi	a2,a0,-8
f90040b4:	00c917b3          	sll	a5,s2,a2
f90040b8:	00000913          	li	s2,0
f90040bc:	cadff06f          	j	f9003d68 <__adddf3+0x100>
f90040c0:	01f86933          	or	s2,a6,t6
f90040c4:	01203933          	snez	s2,s2
f90040c8:	c59ff06f          	j	f9003d20 <__adddf3+0xb8>
f90040cc:	41ff0933          	sub	s2,t5,t6
f90040d0:	41070633          	sub	a2,a4,a6
f90040d4:	012f3433          	sltu	s0,t5,s2
f90040d8:	40860433          	sub	s0,a2,s0
f90040dc:	00841793          	slli	a5,s0,0x8
f90040e0:	2c07cc63          	bltz	a5,f90043b8 <__adddf3+0x750>
f90040e4:	008968b3          	or	a7,s2,s0
f90040e8:	c4089ce3          	bnez	a7,f9003d40 <__adddf3+0xd8>
f90040ec:	00000793          	li	a5,0
f90040f0:	00000993          	li	s3,0
f90040f4:	00000493          	li	s1,0
f90040f8:	efdff06f          	j	f9003ff4 <__adddf3+0x38c>
f90040fc:	f60898e3          	bnez	a7,f900406c <__adddf3+0x404>
f9004100:	00351513          	slli	a0,a0,0x3
f9004104:	01d71793          	slli	a5,a4,0x1d
f9004108:	00355513          	srli	a0,a0,0x3
f900410c:	00a7e8b3          	or	a7,a5,a0
f9004110:	00375793          	srli	a5,a4,0x3
f9004114:	f51ff06f          	j	f9004064 <__adddf3+0x3fc>
f9004118:	00351513          	slli	a0,a0,0x3
f900411c:	01d71793          	slli	a5,a4,0x1d
f9004120:	00355513          	srli	a0,a0,0x3
f9004124:	00a7e8b3          	or	a7,a5,a0
f9004128:	000e0493          	mv	s1,t3
f900412c:	00375793          	srli	a5,a4,0x3
f9004130:	ebdff06f          	j	f9003fec <__adddf3+0x384>
f9004134:	40930533          	sub	a0,t1,s1
f9004138:	14048a63          	beqz	s1,f900428c <__adddf3+0x624>
f900413c:	008006b7          	lui	a3,0x800
f9004140:	7ff00793          	li	a5,2047
f9004144:	00d76733          	or	a4,a4,a3
f9004148:	38f30663          	beq	t1,a5,f90044d4 <__adddf3+0x86c>
f900414c:	03800793          	li	a5,56
f9004150:	28a7c063          	blt	a5,a0,f90043d0 <__adddf3+0x768>
f9004154:	01f00793          	li	a5,31
f9004158:	32a7c663          	blt	a5,a0,f9004484 <__adddf3+0x81c>
f900415c:	02000793          	li	a5,32
f9004160:	40a787b3          	sub	a5,a5,a0
f9004164:	00f71933          	sll	s2,a4,a5
f9004168:	00af56b3          	srl	a3,t5,a0
f900416c:	00ff17b3          	sll	a5,t5,a5
f9004170:	00d96933          	or	s2,s2,a3
f9004174:	00f037b3          	snez	a5,a5
f9004178:	00a75733          	srl	a4,a4,a0
f900417c:	00f96933          	or	s2,s2,a5
f9004180:	00e80833          	add	a6,a6,a4
f9004184:	01f90933          	add	s2,s2,t6
f9004188:	01f937b3          	sltu	a5,s2,t6
f900418c:	01078633          	add	a2,a5,a6
f9004190:	00030493          	mv	s1,t1
f9004194:	e89ff06f          	j	f900401c <__adddf3+0x3b4>
f9004198:	008006b7          	lui	a3,0x800
f900419c:	7ff00793          	li	a5,2047
f90041a0:	00d76733          	or	a4,a4,a3
f90041a4:	d8f314e3          	bne	t1,a5,f9003f2c <__adddf3+0x2c4>
f90041a8:	00361793          	slli	a5,a2,0x3
f90041ac:	0037d793          	srli	a5,a5,0x3
f90041b0:	01d81893          	slli	a7,a6,0x1d
f90041b4:	0117e8b3          	or	a7,a5,a7
f90041b8:	000e8993          	mv	s3,t4
f90041bc:	00385793          	srli	a5,a6,0x3
f90041c0:	ea5ff06f          	j	f9004064 <__adddf3+0x3fc>
f90041c4:	fe150713          	addi	a4,a0,-31
f90041c8:	02000693          	li	a3,32
f90041cc:	00e7d733          	srl	a4,a5,a4
f90041d0:	00d60a63          	beq	a2,a3,f90041e4 <__adddf3+0x57c>
f90041d4:	04000693          	li	a3,64
f90041d8:	40c68633          	sub	a2,a3,a2
f90041dc:	00c79633          	sll	a2,a5,a2
f90041e0:	00c96933          	or	s2,s2,a2
f90041e4:	01203933          	snez	s2,s2
f90041e8:	00e96933          	or	s2,s2,a4
f90041ec:	00000613          	li	a2,0
f90041f0:	00000493          	li	s1,0
f90041f4:	de1ff06f          	j	f9003fd4 <__adddf3+0x36c>
f90041f8:	01ff0933          	add	s2,t5,t6
f90041fc:	010707b3          	add	a5,a4,a6
f9004200:	01e93633          	sltu	a2,s2,t5
f9004204:	00c78633          	add	a2,a5,a2
f9004208:	00861793          	slli	a5,a2,0x8
f900420c:	00100493          	li	s1,1
f9004210:	dc07d2e3          	bgez	a5,f9003fd4 <__adddf3+0x36c>
f9004214:	00200493          	li	s1,2
f9004218:	ff8007b7          	lui	a5,0xff800
f900421c:	fff78793          	addi	a5,a5,-1 # ff7fffff <__freertos_irq_stack_top+0x67f89cf>
f9004220:	00f677b3          	and	a5,a2,a5
f9004224:	00195713          	srli	a4,s2,0x1
f9004228:	00197913          	andi	s2,s2,1
f900422c:	01276933          	or	s2,a4,s2
f9004230:	01f79893          	slli	a7,a5,0x1f
f9004234:	0128e933          	or	s2,a7,s2
f9004238:	0017d613          	srli	a2,a5,0x1
f900423c:	b69ff06f          	j	f9003da4 <__adddf3+0x13c>
f9004240:	fe0e0913          	addi	s2,t3,-32
f9004244:	02000793          	li	a5,32
f9004248:	012856b3          	srl	a3,a6,s2
f900424c:	00fe0a63          	beq	t3,a5,f9004260 <__adddf3+0x5f8>
f9004250:	04000913          	li	s2,64
f9004254:	41c90933          	sub	s2,s2,t3
f9004258:	01281933          	sll	s2,a6,s2
f900425c:	012fefb3          	or	t6,t6,s2
f9004260:	01f03933          	snez	s2,t6
f9004264:	00d96933          	or	s2,s2,a3
f9004268:	ab9ff06f          	j	f9003d20 <__adddf3+0xb8>
f900426c:	01e76933          	or	s2,a4,t5
f9004270:	01203933          	snez	s2,s2
f9004274:	412f8933          	sub	s2,t6,s2
f9004278:	012fb7b3          	sltu	a5,t6,s2
f900427c:	40f80633          	sub	a2,a6,a5
f9004280:	00030493          	mv	s1,t1
f9004284:	000e8993          	mv	s3,t4
f9004288:	aa5ff06f          	j	f9003d2c <__adddf3+0xc4>
f900428c:	01e767b3          	or	a5,a4,t5
f9004290:	1c078c63          	beqz	a5,f9004468 <__adddf3+0x800>
f9004294:	fff50793          	addi	a5,a0,-1
f9004298:	22078463          	beqz	a5,f90044c0 <__adddf3+0x858>
f900429c:	7ff00693          	li	a3,2047
f90042a0:	16d50463          	beq	a0,a3,f9004408 <__adddf3+0x7a0>
f90042a4:	00078513          	mv	a0,a5
f90042a8:	ea5ff06f          	j	f900414c <__adddf3+0x4e4>
f90042ac:	02000793          	li	a5,32
f90042b0:	41c787b3          	sub	a5,a5,t3
f90042b4:	00f816b3          	sll	a3,a6,a5
f90042b8:	00ff9933          	sll	s2,t6,a5
f90042bc:	01cfd633          	srl	a2,t6,t3
f90042c0:	00c6e6b3          	or	a3,a3,a2
f90042c4:	01203933          	snez	s2,s2
f90042c8:	01c857b3          	srl	a5,a6,t3
f90042cc:	0126e933          	or	s2,a3,s2
f90042d0:	00f70733          	add	a4,a4,a5
f90042d4:	d3dff06f          	j	f9004010 <__adddf3+0x3a8>
f90042d8:	00361793          	slli	a5,a2,0x3
f90042dc:	0037d793          	srli	a5,a5,0x3
f90042e0:	01d81893          	slli	a7,a6,0x1d
f90042e4:	0117e8b3          	or	a7,a5,a7
f90042e8:	00058493          	mv	s1,a1
f90042ec:	00385793          	srli	a5,a6,0x3
f90042f0:	000e8993          	mv	s3,t4
f90042f4:	cf9ff06f          	j	f9003fec <__adddf3+0x384>
f90042f8:	10078863          	beqz	a5,f9004408 <__adddf3+0x7a0>
f90042fc:	01f86933          	or	s2,a6,t6
f9004300:	d60916e3          	bnez	s2,f900406c <__adddf3+0x404>
f9004304:	00351513          	slli	a0,a0,0x3
f9004308:	01d71793          	slli	a5,a4,0x1d
f900430c:	00355513          	srli	a0,a0,0x3
f9004310:	00f568b3          	or	a7,a0,a5
f9004314:	00375793          	srli	a5,a4,0x3
f9004318:	d4dff06f          	j	f9004064 <__adddf3+0x3fc>
f900431c:	10088663          	beqz	a7,f9004428 <__adddf3+0x7c0>
f9004320:	00361693          	slli	a3,a2,0x3
f9004324:	01d81793          	slli	a5,a6,0x1d
f9004328:	0036d693          	srli	a3,a3,0x3
f900432c:	00d7e8b3          	or	a7,a5,a3
f9004330:	000e8993          	mv	s3,t4
f9004334:	00385793          	srli	a5,a6,0x3
f9004338:	cbdff06f          	j	f9003ff4 <__adddf3+0x38c>
f900433c:	41ff0933          	sub	s2,t5,t6
f9004340:	410707b3          	sub	a5,a4,a6
f9004344:	012f3f33          	sltu	t5,t5,s2
f9004348:	41e78633          	sub	a2,a5,t5
f900434c:	00100493          	li	s1,1
f9004350:	9ddff06f          	j	f9003d2c <__adddf3+0xc4>
f9004354:	00351513          	slli	a0,a0,0x3
f9004358:	01d71793          	slli	a5,a4,0x1d
f900435c:	00355513          	srli	a0,a0,0x3
f9004360:	00f568b3          	or	a7,a0,a5
f9004364:	000e0493          	mv	s1,t3
f9004368:	00375793          	srli	a5,a4,0x3
f900436c:	c81ff06f          	j	f9003fec <__adddf3+0x384>
f9004370:	00351513          	slli	a0,a0,0x3
f9004374:	01d71793          	slli	a5,a4,0x1d
f9004378:	00355513          	srli	a0,a0,0x3
f900437c:	00a7e8b3          	or	a7,a5,a0
f9004380:	00375793          	srli	a5,a4,0x3
f9004384:	c71ff06f          	j	f9003ff4 <__adddf3+0x38c>
f9004388:	7ff00793          	li	a5,2047
f900438c:	caf682e3          	beq	a3,a5,f9004030 <__adddf3+0x3c8>
f9004390:	01ff0933          	add	s2,t5,t6
f9004394:	01e93633          	sltu	a2,s2,t5
f9004398:	010707b3          	add	a5,a4,a6
f900439c:	00c787b3          	add	a5,a5,a2
f90043a0:	01f79893          	slli	a7,a5,0x1f
f90043a4:	00195913          	srli	s2,s2,0x1
f90043a8:	0128e933          	or	s2,a7,s2
f90043ac:	0017d613          	srli	a2,a5,0x1
f90043b0:	00068493          	mv	s1,a3
f90043b4:	c21ff06f          	j	f9003fd4 <__adddf3+0x36c>
f90043b8:	41ef8933          	sub	s2,t6,t5
f90043bc:	40e80733          	sub	a4,a6,a4
f90043c0:	012fb633          	sltu	a2,t6,s2
f90043c4:	40c70433          	sub	s0,a4,a2
f90043c8:	000e8993          	mv	s3,t4
f90043cc:	975ff06f          	j	f9003d40 <__adddf3+0xd8>
f90043d0:	01e76933          	or	s2,a4,t5
f90043d4:	01203933          	snez	s2,s2
f90043d8:	dadff06f          	j	f9004184 <__adddf3+0x51c>
f90043dc:	fe058793          	addi	a5,a1,-32
f90043e0:	02000693          	li	a3,32
f90043e4:	00f757b3          	srl	a5,a4,a5
f90043e8:	00d58a63          	beq	a1,a3,f90043fc <__adddf3+0x794>
f90043ec:	04000693          	li	a3,64
f90043f0:	40b685b3          	sub	a1,a3,a1
f90043f4:	00b71733          	sll	a4,a4,a1
f90043f8:	00ef6f33          	or	t5,t5,a4
f90043fc:	01e03933          	snez	s2,t5
f9004400:	00f96933          	or	s2,s2,a5
f9004404:	e71ff06f          	j	f9004274 <__adddf3+0x60c>
f9004408:	00361793          	slli	a5,a2,0x3
f900440c:	0037d793          	srli	a5,a5,0x3
f9004410:	01d81893          	slli	a7,a6,0x1d
f9004414:	0117e8b3          	or	a7,a5,a7
f9004418:	00385793          	srli	a5,a6,0x3
f900441c:	c49ff06f          	j	f9004064 <__adddf3+0x3fc>
f9004420:	00c968b3          	or	a7,s2,a2
f9004424:	ba0898e3          	bnez	a7,f9003fd4 <__adddf3+0x36c>
f9004428:	00000793          	li	a5,0
f900442c:	00000993          	li	s3,0
f9004430:	bc5ff06f          	j	f9003ff4 <__adddf3+0x38c>
f9004434:	41ef8933          	sub	s2,t6,t5
f9004438:	40e807b3          	sub	a5,a6,a4
f900443c:	012fb633          	sltu	a2,t6,s2
f9004440:	40c78633          	sub	a2,a5,a2
f9004444:	000e8993          	mv	s3,t4
f9004448:	00100493          	li	s1,1
f900444c:	8e1ff06f          	j	f9003d2c <__adddf3+0xc4>
f9004450:	00361693          	slli	a3,a2,0x3
f9004454:	01d81793          	slli	a5,a6,0x1d
f9004458:	0036d693          	srli	a3,a3,0x3
f900445c:	00d7e8b3          	or	a7,a5,a3
f9004460:	00385793          	srli	a5,a6,0x3
f9004464:	b91ff06f          	j	f9003ff4 <__adddf3+0x38c>
f9004468:	00361693          	slli	a3,a2,0x3
f900446c:	01d81793          	slli	a5,a6,0x1d
f9004470:	0036d693          	srli	a3,a3,0x3
f9004474:	00d7e8b3          	or	a7,a5,a3
f9004478:	00050493          	mv	s1,a0
f900447c:	00385793          	srli	a5,a6,0x3
f9004480:	b6dff06f          	j	f9003fec <__adddf3+0x384>
f9004484:	fe050793          	addi	a5,a0,-32
f9004488:	02000693          	li	a3,32
f900448c:	00f757b3          	srl	a5,a4,a5
f9004490:	00d50a63          	beq	a0,a3,f90044a4 <__adddf3+0x83c>
f9004494:	04000693          	li	a3,64
f9004498:	40a68533          	sub	a0,a3,a0
f900449c:	00a71733          	sll	a4,a4,a0
f90044a0:	00ef6f33          	or	t5,t5,a4
f90044a4:	01e03933          	snez	s2,t5
f90044a8:	00f96933          	or	s2,s2,a5
f90044ac:	cd9ff06f          	j	f9004184 <__adddf3+0x51c>
f90044b0:	00000593          	li	a1,0
f90044b4:	7ff00513          	li	a0,2047
f90044b8:	000807b7          	lui	a5,0x80
f90044bc:	949ff06f          	j	f9003e04 <__adddf3+0x19c>
f90044c0:	01ff0933          	add	s2,t5,t6
f90044c4:	010707b3          	add	a5,a4,a6
f90044c8:	01f93633          	sltu	a2,s2,t6
f90044cc:	00c78633          	add	a2,a5,a2
f90044d0:	d39ff06f          	j	f9004208 <__adddf3+0x5a0>
f90044d4:	00361693          	slli	a3,a2,0x3
f90044d8:	01d81793          	slli	a5,a6,0x1d
f90044dc:	0036d693          	srli	a3,a3,0x3
f90044e0:	00d7e8b3          	or	a7,a5,a3
f90044e4:	00385793          	srli	a5,a6,0x3
f90044e8:	b7dff06f          	j	f9004064 <__adddf3+0x3fc>

f90044ec <__divdf3>:
f90044ec:	fc010113          	addi	sp,sp,-64
f90044f0:	0145d793          	srli	a5,a1,0x14
f90044f4:	02812c23          	sw	s0,56(sp)
f90044f8:	02912a23          	sw	s1,52(sp)
f90044fc:	03312623          	sw	s3,44(sp)
f9004500:	00050493          	mv	s1,a0
f9004504:	00c59413          	slli	s0,a1,0xc
f9004508:	02112e23          	sw	ra,60(sp)
f900450c:	03212823          	sw	s2,48(sp)
f9004510:	03412423          	sw	s4,40(sp)
f9004514:	03512223          	sw	s5,36(sp)
f9004518:	03612023          	sw	s6,32(sp)
f900451c:	01712e23          	sw	s7,28(sp)
f9004520:	7ff7f513          	andi	a0,a5,2047
f9004524:	00c45413          	srli	s0,s0,0xc
f9004528:	01f5d993          	srli	s3,a1,0x1f
f900452c:	16050863          	beqz	a0,f900469c <__divdf3+0x1b0>
f9004530:	7ff00793          	li	a5,2047
f9004534:	1cf50263          	beq	a0,a5,f90046f8 <__divdf3+0x20c>
f9004538:	01d4da93          	srli	s5,s1,0x1d
f900453c:	00341413          	slli	s0,s0,0x3
f9004540:	008ae433          	or	s0,s5,s0
f9004544:	00800ab7          	lui	s5,0x800
f9004548:	00349b13          	slli	s6,s1,0x3
f900454c:	01546ab3          	or	s5,s0,s5
f9004550:	c0150913          	addi	s2,a0,-1023
f9004554:	00000493          	li	s1,0
f9004558:	00000b93          	li	s7,0
f900455c:	0146d713          	srli	a4,a3,0x14
f9004560:	00c69413          	slli	s0,a3,0xc
f9004564:	7ff77713          	andi	a4,a4,2047
f9004568:	00c45413          	srli	s0,s0,0xc
f900456c:	01f6da13          	srli	s4,a3,0x1f
f9004570:	0e070063          	beqz	a4,f9004650 <__divdf3+0x164>
f9004574:	7ff00793          	li	a5,2047
f9004578:	04f70863          	beq	a4,a5,f90045c8 <__divdf3+0xdc>
f900457c:	00341793          	slli	a5,s0,0x3
f9004580:	01d65413          	srli	s0,a2,0x1d
f9004584:	00f467b3          	or	a5,s0,a5
f9004588:	c0170713          	addi	a4,a4,-1023
f900458c:	00800437          	lui	s0,0x800
f9004590:	0087e433          	or	s0,a5,s0
f9004594:	00361813          	slli	a6,a2,0x3
f9004598:	40e90933          	sub	s2,s2,a4
f900459c:	00000693          	li	a3,0
f90045a0:	00f00793          	li	a5,15
f90045a4:	0149c5b3          	xor	a1,s3,s4
f90045a8:	2497ec63          	bltu	a5,s1,f9004800 <__divdf3+0x314>
f90045ac:	00001717          	auipc	a4,0x1
f90045b0:	bf470713          	addi	a4,a4,-1036 # f90051a0 <TWO52+0x30>
f90045b4:	00249493          	slli	s1,s1,0x2
f90045b8:	00e484b3          	add	s1,s1,a4
f90045bc:	0004a783          	lw	a5,0(s1)
f90045c0:	00e787b3          	add	a5,a5,a4
f90045c4:	00078067          	jr	a5 # 80000 <__stack_size+0x7e000>
f90045c8:	00c46833          	or	a6,s0,a2
f90045cc:	80190913          	addi	s2,s2,-2047
f90045d0:	18081063          	bnez	a6,f9004750 <__divdf3+0x264>
f90045d4:	0024e493          	ori	s1,s1,2
f90045d8:	00000413          	li	s0,0
f90045dc:	00200693          	li	a3,2
f90045e0:	fc1ff06f          	j	f90045a0 <__divdf3+0xb4>
f90045e4:	7ff00713          	li	a4,2047
f90045e8:	00000793          	li	a5,0
f90045ec:	00000413          	li	s0,0
f90045f0:	00c79793          	slli	a5,a5,0xc
f90045f4:	00040513          	mv	a0,s0
f90045f8:	03c12083          	lw	ra,60(sp)
f90045fc:	03812403          	lw	s0,56(sp)
f9004600:	01471713          	slli	a4,a4,0x14
f9004604:	00c7d793          	srli	a5,a5,0xc
f9004608:	01f59593          	slli	a1,a1,0x1f
f900460c:	00e7e7b3          	or	a5,a5,a4
f9004610:	00b7e7b3          	or	a5,a5,a1
f9004614:	03412483          	lw	s1,52(sp)
f9004618:	03012903          	lw	s2,48(sp)
f900461c:	02c12983          	lw	s3,44(sp)
f9004620:	02812a03          	lw	s4,40(sp)
f9004624:	02412a83          	lw	s5,36(sp)
f9004628:	02012b03          	lw	s6,32(sp)
f900462c:	01c12b83          	lw	s7,28(sp)
f9004630:	00078593          	mv	a1,a5
f9004634:	04010113          	addi	sp,sp,64
f9004638:	00008067          	ret
f900463c:	00000593          	li	a1,0
f9004640:	7ff00713          	li	a4,2047
f9004644:	000807b7          	lui	a5,0x80
f9004648:	00000413          	li	s0,0
f900464c:	fa5ff06f          	j	f90045f0 <__divdf3+0x104>
f9004650:	00c46833          	or	a6,s0,a2
f9004654:	0e080663          	beqz	a6,f9004740 <__divdf3+0x254>
f9004658:	3e040a63          	beqz	s0,f9004a4c <__divdf3+0x560>
f900465c:	00040513          	mv	a0,s0
f9004660:	00c12423          	sw	a2,8(sp)
f9004664:	c61fd0ef          	jal	ra,f90022c4 <__clzsi2>
f9004668:	00812603          	lw	a2,8(sp)
f900466c:	ff550593          	addi	a1,a0,-11
f9004670:	01d00693          	li	a3,29
f9004674:	ff850713          	addi	a4,a0,-8
f9004678:	40b686b3          	sub	a3,a3,a1
f900467c:	00e417b3          	sll	a5,s0,a4
f9004680:	00d656b3          	srl	a3,a2,a3
f9004684:	00f6e433          	or	s0,a3,a5
f9004688:	00e61833          	sll	a6,a2,a4
f900468c:	01250533          	add	a0,a0,s2
f9004690:	3f350913          	addi	s2,a0,1011
f9004694:	00000693          	li	a3,0
f9004698:	f09ff06f          	j	f90045a0 <__divdf3+0xb4>
f900469c:	00946ab3          	or	s5,s0,s1
f90046a0:	080a8663          	beqz	s5,f900472c <__divdf3+0x240>
f90046a4:	00d12623          	sw	a3,12(sp)
f90046a8:	00c12423          	sw	a2,8(sp)
f90046ac:	36040863          	beqz	s0,f9004a1c <__divdf3+0x530>
f90046b0:	00040513          	mv	a0,s0
f90046b4:	c11fd0ef          	jal	ra,f90022c4 <__clzsi2>
f90046b8:	00812603          	lw	a2,8(sp)
f90046bc:	00c12683          	lw	a3,12(sp)
f90046c0:	00050913          	mv	s2,a0
f90046c4:	ff550713          	addi	a4,a0,-11
f90046c8:	01d00a93          	li	s5,29
f90046cc:	ff890b13          	addi	s6,s2,-8
f90046d0:	40ea8ab3          	sub	s5,s5,a4
f90046d4:	01641433          	sll	s0,s0,s6
f90046d8:	0154dab3          	srl	s5,s1,s5
f90046dc:	008aeab3          	or	s5,s5,s0
f90046e0:	01649b33          	sll	s6,s1,s6
f90046e4:	c0d00513          	li	a0,-1011
f90046e8:	41250933          	sub	s2,a0,s2
f90046ec:	00000493          	li	s1,0
f90046f0:	00000b93          	li	s7,0
f90046f4:	e69ff06f          	j	f900455c <__divdf3+0x70>
f90046f8:	00946ab3          	or	s5,s0,s1
f90046fc:	000a9c63          	bnez	s5,f9004714 <__divdf3+0x228>
f9004700:	00000b13          	li	s6,0
f9004704:	00800493          	li	s1,8
f9004708:	7ff00913          	li	s2,2047
f900470c:	00200b93          	li	s7,2
f9004710:	e4dff06f          	j	f900455c <__divdf3+0x70>
f9004714:	00048b13          	mv	s6,s1
f9004718:	00040a93          	mv	s5,s0
f900471c:	00c00493          	li	s1,12
f9004720:	7ff00913          	li	s2,2047
f9004724:	00300b93          	li	s7,3
f9004728:	e35ff06f          	j	f900455c <__divdf3+0x70>
f900472c:	00000b13          	li	s6,0
f9004730:	00400493          	li	s1,4
f9004734:	00000913          	li	s2,0
f9004738:	00100b93          	li	s7,1
f900473c:	e21ff06f          	j	f900455c <__divdf3+0x70>
f9004740:	0014e493          	ori	s1,s1,1
f9004744:	00000413          	li	s0,0
f9004748:	00100693          	li	a3,1
f900474c:	e55ff06f          	j	f90045a0 <__divdf3+0xb4>
f9004750:	0034e493          	ori	s1,s1,3
f9004754:	00060813          	mv	a6,a2
f9004758:	00300693          	li	a3,3
f900475c:	e45ff06f          	j	f90045a0 <__divdf3+0xb4>
f9004760:	3c070063          	beqz	a4,f9004b20 <__divdf3+0x634>
f9004764:	00100793          	li	a5,1
f9004768:	40e787b3          	sub	a5,a5,a4
f900476c:	03800693          	li	a3,56
f9004770:	42f6d063          	bge	a3,a5,f9004b90 <__divdf3+0x6a4>
f9004774:	00000713          	li	a4,0
f9004778:	00000793          	li	a5,0
f900477c:	00000413          	li	s0,0
f9004780:	e71ff06f          	j	f90045f0 <__divdf3+0x104>
f9004784:	000a0593          	mv	a1,s4
f9004788:	00200793          	li	a5,2
f900478c:	e4f68ce3          	beq	a3,a5,f90045e4 <__divdf3+0xf8>
f9004790:	00300793          	li	a5,3
f9004794:	eaf684e3          	beq	a3,a5,f900463c <__divdf3+0x150>
f9004798:	00100793          	li	a5,1
f900479c:	fcf68ce3          	beq	a3,a5,f9004774 <__divdf3+0x288>
f90047a0:	3ff90713          	addi	a4,s2,1023
f90047a4:	fae05ee3          	blez	a4,f9004760 <__divdf3+0x274>
f90047a8:	00787793          	andi	a5,a6,7
f90047ac:	32079c63          	bnez	a5,f9004ae4 <__divdf3+0x5f8>
f90047b0:	00385813          	srli	a6,a6,0x3
f90047b4:	00741793          	slli	a5,s0,0x7
f90047b8:	0007da63          	bgez	a5,f90047cc <__divdf3+0x2e0>
f90047bc:	ff0007b7          	lui	a5,0xff000
f90047c0:	fff78793          	addi	a5,a5,-1 # feffffff <__freertos_irq_stack_top+0x5ff89cf>
f90047c4:	00f47433          	and	s0,s0,a5
f90047c8:	40090713          	addi	a4,s2,1024
f90047cc:	7fe00793          	li	a5,2046
f90047d0:	e0e7cae3          	blt	a5,a4,f90045e4 <__divdf3+0xf8>
f90047d4:	00941793          	slli	a5,s0,0x9
f90047d8:	01d41693          	slli	a3,s0,0x1d
f90047dc:	0106e433          	or	s0,a3,a6
f90047e0:	00c7d793          	srli	a5,a5,0xc
f90047e4:	7ff77713          	andi	a4,a4,2047
f90047e8:	e09ff06f          	j	f90045f0 <__divdf3+0x104>
f90047ec:	00098593          	mv	a1,s3
f90047f0:	000a8413          	mv	s0,s5
f90047f4:	000b0813          	mv	a6,s6
f90047f8:	000b8693          	mv	a3,s7
f90047fc:	f8dff06f          	j	f9004788 <__divdf3+0x29c>
f9004800:	2b546863          	bltu	s0,s5,f9004ab0 <__divdf3+0x5c4>
f9004804:	2a8a8463          	beq	s5,s0,f9004aac <__divdf3+0x5c0>
f9004808:	000b0713          	mv	a4,s6
f900480c:	fff90913          	addi	s2,s2,-1
f9004810:	00000b13          	li	s6,0
f9004814:	00841793          	slli	a5,s0,0x8
f9004818:	01885893          	srli	a7,a6,0x18
f900481c:	00f8e8b3          	or	a7,a7,a5
f9004820:	0108de13          	srli	t3,a7,0x10
f9004824:	03cad7b3          	divu	a5,s5,t3
f9004828:	01089e93          	slli	t4,a7,0x10
f900482c:	010ede93          	srli	t4,t4,0x10
f9004830:	01075613          	srli	a2,a4,0x10
f9004834:	00881313          	slli	t1,a6,0x8
f9004838:	03cafab3          	remu	s5,s5,t3
f900483c:	02fe86b3          	mul	a3,t4,a5
f9004840:	010a9a93          	slli	s5,s5,0x10
f9004844:	01566633          	or	a2,a2,s5
f9004848:	00d67e63          	bgeu	a2,a3,f9004864 <__divdf3+0x378>
f900484c:	01160633          	add	a2,a2,a7
f9004850:	fff78513          	addi	a0,a5,-1
f9004854:	33166a63          	bltu	a2,a7,f9004b88 <__divdf3+0x69c>
f9004858:	32d67863          	bgeu	a2,a3,f9004b88 <__divdf3+0x69c>
f900485c:	ffe78793          	addi	a5,a5,-2
f9004860:	01160633          	add	a2,a2,a7
f9004864:	40d60633          	sub	a2,a2,a3
f9004868:	03c65433          	divu	s0,a2,t3
f900486c:	01071713          	slli	a4,a4,0x10
f9004870:	01075713          	srli	a4,a4,0x10
f9004874:	03c67633          	remu	a2,a2,t3
f9004878:	028e86b3          	mul	a3,t4,s0
f900487c:	01061613          	slli	a2,a2,0x10
f9004880:	00c76633          	or	a2,a4,a2
f9004884:	00d67e63          	bgeu	a2,a3,f90048a0 <__divdf3+0x3b4>
f9004888:	01160633          	add	a2,a2,a7
f900488c:	fff40713          	addi	a4,s0,-1 # 7fffff <__stack_size+0x7fdfff>
f9004890:	2f166863          	bltu	a2,a7,f9004b80 <__divdf3+0x694>
f9004894:	2ed67663          	bgeu	a2,a3,f9004b80 <__divdf3+0x694>
f9004898:	ffe40413          	addi	s0,s0,-2
f900489c:	01160633          	add	a2,a2,a7
f90048a0:	01079793          	slli	a5,a5,0x10
f90048a4:	000103b7          	lui	t2,0x10
f90048a8:	0087e433          	or	s0,a5,s0
f90048ac:	fff38793          	addi	a5,t2,-1 # ffff <__stack_size+0xdfff>
f90048b0:	00f47833          	and	a6,s0,a5
f90048b4:	01045f13          	srli	t5,s0,0x10
f90048b8:	01035513          	srli	a0,t1,0x10
f90048bc:	00f377b3          	and	a5,t1,a5
f90048c0:	02f80fb3          	mul	t6,a6,a5
f90048c4:	40d60733          	sub	a4,a2,a3
f90048c8:	02ff02b3          	mul	t0,t5,a5
f90048cc:	010fd613          	srli	a2,t6,0x10
f90048d0:	030506b3          	mul	a3,a0,a6
f90048d4:	005686b3          	add	a3,a3,t0
f90048d8:	00d606b3          	add	a3,a2,a3
f90048dc:	02af0833          	mul	a6,t5,a0
f90048e0:	0056f463          	bgeu	a3,t0,f90048e8 <__divdf3+0x3fc>
f90048e4:	00780833          	add	a6,a6,t2
f90048e8:	00010f37          	lui	t5,0x10
f90048ec:	ffff0f13          	addi	t5,t5,-1 # ffff <__stack_size+0xdfff>
f90048f0:	0106d613          	srli	a2,a3,0x10
f90048f4:	01e6f6b3          	and	a3,a3,t5
f90048f8:	01069693          	slli	a3,a3,0x10
f90048fc:	01efff33          	and	t5,t6,t5
f9004900:	01060633          	add	a2,a2,a6
f9004904:	01e686b3          	add	a3,a3,t5
f9004908:	16c76e63          	bltu	a4,a2,f9004a84 <__divdf3+0x598>
f900490c:	16c70a63          	beq	a4,a2,f9004a80 <__divdf3+0x594>
f9004910:	40db06b3          	sub	a3,s6,a3
f9004914:	40c70733          	sub	a4,a4,a2
f9004918:	00db3b33          	sltu	s6,s6,a3
f900491c:	41670b33          	sub	s6,a4,s6
f9004920:	3ff90713          	addi	a4,s2,1023
f9004924:	1f688263          	beq	a7,s6,f9004b08 <__divdf3+0x61c>
f9004928:	03cb5833          	divu	a6,s6,t3
f900492c:	0106d613          	srli	a2,a3,0x10
f9004930:	03cb7b33          	remu	s6,s6,t3
f9004934:	030e8f33          	mul	t5,t4,a6
f9004938:	010b1b13          	slli	s6,s6,0x10
f900493c:	01666b33          	or	s6,a2,s6
f9004940:	01eb7e63          	bgeu	s6,t5,f900495c <__divdf3+0x470>
f9004944:	011b0b33          	add	s6,s6,a7
f9004948:	fff80613          	addi	a2,a6,-1
f900494c:	2d1b6863          	bltu	s6,a7,f9004c1c <__divdf3+0x730>
f9004950:	2deb7663          	bgeu	s6,t5,f9004c1c <__divdf3+0x730>
f9004954:	ffe80813          	addi	a6,a6,-2
f9004958:	011b0b33          	add	s6,s6,a7
f900495c:	41eb0b33          	sub	s6,s6,t5
f9004960:	03cb5633          	divu	a2,s6,t3
f9004964:	01069693          	slli	a3,a3,0x10
f9004968:	0106d693          	srli	a3,a3,0x10
f900496c:	03cb7b33          	remu	s6,s6,t3
f9004970:	02ce8eb3          	mul	t4,t4,a2
f9004974:	010b1b13          	slli	s6,s6,0x10
f9004978:	0166e6b3          	or	a3,a3,s6
f900497c:	01d6fe63          	bgeu	a3,t4,f9004998 <__divdf3+0x4ac>
f9004980:	011686b3          	add	a3,a3,a7
f9004984:	fff60e13          	addi	t3,a2,-1
f9004988:	2916e663          	bltu	a3,a7,f9004c14 <__divdf3+0x728>
f900498c:	29d6f463          	bgeu	a3,t4,f9004c14 <__divdf3+0x728>
f9004990:	ffe60613          	addi	a2,a2,-2
f9004994:	011686b3          	add	a3,a3,a7
f9004998:	01081813          	slli	a6,a6,0x10
f900499c:	00c86833          	or	a6,a6,a2
f90049a0:	01081e13          	slli	t3,a6,0x10
f90049a4:	01085f93          	srli	t6,a6,0x10
f90049a8:	010e5e13          	srli	t3,t3,0x10
f90049ac:	02fe0f33          	mul	t5,t3,a5
f90049b0:	41d686b3          	sub	a3,a3,t4
f90049b4:	03c50e33          	mul	t3,a0,t3
f90049b8:	010f5613          	srli	a2,t5,0x10
f90049bc:	02ff87b3          	mul	a5,t6,a5
f90049c0:	00fe0e33          	add	t3,t3,a5
f90049c4:	01c60633          	add	a2,a2,t3
f90049c8:	03f50533          	mul	a0,a0,t6
f90049cc:	00f67663          	bgeu	a2,a5,f90049d8 <__divdf3+0x4ec>
f90049d0:	000107b7          	lui	a5,0x10
f90049d4:	00f50533          	add	a0,a0,a5
f90049d8:	00010e37          	lui	t3,0x10
f90049dc:	fffe0e13          	addi	t3,t3,-1 # ffff <__stack_size+0xdfff>
f90049e0:	01065793          	srli	a5,a2,0x10
f90049e4:	01c67633          	and	a2,a2,t3
f90049e8:	01061613          	slli	a2,a2,0x10
f90049ec:	01cf7f33          	and	t5,t5,t3
f90049f0:	00a78533          	add	a0,a5,a0
f90049f4:	01e60633          	add	a2,a2,t5
f90049f8:	0ca6f863          	bgeu	a3,a0,f9004ac8 <__divdf3+0x5dc>
f90049fc:	00d886b3          	add	a3,a7,a3
f9004a00:	fff80793          	addi	a5,a6,-1
f9004a04:	2516e463          	bltu	a3,a7,f9004c4c <__divdf3+0x760>
f9004a08:	20a6ee63          	bltu	a3,a0,f9004c24 <__divdf3+0x738>
f9004a0c:	24a68663          	beq	a3,a0,f9004c58 <__divdf3+0x76c>
f9004a10:	00078813          	mv	a6,a5
f9004a14:	00186813          	ori	a6,a6,1
f9004a18:	d8dff06f          	j	f90047a4 <__divdf3+0x2b8>
f9004a1c:	00048513          	mv	a0,s1
f9004a20:	8a5fd0ef          	jal	ra,f90022c4 <__clzsi2>
f9004a24:	01550713          	addi	a4,a0,21
f9004a28:	01c00593          	li	a1,28
f9004a2c:	02050913          	addi	s2,a0,32
f9004a30:	00812603          	lw	a2,8(sp)
f9004a34:	00c12683          	lw	a3,12(sp)
f9004a38:	c8e5d8e3          	bge	a1,a4,f90046c8 <__divdf3+0x1dc>
f9004a3c:	ff850413          	addi	s0,a0,-8
f9004a40:	00849ab3          	sll	s5,s1,s0
f9004a44:	00000b13          	li	s6,0
f9004a48:	c9dff06f          	j	f90046e4 <__divdf3+0x1f8>
f9004a4c:	00060513          	mv	a0,a2
f9004a50:	00c12423          	sw	a2,8(sp)
f9004a54:	871fd0ef          	jal	ra,f90022c4 <__clzsi2>
f9004a58:	01550593          	addi	a1,a0,21
f9004a5c:	01c00713          	li	a4,28
f9004a60:	00050793          	mv	a5,a0
f9004a64:	00812603          	lw	a2,8(sp)
f9004a68:	02050513          	addi	a0,a0,32
f9004a6c:	c0b752e3          	bge	a4,a1,f9004670 <__divdf3+0x184>
f9004a70:	ff878793          	addi	a5,a5,-8 # fff8 <__stack_size+0xdff8>
f9004a74:	00000813          	li	a6,0
f9004a78:	00f61433          	sll	s0,a2,a5
f9004a7c:	c11ff06f          	j	f900468c <__divdf3+0x1a0>
f9004a80:	e8db78e3          	bgeu	s6,a3,f9004910 <__divdf3+0x424>
f9004a84:	006b0b33          	add	s6,s6,t1
f9004a88:	006b3833          	sltu	a6,s6,t1
f9004a8c:	01180833          	add	a6,a6,a7
f9004a90:	01070733          	add	a4,a4,a6
f9004a94:	fff40813          	addi	a6,s0,-1
f9004a98:	02e8fe63          	bgeu	a7,a4,f9004ad4 <__divdf3+0x5e8>
f9004a9c:	16c76063          	bltu	a4,a2,f9004bfc <__divdf3+0x710>
f9004aa0:	14e60c63          	beq	a2,a4,f9004bf8 <__divdf3+0x70c>
f9004aa4:	00080413          	mv	s0,a6
f9004aa8:	e69ff06f          	j	f9004910 <__divdf3+0x424>
f9004aac:	d50b6ee3          	bltu	s6,a6,f9004808 <__divdf3+0x31c>
f9004ab0:	01fa9713          	slli	a4,s5,0x1f
f9004ab4:	001b5613          	srli	a2,s6,0x1
f9004ab8:	001ada93          	srli	s5,s5,0x1
f9004abc:	00c76733          	or	a4,a4,a2
f9004ac0:	01fb1b13          	slli	s6,s6,0x1f
f9004ac4:	d51ff06f          	j	f9004814 <__divdf3+0x328>
f9004ac8:	f4a696e3          	bne	a3,a0,f9004a14 <__divdf3+0x528>
f9004acc:	cc060ce3          	beqz	a2,f90047a4 <__divdf3+0x2b8>
f9004ad0:	f2dff06f          	j	f90049fc <__divdf3+0x510>
f9004ad4:	fce898e3          	bne	a7,a4,f9004aa4 <__divdf3+0x5b8>
f9004ad8:	fc6b72e3          	bgeu	s6,t1,f9004a9c <__divdf3+0x5b0>
f9004adc:	00080413          	mv	s0,a6
f9004ae0:	e31ff06f          	j	f9004910 <__divdf3+0x424>
f9004ae4:	00f87793          	andi	a5,a6,15
f9004ae8:	00400693          	li	a3,4
f9004aec:	ccd782e3          	beq	a5,a3,f90047b0 <__divdf3+0x2c4>
f9004af0:	ffc83793          	sltiu	a5,a6,-4
f9004af4:	00480813          	addi	a6,a6,4
f9004af8:	0017c793          	xori	a5,a5,1
f9004afc:	00385813          	srli	a6,a6,0x3
f9004b00:	00f40433          	add	s0,s0,a5
f9004b04:	cb1ff06f          	j	f90047b4 <__divdf3+0x2c8>
f9004b08:	00000813          	li	a6,0
f9004b0c:	00100793          	li	a5,1
f9004b10:	fee048e3          	bgtz	a4,f9004b00 <__divdf3+0x614>
f9004b14:	fff00813          	li	a6,-1
f9004b18:	c40716e3          	bnez	a4,f9004764 <__divdf3+0x278>
f9004b1c:	c0100913          	li	s2,-1023
f9004b20:	00100793          	li	a5,1
f9004b24:	41e90513          	addi	a0,s2,1054
f9004b28:	00a41733          	sll	a4,s0,a0
f9004b2c:	00f856b3          	srl	a3,a6,a5
f9004b30:	00a81533          	sll	a0,a6,a0
f9004b34:	00d76733          	or	a4,a4,a3
f9004b38:	00a03533          	snez	a0,a0
f9004b3c:	00a76733          	or	a4,a4,a0
f9004b40:	00777693          	andi	a3,a4,7
f9004b44:	00f45433          	srl	s0,s0,a5
f9004b48:	02068063          	beqz	a3,f9004b68 <__divdf3+0x67c>
f9004b4c:	00f77793          	andi	a5,a4,15
f9004b50:	00400693          	li	a3,4
f9004b54:	00d78a63          	beq	a5,a3,f9004b68 <__divdf3+0x67c>
f9004b58:	00470793          	addi	a5,a4,4
f9004b5c:	00e7b733          	sltu	a4,a5,a4
f9004b60:	00e40433          	add	s0,s0,a4
f9004b64:	00078713          	mv	a4,a5
f9004b68:	00841793          	slli	a5,s0,0x8
f9004b6c:	0607d863          	bgez	a5,f9004bdc <__divdf3+0x6f0>
f9004b70:	00100713          	li	a4,1
f9004b74:	00000793          	li	a5,0
f9004b78:	00000413          	li	s0,0
f9004b7c:	a75ff06f          	j	f90045f0 <__divdf3+0x104>
f9004b80:	00070413          	mv	s0,a4
f9004b84:	d1dff06f          	j	f90048a0 <__divdf3+0x3b4>
f9004b88:	00050793          	mv	a5,a0
f9004b8c:	cd9ff06f          	j	f9004864 <__divdf3+0x378>
f9004b90:	01f00693          	li	a3,31
f9004b94:	f8f6d8e3          	bge	a3,a5,f9004b24 <__divdf3+0x638>
f9004b98:	fe100693          	li	a3,-31
f9004b9c:	40e68733          	sub	a4,a3,a4
f9004ba0:	02000613          	li	a2,32
f9004ba4:	00e456b3          	srl	a3,s0,a4
f9004ba8:	00c78863          	beq	a5,a2,f9004bb8 <__divdf3+0x6cc>
f9004bac:	43e90793          	addi	a5,s2,1086
f9004bb0:	00f417b3          	sll	a5,s0,a5
f9004bb4:	00f86833          	or	a6,a6,a5
f9004bb8:	01003733          	snez	a4,a6
f9004bbc:	00d76733          	or	a4,a4,a3
f9004bc0:	00777413          	andi	s0,a4,7
f9004bc4:	00000793          	li	a5,0
f9004bc8:	02040063          	beqz	s0,f9004be8 <__divdf3+0x6fc>
f9004bcc:	00f77793          	andi	a5,a4,15
f9004bd0:	00400693          	li	a3,4
f9004bd4:	00000413          	li	s0,0
f9004bd8:	f8d790e3          	bne	a5,a3,f9004b58 <__divdf3+0x66c>
f9004bdc:	00941793          	slli	a5,s0,0x9
f9004be0:	00c7d793          	srli	a5,a5,0xc
f9004be4:	01d41413          	slli	s0,s0,0x1d
f9004be8:	00375713          	srli	a4,a4,0x3
f9004bec:	00876433          	or	s0,a4,s0
f9004bf0:	00000713          	li	a4,0
f9004bf4:	9fdff06f          	j	f90045f0 <__divdf3+0x104>
f9004bf8:	eadb76e3          	bgeu	s6,a3,f9004aa4 <__divdf3+0x5b8>
f9004bfc:	006b0b33          	add	s6,s6,t1
f9004c00:	006b3833          	sltu	a6,s6,t1
f9004c04:	01180833          	add	a6,a6,a7
f9004c08:	ffe40413          	addi	s0,s0,-2
f9004c0c:	01070733          	add	a4,a4,a6
f9004c10:	d01ff06f          	j	f9004910 <__divdf3+0x424>
f9004c14:	000e0613          	mv	a2,t3
f9004c18:	d81ff06f          	j	f9004998 <__divdf3+0x4ac>
f9004c1c:	00060813          	mv	a6,a2
f9004c20:	d3dff06f          	j	f900495c <__divdf3+0x470>
f9004c24:	00131793          	slli	a5,t1,0x1
f9004c28:	0067b333          	sltu	t1,a5,t1
f9004c2c:	011308b3          	add	a7,t1,a7
f9004c30:	011686b3          	add	a3,a3,a7
f9004c34:	ffe80813          	addi	a6,a6,-2
f9004c38:	00078313          	mv	t1,a5
f9004c3c:	dca69ce3          	bne	a3,a0,f9004a14 <__divdf3+0x528>
f9004c40:	b6c302e3          	beq	t1,a2,f90047a4 <__divdf3+0x2b8>
f9004c44:	00186813          	ori	a6,a6,1
f9004c48:	b5dff06f          	j	f90047a4 <__divdf3+0x2b8>
f9004c4c:	00078813          	mv	a6,a5
f9004c50:	fea688e3          	beq	a3,a0,f9004c40 <__divdf3+0x754>
f9004c54:	dc1ff06f          	j	f9004a14 <__divdf3+0x528>
f9004c58:	fcc366e3          	bltu	t1,a2,f9004c24 <__divdf3+0x738>
f9004c5c:	00078813          	mv	a6,a5
f9004c60:	fec312e3          	bne	t1,a2,f9004c44 <__divdf3+0x758>
f9004c64:	b41ff06f          	j	f90047a4 <__divdf3+0x2b8>

f9004c68 <__eqdf2>:
f9004c68:	0145d713          	srli	a4,a1,0x14
f9004c6c:	001007b7          	lui	a5,0x100
f9004c70:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004c74:	0146d813          	srli	a6,a3,0x14
f9004c78:	7ff77713          	andi	a4,a4,2047
f9004c7c:	7ff00893          	li	a7,2047
f9004c80:	00b7fe33          	and	t3,a5,a1
f9004c84:	00050e93          	mv	t4,a0
f9004c88:	00d7f7b3          	and	a5,a5,a3
f9004c8c:	01f5d593          	srli	a1,a1,0x1f
f9004c90:	00060f13          	mv	t5,a2
f9004c94:	7ff87813          	andi	a6,a6,2047
f9004c98:	01f6d693          	srli	a3,a3,0x1f
f9004c9c:	01170e63          	beq	a4,a7,f9004cb8 <__eqdf2+0x50>
f9004ca0:	00100313          	li	t1,1
f9004ca4:	01180663          	beq	a6,a7,f9004cb0 <__eqdf2+0x48>
f9004ca8:	01071463          	bne	a4,a6,f9004cb0 <__eqdf2+0x48>
f9004cac:	02fe0263          	beq	t3,a5,f9004cd0 <__eqdf2+0x68>
f9004cb0:	00030513          	mv	a0,t1
f9004cb4:	00008067          	ret
f9004cb8:	00ae68b3          	or	a7,t3,a0
f9004cbc:	00100313          	li	t1,1
f9004cc0:	fe0898e3          	bnez	a7,f9004cb0 <__eqdf2+0x48>
f9004cc4:	fee816e3          	bne	a6,a4,f9004cb0 <__eqdf2+0x48>
f9004cc8:	00c7e7b3          	or	a5,a5,a2
f9004ccc:	fe0792e3          	bnez	a5,f9004cb0 <__eqdf2+0x48>
f9004cd0:	00100313          	li	t1,1
f9004cd4:	fdee9ee3          	bne	t4,t5,f9004cb0 <__eqdf2+0x48>
f9004cd8:	00000313          	li	t1,0
f9004cdc:	fcd58ae3          	beq	a1,a3,f9004cb0 <__eqdf2+0x48>
f9004ce0:	00100313          	li	t1,1
f9004ce4:	fc0716e3          	bnez	a4,f9004cb0 <__eqdf2+0x48>
f9004ce8:	00ae6533          	or	a0,t3,a0
f9004cec:	00a03333          	snez	t1,a0
f9004cf0:	fc1ff06f          	j	f9004cb0 <__eqdf2+0x48>

f9004cf4 <__gedf2>:
f9004cf4:	0145d713          	srli	a4,a1,0x14
f9004cf8:	001007b7          	lui	a5,0x100
f9004cfc:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004d00:	0146d813          	srli	a6,a3,0x14
f9004d04:	7ff77713          	andi	a4,a4,2047
f9004d08:	7ff00893          	li	a7,2047
f9004d0c:	00b7f333          	and	t1,a5,a1
f9004d10:	00050e13          	mv	t3,a0
f9004d14:	00d7f7b3          	and	a5,a5,a3
f9004d18:	01f5d593          	srli	a1,a1,0x1f
f9004d1c:	00060e93          	mv	t4,a2
f9004d20:	7ff87813          	andi	a6,a6,2047
f9004d24:	01f6d693          	srli	a3,a3,0x1f
f9004d28:	05170263          	beq	a4,a7,f9004d6c <__gedf2+0x78>
f9004d2c:	03180863          	beq	a6,a7,f9004d5c <__gedf2+0x68>
f9004d30:	04071463          	bnez	a4,f9004d78 <__gedf2+0x84>
f9004d34:	00a36533          	or	a0,t1,a0
f9004d38:	00081663          	bnez	a6,f9004d44 <__gedf2+0x50>
f9004d3c:	00c7e633          	or	a2,a5,a2
f9004d40:	06060263          	beqz	a2,f9004da4 <__gedf2+0xb0>
f9004d44:	04050a63          	beqz	a0,f9004d98 <__gedf2+0xa4>
f9004d48:	06d58c63          	beq	a1,a3,f9004dc0 <__gedf2+0xcc>
f9004d4c:	00100693          	li	a3,1
f9004d50:	04059663          	bnez	a1,f9004d9c <__gedf2+0xa8>
f9004d54:	00068513          	mv	a0,a3
f9004d58:	00008067          	ret
f9004d5c:	00c7e8b3          	or	a7,a5,a2
f9004d60:	fc0888e3          	beqz	a7,f9004d30 <__gedf2+0x3c>
f9004d64:	ffe00693          	li	a3,-2
f9004d68:	fedff06f          	j	f9004d54 <__gedf2+0x60>
f9004d6c:	00a36533          	or	a0,t1,a0
f9004d70:	fe051ae3          	bnez	a0,f9004d64 <__gedf2+0x70>
f9004d74:	02e80e63          	beq	a6,a4,f9004db0 <__gedf2+0xbc>
f9004d78:	00081663          	bnez	a6,f9004d84 <__gedf2+0x90>
f9004d7c:	00c7e633          	or	a2,a5,a2
f9004d80:	fc0606e3          	beqz	a2,f9004d4c <__gedf2+0x58>
f9004d84:	fcd594e3          	bne	a1,a3,f9004d4c <__gedf2+0x58>
f9004d88:	02e85c63          	bge	a6,a4,f9004dc0 <__gedf2+0xcc>
f9004d8c:	00069863          	bnez	a3,f9004d9c <__gedf2+0xa8>
f9004d90:	00100693          	li	a3,1
f9004d94:	fc1ff06f          	j	f9004d54 <__gedf2+0x60>
f9004d98:	fa069ee3          	bnez	a3,f9004d54 <__gedf2+0x60>
f9004d9c:	fff00693          	li	a3,-1
f9004da0:	fb5ff06f          	j	f9004d54 <__gedf2+0x60>
f9004da4:	00000693          	li	a3,0
f9004da8:	fa0506e3          	beqz	a0,f9004d54 <__gedf2+0x60>
f9004dac:	fa1ff06f          	j	f9004d4c <__gedf2+0x58>
f9004db0:	00c7e633          	or	a2,a5,a2
f9004db4:	fc0608e3          	beqz	a2,f9004d84 <__gedf2+0x90>
f9004db8:	ffe00693          	li	a3,-2
f9004dbc:	f99ff06f          	j	f9004d54 <__gedf2+0x60>
f9004dc0:	01074a63          	blt	a4,a6,f9004dd4 <__gedf2+0xe0>
f9004dc4:	f867e4e3          	bltu	a5,t1,f9004d4c <__gedf2+0x58>
f9004dc8:	00f30c63          	beq	t1,a5,f9004de0 <__gedf2+0xec>
f9004dcc:	00000693          	li	a3,0
f9004dd0:	f8f372e3          	bgeu	t1,a5,f9004d54 <__gedf2+0x60>
f9004dd4:	fc0584e3          	beqz	a1,f9004d9c <__gedf2+0xa8>
f9004dd8:	00058693          	mv	a3,a1
f9004ddc:	f79ff06f          	j	f9004d54 <__gedf2+0x60>
f9004de0:	f7cee6e3          	bltu	t4,t3,f9004d4c <__gedf2+0x58>
f9004de4:	00000693          	li	a3,0
f9004de8:	f7de76e3          	bgeu	t3,t4,f9004d54 <__gedf2+0x60>
f9004dec:	fe9ff06f          	j	f9004dd4 <__gedf2+0xe0>

f9004df0 <__unorddf2>:
f9004df0:	0145d713          	srli	a4,a1,0x14
f9004df4:	001007b7          	lui	a5,0x100
f9004df8:	fff78793          	addi	a5,a5,-1 # fffff <__stack_size+0xfdfff>
f9004dfc:	fff74713          	not	a4,a4
f9004e00:	0146d813          	srli	a6,a3,0x14
f9004e04:	00b7f5b3          	and	a1,a5,a1
f9004e08:	00d7f7b3          	and	a5,a5,a3
f9004e0c:	01571693          	slli	a3,a4,0x15
f9004e10:	7ff87813          	andi	a6,a6,2047
f9004e14:	02068063          	beqz	a3,f9004e34 <__unorddf2+0x44>
f9004e18:	7ff00713          	li	a4,2047
f9004e1c:	00000513          	li	a0,0
f9004e20:	00e80463          	beq	a6,a4,f9004e28 <__unorddf2+0x38>
f9004e24:	00008067          	ret
f9004e28:	00c7e7b3          	or	a5,a5,a2
f9004e2c:	00f03533          	snez	a0,a5
f9004e30:	00008067          	ret
f9004e34:	00a5e5b3          	or	a1,a1,a0
f9004e38:	00100513          	li	a0,1
f9004e3c:	fc058ee3          	beqz	a1,f9004e18 <__unorddf2+0x28>
f9004e40:	00008067          	ret

f9004e44 <__errno>:
f9004e44:	81418793          	addi	a5,gp,-2028 # f900560c <_impure_ptr>
f9004e48:	0007a503          	lw	a0,0(a5)
f9004e4c:	00008067          	ret
