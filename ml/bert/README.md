# Elasticsearch meets BERT lab

## Overview
We will use a pre-trained BERT model and Elasticsearch to build a search engine.
This labs is split into Part 1, installing Elastic, and part 2 incorporating BERT  

## Depends On
None

## Run time
30 mins

## Lab Goals

* Install Elasticsearch and verify its operation
* Download a Pre-trained BERT model
* Setting environment variables
* Launching Docker container
* Creating Elasticsearch index
* Creating documents
* Indexing document

## STEP 0: To Instructor

* Use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

## Part 1 Installing Elastic

### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)


### Step 2: Install docker compose

Run the followign to install docker compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

You should also verify docker itself is installed. Installation of docker is not covered here.


### Step 3: Setup environment variables

```bash
export PATH_MODEL=./cased_L-12_H-768_A-12
export INDEX_NAME=jobsearch
```

## Step 4: Download a pretrained BERT model

We will be using a pretrained English BERT model

```bash
wget https://storage.googleapis.com/bert_models/2018_10_18/cased_L-12_H-768_A-12.zip
unzip cased_L-12_H-768_A-12.zip
```

### Step 5: Run Docker Compose

First you need to stop

```bash
docker-compose up 

```




This shoudl build the docker containers and run the container the output should look something like this: (snipped)

```console
tarting bertsearch_elasticsearch_1 ...
Starting bertsearch_elasticsearch_1 ... done
Creating bertsearch_web_1           ... done
Attaching to bertsearch_bertserving_1, bertsearch_elasticsearch_1, bertsearch_web_1
bertserving_1    | I:VENTILATOR:[__i:__i: 67]:freeze, optimize and export graph, could take a while...
bertserving_1    | usage: /usr/local/bin/bert-serving-start -num_worker=1 -model_dir /model
bertserving_1    |                  ARG   VALUE
bertserving_1    | __________________________________________________
bertserving_1    |            ckpt_name = bert_model.ckpt
```


Finally you should see the following`

```console
web_1            |  * Serving Flask app "app" (lazy loading)
web_1            |  * Environment: production
web_1            |    WARNING: This is a development server. Do not use it in a production deployment.
web_1            |    Use a production WSGI server instead.
web_1            |  * Debug mode: off
web_1            |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```

You just need to let this one run.  

If you are done, or need to restart, then hit control-c

Open up a new ssh window to the same machine, as we have some more steps..


## System architecture

![System architecture](../docs/architecture.png)


## 4. Create index

You can use the create index API to add a new index to an Elasticsearch cluster. When creating an index, you can specify the following:

* Settings for the index
* Mappings for fields in the index
* Index aliases

For example, if you want to create `jobsearch` index with `title`, `text` and `text_vector` fields, you can create the index by the following command:

```bash
python example/create_index.py --index_file=example/index.json --index_name=jobsearch
```

```console
# index.json
{
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas": 1
  },
  "mappings": {
    "dynamic": "true",
    "_source": {
      "enabled": "true"
    },
    "properties": {
      "title": {
        "type": "text"
      },
      "text": {
        "type": "text"
      },
      "text_vector": {
        "type": "dense_vector",
        "dims": 768
      }
    }
  }
}
```

**CAUTION**: The `dims` value of `text_vector` must need to match the dims of a pretrained BERT model.

### 5. Create documents

First you need to install a package:

```bash
pip install elasticsearch # if you have not done so already
pip install bert_serving_client==1.9.8
```



Once you created an index, you’re ready to index some document. The point here is to convert your document into a vector using BERT. The resulting vector is stored in the `text_vector` field. Let`s convert your data into a JSON document:

```bash
 python example/create_documents.py --data=example/example.csv --index_name=jobsearch
```

```console
# example/example.csv
"Title","Description"
"Saleswoman","lorem ipsum"
"Software Developer","lorem ipsum"
"Chief Financial Officer","lorem ipsum"
"General Manager","lorem ipsum"
"Network Administrator","lorem ipsum"
```

After finishing the script, you can get a JSON document like follows:

```python
# documents.jsonl
{"_op_type": "index", "_index": "jobsearch", "text": "lorem ipsum", "title": "Saleswoman", "text_vector": [...]}
{"_op_type": "index", "_index": "jobsearch", "text": "lorem ipsum", "title": "Software Developer", "text_vector": [...]}
{"_op_type": "index", "_index": "jobsearch", "text": "lorem ipsum", "title": "Chief Financial Officer", "text_vector": [...]}
...
```

### 6. Index documents

After converting your data into a JSON, you can adds a JSON document to the specified index and makes it searchable.

```bash
$ python example/index_documents.py
```

### 7. Open browser

Go to <http://127.0.0.1:5000>.

Type in a search query. (some examples would be "sales" or "manager")

You should get "lorem ipsum" results.

Ok! so it worked. so now what?

### 8. Index your own Data

Create a file index.json

```json
{
  "settings": {
    "number_of_shards": 2,
    "number_of_replicas": 1
  },
  "mappings": {
    "dynamic": "true",
    "_source": {
      "enabled": "true"
    },
    "properties": {
      "title": {
        "type": "text"
      },
      "text": {
        "type": "text"
      },
      "text_vector": {
        "type": "dense_vector",
        "dims": 768
      }
    }
  }
}

```

Create an index with one of hte previous datasets we've used e.g. Movielens)

```bash
python example/create_index.py --index_file=exammple/index.json --index_name=<YOURINDEXNAMEHERE>
```

You must modify the file `example/create_documents.py` to use your fields rather than the `title` and `description` fileds from he sample data.

Now call create documents with your newly modified python script

```bash
 python example/create_documents.py --data=example/YOUR --index_name=YOURINDEXNAME
```

This will create a new documents.jsonl file.  Take a look at the file.

### 9. Add Documents to your new index
```bash
python example/index_documents.py
```

### 10. Now do a new set of searches 

Go to <http://127.0.0.1:5000>.

Type in a new search query appropriate for your data.

Go back to the other window to watch for any exceptions

