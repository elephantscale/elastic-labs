# ES install

In this lab we will practice the installation of the Solr server.


Lab Goals:

* Install Solr and verify its operation
* Prepare to use this install for all subsequent labs

### STEP 1) Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2) Verify the environment

First make sure Java 8 is installed:

```bash
java -version
```

You should get the response:

```console
openjdk version "1.8.0_232"
OpenJDK Runtime Environment (build 1.8.0_232-8u232-b09-0ubuntu1~18.04.1-b09)
OpenJDK 64-Bit Server VM (build 25.232-b09, mixed mode)
```


If it is NOT installed or ou have the wrong version installed , execute the following:

```console
sudo apt update
sudo apt install default-jdk oracle-java8-installer
sudo update-alternatives --config java
```

And then select the version of java (1.8), usually option number **2.**


### STEP 3) Download and install ES

You can use an older version:

```bash
wget https://s3.amazonaws.com/elephantscale-public/downloads/elasticsearch-5.5.3.zip  # older but works well
unzip elasticsearch-5.5.3.zip
cd elasticsearch-5.5.3
```

Or the latest verison


```bash
wget "https://elephantscale-public.s3.amazonaws.com/downloads/elasticsearch-7.5.1-no-jdk-linux-x86_64.tar.gz"
tar zxvf elasticsearch-7.5.1-no-jdk-linux-x86_64.tar.gz
cd elasticsearch-7.5.1
```



### STEP 4) Start ES

    bin/elasticsearch
    
_Tip_: You can run it in the background as a daemon by using the -d option
    
### STEP 5) Verify install

    curl 'http://localhost:9200/?pretty'

### Environment Variables

* The `JAVA_OPTS` passed to JVM is used by Elasticsearch

### Configuration files

    elasticsearch.yml

Configure different Elasticsearch modules.

    logging.yml
    
Configure the Elasticsearch logging
    
### STEP 6) ES options

    bin/elasticsearch 
or
    bin/elasticsearch --help
    
Study the options




