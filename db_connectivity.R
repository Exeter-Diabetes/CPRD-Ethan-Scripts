library(tidyverse)  # streamlining R coding since 2016

install.packages('r2r')
library(r2r) # Used in Hashmaps later

install.packages('RMySQL')
library(RMySQL)

db.username = readline(prompt="Enter MySQL Username: ")
db.password = readline(prompt="Enter MySQL Password: ")
db.database = readline(prompt="Enter Target Database: ")

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
