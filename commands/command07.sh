#!/usr/bin/env bash

Search in all indices

curl "localhost:9200/get-together,other-index/_search\
?q=elasticsearch&pretty"

curl "localhost:9200/get-together,other-index/_search\?q=elasticsearch&pretty&ignore_unavailable"

