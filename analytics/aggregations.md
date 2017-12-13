# ES Analytics

In this lab we will practice analytics queries.


Lab Goals:

* 

### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)
    
 ### STEP 2: Aggregate to get top tags
 
     curl 'localhost:9200/get-together/group/_search?pretty' -d '{
        "aggregations" : {
            "top_tags" : {
            "terms" : {
            "field" : "tags.verbatim"
            }
        }
     }}'
 
 - This example can be run by copy and paste
 - For the next two steps, you need to create a solution
 - (Hint: this is discussed in the slides)
 
 ### STEP 3: Find top tags for groups in Denver
 
 ### STEP 4: Apply filer, look only for groups in Denver
 
