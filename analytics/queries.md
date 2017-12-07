# ES Analytics

In this lab we will practice analytics queries.


Lab Goals:

* 

### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2: Populate data

    git clone https://github.com/dakrone/elasticsearch-in-action.git
    cd elasticsearch-in-action
    git checkout 5.x
    elasticsearch-in-action/populate.sh
    
 ### STEP 3: Aggregate to get top tags
 
     curl 'localhost:9200/get-together/group/_search?pretty' -d '{
        "aggregations" : {
            "top_tags" : {
            "terms" : {
            "field" : "tags.verbatim"
            }
        }
     }}'
 
 ### STEP 4: Top tags for groups in Denver
 
     curl 'localhost:9200/get-together/group/_search?pretty' -d '{
        "query": {
                "match": {
                "location": "Denver"
            }
        },
        "aggregations" : {
            "top_tags" : {
                "terms" : {
                    "field" : "tags.verbatim"
                }
           }
        }
     }'
 
 ### STEP 5: Apply filer
 
    curl 'localhost:9200/get-together/group/_search?pretty' -d '{
        "post_filter": {
            "term": {
                "location": "denver"
            }
        }
     }'
