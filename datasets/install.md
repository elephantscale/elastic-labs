# Datasets install

In this lab we will install datasets for practicing with Elasticseearch.


### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2: Get the data

    wget https://s3.amazonaws.com/elephantscale-public/downloads/shakespeare_6.0.json

    wget https://s3.amazonaws.com/elephantscale-public/downloads/accounts.zip

    wget https://s3.amazonaws.com/elephantscale-public/downloads/logs.jsonl.gz

    unzip accounts.zip
    gunzip logs.jsonl.gz

The Shakespeare data set is organized in the following schema:

    {
        "line_id": INT,
        "play_name": "String",
        "speech_number": INT,
        "line_number": "String",
        "speaker": "String",
        "text_entry": "String",
    }

The accounts data set is organized in the following schema:

    {
        "account_number": INT,
        "balance": INT,
        "firstname": "String",
        "lastname": "String",
        "age": INT,
        "gender": "M or F",
        "address": "String",
        "employer": "String",
        "email": "String",
        "city": "String",
        "state": "String"
    }

The schema for the logs data set has dozens of different fields, but the notable ones used here are:

{
    "memory": INT,
    "geo.coordinates": "geo_point"
    "@timestamp": "date"
}

Before we load the Shakespeare and logs data sets, we need to set up mappings for the fields. Mapping divides the documents in the index into logical groups and specifies a field’s characteristics, such as the field’s searchability or whether or not it’s tokenized, or broken up into separate words.

Use the following command in a terminal (eg bash) to set up a mapping for the Shakespeare data set:


    curl –H 'Content-Type: application/json' -XPUT 'localhost:9200/shakespeare?pretty' -d'
    {
     "mappings": {
      "doc": {
       "properties": {
        "speaker": {"type": "keyword"},
        "play_name": {"type": "keyword"},
        "line_id": {"type": "integer"},
        "speech_number": {"type": "integer"}
       }
      }
     }
    }
    '

This mapping specifies the following qualities for the data set:

Because the speaker and play_name fields are keyword fields, they are not analyzed. The strings are treated as a single unit even if they contain multiple words.
The line_id and speech_number fields are integers.

The logs data set requires a mapping to label the latitude/longitude pairs in the logs as geographic locations by applying the geo_point type to those fields.

Use the following commands to establish geo_point mapping for the logs:

    curl -H 'Content-Type: application/json' -XPUT 'localhost:9200/logstash-2015.05.18?pretty' -d'
    {
      "mappings": {
        "log": {
          "properties": {
            "geo": {
              "properties": {
                "coordinates": {
                  "type": "geo_point"
                }
              }
            }
          }
        }
      }
    }
    '

    curl -H 'Content-Type: application/json' -XPUT 'localhost:9200/logstash-2015.05.19?pretty' -d'
    {
      "mappings": {
        "log": {
          "properties": {
            "geo": {
              "properties": {
                "coordinates": {
                  "type": "geo_point"
                }
              }
            }
          }
        }
      }
    }
    '

    curl -XPUT 'localhost:9200/logstash-2015.05.20?pretty' -H 'Content-Type: application/json' -d'
    {
      "mappings": {
        "log": {
          "properties": {
            "geo": {
              "properties": {
                "coordinates": {
                  "type": "geo_point"
                }
              }
            }
          }
        }
      }
    }
    '

The accounts data set doesn’t require any mappings, so at this point we’re ready to use the Elasticsearch bulk API to load the data sets with the following commands:

    curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
    curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/shakespeare/doc/_bulk?pretty' --data-binary @shakespeare_6.0.json
    curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @logs.jsonl

    curl -XGET 'localhost:9200/_cat/indices?v&pretty'

You will see something like this

    health status index               uuid                   pri rep docs.count docs.deleted store.size pri.store.size
    yellow open   myindex             p_Edeq_aQSyPo7aSqjcPzw   5   1          0            0       810b           810b
    yellow open   logstash-2015.05.20 ZxafTWXjQHaGuY9D7b_7QA   2   1       9500            0       53mb           53mb
    yellow open   bank                xhirEiTJSNOeND623FKOfA   5   1       1000            0    640.3kb        640.3kb
    yellow open   shakespeare         i8eMu6dNROCVKhk3eJ8h8g   5   1     111396            0     28.6mb         28.6mb
    yellow open   logstash-2015.05.19 lHmZIurjSamU74yC6m0u2A   2   1       9248            0     51.9mb         51.9mb
    yellow open   get-together        Mc3HobI5S2y2P9WOrdD-MA   5   1          5            0     33.4kb         33.4kb
    yellow open   logstash-2015.05.18 MZOT_XVcQ12dgcsbh6Cd0A   2   1       9262            0     52.3mb         52.3mb
