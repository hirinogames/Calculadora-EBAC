#!/bin/bash


# Cria um arquivo temporário para armazenar o código Python
TEMP_PY=$(mktemp /tmp/calculadora.XXXXXX.py)


# Escreve o código Python no arquivo temporário
cat << 'EOF' > $TEMP_PY
operacao = None # Cria a variável para operação, ela seleciona qual vai ser usada e fecha os loopings
while operacao != 0:
    # Looping se mantém até a operação ser 0
    num1 = int(input("\nDigite o primeiro número da operação: "))
    num2 = int(input("Digite o segundo número da operação: "))
    operacao = None # Garante que a operação selecionada não seja mantida, ao entrar no novo looping
    while operacao != 5 and operacao != 0:
        operacao = int(input(" 0 - Sair da aplicação \n 1 - Soma \n 2 - Subtração \n 3 - Multiplicação \n 4 - Divisão \n 5 - Digitar novos números\nDigite a operação desejada:  "))
        # Ifs aninhados para cada operação, otimizar o desempenho do código
        if operacao == 1:
            resultado = num1 + num2
            print(f"\nA soma dos dois números é: {resultado}")
        elif operacao == 2:
            resultado = num1 - num2
            print(f"\nA subtração dos dois números é: {resultado}")
        elif operacao == 3:
            resultado = num1 * num2
            print(f"\nA multiplicação dos dois números é: {resultado}")
        elif operacao == 4:
            resultado = num1 / num2
            print(f"\nA divisão dos dois números é: {resultado}")
        elif operacao == 0:
            print("\nFechando aplicação.") # Operação 0 é a condicional para o looping principal
        elif operacao == 5:
            print("\nVoltando à seleção de números.\n") # Operação 5 volta para o looping principal de selecionar os números
        else:
            print("\nERRO - Operação inválida.") # Mensagem para caso a operação digitada não esteja nas opções
EOF


# Executa o código Python do arquivo temporário
python3 $TEMP_PY


# Remove o arquivo temporário
rm $TEMP_PY