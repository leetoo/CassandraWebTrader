#Load RJDBC
library(RJDBC)

#Load in the Cassandra-JDBC diver
cassdrv <- JDBC("org.apache.cassandra.cql.jdbc.CassandraDriver",
  list.files("/Users/mario/workspace/bdp/resources/cassandra/lib/",pattern="jar$",full.names=T))

#Connect to Cassandra node and Keyspace
casscon <- dbConnect(cassdrv, "jdbc:cassandra://localhost:9160/Demo")

#Query timeseries data
res <- dbGetQuery(casscon, "select * from com.cassandrawebtrader limit 10")

#Transpose
tres <- t(res[2:10])

#Plot
boxplot(tres,names=res$KEY,col=topo.colors(length(res$KEY)))