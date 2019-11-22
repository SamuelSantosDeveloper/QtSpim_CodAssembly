              .data
N: .asciiz "\nQuantos numeros deseja digitar ?\n"
V: .asciiz "\nDigite um valor inteiro\n"
Q: .asciiz "\nQuantidade de numeros digitados\n"
O: .asciiz "\n\nA soma dos numeros digitaos e: "
.text

main: addi $v0,$zero,4      #comando para imprimir string
      la $a0, N             # carrega mensagem
      syscall               #imprime mensagem
      addi $v0,$zero,5      #codigo leitura inteiro
      syscall               #le do teclado
      add $s0,$zero,$v0     # N
      addi $s1,$zero,0      #i
      addi $s2,$zero,0      #soma
while: slt $t0,$s1,$s0      # comparar se (i < N)
      beq $t0,$zero,F_while # se st0 for 0: fim do while, senao: continua while
      addi $v0,$zero,4      #comando imprime string
      la $a0, V             #carrega mensagem
      syscall               # imprime na tela
      addi $v0,$zero,5      #codigo leitura inteiro
      syscall               # le do teclado
      add $s2,$s2,$v0       # soma = soma + num
      addi $s1,$s1,1        # i = i + 1
      j while
F_while: addi $v0,$zero,4   #comando imprime string
         la $a0, Q          # carrega mensagem
         syscall            # imprime mensagem
         addi $v0,$zero,1   # cod imprime inteiro
         add $a0,$zero,$s1  #carrega inteiro
         syscall            #imprime na tela
         addi $v0,$zero,4   #comando imprime string
         la $a0, O          # carrega mensagem
         syscall            # imprime mensagem
         addi $v0,$zero,1   # cod imprime inteiro
         add $a0,$s2,$zero  #carrega inteiro
         syscall            #imprime na tela
         jr $ra