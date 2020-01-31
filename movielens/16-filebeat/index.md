# Elastic Stack Lab16

In this lab we are going to install Filebeat and a couple plugins to play around with.

Let's start by downloading and installing Filebeat. In the virtual machine, open a browser and navigate to https://www.elastic.co/downloads/beats/filebeat. Download the Linux 64-BIT version.

Now put it in your home directory and we will unzip it.
```
tar zxvf filebeat-7.5.2-linux-x86_64.tar.gz
```

Now let's go configure Filebeat.
```
cd filebeat-7.5.2-linux-x86_64
sudo filebeat setup --dashboards
sudo mv filebeat-7.5.2-linux-x86_64/modules.d/apache.yml.disabled filebeat-7.5.2-linux-x86_64/modules.d/apache.yml
sudo vi filebeat-7.5.2-linux-x86_64/modules.d/apache.yml  
```
##Configuring Filebeat

In the file edit `var.paths`  for `access` logs to point to your home directory
`var.paths: ["~/logs/access*"]`

Disable `error` logs by changing to look like below:
```
# Error logs
  error:
    enabled: false
```

Now in our home directory we need to create `logs` directory and copy the access logs over
```
mkdir ~/logs
cd ~/logs
cp ~/access_log ~/logs/
```

Now go back to the filebeat directory to configure the filebeat.yml file:
(If it is not in this location, you will have to find it)
```
cd filebeat-7.5.2-linux-x86_64
sudo vi filebeat.yml
```
There will be a few things we have to edit:

1. Locate filebeat inputs. Under type: log, change enabled: false to enable true
2. Under paths, add the path to the log file we just created and comment out the existing log path. It will look like this.

```bash

# - /var/log/*.log
   - ~/logs/access_log

```
Save your changes.



We have an access log for Filebeat to work with so let's start it up from the directory that contains the filebeat file and the filebeat.yml. (Depending on your setup, this could be in /usr/share/filebeat/bin/ or /etc/filebeat/  )

```
./filebeat -e -c filebeat.yml
```

## Kibana and Filebeats
Now that we have Filebeats shipping our logs to Elasticsearch we should be able to see those changes in Kibana.

Start by browsing to the [Kibana dashboard](http://127.0.0.1:5601)

Click on the "Management" tab to create a new index pattern for the `filebeat` logs. The index will now be available.

Great so now we've got all the data from Filebeat directly imported into Elasticsearch.

Let's play around with this data now.

In Kibana click on `Discover` on the left hand side, then. Where it says `shakespeare*` click the drop down arrow and choose `filebeat-*`

![](index/A0509C58-30A5-4BB4-B7F3-78962E5F3E38%205.png)

You're going to get "No results found".  Don't worry there is data it's just set to only show the last 15 minutes by default so we need to adjust the time range.

In the top right hand corner of the window click `Last 15 minutes` and change it to `Absolute` and then select the first week of May.


![](index/95356BFA-A130-4A1F-BC2A-DEADF8E2AFD8%205.png)

After this loads, you'll see a lot of log entries which can be filtered to provide valuable information.

On the `Discover` screen, left hand side click on when hovering over `apache.access.response_code:500`.  This will show you all the 500 errors for the selected time period.

Now let's turn some of that info into graphs and charts.

On the left click on `Dashboard` and choose  `[Filebeat Apache2] Access and error logs`


You should see something like this
![](index/D9F9DE45-16DE-41E6-A501-E66DE926D044%205.png)

Now we can see how easy it is to stream logs to Elasticsearch and use Kibana to create graphs and charts.

# Lab Complete
