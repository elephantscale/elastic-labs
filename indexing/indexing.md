# ES indexing

In this lab we will practice indexing operations


Lab Goals:

*

### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)



### STEP 2: Index one document

    curl -XPUT  -H 'Content-type: application/json' "localhost:9200/get-together/group/1 " -d '{
    "name": "Elasticsearch Denver",
    "organizer": "Lee"
    }'

### STEP 3: Practice index create, list, delete

    curl -XPUT 127.0.0.1:9200/new-index

    curl -XDELETE 'localhost:9200/new-index'

    curl -XHEAD -I 'localhost:9200/new-index'


### STEP 4: List mapping

    curl 'localhost:9200/get-together/_mapping/group?pretty'
