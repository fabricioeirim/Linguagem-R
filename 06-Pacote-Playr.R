setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
install.packages("plyr")
library("plyr")
install.packages("gapminder")
library(gapminder)
?gapminder
#split-apply-combiner
#ddply
df <- ddply(gapminder, ~ continent, summarise,
            max_le = max(lifeExp))
df
View(df)
levels(df$continent)

#Mais um exemplo
ddply(gapminder, ~ continent,
      summarise, n_uniq_countries = length(unique(country)))
#exemplo com função personalizada
ddply(gapminder, ~ continent, function(x) c(n_uniq_countries = length(unique(x$country))))

#outro exemplo
ddply(gapminder, ~ continent, summarise,
      min = min(lifeExp),
      mediana = median(lifeExp),
      max = max(lifeExp))

View(ddply(gapminder, ~ country, summarise,
      min = min(lifeExp),
      mediana = median(lifeExp),
      max = max(lifeExp)))
ddply(gapminder, ~ continent, summarise,
      min = min(lifeExp),
      max = max(lifeExp),
      media = median(gdpPercap))
#Usando o Dataset ggplot
library(ggplot2)
data(mpg)
str(mpg)
#Trabalhando com um sbset - Sempre lebrar de usar conchetes pois um subset é um slice de
#um dataset, e a nortação de slice usa conchetes
data <- subset(mpg[,c(1,7:9)])
data

#Sumarizando e agragando dados
ddply(data, ~ manufacturer,
      summarise, 
      avgcty = mean(cty))
#Varias funções em uma unica chamada
ddply(data, ~manufacturer,
      summarise,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy))

#Sumarixando utilizando mais de uma variavel
ddply(data, .(manufacturer, drv),
      summarise,
      avgcty = mean(cty),
      sdcty = sd(cty),
      maxhwy = max(hwy)
)
