# Spark with Elasticssearch install

In this lab we will be practicing Spark with Elasticseearch.


### STEP 1: Login to the server
 
Each student is provided their individual server and credentials

(Instructor: use our ubuntu AMI, t2.large or t2.xlarge instances and Elasticsearch security group)

### STEP 2: Install Spark

     tar xf files/spark-2.2.0-bin-hadoop2.7.tgz
     mv spark-2.2.0-bin-hadoop2.7/ spark
    
### STEP 3: Prepare eleasticsearch-spark library

    https://s3.amazonaws.com/elephantscale-public/downloads/elasticsearch-hadoop-6.0.1.zip
    unzip elasticsearch-hadoop-6.0.1.zip
    
### STEP 4: Start Spark shell with elasticsearch library

    cp elasticsearch-hadoop-6.0.1/dist/elasticsearch-spark-20_2.11-6.0.1.jar ~
    ~/spark/bin/spark-shell --jars elasticsearch-spark-20_2.11-6.0.1.jar
    
### STEP 5: Write to Elasticsearch from Spark

    import org.apache.spark.SparkConf
    
    val conf = new SparkConf().setAppName("my-app").setMaster("local[2]")
    conf.set("es.index.auto.create", "true")
    
    import org.apache.spark.SparkContext
    import org.apache.spark.SparkContext._
    import org.elasticsearch.spark._   
    
    sc.stop
    val sc = new SparkContext(conf)  
    
    val numbers = Map("one" -> 1, "two" -> 2, "three" -> 3)
    val airports = Map("arrival" -> "Otopeni", "SFO" -> "San Fran")
    
    sc.makeRDD(Seq(numbers, airports)).saveToEs("spark/docs")
    
### STEP 6: Read from Elasticsearch in Spark

    val RDD = sc.esRDD("spark/docs")
    
### STEP 7: Check the values

    RDD.first
    RDD.collect
    RDD.foreach(println)

### STEP 8: Verify the index in elasticsearch

Leave the spark shell. CTRL-d or :q will do it for you.

Now list this index in Elasticsearch

curl 'localhost:9200/spark/_search?&pretty'

