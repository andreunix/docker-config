FROM solr:9.4.1

COPY myconfig /opt/solr/server/solr/configsets/myconfig

COPY start.sh /opt/solr-9.4.1/docker/scripts/start.sh

USER root

RUN chmod +x /opt/solr-9.4.1/docker/scripts/start.sh

USER solr

CMD ["/opt/solr-9.4.1/docker/scripts/start.sh"]
