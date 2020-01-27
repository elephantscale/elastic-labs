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

```bash
curl -H"Content-Type: application/json" "localhost:9200/get-together/group/_search?\
q=elasticsearch\
&stored_fields=name,location\
&size=1\
&pretty"
```

### STEP 3: Search in multiple types

    curl "localhost:9200/get-together/group,event/_search\
    ?q=elasticsearch&pretty"

### STEP 4: Search in all types of an index    

    curl 'localhost:9200/get-together/_search?q=sample&pretty'

    curl 'localhost:9200/get-together/_search?&pretty'

### STEP 5: Search in multiple indices

Will the search below fail?    

    curl "localhost:9200/get-together,other-index/_search\
    ?q=elasticsearch&pretty"

Can you fix it?

(Hint) Use `ignore_unavailable`

curl "localhost:9200/get-together,other-index/_search\?q=elasticsearch&pretty&ignore_unavailable"

### STEP 6: List all indices

    curl -XGET 'localhost:9200/_cat/indices?v&pretty'
