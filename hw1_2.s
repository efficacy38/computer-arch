            .data

prompt1:    .asciiz "PLZ enter the fibonacci sequence deeph as n.\n"
prompt2:    .asciiz "ANS is : ";

            .text
main:
        li		$v0, 4		        # $v0 = 4;
        la		$a0, prompt1
        syscall

        li      $v0, 5
        syscall

        add      $s0, $v0, $0        # $s0 = n
        andi     $t0, $0, 0;         # set $t0 = 0;      counter

Loop:
        beq	$s0, $0, Exit	                # if $s0 == 0 Exit target
        add     $t0, $t0, $s0
        addi    $s0, $s0, -1
        j	Loop				# jump to Loop
        

Exit:
        li		$v0, 4		        # $v0 = 4;
        la		$a0, prompt2
        syscall        
        li	        $v0, 1		        # $v0 = 1;
        or              $a0, $0, $t0
        syscall

        j       $ra