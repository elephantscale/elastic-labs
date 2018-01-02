#!/usr/bin/env bash


curl -XPUT 'localhost:9200/get-together/group/1?pretty' -d '{
"name": "Elasticsearch Denver",
"organizer": "Lee"
}'