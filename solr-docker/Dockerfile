FROM solr:9.4.1

LABEL org.opencontainers.image.source https://github.com/andreunix/docker/solr-docker

COPY solr.in.sh /etc/default/solr.in.sh
COPY zkcli.sh /opt/solr-9.4.1/server/scripts/cloud-scripts/zkcli.sh
# COPY myconfig /opt/solr-9.4.1/server/solr/configsets/myconfig
# COPY start.sh /opt/solr-9.4.1/docker/scripts/start.sh
# USER root
# RUN chmod +x /opt/solr-9.4.1/docker/scripts/start.sh
# USER solr

CMD ["solr-foreground"]
