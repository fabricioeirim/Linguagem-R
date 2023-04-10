setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
#Muitas das técnicas abaixo podem ser utilizadas com aplicação de funções
#subset(), merge(), playr::arange()
#Mas conhecer essas notações é fundamental para compreender como gerar subconjuntos de dados

##Vetores
x <- c("A","E","D","B","C")
x[] # Notação de slicing
x

#índices positivos, alguns elementos em posições específicas
x[c(1,3)] #Utiliza um vetor para trazer os elementos das colunas especificadas atravez dos indices
x[c(1,1)] #Utiliza um vetor para trazer os elementos das colunas especificadas atravez dos indices, neste caso
#está repetidno a mesma coluna, pois um vetor é um elemento unidimensional
x[order(x)] #Utilizamos a função order para trazer todo o vetor X, ordenado

#índices negativos, ignora elementos em posições específicas
x[-c(1,3)] #Nessa notação, traz todo o vetor menos os indices 1 e 3 (ignora os indices informados)
x[-c(1,4)] #Nessa notação, traz todo o vetor menos os indices 1 e 4 (ignora os indices informados)

#Vetor lógico para retornar subestring
x[c(TRUE,FALSE)]
x[c(TRUE,FALSE,TRUE,FALSE)]

#vetor de caracteres
x <- c("A","B","C","D")
y <- setNames(x,letters[1:4]) #Criando nomes para as colunas do vetor X
y
y[c("d","c","a")]
y[c("a","a","b")]

#Trabalhando com matrizes - vetores multdimensionais

mat <- matrix(1:9 ,nrow = 3)
colnames(mat) <- c("A","B","C")
mat
mat[1:2,]
mat[1:2,2:3]

#função outer() permite que a matriz se comporte como vetores individuais
?outer
vals <- outer(1:5,1:5,FUN = "paste", sep = ",")
vals
class(vals)
str(vals)
vals[c(4,15)]

#DataFrame
df <- data.frame(x = 1:3,y=3:1,z = letters[1:3])
df
df$x
df[df$x == 2,]
df[c(1,3),]
df[c("x","y")]
df[,c("x","z")]
str(df["x"])
str(df[,"x"])

#Removendo colunas de um DataFrame
df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df
df$z <- NULL #Transformando a coluna z em nulos, logo o DataFrame a descarta quando toda ela é nula
df

#Operadores [] [[]] e $
a <- list(x = 1:3, y = 4:5)
a
a[1]
a[[1]]
a[[1]][[1]]
a[['x']]

b <- list(a = list(b = list(c=list(d=1))))
b
b[[c("a","b","c","d")]]
b[["a"]][["b"]][["c"]][["d"]]
# x$y é equivalente a x[["y",exact = FALSE]]
var <- "cyl"
mtcars$var # essa notação não funciona pois var não é um atributo do dataset, mesmo tendo atribuido o atributo
#cyl a var, porem não se pode chamar var diretamente no dataset

mtcars[[var]] #usando a notação de slice, é possivel obter os valores do atributo, pois a consulta é inversa
#e indireta atravez do objeto var ao atributo cyl

x <- list(abc = 1)
x
x$a
x[["a"]]
x[["abc"]]

#subseting e atribuição
x <- 1:5
x
x[c(1,2)] <- 2:3
x
x[-1] <- 4:1
x

#Isso é subseting
head(mtcars)
mtcars[] <- lapply(mtcars,as.integer) #A função lapply, permite aplicar uma função a um dataset inteiro
head(mtcars)

#Isso não é um subset
head(mtcars)
mtcars<-lapply(mtcars,as.integer)
head(mtcars)

#lookup table
x <- c("m","f","u","f","f","m","m")
lookup <- c(m = "Male",f = "Female",u = NA)
lookup[x]
unname(lookup[x])

#usando operadores lógicos
x1 <- 1:10 %% 2 == 0
x1
which(x1)
x2 <- which(x1)
y1 <- 1:10 %% 5 == 0
y1
which(y1)
y2 <- which(y1)
y2
intersect(x2,y2)
x1 & y1
union(x2,y2)
setdiff(x2,y2)
