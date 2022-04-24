#!/bin/bash

#####	NOME:				apply.sh
#####	VERSÃO:				0.0.1
#####	DESCRIÇÃO:			Inicia aplicação.
#####	DATA DA CRIAÇÃO:	23/04/2022
#####	ESCRITO POR:		Walter Paulo
#####	E-MAIL:				walter0paulo@hotmail.com
#####	DISTRO:				Ubuntu GNU/Linux
#####	LICENÇA:			GPLv3
#####	PROJETO:	        https://github.com/walterpaulo/terraform-ansible-aws-jenkins		

DIR=terraform/

cd terraform/
terraform init
terraform apply -auto-approve
# cd -

echo "Conectando... 20s"
sleep 20
echo

DNS=$(terraform output public_dns)
DNS=$(echo $DNS | sed -e "s/\"//g")

echo "
[Jenskins]
$DNS
" > ../jenkins-ansible/hosts

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i ../jenkins-ansible/hosts ../jenkins-ansible/provisionar.yml -u ubuntu --private-key $private_key
ssh -i $private_key ubuntu@$DNS -o ServerAliveInterval=60

