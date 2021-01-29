library(DBI)
library(RMySQL)
MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
library(dplyr)
dbListTables(MyDataBase)
dbListFields(MyDataBase, 'CountryLanguage')
DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
names(DataDB)
DataDB %>% filter(Language == "Spanish")
XX <- DataDB %>% filter(Language == "Spanish")
XX.df <- as.data.frame(XX) 

ggplot(XX.df, aes(x=Percentage, y=CountryCode, fill=IsOfficial)) + geom_col(colour = "black", fill= "red")+geom_bin2d()+coord_flip()
