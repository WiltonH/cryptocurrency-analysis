# 加载包

library(xts)
library(magrittr)
library(quantmod)
library(ggplot2)
library(ggfortify)
library(ggpubr)
library(urca)
library(PairTrading)

theme_btc <- function (base_size = 11, base_family = "") {
  theme_classic() %+replace% 
    theme(
      panel.grid.major  = element_line(color = "white"),
      panel.background = element_rect(fill = "white"),
      panel.border = element_rect(color = "black",fill = NA),
      axis.line = element_line(color = "black"),
      axis.ticks = element_line(color = "black"),
      axis.text = element_text(color = "black")
    )
}

# 协整检验

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
ETH <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETH.csv")
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))
ETH <- ETH$Close

index <- paste(index(ETH)[1],"/",sep="")
BTC <- BTC$Close[index]

ETH.log <- log(ETH)
BTC.log <- log(BTC)

# 单整检验

# summary(ur.df(coredata(BTC.log),type="none",lags=1)) # 不能拒绝原假设 非平稳

BTC.log.diff <- na.omit(diff(BTC.log))

summary(ur.df(coredata(BTC.log.diff),type="none",lags=1)) # 接受原假设 平稳 为一阶单整

# summary(ur.df(coredata(ETH.log),type="none",lags=1)) # 不能拒绝原假设 非平稳

ETH.log.diff <- na.omit(diff(ETH.log))

summary(ur.df(coredata(ETH.log.diff),type="none",lags=1)) # 接受原假设 平稳 为一阶单整

plot(ETH.log,type="l",col="purple",ylim=c(-1,12),main="ETH/BTC Natural Logarithm Price")
points(BTC.log,col="orange",pch=20,cex = 0.2)
legend("topright",legend=c("ETH","BTC"),col=c("purple","orange"),pch=c(20,NA_integer_),lty=c(0,1))

plot(ETH.log.diff,ylim=c(-0.4,0.4),col="#553580",yaxt="n",main="ETH/BTC 1st-order Difference",lwd=0.8)
grid(col = "white")
par(new=T)
plot(BTC.log.diff,ylim=c(-0.4,0.4),col="orange",main="ETH/BTC 1st-order Difference",lwd=0.8,grid.col = NA)

lm <- lm(ETH.log ~ BTC.log)
summary(lm)

alpha <- coef(lm)[1] # 截距项
beta <- coef(lm)[1] # 回归系数
res <- resid(lm)

autoplot(res) + theme_bw()

summary(ur.df(coredata(res),type="none")) # 拒绝原假设 认为序列平稳 有一阶协整关系

# 配对交易策略

library(PairTrading)
library(tseries)

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
ETH <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETH.csv")
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))
ETH <- ETH$Close

index <- paste(index(ETH)[1],"/",sep="")
BTC <- BTC$Close[index]

lm <- lm(ETH.log ~ BTC.log)
summary(lm)

alpha <- coef(lm)[1] # 截距项
beta <- coef(lm)[2] # 回归系数

res <- ETH.log - beta*BTC.log - alpha
mu <- mean(res)
sd <- sd(res)



res.df <- data.frame(date = index(res),res$Close)

ggplot(data=res.df, aes(date), ylim = c(-2,2)) + theme_bw() + ylab("Spread between ETH and BTC") + xlab("Time") +
  geom_line(aes(y = Close) , size = 0.5, linetype = 1, alpha = 1) +
  geom_hline(yintercept = mu, linetype = 1, col = "black") +
  geom_hline(yintercept = c(mu+0.2*sd,mu-0.2*sd), linetype = 2, col = "black") +
  geom_hline(yintercept = c(mu+1.5*sd,mu-1.5*sd), linetype = 2, col = "#B3B2BA") +
  geom_hline(yintercept = c(mu+2.5*sd,mu-2.5*sd), linetype = 2, col = "#B3B2BA")

signal <- Simple(res, spread.entry = 0.06)
head(signal)

barplot(signal, col="#CCC9D6",space=0,border="#63A362",xaxt="n",yaxt="n")
#par(new=TRUE)
#plot(res)

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
ETH <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETH.csv")
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))

BTC <- BTC["2015-08-07/"]$Close
ETH <- ETH$Close

prcdata <- merge(ETH,BTC)
names(prcdata) <- c("ETH","BTC")

reg <- EstimateParameters(prcdata, method = lm)

head(reg$spread)
reg$hedge.ratio
reg$premium

autoplot(reg$spread,main="Spread") + theme_bw()

library(urca)
library(quantmod)
library(PerformanceAnalytics)

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
ETH <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETH.csv")
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))

BTC <- BTC["2015-08-07/"]$Close
ETH <- ETH$Close

# 形成期

BTC.f <- BTC["2015-08-07/2018-04-20"]
ETH.f <- ETH["2015-08-07/2018-04-20"]

# 对数 - 单位根检验

BTC.f.log <- log(BTC.f)
ETH.f.log <- log(ETH.f)

ummary(ur.df(BTC.f.log))
summary(ur.df(ETH.f.log))

BTC.f.log.diff <- na.omit(diff(log(BTC.f)))
ETH.f.log.diff <- na.omit(diff(log(ETH.f)))

summary(ur.df(BTC.f.log.diff))
summary(ur.df(ETH.f.log.diff))

