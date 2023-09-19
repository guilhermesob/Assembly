section .data
    msg1 db "Digite o primeiro número: ", 0
    msg2 db "Digite o segundo número: ", 0
    msg3 db "A soma dos números é: ", 0
    format db "%d", 0

section .bss
    num1 resb 10
    num2 resb 10
    resultado resb 10

section .text
    global _start

_start:
    ; Exibe a mensagem para digitar o primeiro número
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 22
    int 0x80

    ; Lê o primeiro número
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 10
    int 0x80

    ; Exibe a mensagem para digitar o segundo número
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 23
    int 0x80

    ; Lê o segundo número
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 10
    int 0x80

    ; Converte os números para inteiros
    mov eax, [num1]
    mov ebx, [num2]
    add eax, ebx

    ; Exibe o resultado
    mov ebx, eax
    mov eax, 4
    mov ecx, msg3
    mov edx, 20
    int 0x80

    ; Finaliza o programa
    mov eax, 1
    int 0x80
    
