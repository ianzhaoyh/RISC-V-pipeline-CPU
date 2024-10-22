.text
.globl main
main:
li   t0, 0xdeadbeef
li   t1, 0x2000
sw   t0, 0(t1)	#FA=2 (EX Forward), FB=1 (MEM Forward)
lw   t2, 0(t1)	#t2=0xdeadbeef, FA=1 (MEM Forward)
sw   t2, 4(t1)	#FM=1 (SW GPR[rs2] Forward), FA=1 (MEM Forward)
lw   t3, 4(t1)	#t2=0xdeadbeef
srli t4, t2, 16	#t4=0x0000dead 
slli t5, t3, 16	#t5=0xbeef0000, FA=1 (MEM Forward)
or   t5, t5, t4 	#t5=0xbeefdead, FA=2 (EX Forward), FB=1 (MEM Foreward)
addi t1, t1, 4
sw   t5, 0(t1)	#FA=2 (EX forward), FB=1 (MEM Foreward)

li a7, 10
ecall
