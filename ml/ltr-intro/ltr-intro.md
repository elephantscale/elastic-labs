# LTR with Elasticsearch intro

In this lab we will be practicing Spark with Elasticseearch.


### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2: Install Elastic and plugin

This lab is written for Elastic 7.5.1.  It is likely that you may be running a different version of Elastic, 
so for the purpose of this lab, let us install this version.

```bash
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.5.1-linux-x86_64.tar.gz
tar zxvf elasticsearch-7.5.1-linux-x86_64.tar.gz
cd elasticsearch-7.5.1/
```


You may now install the plugin:


```bash
./bin/elasticsearch-plugin install \
http://es-learn-to-rank.labs.o19s.com/ltr-1.1.2-es7.5.1.zip

```

And re-start elastic:

```bash
bin/elasticsearch -d
```
    
### Step 3: Get Dataset and ranking library

```bash
cd $HOME/elastic-labs/ml/ltr-intro
wget  http://es-learn-to-rank.labs.o19s.com/tmdb.json
wget  http://es-learn-to-rank.labs.o19s.com/RankLibPlus-0.1.0.jar
```

### Step 5: Install elasticsearch python library

Make sure elasticsearch python library is installed

```bash
conda install elasticsearch  #for anacconda
```

If that doesn't work, use pip:

```bash
pip install elasticsearch 
```



### Step 5: Build an Index called tmdb


This python script should build the index for you

```bash
python index_ml_tmdb.py
```

Go ahead and use CURL commands to see the mappings for your new index.


### Step 7: Create Features

Create and upload features (load_features.py)

```bash
python load_features.py
```


A "feature" in ES LTR corresponds to an Elasticsearch query. The score yielded by the query is used to train and evaluate the model. For example, if you feel that a TF\*IDF title score corresponds to higher relevance, then that's a feature you'd want to train on! Other features might include how old a movie is, the number of keywords in a query, or whatever else you suspect might correlate to your user's sense of relevance.

If you examine [load_features.py](load_features.py) you'll see how we create features. We first initialize the default feature store (`PUT /_ltr`). We create a feature set (`POST /_ltr/_featureset/movie_features`). Now we have a place to create features for both logging & use by our models!

In the demo features 1...n json are mustache templates that correspond to the features. In this case, the features are identified by *ordinal* (feature 1 is in 1.json). They are uploaded to Elasticsearch Learning to Rank with these ordinals as the feature name. In `eachFeature`, you'll see a loop where we access each mustache template an the file system and return a JSON body for adding the feature to Elasticsearch.

For traditional Ranklib models, the ordinal is the only way features are identified. Other models use feature *names* which make developing, logging, and managing features more maintainable.

### Step 9:  Gather Judgments (sample_judgments.txt)

The first part of the training data is the *judgment list*. We've provided one in [sample_judgments.txt](sample_judgments.txt).

What's a judgment list? A judgment list tells us how relevant a document is for a search query. In other words, a three-tuple of

```
<grade>,<docId>,<keywords>
```

Quality comes in the form of *grades*. For example if movie "First Blood" is considered extremely relevant for the query Rambo, we give it a grade of 4 ('exactly relevant'). The movie Bambi would receive a '0'. Instead of the notional CSV format above, Ranklib and other learning to rank systems use a format from LibSVM, shown below:

```
# qid:1: rambo
#

#
# grade (0-4)   queryid  # docId        title
4       qid:1 # 7555    Rambo
```

You'll notice we bastardize this syntax to add comments identifying the keywords associated with each query id, and append metadata to each line. Code provided in [judgments.py](judgments.py) handles this syntax.

## Step 8: Log features (collect_features.py)

You saw above how we created features, the next step is to log features for each judgment 3-tuple. This code is in [collect_features.py](collect_features.py). Logging features can be done in several different contexts. Of course, in a production system, you may wish to log features as users search. In other contexts, you may have a hand-created judgment list (as we do) and wish to simply ask Elasticsearch Learning to Rank for feature values for query/document pairs.

In [collect_features.py](collect_features.py), you'll see an `sltr` query is included. This query points to a featureSet, not a model. So it does not influence the score. We filter down to needed document ids for each keyword and allow this `sltr` query to run.

```bash
python collect_features.py
```


You'll also notice an `ext` component in the request. This search extension is part of the Elasticsearch Learning to Rank plugin and allows you to configure feature logging. You'll noticed it refers to the query name of `sltr`, allowing it to pluck out the `sltr` query and perform logging associated with the feature set.

Once features are gathered, the judgment list is fleshed out with feature value, the ordinals below corresponding to the features in our 1..n.json files.

```
4       qid:1   1:12.318446     2:9.8376875 # 7555      rambo
```
### Step 9: Train

Now it's time to train a model. 

With training data in place, it's time to ask RankLib to train a model, and output to a test file. RankLib supports linear models, ListNet, and several tree-based models such as LambdaMART. In [train.py](train.py) you'll notice how RankLib is called with command line arguments. Models `test_N` are created in our feature store for each type of RankLib model. In the `saveModel` function, you can see how the model is uploaded to our "movie_features" feature set.


Go ahead and examine the training code in `train.py`

Now, run that code.



```
python train.py
```

### Step 10: Do a sample search

See what sort of search results you get! In `search.py` you'll see we execute the `sltr` query referring to a `test_N` model in the rescore phase. By default `test_6` is used (corresponding to LambdaMART), but you can change the used model at the command line.


Then you can search using

```
python search.py Rambo
```

and search results can be printed to the console.




### Step 11: Try a different model:

```
python search.py rambo test_8
```
