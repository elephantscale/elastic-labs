# ES searching

In this lab we will practice indexing operations


Lab Goals:

* 

### STEP 1: Prepare data for searches

    cd ~/elastic-labs
    ./populate.sh

### STEP 2: Search for a specific item

* Find documents containing “elasticsearch”
* Return only the name and location fields for the top result.
 
    curl "localhost:9200/get-together/group/_search?\
    q=elasticsearch\
    &stored_fields=name,location\
    &size=1\
    &pretty"

### STEP 3: Search in multiple types

    curl "localhost:9200/get-together/group,event/_search\
    ?q=elasticsearch&pretty"
    
### STEP 4: Search in all types of an index    

    curl 'localhost:9200/get-together/_search?q=sample&pretty'
    
    curl 'localhost:9200/get-together/_search?&pretty'
    