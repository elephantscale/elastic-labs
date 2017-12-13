# ES install

In this lab we will practice the installation of Kibana.


Lab Goals:


### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2: Downaload and unpack
 
    wget wget https://s3.amazonaws.com/elephantscale-public/downloads/kibana-5.5.3-linux-x86_64.tar.gz
    tar -xzf kibana-5.5.3-linux-x86_64.tar.gz
    mv kibana-5.5.3-linux-x86_64 kibana
    
### STEP 3: Start Kibana

    cd kibana/
    ./bin/kibana
    
Configuring Kibana via config fileedit
Kibana loads its configuration from the $KIBANA_HOME/config/kibana.yml file by default. 
The format of this config file is explained in [Configuring Kibana](https://www.elastic.co/guide/en/kibana/5.5/settings.html).