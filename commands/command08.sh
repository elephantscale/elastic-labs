#!/usr/bin/env bash


curl -XPOST 'localhost:9200/get-together/_search?pretty' -d'
{
"query": {
"match": {
"description": "elasticsearch"
}
},
"explain": true
}'