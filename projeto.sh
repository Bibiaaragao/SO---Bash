#!/bin/bash

echo "Executando o projeto"

menuOpcoes(){
	while true; do
		echo -e "\nO que deseja fazer?"
		echo -e  "\n1 - Criar arquivos/diretórios"
		echo "2 - Excluir arquivos/diretórios"
		echo "3 - Renomear arquivos/diretórios"
		echo "4 - Listar arquivos/diretórios"
		echo "5 - Visualizar o conteúdo"
		echo "6 - Visualizar o tamanho de um arquivo"
		echo "7 - Alterar extensão"
		echo "8 - Mover arquivo"
		echo "9 - Copiar arquivo"
		echo "10 - Sair"
		echo "Escolha uma opção"
		read OPCAO

		case $OPCAO in
			1) criar;;
			2) excluir ;;
			3) renomear ;;
			4) listar ;;
			5) visualizarConteudo ;;
			6) visualizarTamanho ;;
			7) alterarExtensao ;;
			8) moverArquivo ;;
			9) copiarArquivo ;;
			10) echo -e "\nVocê está saindo. Volte sempre!"; exit 0 ;;
			*) echo -e "\nEssa opção é inválida. Tente novamente!"
		esac
	done
}

#Função para criar um novo arquivo/diretório
criar(){
	echo -e "\nO que deseja criar?"
	echo "1 - Arquivo"
	echo "2 - Diretório"
	read ESCOLHA
	if [ "$ESCOLHA" -eq 1 ]; then
		echo "Informe o nome do arquivo que será criado: "
		read NOVO_ARQUIVO
		if [ -e "$NOVO_ARQUIVO" ]; then
			echo -e "\e[31mOops... Esse arquivo já existe\e[0m"
		else
			touch "$NOVO_ARQUIVO"
			echo -e "\e[32mO arquivo foi criado com sucesso!\e[0m"
		fi
	elif [ "$ESCOLHA" -eq 2 ]; then
		echo "Informe o nome do diretório que será criado: "
		read NOVO_DIRETORIO
		if [ -e "$NOVO_DIRETORIO" ]; then
			echo -e "\e[31mOops... Esse diretório já existe.\e[0m"
		else
			mkdir "$NOVO_DIRETORIO"
			echo -e "\e[32mO diretório foi criado com sucesso\e[0m"
		fi
	else
		echo -e "\e[31mEssa escolha é inválida. Tente novamente!e\[0m"
	fi
}

#Função para excluir um arquivo/diretório
excluir(){
	echo -e "\nInforme o nome do arquivo/diretório que deseja excluir: "
	read NOME
	if [ -f "$NOME" ]; then
		rm "$NOME"
		echo -e "\e[32mArquivo excluído com sucesso!\e[0m"
	elif [ -d "$NOME" ]; then
		rm -r "$NOME"
		echo -e "\e[32mDiretório excluído com sucesso\e[0m"
	else 
		echo -e "\e[31mO arquivo ou diretório informado não existe. Tente novamente!\e[0m"
	fi
}

#Função para renomear arquivos/diretórios
renomear(){
	echo -e "\nInforme o nome do arquivo/diretório que deseja renomear: "
	read NOME_ATUAL
	if [ -e "$NOME_ATUAL" ]; then
		echo "Informe o novo nome: "
		read NOME_NOVO
		mv "$NOME_ATUAL" "$NOME_NOVO"
		echo -e "\e[32mRenomeação feita com sucesso!\e[0m"
	else 
		echo -e "\e[31mNão existe um arquivo ou diretótio com esse nome. Tente novamente!\e[0m"
	fi
}

#Função para listar 
listar(){
	echo -e "\nLista dos diretórios e arquivos"
	echo "------------------------------"
	ls -lh
}

