---
id: s25qc9mrkt49vym2j0g8gvw
title: MongoDB
desc: ""
updated: 2024-12-15T22:35
created: 1641827261064
---
**Note - these are my personal notes from barely studying these things and trying to understand them**. They might be completely off.

Document database. 'Best' use-case scenario: not sure what our data model is exactly, need to integrate many different data sources. Can just put them in Mongo and have the application deal with
it later.

## Use Cases:

When you are expecting a lot of reads and write operations from your application but you do not care much about some of the data being lost in the server crash 

Up to application logic to handle joins/etc!!! 

# Key- Value stores

## DynamoDB

Amazon DynamoDB supports keys, partition keys, sort keys, and secondary indices.
(DynamoDB keys)[https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/bp-sort-keys.html].

So it can probably support fast range queries.

## Cassandra and Hbase.

When your use case requires more writing operations than reading ones ---  

In situations where you need more availability than consistency. For example, you can use it for social network websites but cannot use it for banking purposes 

You require less number of joins and aggregations in your queries to the database 

Health trackers, weather data, tracking of orders, and time series data are some good use cases where you can use Cassandra databases 

# Wide Column Stores

 BigTable

# Graph Databases (Neo4j)

Use case is clear- want recursive joins and long-range relationships.
It's kind of clear when we want it...

# Column Oriented Databases:

Support fast appends, use [[science.CS.algos.Run Length Encoding]] to compress data. Great for massive time series (e.g. sensor data, [[engineering.technologies.Internet Of Things]]).

# List Of popular NoSQL databases w/ some notes...

<https://onedrive.live.com/view.aspx?resid=A6A13EED7FFACAB8%215824&id=documents&wd=target%28System%20Design%20Stuff.one%7CC47AA9EC-5641-4E28-9386-48260F2E0A52%2FNoSQL%20databases%20list%7CB0AF0C61-E8DA-4D46-8CCE-4F24A23D4698%2F%29>

# Database Replication

- Cold Standby 

```{mermaid}
graph LR;
a[a]-->b[b]

```

# Time Series

Have some common properties with [[engineering.system_design.nosql databases#column-oriented-databases]]

[[engineering.system_design.InfluxDB]]

