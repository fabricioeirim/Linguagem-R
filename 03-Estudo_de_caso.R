setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
#Estudo de cado 03
#Instalando o pacote HFLIGHTS (Dados de voos de huston)
install.packages("hflights")
library(hflights)
library(dplyr)
?hflights
?tbl_df
flights <- tbl_df(hflights)
flights
View(flights)
#Resumindo os dados
str(flights)
glimpse(flights)
#Visualizando com DataFrame
data.frame(flights)
data.frame(head(flights))
#Filtrando dados com slice
flights[flights$Month == 1 &  flights$DayofMonth == 1,]
#Aplicando filtros
filter(flights,Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA","UA"))
#Utilizando o select
select(flights,Year:DayofMonth, contains("Taxi"),contains("Delay"))
#Organizando os dados
flights %>% select(UniqueCarrier, DepDelay) %>% arrange(DepDelay)
flights %>% select(Distance,AirTime) %>% mutate(Speed = Distance / AirTime*60)
flights %>% group_by(Month,DayofMonth) %>% tally(sort = TRUE)
