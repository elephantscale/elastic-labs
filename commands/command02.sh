#!/usr/bin/env bash

curl -XPUT 'localhost:9200/new-index'

curl -XDELETE 'localhost:9200/new-index'

curl -XHEAD -I 'localhost:9200/new-index'
