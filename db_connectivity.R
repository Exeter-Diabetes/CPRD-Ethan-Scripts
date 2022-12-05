library(tidyverse)  # streamlining R coding since 2016
library(r2r) # Used in Hashmaps later
library(RMySQL)

args = commandArgs(trailingOnly=TRUE)
if (length(args) == 0){
  print('No Args Passed!')
} else if (length(args) == 1){
  print(paste('1 arg passed: ', args[1]))
} else {
  print(paste('Multiple args passed!'))
}

df = read.table(args[1], header=TRUE)
num_vars = which(sapply(df, class)=="numeric")
df_out = df[ ,num_vars]
write.table(df_out, file=args[2], row.names=FALSE)

# Connect to a MySQL database running locally
con = dbConnect(RMySQL::MySQL(), dbname = db.database, user = db.username, password = db.password) # host = db.host

#Lists
Keys = c('This', 'is', 'a', 'test', 'dataframe')
Values = c(1:5)

df = data.frame(Keys, Values)
View(df)

dbWriteTable(conn = con, name = 'ethan_test_dbconnection', value = df)
# Always cleanup by disconnecting the database
dbDisconnect(con)
