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

And then select the opetion for java 8.

### STEP 2: Downaload and unpack

```bash 
wget https://s3.amazonaws.com/elephantscale-public/downloads/kibana-5.5.3-linux-x86_64.tar.gz  # outdated but works ok
tar -xzf kibana-5.5.3-linux-x86_64.tar.gz
mv kibana-5.5.3-linux-x86_64 kibana
```

This is the latest version


```bash
wget https://s3.amazonaws.com/elephantscale-public/downloads/kibana-5.5.3-linux-x86_64.tar.gz  # latest
wget https://elephantscale-public.s3.amazonaws.com/downloads/kibana-7.5.1-linux-x86_64.tar.gz
tar -xzf kibana-7.5.1-linux-x86_64.tar.gz

```
    
### STEP 3: Start Kibana

    cd kibana/
    ./bin/kibana
    
Configuring Kibana via config fileedit
Kibana loads its configuration from the $KIBANA_HOME/config/kibana.yml file by default. 
The format of this config file is explained in [Configuring Kibana](https://www.elastic.co/guide/en/kibana/5.5/settings.html).

### STEP 4: Accessing Kibana

Kibana is a web application that you access through port 5601. All you need to do is point your web browser at the machine where Kibana is running and specify the port number. For example, localhost:5601

When you access Kibana, the Discover page loads by default with the default index pattern selected. The time filter is set to the last 15 minutes and the search query is set to match-all (\*).

If you don’t see any documents, try setting the time filter to a wider time range. If you still don’t see any results, it’s possible that you don’t have any documents.

### STEP 5: Checking Kibana Status

You can reach the Kibana server’s status page by navigating to localhost:5601/status. The status page displays information about the server’s resource usage and lists the installed plugins.

You should an output similar to this one

![alt text](kibana.png)
