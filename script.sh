#!/bin/bash

docker build -t Alusantos/projeto-backend:1.1 backend/.
docker build -t Alusantos/projeto-database:1.1 database/.

echo "Subindo imagens.."

docker push Alusantos/projeto-backend:1.1
docker push Alusantos/projeto-database:1.1

echo "Criando serviços..."

kubectl apply -f ./services.yml

echo "Criando os deploys.."

kubectl apply -f ./deployment.yml