#Função para visualizar o conteúdo de um arquivo
visualizarConteudo(){
	echo "De qual você deseja visualizar o conteúdo?"
	echo "1 - Arquivo"
	echo "2 - Diretório"
	read ESCOLHA2
	if [ "$ESCOLHA2" -eq 1 ]; then
		echo "Informe o nome do arquivo que desejas visualizar o conteúdo:"
		read ARQUIVO
		if [ -f "$ARQUIVO" ]; then
			if [ -s "$ARQUIVO" ]; then
				cat "$ARQUIVO"
			else
				echo -e "\e[31mEsse arquivo está vazio!\e[0m"
			fi
		else 
			echo -e "\e[32mEsse arquivo não existe. Tente novamente!\e[0m"
		fi
	elif [ "$ESCOLHA2" -eq 2 ]; then
		echo "Informe o nome do diretório:"
		read DIRETORIO
		if [ -d "$DIRETORIO" ]; then
			if [ "$(ls -A "$DIRETORIO")" ]; then
				ls -ls "$DIRETORIO"
			else
				echo -e "\e[31mEsse diretório está vazio!\e[0m"
			fi
		else
			echo -e "\e[31mEsse diretório não existe!\e[0m"
		fi
	else
		echo -e "\e[31mOpção inválida! Tente novamente!\e[0m"
	fi
}
 
#Função para visualizar o tamanho de um arquivo
visualizarTamanho(){
	echo "Informe o nome do arquivo que desejas visualizar o tamanho"
	read ARQUIVO_TAMANHO
	if [ -f "$ARQUIVO_TAMANHO" ]; then
		du -h "$ARQUIVO_TAMANHO"
	else
		echo -e "\e[32mEsse arquivo não existe. Tente novamente!\e[0m"
	fi
}

#Função para alterar a extensão de um arquivo
alterarExtensao(){
	echo "Informe o nome com a extensão do arquivo: "
	read ARQUIVO_EXTENSAO
	if [ -f "$ARQUIVO_EXTENSAO" ]; then
		APENAS_NOME="${ARQUIVO_EXTENSAO%.*}"
		echo "Informe a extensão antiga:"
		read EXTENSAO_ANTIGA
		echo "Informe a nova extensão: "
		read EXTENSAO
		mv $APENAS_NOME.$EXTENSAO_ANTIGA $APENAS_NOME.$EXTENSAO
		echo -e "\e[32mExtensão alterada com sucesso!\e[0m"
	else
		echo -e "\e[31mEsse arquivo não existe. Tente novamente!\e[0m"
	fi
}

moverArquivo(){
	echo "Informe o nome do arquivo que desejas mover:"
	read ARQUIVO_MOVER
	if [ -f "$ARQUIVO_MOVER" ]; then
		echo "Informe o diretŕio para o qual desejas mover o arquivo:"
		read DIRETORIO_DESTINO
		if [ -d "$DIRETORIO_DESTINO" ]; then
			mv "$ARQUIVO_MOVER" "$DIRETORIO_DESTINO"
			echo -e "\e[32mO arquivo foi movido com sucesso!\e[0m"
		else 
			echo -e "\e[31mEsse diretório não existe. Tente novamente"
		fi
	else
		echo -e "\e[31mEsse arquivo não existe. Tente novamente!\e[0m"
	fi
}

copiarArquivo(){
	echo "Informe o nome do arquivo que desejas copiar: "
	read ARQUIVO_COPIAR
	if [ -f "$ARQUIVO_COPIAR" ]; then
		echo "Informe o nome do diretório onde o qual desejas copiar o arquivo:"
		read DIRETORIO_COPIA
		if [ -d "$DIRETORIO_COPIA" ]; then
			cp "$ARQUIVO_COPIAR" "$DIRETORIO_COPIA"
			echo -e "\e[32mO arquivo foi copiado com sucesso!\e[0m"
		else
			echo -e "\e[31mEsse diretório não existe. Tente novamente!\e[0m"
		fi
	else
		echo -e "\e[31mEsse arquivo não existe. Tente novamente!\e[0m"
	fi
}

menuOpcoes
