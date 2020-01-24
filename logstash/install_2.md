# Logstatsh install

In this lab we will practice the installation of Logstash.


### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

First make sure Java 8 is installed:

```bash
java -version
```

If you have not done so already, add the following:

```bash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
sudo apt-get update

```


### STEP 2: Download and unzip logstash


The latest version:

```bash
    wget https://s3.amazonaws.com/elephantscale-public/downloads/logstash-7.5.1.tar.gz    #latest version
    tar xf logstash-7.5.1.tar.gz
    mv logstash-7.5.1 logstash
    cd logstash

### STEP 3: Run logstash interactively

    bin/logstash -e 'input { stdin { } } output { stdout {} }'

Logstash is now listening.

### STEP 4: Give it some input

    hello logstash

You will see something like

     hello logstash
    2017-12-13T02:55:40.132Z ip-172-16-0-156  hello logstash
