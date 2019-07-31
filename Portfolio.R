# 投资组合

library(xts)
library(magrittr)
library(quantmod)
library(ggplot2)
library(ggfortify)
library(ggpubr)
library(urca)
library(PairTrading)
library(tseries)
library(PerformanceAnalytics)
library(quantmod)

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
BTC.c <- BTC$Close

BTC.return <- CalculateReturns(BTC.c,method="discrete")
#BTC.return <- periodReturn(BTC,period="daily",type="arithmetic")
BTC.annual <- Return.annualized(BTC.return,scale=252) # 年化



# chart.CumReturns(BTC.return["2017-01-01/"],main="BTC Cumulative Returns")
# chart.CumReturns(BTC.return["2017-11-01/"])
# chart.CumReturns(BTC.return["2018-01-01/"])
# chart.CumReturns(BTC.return["2018-06-01/"])
# chart.CumReturns(BTC.return["2019-01-01/"])

par(mfrow=c(4,1))
plot(cumprod(1+ BTC.return["2017-01-01/"])$Close-1,main="Cumulative Ratio/ Volume",cex=0.7,lwd=2,ylim=c(-0.5,20.1),grid.col = "white")
plot(cumprod(1 + BTC.return["2018-01-01/"])$Close-1,main="",cex=0.7,lwd=2,grid.col = "white")
plot(cumprod(1 + BTC.return["2018-06-01/"])$Close-1,main="",cex=0.7,lwd=2,grid.col = "white")
plot(cumprod(1 + BTC.return["2019-01-01/"])$Close-1,main="",cex=0.7,lwd=2,grid.col = "white")

