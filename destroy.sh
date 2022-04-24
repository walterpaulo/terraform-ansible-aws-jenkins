#!/bin/bash

#####	NOME:				apply.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Inicia aplicação.
#####	DATA DA CRIAÇÃO:	23/04/2022
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Ubuntu GNU/Linux
#####	LICENÇA:			GPLv3
#####	PROJETO:            

DIR=terraform/

cd terraform/
terraform destroy
cd -

