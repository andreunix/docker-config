#!/usr/bin/env bash

# You can override pass the following parameters to this script:
#

JVM="java"

# Find location of this script

sdir="`dirname \"$0\"`"

log4j_config="file:$sdir/../../resources/log4j2-console.xml"

solr_home="$sdir/../../solr"

# Settings for ZK ACL
SOLR_ZK_CREDS_AND_ACLS="-DzkACLProvider=org.apache.solr.common.cloud.DigestZkACLProvider \
 -DzkCredentialsProvider=org.apache.solr.common.cloud.DigestZkCredentialsProvider \
 -DzkCredentialsInjector=org.apache.solr.common.cloud.VMParamsZkCredentialsInjector \
 -DzkDigestUsername=$ZK_DIGEST_USERNAME -DzkDigestPassword=$ZK_DIGEST_PASSWORD \
 -DzkDigestReadonlyUsername=$ZK_DIGEST_READONLY_USERNAME -DzkDigestReadonlyPassword=$ZK_DIGEST_READONLY_PASSWORD"
# optionally, you can use using a a Java properties file 'zkDigestCredentialsFile'
#...
#   -DzkDigestCredentialsFile=/path/to/zkDigestCredentialsFile.properties
#...
echo $SOLR_ZK_CREDS_AND_ACLS

PATH=$JAVA_HOME/bin:$PATH $JVM $SOLR_ZK_CREDS_AND_ACLS $ZKCLI_JVM_FLAGS -Dlog4j.configurationFile=$log4j_config -Dsolr.home=$solr_home \
-classpath "$sdir/../../solr-webapp/webapp/WEB-INF/lib/*:$sdir/../../lib/ext/*:$sdir/../../lib/*" org.apache.solr.cloud.ZkCLI ${1+"$@"}