par(mfrow=c(4,1))
plot.xts(BTC$Volume["2017-01-01/"],lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA",cex=0.7)
plot(BTC$Volume["2018-01-01/"],lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA",cex=0.7)
plot(BTC$Volume["2018-06-01/"],lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA",cex=0.7)
plot(BTC$Volume["2019-01-01/"],lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA",cex=0.7)

BTC <- read.csv("./Cryptocurrency/Crypto/BTC.csv")
ETH <- read.csv("./Cryptocurrency/Crypto/ETH.csv")
LTC <- read.csv("./Cryptocurrency/Crypto/LTC.csv")
BCH <- read.csv("./Cryptocurrency/Crypto/BCH.csv")
DASH <- read.csv("./Cryptocurrency/Crypto/DASH.csv")
XMR <- read.csv("./Cryptocurrency/Crypto/XMR.csv")

REP <- read.csv("./Cryptocurrency/Crypto/REP.csv")
EOS <- read.csv("./Cryptocurrency/Crypto/EOS.csv")
ETC <- read.csv("./Cryptocurrency/Crypto/ETC.csv")
NEO <- read.csv("./Cryptocurrency/Crypto/NEO.csv")

# 时间序列化
BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))
LTC <- xts(LTC[,-1],order.by=as.Date(LTC$Date))
BCH <- xts(BCH[,-1],order.by=as.Date(BCH$Date))
DASH <- xts(DASH[,-1],order.by=as.Date(DASH$Date))
XMR <- xts(XMR[,-1],order.by=as.Date(XMR$Date))

REP <- xts(REP[,-1],order.by=as.Date(REP$Date))
EOS <- xts(EOS[,-1],order.by=as.Date(EOS$Date))
ETC <- xts(ETC[,-1],order.by=as.Date(ETC$Date))
NEO <- xts(NEO[,-1],order.by=as.Date(NEO$Date))
# 时间序列等长化
BTC <- BTC$Close["2017-07-24/"]
ETH <- ETH$Close["2017-07-24/"]
LTC <- LTC$Close["2017-07-24/"]
BCH <- BCH$Close["2017-07-24/"]
DASH <- DASH$Close["2017-07-24/"]
XMR <- XMR$Close["2017-07-24/"]

REP <- REP$Close["2017-07-24/"]
ETC <- ETC$Close["2017-07-24/"]
EOS <- EOS$Close["2017-07-24/"]
NEO <- NEO$Close["2017-07-24/"]
# 收益率
BTC.r <- na.omit(CalculateReturns(BTC,method="discrete"))
ETH.r <- na.omit(CalculateReturns(ETH,method="discrete"))
LTC.r <- na.omit(CalculateReturns(LTC,method="discrete"))
BCH.r <- na.omit(CalculateReturns(BCH,method="discrete"))
DASH.r <- na.omit(CalculateReturns(DASH,method="discrete"))
XMR.r <- na.omit(CalculateReturns(XMR,method="discrete"))

REP.r <- na.omit(CalculateReturns(REP,method="discrete"))
EOS.r <- na.omit(CalculateReturns(EOS,method="discrete"))
ETC.r <- na.omit(CalculateReturns(ETC,method="discrete"))
NEO.r <- na.omit(CalculateReturns(NEO,method="discrete"))
return <- merge(BTC.r,ETH.r,LTC.r,BCH.r,DASH.r,XMR.r,REP.r,EOS.r,ETC.r,NEO.r)

names(return) <- c("BTC","ETH","LTC","BCH","DASH","XMR","REP","EOS","ETC","NEO")
# 累计回报率
return.cum <- cumprod(1+return)
autoplot(return.cum)  + theme_bw()

library(corrplot)
cor <- cor(return)
corrplot.mixed(cor,upper="ellipse",diag = "u")

chart.Correlation(return,histogram = TRUE,pch="+")

# 最小方差前缘

min.var <- function(r_set,goal_return){
  n <- dim(r_set)[2]
  Q <- cov(r_set) 
  r <- apply(r_set, MARGIN=2, FUN=mean)
  L1 <- cbind(Q, rep(1, n), r) 
  L2 <- rbind( c(rep(1, n), 0, 0), c(r, 0, 0) ) 
  L <- rbind(L1, L2)
  b <- c( rep(0, n), 1, goal_return) 
  solve.res <- solve(L, b)
  wt <- solve.res[1:n] 
  return_mean <- r %*% wt 
  return_variance <- wt %*% Q %*% wt 
  return( c(return_mean, return_variance, wt) ) 
}

step <- seq(-0.0005, 0.00418, by=0.00003) 
frontier_curve <- t(sapply(step,FUN=function(goal_return) min.var(return,goal_return))) 
plot(frontier_curve[,2:1],main='Frontier Curve',
     xlab='Variance',ylab='Goal Return', pch=20,ylim=c(-0.001,0.005),xlim=c(0.0018,0.0027),type="o")
abline(h=0,col="red",lty=1)
abline(h=min(frontier_curve[,2]),col="black",lty=2)
#abline(h=0.002,col="blue",lty=5)
abline(v=0.00235,col="red",lty=5)

# 模拟交易

train <- return["2017-07-25/2019-05-01"]
test <- return["2019-05-02/"]
# 选取组合
goal <- 0.00184
portfolio <- min.var(train,goal)
portfolio.weight <- portfolio[3:length(portfolio)]
portfolio.weight

# 计算测试集收益率
test.r <- test %*% portfolio.weight
test.r <- xts(test.r, order.by=index(test))
test.r.cum <- cumprod(1+test.r)
# autoplot(test.r.cum) + theme_bw()

# 与随机生成的组合进行比较
L <- 20
sim_weight <- t(sapply(1:L, FUN=function(i){
  weight <- runif(10, min=0, max=1)
  weight <- weight/sum(weight)
  return(weight)
}))
sim_return <- sapply(1:L, FUN=function(i){
  weight <- sim_weight[i, ] 
  sim_ret <- test %*% weight
  return(sim_ret)
})
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
sim_return <- xts(sim_return, order.by=index(test))
sim_cum_return <- cumprod(1+sim_return)
plot(merge(test.r.cum,sim_cum_return), main="Porfolio Return", 
     col=c('#F04186',rep('#B3B2BA', 20)), screens=1,lwd=1.5,ylab="Cumulative Returns",xlab="Time", grid.col = "white")


# Black-Litterman模型

library(BLCOP)
library(xts)
library(fPortfolio)

prior.mean <- colMeans(return)
prior.cov <- cov(return)

# 构造投资人观点
pick.matrix <- matrix(0,nrow=2,ncol=10)
colnames(pick.matrix) <- colnames(return)
pick.matrix[1,1:4] <- 1
pick.matrix[1,5:10] <- 0.5
pick.matrix[2,c(1,2,5,6,7,9)] <- c(0.5,0.5,-1,-0.5,1,0.8)

# 看法向量
q <- c(0.04, 0.022)
# 信心向量
conf <- c(85,90)
# BLView类
views <- BLViews(pick.matrix,q,conf,assetNames=colnames(return))
views

# 投资组合优化

portfolio.opt <- optimalPortfolios.fPort(post,optimizer = "tangencyPortfolio")
portfolio.opt

weightsPie(portfolio.opt$priorOptimPortfolio)
weightsPie(portfolio.opt$posteriorOptimPortfolio)

```{r fig.height=1.5, fig.width=6, warning=FALSE}

# 修正后收益
post <- posteriorEst(views,tau=0.1,prior.mean,prior.cov)
post

densityPlots(post,assetsSel="BTC")

densityPlots(post,assetsSel="BCH")
densityPlots(post,assetsSel="ETH")
densityPlots(post,assetsSel="LTC")
densityPlots(post,assetsSel="EOS")
densityPlots(post,assetsSel="TRX")
densityPlots(post,assetsSel="BCH")
densityPlots(post,assetsSel="ETC")
densityPlots(post,assetsSel="DASH")
densityPlots(post,assetsSel="XMR")
densityPlots(post,assetsSel="NEO")