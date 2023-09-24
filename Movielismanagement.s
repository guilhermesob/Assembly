; Definição das variáveis
section .data
    lista_filmes db "Filme 1",0, "Filme 2",0, "Filme 3",0
    tamanho_lista_filmes equ $ - lista_filmes

section .bss
    nome_filme resb 100

section .text
global _start

_start:
    ; Chame as funções aqui, por exemplo:
    ; call adicionar_filme
    ; call remover_filme
    ; call listar_filmes
    ; call pesquisar_filme
    ; call sair

; Sub-rotina para adicionar um filme
adicionar_filme:
    ; Leia o nome do filme do usuário
    mov eax, 3
    mov ebx, 0
    mov ecx, nome_filme
    mov edx, 100
    int 0x80

    ; Adicione o filme à lista
    mov eax, 0
    mov ebx, lista_filmes
    mov ecx, tamanho_lista_filmes
    mov edx, 1
    int 0x80

    ret

; Sub-rotina para remover um filme
remover_filme:
    ; Leia o nome do filme a ser removido
    mov eax, 3
    mov ebx, 0
    mov ecx, nome_filme
    mov edx, 100
    int 0x80

    ; Encontre o filme na lista e remova-o
    mov eax, 0
    mov ebx, lista_filmes
    mov ecx, tamanho_lista_filmes
    mov edx, 1
    int 0x80

    ret

; Sub-rotina para listar todos os filmes
listar_filmes:
    ; Imprima um cabeçalho
    mov eax, 4
    mov ebx, 1
    mov ecx, "Lista de Filmes:"
    mov edx, 16
    int 0x80

    ; Inicialize o ponteiro para o início da lista
    mov esi, lista_filmes

loop_listar:
    ; Imprima o nome do filme
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 100
    int 0x80

    ; Avance para o próximo filme
    add esi, 10

    ; Verifique se chegamos ao final da lista
    cmp byte [esi], 0
    jnz loop_listar

    ret

; Sub-rotina para sair do programa
sair:
    ; Adicione uma mensagem de saída
    mov eax, 4
    mov ebx, 1
    mov ecx, "Programa Encerrado."
    mov edx, 17
    int 0x80

    ; Termine o programa
    mov eax, 1
    mov ebx, 0
    int 0x80
