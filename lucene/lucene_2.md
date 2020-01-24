## Lucene

Lab Goals:

1. Install Lucene
2. Index documents
3. Do searches

### STEP 1: Install Lucene

```bash
    wget https://s3.amazonaws.com/elephantscale-public/downloads/lucene-7.1.0.zip
    unzip lucene-7.1.0.zip
    mv lucene-7.1.0 lucene
```

### STEP 2: Prepare to run Lucene programs

```bash
git clone git@github.com:elephantscale/elastic-labs.git
```
Analyze the file `elastic-labs/lucene/lucene_env.sh`    

Be ready to answer the question, "What does the CLASSPATH accomplish"
```bash
    source elastic-labs/lucene/lucene_env.sh
```
Verify the result by running the following command

    echo $CLASSPATH

You should see this output (or very similar)
```bash
echo $CLASSPATH

    /home/ubuntu/lucene/core/lucene-core-7.1.0.jar:
    /home/ubuntu/lucene/queryparser/lucene-queryparser-7.1.0.jar:
    /home/ubuntu/lucene/analysis/common/lucene-analyzers-common-7.1.0.jar:    
    /home/ubuntu/lucene/demo/lucene-demo-7.1.0.jar            
```
### STEP 3: Index the documents in the `lucene` folder
```bash
    java org.apache.lucene.demo.IndexFiles -docs lucene/
```
This will produce a subdirectory called index which will contain an index
of all of the Lucene source code.        

### STEP 4: Find the resulting `index` directory

Be ready to explain what the `index` directory contains.

### STEP 5: Perform searches
```bash
    java org.apache.lucene.demo.SearchFiles

```

You'll be prompted for a query. Type in a gibberish or made up word
(for example: "supercalifragilisticexpialidocious").
You'll see that there are no matching results in the lucene source code.
Now try entering the word "string". That should return a whole bunch of documents.
The results will page at every tenth result and ask you whether you want more results.
