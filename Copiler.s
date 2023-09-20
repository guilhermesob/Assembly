# Cria um arquivo de código Assembly
#echo "mov eax, 1" > hello.asm

# Compila o código Assembly
#nasm -f elf64 hello.asm -o hello.o

# Executa o código Assembly
#./hello

; Compilador em Assembly para x86-64
;
; Autor: guilhermesob (uso livre para estudos)

; Estrutura de dados

struct instruction {
  byte opcode;
  byte modrm;
  byte displacement;
  byte immediate;
};

; Declaração de funções

void parse_line(char *line, struct instruction *instruction);
void generate_code(struct instruction *instruction, FILE *output);

; Main

int main(int argc, char **argv) {
  // Abre o arquivo de entrada
  FILE *input = fopen(argv[1], "r");
  if (input == NULL) {
    printf("Erro ao abrir o arquivo de entrada\n");
    return 1;
  }

  // Abre o arquivo de saída
  FILE *output = fopen(argv[2], "wb");
  if (output == NULL) {
    printf("Erro ao abrir o arquivo de saída\n");
    return 1;
  }

  // Lê o código Assembly
  char line[1024];
  while (fgets(line, sizeof(line), input) != NULL) {
    // Parseia a linha
    struct instruction instruction;
    parse_line(line, &instruction);

    // Gera o código binário
    generate_code(&instruction, output);
  }

  // Fecha os arquivos
  fclose(input);
  fclose(output);

  return 0;
}

; Função para parsear uma linha de código Assembly

void parse_line(char *line, struct instruction *instruction) {
  // Obtém o opcode
  instruction->opcode = line[0];

  // Obtém os operandos
  instruction->modrm = line[1];
  instruction->displacement = line[2];
  instruction->immediate = line[3];
}

; Função para gerar o código binário de uma instrução Assembly

void generate_code(struct instruction *instruction, FILE *output) {
  // Escreve o opcode
  fputc(instruction->opcode, output);

  // Escreve o modrm
  fputc(instruction->modrm, output);

  // Escreve o displacement
  if (instruction->displacement != 0) {
    fputc(instruction->displacement, output);
  }

  // Escreve o immediate
  if (instruction->immediate != 0) {
    fputc(instruction->immediate, output);
  }

  
}
