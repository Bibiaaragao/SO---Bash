#!/bin/bash

echo "Executando o arquivo"

menuOpcoes(){
	while true; do
		echo "O que deseja fazer?"
		echo "1 - Criar arquivos/diretórios"
		echo "2 - Excluir arquivos/diretórios"
		echo "3 - Renomear arquivos/diretórios"
		echo "4 - Listar arquivos/diretórios"
		echo "5 - Sair"

		echo "Escolha uma opção"
		read OPCAO

		case $OPCAO in
			1) criar;;
			2) excluir ;;
			3) renomear ;;
			4) listar ;;
			5) echo "\nVocê está saindo. Volte sempre!"; exit 0 ;;
			*) echo "\nEssa opção é inválida. Tente novamente!"
		esac
	done
}

criar(){
	echo -e "\nO que deseja criar?"
	echo "1 - Arquivo"
	echo "2 - Diretório"
	read ESCOLHA
	if [ "$ESCOLHA" -eq 1 ]; then
		echo "\nInforme o nome do arqivo que será criado: "
		read NOVO_ARQUIVO
		if [ -e "$NOVO_ARQUIVO" ]; then
			echo "Oops... Esse arquivo já existe"
		else
			touch "$NOVO_ARQUIVO"
			echo "O arquivo foi criado com sucesso!"
		fi
	elif [ "$ESCOLHA" -eq 2 ]; then
		echo "\nInforme o nme do diretório que será criado: "
		read NOVO_DIRETORIO
		if [ -e "$NOVO_DIRETORIO" ]; then
			echo "Oops... Esse diretório já existe."
		else
			mkdir "$NOVO_DIRETORIO"
			echo "O diretório foi criado com sucesso"
		fi
	else
		echo "\nEssa escolha é inválida. Tente novamente!"
	fi
}

excluir(){
	echo -e "\nInforme o nome do arquivo/diretório que deseja excluir: "
	read NOME
	if [ -f "$NOME" ]; then
		rm "$NOME"
		echo "\nArquivo excluído com sucesso!"
	elif [ -d "$NOME" ]; then
		rm -r "$NOME"
		echo "\nDiretório excluído com sucesso"
	else 
		echo "\nO arquivo ou diretório informado não existe. Tente novamente!"
	fi
}

renomear(){
	echo -e "\nInforme o nome do arquivo/diretório que deseja renomear: "
	read NOME_ATUAL
	if [ -e "$NOME_ANTIGO" ]; then
		echo "Informe o novo nome: "
		read NOME_NOVO
		mv "$NOME_ATUAL" "$NOME_NOVO"
		echo "Renomeação feita com sucesso!"
	else 
		echo "Não existe um arquivo ou diretótio com esse nome. Tente novamente!"
	fi
}

listar(){
	echo -e "\nLista dos diretórios e arquivos"
	echo "------------------------------"
	ls -lh
}

menuOpcoes
