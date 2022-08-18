# Logstash install

In this lab we will practice the installation of Logstash.


### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

First make sure Java 8+ is installed:

```bash
java -version
```

* Download and install the Public Signing Key:

```bash
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
```

* You may need to install the apt-transport-https package on Debian before proceeding: (I did it)

```shell
sudo apt-get install apt-transport-https
```

* Save the repository definition to /etc/apt/sources.list.d/elastic-8.x.list:

```shell
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list
```

* Run sudo apt-get update and the repository is ready for use. You can install it with:

```shell
sudo apt-get update && sudo apt-get install logstash
```

* Verify that it is installed: proceed to your [first pipeline](2-first-pipeline.md).

