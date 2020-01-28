# ES searching

In this lab we will practice indexing operations


Lab Goals:

*

### STEP 1: Prepare data for searches
```bash
    cd ~/elastic-labs
    ./populate.sh
```    
You may have to copy and paste the code into the terminal.

### STEP 2: Search for a specific item

* Find documents containing “elasticsearch”
* Return only the name and location fields for the top result.

```bash
curl "localhost:9200/get-together/group/_search?\
q=elasticsearch\
&stored_fields=name,location\
&size=1\
&pretty"
```

### STEP 3: Search in multiple types
```bash
    curl "localhost:9200/get-together/group/_search?q=elasticsearch&pretty"
    curl "localhost:9200/events/event/_search?q=elasticsearch&pretty"
```
### STEP 4: Search in all types of an index    

    curl 'localhost:9200/get-together/_search?q=sample&pretty'

    curl 'localhost:9200/get-together/_search?&pretty'

    curl 'localhost:9200/events/_search?q=sample&pretty'

    curl 'localhost:9200/events/_search?&pretty'

### STEP 5: Search in multiple indices

Will the search below fail?    

    curl "localhost:9200/get-together,events/_search\
    ?q=elasticsearch&pretty"

Can you fix it?

(Hint) Use `ignore_unavailable`

We will have to create a join to do so which we will look at later.

### STEP 6: List all indices

    curl -XGET 'localhost:9200/_cat/indices?v&pretty'
