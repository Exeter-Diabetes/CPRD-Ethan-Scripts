library(tidyverse)  # streamlining R coding since 2016
library(r2r) # Used in Hashmaps later
library(RMySQL)

args = commandArgs(trailingOnly=TRUE)
if (length(args) != 3){
  stop('Script requires 3 arguments: MySQL Username, MySQL Password, Target MySQL DB Name.')
}


# Connect to a MySQL database running locally
con = dbConnect(RMySQL::MySQL(), user = args[1], password = args[2], dbname = args[3])

#Lists
Keys = c('This', 'is', 'a', 'test', 'dataframe')
Values = c(1:5)

df = data.frame(Keys, Values)
View(df)

dbWriteTable(conn = con, name = 'ethan_test_dbconnection', value = df)
# Always cleanup by disconnecting the database
dbDisconnect(con)
