# Kibana install

In this lab we will practice the installation of Kibana.


Lab Goals:


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
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt-get update

```

### STEP 2: Download and unpack


```bash
 # latest
wget https://elephantscale-public.s3.amazonaws.com/downloads/kibana-7.5.1-linux-x86_64.tar.gz
tar -xzf kibana-7.5.1-linux-x86_64.tar.gz
mv kibana-7.5.1-linux-x86_64 kibana
```

### STEP 3: Start Kibana

    cd kibana/
    ./bin/kibana

Configuring Kibana via config file.
Kibana loads its configuration from the $KIBANA_HOME/config/kibana.yml file by default.
The format of this config file is explained in [Configuring Kibana](https://www.elastic.co/guide/en/kibana/7.5/settings.html).

### STEP 4: Accessing Kibana

Kibana is a web application that you access through port 5601. All you need to do is point your web browser at the machine where Kibana is running and specify the port number. For example, localhost:5601

When you access Kibana, the Discover page loads by default with the default index pattern selected. The time filter is set to the last 15 minutes and the search query is set to match-all (\*).

If you don’t see any documents, try setting the time filter to a wider time range. If you still don’t see any results, it’s possible that you don’t have any documents.

### STEP 5: Checking Kibana Status

You can reach the Kibana server’s status page by navigating to localhost:5601/status. The status page displays information about the server’s resource usage and lists the installed plugins.

You should an output similar to this one

![alt text](kibana.png)
