#!/bin/bash

echo "Executando o projeto"

menuOpcoes(){
	while true; do
		echo "O que deseja fazer?"
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

#Função para excluir um arquivo/diretório
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

#Função para renomear arquivos/diretórios
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

#Função para listar 
listar(){
	echo -e "\nLista dos diretórios e arquivos"
	echo "------------------------------"
	ls -lh
}

#Função para visualizar o conteúdo de um arquivo
visualizarConteudo(){
	echo "Informe o nome do arquivo que desejas visualizar o conteúdo:"
	read ARQUIVO
	if [ -f "$ARQUIVO" ]; then
		cat "$ARQUIVO"
	else 
		echo "Esse arquivo não existe. Tente novamente!"
	fi
}
 
#Função para visualizar o tamanho de um arquivo
visualizarTamanho(){
	echo "Informe o nome do arquivo que desejas visualizar o tamanho"
	read ARQUIVO_TAMANHO
	if[ -f "$ARQUIVO_TAMANHO" ]; then
		du -h "$ARQUIVO_TAMANHO"
	else
		echo "Esse arquivo não existe. Tente novamente!"
	fi
}

alterarExtensao(){
	echo "Informe o nome com a extensão do arquivo: "
	read ARQUIVO_EXTENSAO
	if [ -f "$ARQUIVO_EXTENSAO" ]
		APENAS_NOME = "${ARQUIVO_EXTENSAO%.}"
		echo "Informe a nova extensão: "
		read EXTENSAO
		mv "$ARQUIVO_ENTENSAO" "$APENAS_NOME.$EXTENSAO"
		echo "Extensão alterada com sucesso!"
	else 
		echo "Esse arquivo não existe. Tente novamente!"
	fi
}

moverArquivo()

copiarArquivo()

menuOpcoes
