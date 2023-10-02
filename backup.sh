#!/bin/bash

read -p "Informe o caminho do diretório/arquivo corretamente: " CAM_ORIGINAL
if [ -e $CAM_ORIGINAL ]
then
	echo
	echo Arquivo existente
	echo
	read -p "Informe o caminho de destino para esse diretório/arquivo, corretamente: " CAM_DESTINO
	if [ -e $CAM_DESTINO ]
	then
		echo
		echo O caminho existe!
		read -p "Informe o nome do backup: " NOME_BACKUP
		rsync -avz --delete "$CAM_ORIGINAL" "$CAM_DESTINO/$NOME_BACKUP"
		if [ $? -eq 0 ]
		then
			echo
			echo Backup executado com sucesso.
			echo Fim do script
			exit 0
		else
			echo
			echo Backup não executado. Inicie o processo novamente
			echo Fim do script
			exit 0
		fi
	else
		echo
		mkdir $CAM_DESTINO
		echo
		echo O caminho não existe, mas foi criado para facilidades
		read -p "Informe o nome do backup: " NOME_BACKUP
		rsync -avz --delete "$CAM_ORIGINAL" "$CAM_DESTINO/$NOME_BACKUP"
		if [ $? -eq ]
		then
			echo
			echo Backup executado com sucesso
			echo Fim do script
			exit 0
		else
			echo
			echo Backup não executado. Inicie o processo novamente
			echo Fim do script
			exit 0
		fi
	fi
else
	echo
	echo O arquivo não existe, por favor, verifique e rode novamente
	exit 0
fi
