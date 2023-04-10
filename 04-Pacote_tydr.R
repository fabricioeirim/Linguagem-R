setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
#Instalando o pacote tidyr
install.packages("tidyr")
library("tidyr")
library(ggplot2)
dados <- data.frame(nome = c("Geografia","Literatura","Biologia"),
                    Regiao_A = c(97,80,84),
                    Regiao_B = c(86,90,91)
                    )
dados
#Utilizando a função gather() do pacote tidyr , remodelmaos os dados, no caso em questão a Variavel Regiao
#deveria se uma só, porem foi criada em duas variaveis (Regiao_A e Regiao_B) o que dificulta a análise.
#na instrução abaixo Criamos a variavel Regiao e agrupamos os valores das variaveis Regiao_A e Regiao_B
#em uma unica variavel chamada Regiao e ja criamos a variavel nota final.
dados %>% 
  gather(Regiao,NotaFinal,Regiao_A:Regiao_B)
#Criando dados
set.seed(10)
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle','tratamento'), each = 2)),
  work.T1 = runif(4),
  home.T1 = runif(4),
  work.T2 = runif(4),
  work.T2 = runif(4)
  
)
df2
#reshape
#Na instrução abaixo, reorganizamos o dataset colocando a variavel Key agrupando toda as variaveis
#que estavam representadas por variaveis work e home T1 e T2 (que se transformaram na variavel key)
#e criamos a variavel time para agrupar as observações da variavel work e da variavel home 
df2_organizado1 <- df2 %>% gather(key, time, -id, -acao) # ) -id e -acao indica que essas
#colunas não sofrerão a ação da função gather()
df2_organizado1
#reshape
df2_organizado2 <- df2_organizado1 %>% separate(key, into = c("localidade", "tempo"), sep = "\\.")
df2_organizado2

#Outro exemplo de reshape
set.seed(1)
df3 <- data.frame(participante = c("p1","p2","p3","p4","p5","p6"),
                  info = c("g1m","g1m","g1f","g2m","g2m","g2m"),
                  day1score = rnorm(n=6,mean = 80,sd = 15),
                  day2score = rnorm(n=6,mean = 88,sd = 8)
                  )
df3
df3 %>% gather(day,socore,c(day1score,day2score))

df3 %>% gather(day,socore,c(day1score,day2score)) %>%
  spread(day,socore)

df3 %>% gather(day, score, c(day1score,day2score)) %>%
  separate(col = info, into = c("group","gender"),sep = 2)

df3 %>% gather(day, score, c(day1score,day2score)) %>%
  separate(col = info, into = c("group","gender"),sep = 2) %>%
  unite(infoagain,group,gender)

df3 %>% gather(day, score, c(day1score,day2score)) %>%
  separate(col = info, into = c("group","gender"),sep = 2) %>%
  ggplot(aes(x=day,y=score)) +
  geom_point() +
  facet_wrap(~group)+
  geom_smooth(method = "lm",aes(group = 1), se = F)

df3 %>% gather(day, score, c(day1score,day2score)) %>%
  separate(col = info, into = c("group","gender"),sep = 2)
