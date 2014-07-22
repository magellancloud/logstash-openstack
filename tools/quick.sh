#!/bin/bash
logstash_bin=${LOGSTASH_BIN:$(which logstash)}
tools_path=$(dirname $0)
config_path="${tools_path}/../config.d"
echo $config_path
${logstash_bin} -f $config_path
