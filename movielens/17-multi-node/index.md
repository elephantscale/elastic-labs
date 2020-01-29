# Elastic Stack Lab17

In this lab we are going to
* Setup a second local Elasticsearch node
* Observe how Elasticsearch automatically redistributes the shards to the new node


Start by editing our `elasticsearch.yml` file
The location of your configuration file may vary.
```bash
sudo vi ~/elasticsearch-7.5.2/config/elasticsearch.yml
```
Set the following
```bash
cluster.name: my-cluster
node.name: node-1
node.max_local_storage_nodes: 2
```
We then need to copy the `elasticsearch` directory
```
sudo cp -rp elasticsearch-7.5.2 elasticsearch-7.5.2-node2
```
In the new `elasticsearch-node2` directory edit the `elasticsearch.yml` file and set:
```bash
cluster.name: my-cluster
node.name: node-2
network.port: 9201
node.max_local_storage_nodes: 2
```

Now we've setup the configuration file for the new node in our cluster but there's still a little more.
Elasticsearch requires a log directory so let's create a directory for our new node
```
sudo mkdir /var/log/elasticsearch-7.5.2-node2
```

Now we will start the new node.

Navigate to the new node's directory and start elasticsearch

```bash
cd elasticsearch-7.5.2-node2
bin/elasticsearch -d
```

After a few minutes let's confirm the new node was added to the cluster
```bash
curl -XGET 127.0.0.1:9200/_cluster/health?pretty

```

We should see the `number_of_nodes` has increased, due to adding another node.

Now if everything worked successfully `status` should go from yellow to green and you should see the shards rebalance.

Now let's confirm it also shows the same from our new node by checking port `9201`
```bash

curl -XGET 127.0.0.1:9201/_cluster/health?pretty
```

We can now query either of them and get the same results.


To confirm all the data is still available let's go ahead and query the new node for Shakespeare
```bash
curl -XGET 127.0.0.1:9200/movies/_search?pretty
curl -XGET 127.0.0.1:9201/movies/_search?pretty
```
We can also stop the original node.

You should now see that the shards were automatically distributed between the old and the new node.

You can still query the working node.

Now if we start up our original node everything will rebalance and our cluster will go back to a green status

The above commands simulated a node failure and we can see that Elasticsearch handled it without any issues.

# Lab Complete
