.data
    message1: .asciiz "THIS PROGRAM COMPUTE THE ROOT OF A QUADRATIC EQUATION\n"
    message2: .asciiz "\nINPUT VALUE FOR A:"
    message3: .asciiz "\nINPUT VALUE FOR B:"
    message4: .asciiz "\nINPUT VALUE FOR C:"
    message5: .asciiz "\nCOMPLEX ROOT\n"
    message6: .asciiz "\nX1 is:"
    message7: .asciiz "\nX2 is:"
    message8: .asciiz "\n"
    value:    .float  4.0
    value1:   .float  2.0
    value2:   .float  0.0
    value3:   .float -1.0 
   
.text 
   main:
   
    lwc1 $f1,value
    lwc1 $f2,value1
    lwc1 $f3,value2
    lwc1 $f4,value3
    
    li $v0,4
    la $a0,message1
    syscall
    
    li $v0,4
    la $a0,message2
    syscall
    
    li $v0,6
    syscall
    mov.s $f5,$f0
    
    li $v0,4
    la $a0,message3
    syscall
    
    li $v0,6
    syscall
    mov.s $f6,$f0
    
    li $v0,4
    la $a0,message4
    syscall
    
    li $v0,6
    syscall
    mov.s $f7,$f0
    
    mul.s $f8,$f6,$f6
    mul.s $f7,$f5,$f7
    mul.s $f7,$f1,$f7
    mul.s $f9,$f4,$f6
    mul.s $f10,$f2,$f5
    sub.s $f11,$f8,$f7
    
    sqrt.s $f13,$f11
    
    c.le.s $f11,$f3
    bc1t exit
    
    #computing X1
    add.s $f15,$f9,$f13
    div.s $f12,$f15,$f10
    
    li $v0,4
    la $a0,message6
    syscall
    
    li $v0,2
    syscall
    #computing X2
    sub.s $f16,$f9,$f13
    div.s $f12,$f16,$f10
    
    li $v0,4
    la $a0,message7
    syscall
    
    li $v0,2
    syscall
    
    li $v0,10
    syscall
    
exit:
    li $v0,4
    la $a0,message5
    syscall
    
    j main
