setwd("c:/FCD/BigData/RAzure/CAP07")
getwd()
install.packages('quantmod')
install.packages('xts')
install.packages('moments')
library(quantmod)
library(xts) #Pacotes para séries temporais
library(moments) #Pacotes para séries temporais
#Seleção do perido de analise
startdate = as.Date("2018-01-21")
enddate = as.Date("2018-06-21")
#download dos dados do periodo
?getSymbols
getSymbols("PETR4.SA", src = "yahoo", from = startdate, to = enddate, auto.assign = TRUE)
#Retorna no formato .rds que ´um BD interno do R
#PETR4.SA = readRDS("PETR4.SA.rds")
#Checando o tipo de dado retornado
class(PETR4.SA)
is.xts(PETR4.SA)
#Mostra os primeiros registos para ação da Petrobras
head(PETR4.SA)
View(PETR4.SA)
 #Analisando dados de fechamento
PETR4.SA.Close <- PETR4.SA[,"PETR4.SA.Close"]
PETR4.SA.Close
?Cl
head(Cl(PETR4.SA.Close),5)
#Vamos plotar o gráfico da petrobras 
#Gráfico CandleChart() - Gráfico de velas
?candleChart
candleChart(PETR4.SA)
#Plot de fechamento
plot(PETR4.SA.Close,main = "Fechamento Diário Ações Petrobras ",
     col = "red",xlab = "Data",ylab = "Preço", major.ticks = 'months',
     minor.ticks = FALSE)
#Adicionando as bandas de bollinger ao gráfico, com média de 20 periodos e 2
#desvios
#Como o desvio padrão é uma medida de volatilidade, Bollinger Bands ajustam-se as condições de mercado
#Mercados mais volateis possuem as bandas mais distantes da média, enquanto mercados menos volateis
#possuem as bandas mais proximas da média.
?addBBands
addBBands(n = 20, sd = 2)
#Adicionando indicador ADX, média de 11 dias do tipo exponencial
?addADX
addADX(n = 11, maType = "EMA")
#Calculando logs diários
?log
PETR4.SA.ret <- diff(log(PETR4.SA.Close), lag = 1)
#Remove valores NA na posição 1
PETR4.SA.ret <- PETR4.SA.ret[-1]
#Plotar a taxa de retorno
plot(PETR4.SA.ret, main = "Fechamento Diário das Ações da Petrobras",
     col = "red", xlab = "Data", ylab = "Retorno",major.ticks = "month",
     minor.ticks = FALSE)
#Calculando medidas estatisticas 
statnames <- c("Mean","Standard Desviation","Skewness","Kurtois")
PETR4.SA.stats <- c(mean(PETR4.SA.ret), sd(PETR4.SA.ret), skewness(PETR4.SA.ret), 
                    kurtosis(PETR4.SA.ret))
names(PETR4.SA.stats) <- statnames
PETR4.SA.stats
#Salvando os dados em um arquivo RDS
saveRDS(PETR4.SA,file = "PETR4.SA.rds")#Salva os dados em formato binário.
Ptr = readRDS("PETR4.SA.rds")
dir()
head(Ptr)
View(Ptr)
