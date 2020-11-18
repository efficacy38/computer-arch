# hw1.s
            .data       # data declear space

ds1:        .asciiz "Plz enter the apple.\n"
ds2:        .asciiz "Plz enter the banana.\n"
ds3:        .asciiz "ANS is : ";

            .text       # instrection space
main:
            li		$v0,  4		        # $v0 = 4           ori $v0, 0, 4
            la		$a0,  ds1	        # $a0 = ds1
            syscall                     # printString

            li		$v0,  5		        # $v0 = 5 
            syscall
            addi	$s0, $v0, 0	        # $s0 = $v0 + 0     apple = $s0
            
            li		$v0,  4		        # $v0 = 4             
            la		$a0,  ds2	        # $a0 = ds2
            syscall                     # printString

            li		$v0,  5		        # $v0 = 5 
            syscall 
            addi	$s1, $v0, 0	        # $s1 = $v0 + 0     banana = $s1



            add		$t0, $s0, $s0		# $t0 = $s0 + $s0
            add		$t0, $t0, $t0
            add		$t0, $t0, $t0
            
            add		$t1, $s1, $s1		# $t1 = $s1 + $s1

            sub     $s2, $t0, $t1
            li		$v0,  4		        # $v0 = 4
            la		$a0,  ds3	        # $a0 = ds3
            syscall                     # printString

            li		$v0,  1		        # $v0 = 4             
            or		$a0,  $s2, $0
            syscall                     # printInt

            j       $ra