# 构造统计参数函数

weighted.var <- function(x, w, na.rm = FALSE) {
  if (na.rm) {
    w <- w[i <- !is.na(x)]
    x <- x[i]
  }
  sum.w <- sum(w)
  sum.w2 <- sum(w^2)
  mean.w <- sum(x * w) / sum(w)
  (sum.w / (sum.w^2 - sum.w2)) * sum(w * (x - mean.w)^2, na.rm = na.rm)
}

coin <- function(coin = "BTC") {
  library(xts)
  library(PerformanceAnalytics)
  
  name <- coin
  path <- paste("./Cryptocurrency/Crypto/USDseries/",name,".csv",sep ="")
  coin <- read.csv(path)
  
  coin <- xts(coin[,-c(1)],order.by = as.Date(coin$Date))
  coin.r <- na.omit(CalculateReturns(coin$Close,method="discrete"))
  
  # 币种
  i = paste("币种：",name,sep="")
  # 当前市值
  b = paste("当前对数市值：",as.numeric(log(coin$Market.Cap["2019-05-25"])))
  # 发行时长
  c = paste("发行对数时长：",log(as.numeric(as.Date("2019-05-25") - index(coin)[1])))
  # 平均日交易量
  d = paste("平均日交易量：",log(mean(na.omit(coin)$Volume)))
  # 下行风险
  e = paste("下行风险：",DownsideDeviation(coin.r))
  # 风险价值
  f = paste("风险价值：",VaR(coin.r,p=0.95,method="historical"))
  # 最大差价
  g = paste("最大差价：",mean(coin$High - coin$Low))
  # 最大回撤
  h = paste("最大回撤：",maxDrawdown(coin.r,invert = T))
  # 期望亏空
  h = paste("期望亏空：",ES(coin.r,p=0.95,method="historical"))
  # 加权平均价格
  j = paste("加权平均价格：",weighted.mean(coin$Close,c(1:length(coin$Close))/sum(1:length(coin$Close))))
  # 加权平均方差
  k = paste("加权平均方差：",weighted.var(coin$Close,c(1:length(coin$Close))/sum(1:length(coin$Close))))
  
  list <- list(i,b,c,d,e,f,g,h,j,k)
  
  return(list)}

coin("USDT")

# 层次聚类

library(xts)
library(magrittr)
library(quantmod)
library(ggplot2)
library(ggfortify)
library(ggpubr)
library(urca)

USDT <- read.csv("./Cryptocurrency/Crypto/USDseries/USDT.csv")
TUSD <- read.csv("./Cryptocurrency/Crypto/USDseries/TUSD.csv")
GUSD <- read.csv("./Cryptocurrency/Crypto/USDseries/GUSD.csv")
SUSD <- read.csv("./Cryptocurrency/Crypto/USDseries/SUSD.csv")
USDC <- read.csv("./Cryptocurrency/Crypto/USDseries/USDC.csv")
PAX <- read.csv("./Cryptocurrency/Crypto/USDseries/PAX.csv")
DAI <- read.csv("./Cryptocurrency/Crypto/USDseries/DAI.csv")
SBD <- read.csv("./Cryptocurrency/Crypto/USDseries/SBD.csv")
CKUSD <- read.csv("./Cryptocurrency/Crypto/USDseries/CKUSD.csv")
BITUSD <- read.csv("./Cryptocurrency/Crypto/USDseries/BITUSD.csv")



USDT <- xts(USDT$Close,order.by = as.Date(USDT$Date))
TUSD <- xts(TUSD$Close,order.by = as.Date(TUSD$Date))
GUSD <- xts(GUSD$Close,order.by = as.Date(GUSD$Date))
SUSD <- xts(SUSD$Close,order.by = as.Date(SUSD$Date))
USDC  <- xts(USDC $Close,order.by = as.Date(USDC$Date))
PAX <- xts(PAX$Close,order.by = as.Date(PAX$Date))
DAI <- xts(DAI$Close,order.by = as.Date(DAI$Date))
SBD <- xts(SBD$Close,order.by = as.Date(SBD$Date))
CKUSD <- xts(CKUSD$Close,order.by = as.Date(CKUSD$Date))
BITUSD <- xts(BITUSD$Close,order.by = as.Date(BITUSD$Date))

stable <- merge(USDT,TUSD,GUSD,SUSD,USDC,PAX,DAI,SBD,CKUSD,BITUSD)

stable <- na.omit(stable)

stable.df <- data.frame(Date = index(stable),stable)

plot(stable,ylim=c(0.5,1.5),lwd=0.8,main=NA)
leg <- c("USDT","TUSD","GUSD","SUSD","USDC","PAX","DAI","SBD","CKUSD","BITUSD")
legend("top", leg, horiz = T)

USDT.r <- na.omit(CalculateReturns(USDT,method="discrete"))
TUSD.r <- na.omit(CalculateReturns(TUSD,method="discrete"))
GUSD.r <-  na.omit(CalculateReturns(GUSD,method="discrete"))
SUSD.r <-  na.omit(CalculateReturns(SUSD,method="discrete"))
USDC.r <-  na.omit(CalculateReturns(USDC,method="discrete"))
PAX.r <-  na.omit(CalculateReturns(PAX,method="discrete"))
DAI.r <-  na.omit(CalculateReturns(DAI,method="discrete"))
SBD.r <-  na.omit(CalculateReturns(SBD,method="discrete"))
CKUSD.r <-  na.omit(CalculateReturns(CKUSD,method="discrete"))
BITUSD.r <-  na.omit(CalculateReturns(BITUSD,method="discrete"))

library(factoextra)
stablecoin <- read.csv("./Cryptocurrency/StableCoins.csv")

rownames(stablecoin) <- stablecoin$Stable.Coin

stablecoin <- scale(stablecoin[,-1])



dist.r = dist(stablecoin, method="minkowski") 

hc.r = hclust(dist.r, method = "ward.D")

plot(hc.r, hang = -1,main=NA)
rect.hclust(hc.r,k=2)

# fviz_nbclust(stablecoin, kmeans, method = "wss") + geom_vline(xintercept = 4, linetype = 2)

fviz_dend(hc.r, k = 4, 
          cex = 0.8, 
          color_labels_by_k = T, 
          rect = F,
          type="rectangle",
          show_labels = T,
          horiz = T,
          ggtheme = theme_bw(),
          lwd = 0.8,
          palette="RdBu",
          main="",
          rect_fill = F,
          rect_border = 4:2,
          rect_lty = 1
)

library(factoextra)
stablecoin <- read.csv("./StableCoin.csv")
sta <- scale(stablecoin[,-1])
km = kmeans(sta, 3) 

fviz_nbclust(sta, kmeans, method = "wss") + geom_vline(xintercept = 4, linetype = 2)