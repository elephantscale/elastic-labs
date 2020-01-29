# Elastic Stack Lab 20
In this lab we are going to Parse Logs with Logstash


We will create a Logstash pipeline that uses Filebeat to take Apache web logs as input, parses those logs to create specific, named fields from the logs, and writes the parsed data to an Elasticsearch cluster.   Rather than defining the pipeline configuration at the command line, You'll define the pipeline in a config file.  

### Download Sample data
Make note of where this data is located.  

```bash
wget https://download.elastic.co/demos/logstash/gettingstarted/logstash-tutorial.log.gz
gunzip logstash-tutorial.log.gz
```

### Configure Filebeat to Send Log Lines to Logstash

The default Logstash installation includes the Beats input plugin. The Beats input plugin enables Logstash to receive events from the Elastic Beats framework.

Open the filebeat.yml located in your Filebeat installation directory
```bash
sudo vi /etc/filebeat/filebeat.yml
```

and replace the contents with the following lines.

```bash
filebeat.inputs:
- type: log
  paths:
    - :
output.logstash:
  hosts: ["localhost:5044"]
```
Save your changes.

To keep the configuration simple, you won't specify TLS/SSL settings as you would in a real world scenario.

At the data source machine run the following command
```bash
sudo ./filebeat -e -c /etc/filebeat/filebeat.yml -d "publish" &
```

### Configuring Logstash for Filebeat input
Navigate to logstash directory
```bash
cd /etc/logstash/
```

# Lab Complete
