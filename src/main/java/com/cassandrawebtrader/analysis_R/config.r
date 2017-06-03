#******************
#Mario Barrientos - 13039
#Instalación y configuración de RCassandra
#******************

install.packages("RCassandra")
#Load the RCassandra package into your environment with
library(RCassandra)

#Connectarse a la base de datos
#Por default se usa el puerto 9160 pues ahi es donde esta configurado Cassandra
connect.handle <- RC.connect(host="127.0.0.1", port=9160)
#conectarse al cluster
RC.cluster.name(connect.handle)
[1] “Test Cluster” RC.describe.keyspaces(connect.handle)

#Entrar al keyspace(BD, schema, etc)
RC.describe.keyspace(connect.handle, 'rcass')

# a partir de aqui se pueden realizar muchas cosas con esa data