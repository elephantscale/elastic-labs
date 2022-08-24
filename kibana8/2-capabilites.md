# Kibana capabilities

In this lab we will Kibana capabilities.

Lab Goals: Practicing Kibana capabilities


### Let us have an overview of what Kibana capabilities are, using provided data sets

* Open Kibana. You see three different solutions and also analytics. We will go to analytics but first let's look at sample data.


![](../images/32.png)

* You could add data from other different data sources.
* You could add an Integration or upload file.

![](../images/33.png)

* But we will start with the sample data, because it is the fastest way to get started.


![](../images/34.png)

* You see three different sample data sets. Let us chose the sample web logs. That is because Kibana comes with pre-build visualizations and dashboards.
* While the web logs are loading, we can look around. But it won't be long.

![](../images/35.png)

* When you click on "View Data", you can choose different ways of investigation.


![](../images/36.png)

* While it is loading, you can look around.


![](../images/37.png)

* Here are different ways of investigation.


![](../images/38.png)

* Chose "Discover"


![](../images/39.png)

* Here is data discovery display


![](../images/40.png)

* You can look at different data fields


![](../images/41.png)

* Each field will show more information about itself.


![](../images/42.png)

* If you click on one of these, you will a popout with top five values. For some, we have less than five.


![](../images/43.png)

* In the center, you have the chart of the data, with each individual log entry being a document.
* Expand a document and watch an additional screen pop up.


![](../images/44.png)

* While inspecting a document, you can click on the "JSON" button to see the raw JSON.
* Now you can see the document in it native format as it is stored in Elasticsearch.


![](../images/45.png)

* You can choose specific fields to display.


![](../images/46.png)

* You can adjust the display of the chart.


![](../images/47.png)

* Look at the time picker on the top right.


![](../images/48.png)

* You see three different sample data sets


![](../images/49.png)

* Let us update to 2 weeks ago. And let us investigate more controls.


![](../images/51.png)

* Adjust more controls.


![](../images/52.png)

* Go back to the data and refresh.


![](../images/53.png)

* Now you can do a search. We are using KQL, Kibana Query Language.


![](../images/54.png)

* You can use filters and temporarily disable some part of the filter.


![](../images/58.png)

* In that way, you can make your filters travel with you.


![](../images/59.png)

* Again, you can pin and unpin filters.


![](../images/60.png)

* A new feature is Kibana 8 is field statistics.


![](../images/61.png)

* You can analyze the field statistics and look, say, number of documents with a specific field value.


![](../images/62.png)

* Go back and click on geo.dest


![](../images/63.png)

* And now we can visualize it.


![](../images/64.png)

* Now let's investigate dashboards and visualizations.


![](../images/65.png)

* Back to the menu and then choose "Dashboards".


![](../images/66.png)

* So here we are at the dashboard screen. In Discover, we analyzed the data and the fields.
* By contrast, in Dashboards, we can create at-a-glance visualizations and dashboards, and then go deeper.
* Here is a list of dashboards.

![](../images/67.png)

* Let us go to logs traffic dashboard.
* At the top, we have search query bar, date range picker, we can add filters or keep the filters that we have used. 

![](../images/68.png)

* Look around the dashboard, analyze metrics and visualizations, charts, maps, heat map, bar charts.


![](../images/69.png)

* Scroll down, analyze different other dashboard elements.


![](../images/70.png)

* Back at the top, you see controls with preset filters.


![](../images/71.png)

* You can see that the dashboards and all their elements are interactive.


![](../images/72.png)

* You see three different sample data sets


![](../images/72.1.png)

* You can go to the 'gear' and create a Drill-down.


![](../images/73.png)

* In creating the drill-down, you can choose different fields to display.


![](../images/74.png)

* Create US dashboard.


![](../images/74.1.png)

* Refer and add a link to a specific dashboard.


![](../images/75.png)

* Jump to the US dashboard. You may see where it is different from the global traffic dashboard.


![](../images/76.png)

* You can edit dashboard. Chose the "Edit lens".


![](../images/76.1.png)

* Now we are editing it. This is Kibana Lens, the main visualization editor.


![](../images/77.png)

* You can save your visualization and use it elsewhere. 


![](../images/78.png)

* You can start from scratch and create a new visualization, or you can borrow the existing ones. Then update, save, and use it.

* Now let us look at Canvas and Elastic Maps.


![](../images/79.png)

* Go to Analytics and select "Canvas"


![](../images/80.png)

* Here is the Canvas screen for the same logs web traffic.


![](../images/81.png)

* Canvas is a tool for building pixel-perfect visual presentations for live data.


![](../images/82.png)

* You see three different sample data sets


![](../images/83.png)

* Canvas is an editor. You can choose "Background" and select your color.


![](../images/84.png)

* You can change the CSS style.


![](../images/85.png)

* Analyze and edit a selected element.


![](../images/86.png)

* And what is this? It is a diagram of moving violations in the area.


![](../images/87.png)

* Another example: moving violations in the area, with the analytics and numbers.


![](../images/88.png)



