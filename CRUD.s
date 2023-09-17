section .data
    ; Declaração de variáveis de dados
    db_filename db 'dados.db',0

section .text
global _start

_start:
    ; Abre o arquivo de dados
    mov eax, 5         ; Código de sistema para abrir o arquivo
    mov ebx, db_filename
    mov ecx, 0         ; Modo de leitura (O_RDONLY)
    int 80h

    ; Verifica se o arquivo foi aberto com sucesso
    cmp eax, -1
    je erro_abertura

    ; Operações CRUD podem ser implementadas aqui

    ; Fecha o arquivo de dados
    mov eax, 6         ; Código de sistema para fechar o arquivo
    mov ebx, eax       ; Use o mesmo descritor de arquivo de entrada
    int 80h

    ; Sai do programa
    mov eax, 1         ; Código de sistema para sair do programa
    mov ebx, 0         ; Código de retorno
    int 80h

erro_abertura:
    ; Tratamento de erro de abertura de arquivo
    ; Implemente a lógica de tratamento de erro aqui

; Implemente as operações CRUD (Create, Read, Update, Delete) neste ponto

