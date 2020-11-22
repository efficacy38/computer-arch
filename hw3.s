            .data
prompt1:    .asciiz "please enter the Multiplicand\n"
prompt2:    .asciiz "please enter the product\n"
prompt3:    .asciiz "\t\tMultiplicand\tproduct\n"
prompt4:    .asciiz "\t\t"
prompt5:    .asciiz "\n"

            .text

printBin:
            li      $t3, 8                 # let t3 as a counter
            li      $t4, 128               # first compare digit        0b10000000
            li      $t5, 0
            add     $t5, $a0, $0           # t5 is the arg copy
Loop1:
            beq     $t3, $0, EndLoop1
            addi    $t3, $t3, -1
            and     $a0, $t4, $t5

            srlv    $a0, $a0, $t3
            srl     $t4, $t4, 1
            
            li      $v0, 1
            syscall

            j       Loop1
EndLoop1:   
            jr      $ra

main:
            li		$v0, 4
            la      $a0, prompt1            # please enter the Multiplicand
            syscall

            li      $v0, 5                  # set s0 multiplicand
            syscall
            andi    $s0, $s0, 0
            add     $s0, $s0, $v0

            li		$v0, 4
            la      $a0, prompt2            # please enter the product
            syscall

            li      $v0, 5                  # set t0 product
            syscall
            andi    $t0, $t0, 0
            add     $t0, $t0, $v0

            and     $t1, $0, $0             #set counter($t1) 4
            addi    $t1, $0, 4


            li		$v0, 4
            la      $a0, prompt3
            syscall

Loop:
            beq     $t1, $0, Exit           # if counter($t1) == 0 jump to Exit            
            addi    $t1, $t1, -1            # counter($t1)--
            
            li		$v0, 4                  # print current multiplicand and product
            la      $a0, prompt4
            syscall

            andi    $a0, $0, 0
            add     $a0, $0, $s0
            jal     printBin

            li		$v0, 4
            la      $a0, prompt4
            syscall

            li		$v0, 1
            andi    $a0, $a0, 0
            add     $a0, $a0, $t0
            jal     printBin
            # syscall

            li		$v0, 4
            la      $a0, prompt5
            syscall
            
            
            andi    $t2, $t0, 0x1             # $t2 represent the last bit of multiplicand
            srl     $t0, $t0, 1
            beq     $t2, $0, Loop

            sll     $t0, $t0, 1
            sll     $t2, $s0, 4
            add     $t0, $t0, $t2             # merge the products
            srl     $t0, $t0, 1

            j       Loop

Exit:      

            li		$v0, 4
            la      $a0, prompt4
            syscall


            andi    $a0, $a0, 0
            add     $a0, $a0, $s0
            jal     printBin

            li		$v0, 4
            la      $a0, prompt4
            syscall

            # li      $v0, 1
            andi    $a0, $0, 0
            add     $a0, $0, $t0
            jal     printBin
            # syscall

            li		$v0, 4
            la      $a0, prompt5
            syscall

            li		$v0, 4
            la      $a0, prompt5
            syscall

            # li      $v0, 10
            # syscall
            j       main