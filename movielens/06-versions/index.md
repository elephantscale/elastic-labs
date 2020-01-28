# Elastic Stack Lab06
In this lab you will be learning more about the `_version`, `_seq_no`, `_primary_term`   fields and how they can help with concurrency in Elasticsearch’s distributed architecture.

## Check version number of a document
* Use `curl` with the `GET` verb to get a list of the documents in the `movies` index
* Choose one of these movies and note the `id` ,`_version`, `_seq_no`, and `_primary_term` fields.
As an example lets do interstellar.  
```
curl -XGET 127.0.0.1:9200/movies/movie/109487?pretty
```
You should get the following ouput:
```
{
  "_index" : "movies",
  "_type" : "movie",
  "_id" : "109487",
  "_version" : 3,
  "_seq_no" : 6,
  "_primary_term" : 1,
  "found" : true,
  "_source" : {
    "id" : "109487",
    "title" : "Interstellar",
    "year" : 2014,
    "genre" : [
      "IMAX",
      "Sci-FI"
    ]
  }
}
```

The sequence number updates every time we update a document.

Elasticsearch allows us to overwrite a specific sequence number when we go to update a document, this is so we can use optimal concurrency control to ensure the correct version is updated and there’s no conflicts.

## Update specific version of document
To update a specific version we run a command like the following, but remember to change `<movieid>`, `genre`, `title`, and `year` to match the movie you chose!

```bash
curl -XPUT "127.0.0.1:9200/movies/movie/<movieid>?pretty" -H "Content-Type: application/json" -d '{
  "genre" : ["IMAX", "Sci-Fi"],
  "title" : "Interspeller",
  "year" : 2014
}'
```

After applying this update confirm it was successful by executing a `GET` against the Elasticsearch API.

```bash
curl -XGET 127.0.0.1:9200/movies/movie/<movieid>?pretty
```
Note that the sequence number has updated upon change.

If it was successful continue on otherwise check to make sure you don’t have any syntax errors, and if needed get the instructor.

Now that we’ve successfully updated our movie document let’s try to update the same version again and see what happens. You will have to specify the same sequence number and primary term that you note from the GET you just did.

```bash
curl -XPUT "127.0.0.1:9200/movies/movie/109487?if_seq_no=<seq_no>&if_primary_term=<primary_term>" -H "Content-Type: application/json" -d '{
  "genre" : ["IMAX", "Sci-Fi"],
  "title" : "Interstellar",
  "year" : 2014
}'
```

Now do another GET to see the update and confirm that it overwrote over the same sequence number.

```bash
curl -XGET 127.0.0.1:9200/movies/movie/<movieid>?pretty
```
## Retry on conflict
Now we are going to send an updating using `POST` and this time we’re going to add the option to retry if we are updating an older version.

I will be using the following because the movie I chose was `Interstellar` but you should replace this with the info for the movie you choose in the previous step.

```bash
curl -XPOST 127.0.0.1:9200/movies/movie/109487/_update?retry_on_conflict=5 -d '
{
  "doc": {
    "title" : "Interstellar"
  }
}'
```

Now confirm it was successful, but running `curl` with `GET` against the movie `id` you updated.

Spend some time playing around with version conflicts and `retry_on_conflict` updates.

# Lab Complete
