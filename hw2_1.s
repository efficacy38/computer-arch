            .data
            
Jtable:     .word   case0, case1
prompt1:    .asciiz "PLZ enter the condition\n"
prompt2:    .asciiz "odd\n"
prompt3:    .asciiz "even\n"

            .text
main:
            li		$v0, 4		        # $v0 = 4
            la		$a0, prompt1	    # $a0 = ds1
            syscall                     # printString

            li      $v0, 5
            syscall
            andi    $t0, $v0, 1
            sll     $t0, $t0, 2
            la      $t1, Jtable
            add     $t1, $t1, $t0
            lw		$t1, 0($t1)
            jr		$t1

case0:
            li      $v0, 4
            la      $a0, prompt3
            syscall
            j		Exit				# jump to Exit
case1:
            li      $v0, 4
            la      $a0, prompt2
            syscall
            j		Exit				# jump to Exit
Exit:
            j       main
            j       $ra
  