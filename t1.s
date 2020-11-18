            .data

prompt1:    .asciiz "asd"

            .text
main:

            li  $v0, 4
            la  $a0, prompt1
            syscall

            li  $v0, 5
            syscall


            add  $a0, $v0, $0
            li  $v0, 1
            syscall

            li  $v0, 10
            syscall