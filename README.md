# Elasticsearch labs

The preparation steps in this 'README' apply to all subsequent labs.

## Lab Goals:

1. Prepare the working environment for the Elastic Labs.
2. Make the necessary steps so that the students won't have to repeat them in each and every lab.

The markdown format removes many characters, like ampersand (&), which are important for the 
Elasticsearch lab. Until a proper resolution is found, use scripts from the `commands` folder.
 
### STEP 1) Lab environment

The instructor will provide a server with SSH access.

### STEP 2) Login 

Login with the credentials provided by the instructor


Nothing is needed; the instructor will provide the link. 

### STEP 4) To view the labs locally

Markdown (`*.md`) files are plain text files and can be viewed in any text editor.

For the best viewing experience, we recommend the following setup:

* Get Chrome browser from [here](https://www.google.com/chrome/browser/desktop/)
* Install Markdown [preview plus plugin](https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl?hl=en-US)
* Once installed, go to the 'Window --> Extensions' menu of Chrome;   Find the 'Markdown Preview Plus' plugin;  set 'Allow access to file urls'
* Open any `*.md` file using Chrome (File --> Open)

### If you need to edit a file

We recommend using a 'programmer's editor to view these files. These editors have integrated file browsers and allow navigating through files quickly.

* For Windows: [Sublime](http://www.sublimetext.com/), [NodePad++](http://notepad-plus-plus.org/), [Textpad](http://www.textpad.com/)
* For Mac: [Sublime](http://www.sublimetext.com/),  [TextWrangler](http://www.barebones.com/products/textwrangler/)
* For Linux: [Sublime](http://www.sublimetext.com/), GEdit, Vim

## Suggested lab order

* [Inverted index](https://github.com/elephantscale/elastic-labs/tree/master/inverted-index)
* [Precision-Recall](https://github.com/elephantscale/elastic-labs/tree/master/precision-recall)
* [Lucene](https://github.com/elephantscale/elastic-labs/blob/master/lucene/lucene.md)
* [Luke](https://github.com/elephantscale/elastic-labs/blob/master/lucene/luke.md)
* [Lucene API](https://github.com/elephantscale/elastic-labs/tree/master/luceneapi) - demo only
* [Install Elasticsearch](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/1-install.md) - demo - only
* [Indexing](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/2-indexing.md)
* [Mapping](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/2-indexing.md)
* [Mapping-nested](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/4-mapping-nested.md)
* [Joins](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/5-joins-todo-TODO.md) - demo (todo)
* [Index templates](https://github.com/elephantscale/elastic-labs/blob/master/elasticsearch8/6-index-templates-TODO.md)
* [Movielens](https://github.com/elephantscale/elastic-labs/tree/master/movielens)
* [Kibana](https://github.com/elephantscale/elastic-labs/tree/master/kibana8)
* [Logstash install](https://github.com/elephantscale/elastic-labs/blob/master/logstash8/1-install.md)
* [Logstash first pipeline](https://github.com/elephantscale/elastic-labs/blob/master/logstash8/2-first-pipeline.md)
* [Logstash real-world pipeline](https://github.com/elephantscale/elastic-labs/blob/master/logstash8/3-real-world-pipeline.md)
* [Logstash parsing syslog](https://github.com/elephantscale/elastic-labs/blob/master/logstash8/4-parsing-syslog.md)
* [Learn to rank](https://github.com/elephantscale/elastic-labs/tree/master/ml/ltr-intro)
* [Elastic meets BERT](https://github.com/elephantscale/elastic-labs/tree/master/ml/bert)
* [Elastic with Spark](https://github.com/elephantscale/elastic-labs/blob/master/spark-elastic/intro.md)
