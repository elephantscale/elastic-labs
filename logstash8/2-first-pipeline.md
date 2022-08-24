# Logstash first pipeline

In this lab we will test Logstash with a simple pipeline.


### STEP 1: Login to the server

Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

First make sure Java 8+ is installed:

```bash
java -version
```

### STEP 2: Create a new logstash-pipeline.conf

* Create a new logstash-pipeline.conf file using your preferred code editor. 
* I created a `/home/ubuntu/logstash-resources` directory and put the file there.
* The pipeline is configured to accept input over the standard input interface. Each input will be stored in the message field of the event:
* So far, we get this

```text
input {
    stdin {}
}
```

* The filter block of the pipeline is where event processing happens. In this pipeline, a field called description is added to the event with the "First pipeline!" value. Logstash will add this field to every event coming through the input:

* Therefore, add this block to the file:

```text
filter {
    mutate {
        add_field => { "description" => "First pipeline!" }
    }
}
```

* Send the result the standard output.
* Add the following fragment to your pipeline configuration file:

```text
output {
    stdout {}
}
```

* The following command will expect the pipeline configuration file to be in the logstash directory, so I copied it there.

```shell
sudo cp logstash-pipeline.conf /usr/share/logstash/
```

```bash 
echo -e 'Hello world!' | sudo /usr/share/logstash/bin/logstash -f logstash-pipeline.conf 
```

![](../images/26.png)

* Try to send two events

```shell
 echo -e 'Hello world x1 \nHello world x2' | /usr/share/logstash/bin/logstash -f /home/ubuntu/logstash-resources/logstash-pipeline.conf
```

* You should see two events in your output

![](../images/27.png)


### STEP 3: Your first pipeline worked!
