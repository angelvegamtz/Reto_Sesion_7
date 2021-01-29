####Reto 2
library(rvest)
url<-"https://www.glassdoor.com.mx/Sueldos/data-scientist-sueldo-SRCH_KO0,14.htm"
file<-read_html(url)
tables <- html_nodes(file, "table")  
table1 <- html_table(tables[1], fill = TRUE)
table <- na.omit(as.data.frame(table1))
table2<-gsub("MXN","" ,table$Sueldo)
table2<-gsub("mes","" ,table2)
table2<-gsub("/","" ,table2)
table2 <- gsub("[^[:alnum:][:blank:]?]", "", table2)
table2<- as.numeric(table2)
table$Sueldo<-table2
max.sueldo<-which.max(table$Sueldo)
table[max.sueldo,]
min.sueldo<-which.min(table$Sueldo)
table[min.sueldo,]
