setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
#Instalando os pacotes
install.packages("data.table")
library(data.table)
#Criando 2 vetores
vec1 <- c(1,2,3,4)
vec2 <- c("vermelho","verde","amarelo","azul")
#Criando uma data table
dt1 <- data.table(vec1,vec2)
dt1
class(dt1)
#Slicing data table
dt2 <- data.table(A = 1:9, B = c("Z","W","Q"), C = rnorm(9), D = TRUE)
dt2
dt2[3:5,]
dt2[,.(B,C)]
#Aplicando função ao data.table
dt2[, . (Total = sum(A),Mean = mean(C))]
dt2[,plot(A,C)]
dt2[,.(Mysum = sum(A)), by = .(Grp = A%%2)]
#Definido valores por grupos
dt3 <- data.table(B = c("a","b","c","d","e","a","b","c","d","e"),
                  val = as.integer(c(6:10,1:5)))
dt3
#Operações com data tables
dt4 <- data.table(A = rep(letters[2:1],each = 4L),
                  B = rep(1:4, each = 2L),
                  C = sample(8)
)
new_dt4 <- dt4[, sum(C), by = A]
class(new_dt4)
new_dt4[order(A)]

new_dt4 <- dt4[, sum(B), by = A][order(A)]
new_dt4

#iris
dt5 <- as.data.table(iris)
dt5
dt5[, .(Sepal.Length = median(Sepal.Length),
        Sepal.Width = median(Sepal.Width),
        Petal.Length = median(Petal.Length),
        Petal.Width = median(Petal.Width)
        ),by = Species]
#O parametro .SD significa Sabset Data e um subset é criado 
#Com a função lapplay, criamos um loop aplicando uma função
dt5[, lapply(.SD,median), by = Species]
?.SD
