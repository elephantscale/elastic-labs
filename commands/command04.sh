#!/usr/bin/env bash


curl "localhost:9200/get-together/group/_search?\
q=elasticsearch\
&stored_fields=name,location\
&size=1\
&pretty"

