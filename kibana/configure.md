# Kibana configuration

In this lab we will practice the configuration of Kibana.

Pre-requisites:

Make sure you have the datasets imported, as in this lab: [datasets/install.md](../datasets/install.md)

you will need the Kibana slides where the configuration and capabilities
are illustrated with screenshots.

### STEP 1: Start Kibana as in the [install.md](install.md) lab

### STEP 2: Get test data

    wget https://s3.amazonaws.com/elephantscale-public/downloads/logstash-7.5.1.tar.gz

### STEP 3: Configuration

1. Configure an index pattern

    * Click on Configure
    * Investigate individual fields

1. Investigate setting time range

    * Use the time picker
    * Try absolute or relative time picker
    * Change time intervals

1.  Search in Kibana

    * Refresh Lucene syntax
    * Search for three specific fields in different formats

1.  Investigate documents

    * Expand documents
    * Investigate fields and data

1.  Filter for specific geography

    * Search for countries or groups of countries

1.  Structured filters

    * Add three structured filters
    * Select different fields, conditions, and values for the filters

1.  Visualizations

    * Create a line chart, count documents
    * Visualize traffic vs bytes count
    * Change the appearance of the visualization
    * Create a pie chart for the return codes

1.  Dashboards

    * Create a dashboard, add your visualizations                       
    * Share your dashboard with another browser
    * Print the dashboard to a PDF