reg <- lm(BTC.f.log ~ ETH.f.log)
alpha <- coef(reg)[1]
beta <- coef(reg)[2]
spread.f <- BTC.f.log - beta*ETH.f.log - alpha
summary(ur.df(spread.f))

mu <- mean(spread.f)
sd <- sd(spread.f)

# 交易模拟

ETH.t <- ETH["2018-04-20/2019-05-01"]
BTC.t <- BTC["2018-04-20/2019-05-01"]

CoSpread.t <- log(BTC.t) - beta*log(ETH.t) - alpha
names(CoSpread.t) <- "CoSpread.t"

summary(CoSpread.t)

res.df <- data.frame(date = index(CoSpread.t),CoSpread.t$CoSpread.t)

ggplot(data=res.df, aes(date), ylim = c(-2,2)) + theme_bw() + ylab("BTC/ETH Spread") + xlab("Time") +
  geom_line(aes(y = CoSpread.t) , size = 0.5, linetype = 1, alpha = 1) +
  geom_hline(yintercept = mu, linetype = 1, col = "black") +
  geom_hline(yintercept = c(mu+0.2*sd,mu-0.2*sd), linetype = 2, col = "black") +
  geom_hline(yintercept = c(mu+1.5*sd,mu-1.5*sd), linetype = 2, col = "#B3B2BA") +
  geom_hline(yintercept = c(mu+2.5*sd,mu-2.5*sd), linetype = 2, col = "black")

level <- c(mu-2.5*sd, mu-1.5*sd, mu-0.2*sd, mu+0.2*sd, mu+1.5*sd, mu+2.5*sd)

interval<-function(x,level){
  prcLevel<-cut(x,breaks=c(-Inf,level,Inf))
  prcLevel<-as.numeric(prcLevel)-4
}

Level<-interval(CoSpread.t,level)

# 交易信号函数

TradeSig<-function(Level){
  n<-length(Level)
  signal<-rep(0,n)
  for (i in (2:n)){
    if(Level[i-1]==1 & Level[i]==2 )
      signal[i]<-(-2)
    
    if(Level[i-1]==1 & Level[i]== 0)
      signal[i]<-2
    
    if(Level[i-1]==2 & Level[i]==3)
      signal[i]<-3
    
    if(Level[i-1]==(-1)& Level[i]==(-2))
      signal[i]<-1
    
    if(Level[i-1]==(-1)& Level[i]==0)
      signal[i]<-(-1)
    
    if(Level[i-1]==(-2)& Level[i]==(-3))
      signal[i]<-(-3)
  }
  return(signal)
}

signal<-TradeSig(Level)

position<-c()
position[1]<-signal[1]
ns<-length(signal)
for (i in 2:ns){
  position[i]<-position[i-1]
  if (signal[i]==1)
    position[i]=1
  if (signal[i]==(-2))
    position[i]=(-1)
  if (position[i-1]==1 &signal[i]==(-1))
    position[i]=0
  if (position[i-1]==(-1) &signal[i]==(2))
    position[i]=0
  #if (signal[i]==3) break
  #if (signal[i]==-3) break
}

position<-xts(position,order.by=index(CoSpread.t))

TradeSim<-function(PriceA,PriceB,Position){
  n<-length(Position)
  priceA<-as.numeric(PriceA)
  priceB<-as.numeric(PriceB)
  position<-as.numeric(Position)
  size<-1000
  shareA<-size*position
  shareB<-c()
  shareB[1]<-(-beta)*shareA[1]*priceA[1]/priceB[1]
  cash<-c()
  cash[1]<-2000
  for (i in 2:n){
    shareB[i]<-shareB[i-1]
    cash[i]<- cash[i-1]
    if(position[i-1]==0 & position[i]==1){
      shareB[i]<-(-beta)*shareA[i]*priceA[i]/priceB[i]
      cash[i]<-cash[i-1]-(shareA[i]*priceA[i]+shareB[i]*priceB[i])
    }
    if(position[i-1]==0&position[i]==(-1)){
      shareB[i]<-(-beta)*shareA[i]*priceA[i]/priceB[i]
      cash[i]<-cash[i-1]-(shareA[i]*priceA[i]+shareB[i]*priceB[i])
    }
    if(position[i-1]==1& position[i]==0){
      shareB[i]<-0
      cash[i]<-cash[i-1]+(shareA[i-1]*priceA[i]+shareB[i-1]*priceB[i])
    }
    if((position[i-1]==(-1))&(position[i]==0)){
      shareB[i]<-0
      cash[i]<-cash[i-1]+(shareA[i-1]*priceA[i]+shareB[i-1]*priceB[i])
    }
    
  }
  cash<-xts(cash,order.by=index(Position))
  shareA<-xts(shareA,order.by=index(Position))
  shareB<-xts(shareB,order.by=index(Position))
  asset<-cash+shareA*PriceA+shareB*PriceB
  account<-merge(Position,shareA,shareB,cash,asset)
  colnames(account)<-c("Position","shareA","shareB","cash","asset")
  return(account)
}

account<-TradeSim(ETH.t,BTC.t,position)

# 模拟交易

plot.zoo(account[,c(1,4,5)],col=c("black","blue","red"), main="BTC/ETH Pairs Trading")





