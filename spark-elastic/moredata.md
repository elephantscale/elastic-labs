# Spark with Elasticssearch reading more data

Practice for more data with Spark with Elasticseearch.

### STEP 1: Prepare the installs as in the [install.md](install.md) lab
    
### STEP 2: Start Spark shell with elasticsearch library

    ~/spark/bin/spark-shell --jars ~/elasticsearch-spark-20_2.11-6.0.1.jar
    
### STEP 3: Prepare Spark Context

    import org.apache.spark.SparkConf
    import org.apache.spark.SparkContext
    import org.apache.spark.SparkContext._
    import org.elasticsearch.spark._             
          
    sc.stop
    
    val conf = new SparkConf().setAppName("my-app").setMaster("local[2]")
    conf.set("es.index.auto.create", "true")    
    val sc = new SparkContext(conf)  
        
### STEP 4: Prepare the data

     val meetups = sc.textFile("/data/meetup/meetup.csv")
    
    
     val userMeetupsKV = meetups.map(line => {
                        val tokens = line.split(",") // split the line
                        val user = tokens(0)
                        val meetup = tokens(1)
                        (user, meetup) // create a KV pair (user, meetup)
                        })
    
     userMeetupsKV.foreach(println)

Save the data to Elasticsearch
    
    userMeetupsKV.saveToEs("spark/meetups")

Read the data back from Elasticsearch (reading all data)

    val RDD = sc.esRDD("spark/meetups")
    
### STEP 5: Check the values

    RDD.first
    RDD.take(20)    
    RDD.take(20).foreach(println)
    
### STEP 6: Verify the index in elasticsearch

Leave the spark shell. CTRL-d or :q will do it for you.

Now list this index in Elasticsearch

curl 'localhost:9200/spark/_search?&pretty'


### STEP 7: Back into the Spark shell 

Repeat STEP 2

### STEP 8: Read a sample Dataframe (house data)

In the future, life will be easier, and you will be able to read the data with Spark
figuring out the schema. Here is an example

    val housePrices = spark.read.
        format("csv").
        option("header", "true").
        option("inferSchema", "true").
        load("/data/house-prices/house-sales-full.csv")
        
Investigate the `housePrices` Dataframe
      
    housePrices.schema
    housePrices.count
    
    


