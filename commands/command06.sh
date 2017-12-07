#!/usr/bin/env bash


curl 'localhost:9200/get-together/_search?q=sample&pretty'

curl 'localhost:9200/get-together/_search?&pretty'
