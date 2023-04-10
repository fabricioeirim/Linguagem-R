setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
install.packages("dplyr")
install.packages("readr")
library(dplyr)
library(readr)
df_sono <- read_csv("sono.csv")
View(df_sono)
head(df_sono)
class(df_sono)
str(df_sono)
#Função glimpse() pode ser usada no lugar da função STR()
glimpse(df_sono)

#Aplicando mutate() - Cria uma nova coluna calculada no data frame
glimpse(mutate(df_sono,peso_libras = sono_total / 0.45359237))
View(df_sono)
#Utilizando o Count() e um atributo, fazemos a contagem por este atributo selecionado.
count(df_sono,cidade)
#Utilizando a função hist junto com o data frame e selecionando um atributo , criamos um grafico de hist
hist(df_sono$sono_total)
#Amostragem - seleciona uma amostra aleatória com 10 amostras
sample_n(df_sono,size = 10)
#select
sleepdata <- select(df_sono,nome,sono_total)
head(sleepdata)
class(sleepdata)
select(df_sono,nome)
select(df_sono, nome:cidade)
#filter
filter(df_sono,sono_total >= 16)
filter(df_sono,sono_total >= 16, peso >= 80)
filter(df_sono,cidade %in% c("Recife","Curitiba"))
#Função arrange()
df_sono %>% arrange(cidade) %>% head()
#A função arrange(), ordena pelas colunas infomradas como parametro
df_sono %>% 
  select(nome, cidade, sono_total)
  %>% arrange(cidade, sono_total) %>% head()

df_sono %>% 
  select(nome, cidade, sono_total) 
  %>% filter(sono_total >16)

df_sono %>% select(nome, cidade, sono_total)
  %>% arrange(cidade,desc(sono_total)) 
  %>% filter(sono_total >=16)

#mutate() - Cria uma coluna calculada, ou não
head(df_sono)
df_sono %>% mutate(novo_indice = sono_total / peso, peso_em_libras = peso/0.45359237) %>%
  head()

#Função sumarize()
df_sono %>% summarise(media_sono = mean(sono_total))
df_sono %>% summarise(media_sono = mean(sono_total),
                      min_sono = min(sono_total),
                      max_sono = max(sono_total))

#Sumarize com groupby
df_sono %>% group_by(cidade) %>% summarise(media_sono = mean(sono_total),
                                           min_sono = min(sono_total),
                                           max_sono = max(sono_total))

#operador %>%
head(select(df_sono,cidade,sono_total))

df_sono %>% select(cidade,sono_total) %>% head()

df_teste <- df_sono %>% mutate(novo_indice = sono_total / peso, peso_em_libras = peso/0.45359237)
  
df_teste
View(df_teste)
