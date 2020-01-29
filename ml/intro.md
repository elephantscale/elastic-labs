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
cd $HOME/elastic-labs/ml/
wget  http://es-learn-to-rank.labs.o19s.com/tmdb.json
wget  http://es-learn-to-rank.labs.o19s.com/RankLibPlus-0.1.0.jar
```





