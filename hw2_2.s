            .data

prompt1:    .asciiz "PLZ enter the fibonacci sequence deeph as n.\n"
prompt2:    .asciiz "ANS is : "
prompt3:    .asciiz "Cur: "
            .text
fibonacci:
            addi    $sp, $sp, -8
            sw      $ra, 4($sp)
            sw      $a0, 0($sp)
            slti    $t0, $a0, 1
            beq     $t0, $0, L1

            li      $v1, 0                   # clear count(v1)
            addi    $sp, $sp, 8
            jr      $ra
L1:
            addi    $a0, $a0, -1
            jal     fibonacci
            lw      $ra, 4($sp)
            lw      $a0, 0($sp)
            add     $v1, $v1, $a0
            addi    $sp, $sp, 8
            jr      $ra

main:
            li      $v0, 4
            la      $a0, prompt1
            syscall

            li      $v0, 5
            syscall
            and     $a0, $0, $0
            add     $a0, $0, $v0
            jal     fibonacci

            li      $v0, 4
            la      $a0, prompt2
            syscall

            li  $v0, 1
            and $a0, $0, $0
            add $a0, $a0, $v1
            syscall

            li  $v0, 10
            syscall