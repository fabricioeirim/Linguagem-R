setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
#Pacotes R para Webscraping
#RCurl
#httr
#XML
#rvest
#Pacote rvest, útil para quem não conhece html e css.
install.packages('rvest')
library(rvest)
library(stringr)
library(lubridate)
library(readr)
library(xml2)
library(gtable)
library(dplyr)
#Leitura de uma webpage, retorna um documento xml
webpage <- read_html("https://www.nytimes.com/interactive/2017/06/23/opinion/trumps-lies.html")
webpage
#Extraindo os registros
#Cada elemento na web page acima tem o seguinte formato html:
#<span class = "short-desc"><strong>DATE</strong>LIE<span class="short-truth">
#<a href = "url">EXPLANATION </a></span></span>
?html_nodes
results <- webpage %>% html_nodes(".short-desc")
results
#Construindo um dataset
records <- vector("list",length = length(results))
records
for (i in seq_along(results)) {
  date <- str_c(results[i] %>%
                  html_nodes("strong") %>%
                  html_text(trim = TRUE),', 2017')
  
  explanation <- str_sub(results[i] %>% html_nodes(".short-truth") %>% html_text(trim = TRUE),2,-2)
  url <- results[i] %>% html_element("a") %>% html_attr("href")
  lie <- str_sub(xml_contents(results[i])[2]%>% html_text(trim = TRUE),2,-2)
  records[[i]] <- data.frame(date = date , explanation = explanation, url = url, lie = lie)
}
records
# Dataset final
?bind
df <- bind_rows(records)

#Transformando o campo data para o formato Dateem R.
df$date <- mdy(df$date)
View(df)
write_csv(df,"mentiras_trump")
data = xmlParse()
?xmlParse
