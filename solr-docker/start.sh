#!/bin/bash

# Espera o ZooKeeper ficar pronto
while ! nc -z zoo1 2181; do   
  sleep 0.1
done
folder_name="myconfig"

# Verifica se a configuração já existe no ZooKeeper
# if bin/solr zk ls /configs -z zoo1:2181,zoo2:2181,zoo3:2181 | grep -q $folder_name; then
#     echo "A configuração '$folder_name' já existe no ZooKeeper. Pulando a etapa de envio."
# else
#     echo "A configuração '$folder_name' não existe. Enviando para o ZooKeeper..."
#     bin/solr zk upconfig -n $folder_name -d /opt/solr-9.4.1/server/solr/configsets/myconfig -z zoo1:2181,zoo2:2181,zoo3:2181
# fi
exec solr-foreground
