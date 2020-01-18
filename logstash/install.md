# Logstatsh install

In this lab we will practice the installation of Logstash.


### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

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


### STEP 2: Download and unzip logstash

    wget https://s3.amazonaws.com/elephantscale-public/downloads/logstash-5.5.3.tar.gz
    tar xf logstash-5.5.3.tar.gz
    mv logstash-5.5.3 logstash
    cd logstash
    
### STEP 3: Run logstash interactively

    bin/logstash -e 'input { stdin { } } output { stdout {} }'

Logstash is now listening. 

### STEP 4: Give it some input

    hello logstash
    
You will see something like

     hello logstash
    2017-12-13T02:55:40.132Z ip-172-16-0-156  hello logstash

     
