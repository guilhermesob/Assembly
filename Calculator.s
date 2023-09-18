section .data
    menu db 'Calculadora Simples',0
    menu_adicao db '1. Adição',0
    menu_subtracao db '2. Subtração',0
    menu_multiplicacao db '3. Multiplicação',0
    menu_divisao db '4. Divisão',0
    menu_sair db '0. Sair',0
    escolha db 'Escolha uma opção: ',0
    num1_msg db 'Digite o primeiro número: ',0
    num2_msg db 'Digite o segundo número: ',0
    resultado_msg db 'Resultado: ',0
    erro_divisao db 'Erro: Divisão por zero.',0

section .bss
    opcao resb 1
    num1 resq 1
    num2 resq 1
    resultado resq 1
    zero db '0', 0

section .text
global _start

_start:
    ; Exibir o menu
    mov eax, 4
    mov ebx, 1
    mov ecx, menu
    mov edx, 18
    int 80h

menu_loop:
    ; Exibir as opções do menu
    mov eax, 4
    mov ecx, menu_adicao
    mov edx, 13
    int 80h

    ; Repita para as outras opções do menu...

    ; Solicitar a escolha do usuário
    mov eax, 4
    mov ecx, escolha
    mov edx, 21
    int 80h

    ; Ler a escolha do usuário
    mov eax, 3
    mov ebx, 0
    mov ecx, opcao
    mov edx, 1
    int 80h

    ; Executar a operação selecionada
    cmp byte [opcao], '1'
    je adicao
    cmp byte [opcao], '2'
    je subtracao
    cmp byte [opcao], '3'
    je multiplicacao
    cmp byte [opcao], '4'
    je divisao
    cmp byte [opcao], '0'
    je sair

    ; Tratar escolha inválida
    jmp menu_loop

adicao:
    ; Solicitar números ao usuário
    mov eax, 4
    mov ebx, 1
    mov ecx, num1_msg
    mov edx, 22
    int 80h

    ; Ler o primeiro número
    ; Implementar a leitura aqui...

    ; Solicitar o segundo número ao usuário
    mov eax, 4
    mov ebx, 1
    mov ecx, num2_msg
    mov edx, 22
    int 80h

    ; Ler o segundo número
    ; Implementar a leitura aqui...

    ; Realizar a adição
    ; Implementar a adição aqui...

    ; Exibir o resultado
    ; Implementar a exibição do resultado aqui...

    jmp menu_loop

subtracao:
    ; Solicitar números ao usuário
    ; Ler os números
    ; Realizar a subtração
    ; Exibir o resultado
    ; Implementar a subtração aqui...

    jmp menu_loop

multiplicacao:
    ; Solicitar números ao usuário
    ; Ler os números
    ; Realizar a multiplicação
    ; Exibir o resultado
    ; Implementar a multiplicação aqui...

    jmp menu_loop

divisao:
    ; Solicitar números ao usuário
    ; Ler os números
    ; Verificar se o divisor é zero
    ; Se for zero, exibir mensagem de erro e voltar ao menu
    ; Realizar a divisão
    ; Exibir o resultado
    ; Implementar a divisão aqui...

    jmp menu_loop

sair:
    ; Finalizar o programa
    mov eax, 1
    mov ebx, 0
    int 80h
    
