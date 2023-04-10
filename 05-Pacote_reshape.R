setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()

#Pivot (Transposta da Matriz)
mtcars
View(t(mtcars))
#reshape
head(iris)
View(iris)
str(iris)
library(lattice)
?reshape
#Distribuindo os dados verticalmente
iris_modif <- reshape(iris, varying = 1:4
                    ,v.names = "Medidas",
                    timevar = "Dimensoes",
                    times = names(iris)[1:4],
                    idvar = "ID",
                    direction = "long")
head(iris_modif)
View(iris_modif)

bwplot(Medidas ~ Species | Dimensoes, data = iris_modif)

iris_modif_sp <- reshape(iris,
                         varying = list(c(1,3),c(2,4)),
                         v.names = c("Comprimento","Largura"),
                         timevar = "Parte",
                         times = c("Sepal","Petal"),
                         idvar = "ID",
                         direction = "long")
head(iris_modif_sp)
View(iris_modif_sp)

xyplot(Comprimento ~ Largura | Species, groups = Parte,
       data = iris_modif_sp,auto.key = list(space = "right"))

xyplot(Comprimento ~ Largura | Parte, groups = Species,
       data = iris_modif_sp,auto.key = list(space = "right"))

#Pacote reshape2
install.packages("reshape2")
library("reshape2")
#Criando um dataframe
df = data.frame(nome = c("zico","pele"),
                chuteira = c(40,42),
                idade = c(34,NA),
                peso = c(93,NA),
                altura = c(175,178)
)
df
#Derretendo o dataframe - Função melt()
df_wide = melt(df, id = c("nome","chuteira"))
df_wide
#Removendo valores NA
df_wide = melt(df,id = c("nome","chuteira"), na.rm = TRUE)
df_wide
#esticando o dataframe com a função dcast
dcast(df_wide, formula = chuteira + nome ~ variable)
dcast(df_wide, formula = nome + chuteira ~ variable)
dcast(df_wide, formula =  nome ~ variable)
dcast(df_wide, formula =  ... ~ variable)  

#Aplicando o reshape2
names(airquality) <- tolower(names(airquality))
head(airquality)
dim(airquality)
#Utilizando a função melt para transformar o dataframe
df_wide2 <- melt(airquality)
df_wide2
head(df_wide2)

#Aplicando o reshape2 inserindo mais duas variaveis
df_wide2 <- melt(airquality, id.vars = c("month","day"))
head(df_wide2)

df_wide2 <- melt(airquality, id.vars = c("month","day"),
                 variable.name = "climate_variable",
                 value.name = "climate_value")
head(df_wide2)
#Função dcast - long
df_wide <- melt(airquality,id.vars = c("month","day"))
View(df_wide)

df_long <- dcast(df_wide,month + day ~ variable)
View(df_long)
