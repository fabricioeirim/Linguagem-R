setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
install.packages('haven')
library(haven)

#Sas - lendo o arquivo

vendas <- read_sas("vendas.sas")
vendas
class(vendas)

#Stata
df_stata <- read_stata("mov.dta")
class(df_stata)
View(df_sata)
#pacote foreign
install.packages('foreingh')
library(foreign)
#stata
florida <- read_dta("florida.dta")
class(florida)
str(florida)
View(florida)
#spss
dados <- read.spss('international.sav')
class(dados)
str(dados)
head(dados)
df<-data.frame(dados)
View(df)
#Criando um boxplot
boxplot(dados$gdp)
#Coeficiente de correalção. Indica uma associação negativa entre o GDP e alfabetização.
#utilizando a função COR()
cor(df$gdp,df$f_illit)
