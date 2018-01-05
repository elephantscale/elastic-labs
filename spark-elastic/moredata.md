# Spark with Elasticssearch reading more data

Practice for more data with Spark with Elasticseearch.

### STEP 1: Prepare the installs as in the [intro.md](intro.md) lab
    
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

Quit the spark shell. CTRL-d or :q will do it for you.

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
    
### STEP 9: Dataframe to ES

We need a file called `people.txt`. For example

    cat people.txt
    a,b,12
    c,d,20
    e,f,100

    import org.apache.spark.sql.SQLContext
    import org.apache.spark.sql.SQLContext._
    import org.elasticsearch.spark.sql._
    val sqlContext = new SQLContext(sc)

    case class Person(name: String, surname: String, age: Int)

    //  create DataFrame
    val people = sc.textFile("people.txt").   
            map(_.split(",")).
            map(p => Person(p(0), p(1), p(2).trim.toInt)).
            toDF()
    
    people.saveToEs("spark/people")  

Here a fragment of what you will see

      {
        "_index" : "spark",
        "_type" : "people",
        "_id" : "AWDFDUNjUHNSwTOxy7Uq",
        "_score" : 1.0,
        "_source" : {
          "name" : "a",
          "surname" : "b",
          "age" : 12
        }
      }    
    
### STEP 10: Verify the index in elasticsearch

Leave the spark shell. CTRL-d or :q will do it for you.

Now list this index in Elasticsearch

curl 'localhost:9200/spark/_search?&pretty&size=1000'    

References

1. Read the code
2. [https://www.elastic.co/guide/en/elasticsearch/hadoop/master/spark.html](https://www.elastic.co/guide/en/elasticsearch/hadoop/master/spark.html)


