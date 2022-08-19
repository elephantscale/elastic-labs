# Logstash parsing syslog

In this lab we will be parsing syslog with Logstash.


### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

First make sure Java 8+ is installed:

```bash
java -version
```

### STEP 2: Navigate to the directory where the syslog files are located

```shell
cd /home/ubuntu/Getting-Started-with-Elastic-Stack-8.0/Chapter7/parsing-syslog
```

* Analyze the elements of the pipeline

* Now run the pipeline

```shell
/usr/share/logstash/bin/logstash -f /home/ubuntu/Getting-Started-with-Elastic-Stack-8.0/Chapter7/parsing-syslog/logstash-syslog.conf < /home/ubuntu/Getting-Started-with-Elastic-Stack-8.0/Chapter7/parsing-syslog/linux-system.log
```

* You should see your events

![](../images/28.png)


