#!/usr/bin/env bash



curl "localhost:9200/get-together/group,event/_search\
?q=elasticsearch&pretty"

