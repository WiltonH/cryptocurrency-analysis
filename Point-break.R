# 加载包

library(xts)
library(gap)
library(changepoint)
library(strucchange)
library(xts)
library(magrittr)
library(quantmod)
library(ggplot2)
library(ggfortify)
library(ggpubr)
library(urca)

# BTC 第三次减半结构突变点分析

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
BTC <- na.omit(xts(BTC[,-1],order.by=as.Date(BTC$Date)))

BTC.v <- BTC$Volume
BTC <- BTC$Close

BTC.half.v <- BTC.v["2016-06-10/2016-08-10"]
BTC.half.v <- as.ts(BTC.half.v)


BTC.half <- BTC["2016-06-10/2016-08-10"]
BTC.half.t <- as.ts(BTC.half)

BTC.f <- Fstats(BTC.half.t ~ 1)
sctest(BTC.f)
BTC.bp <- breakpoints(BTC.half.t~1)
BTC.ci <- confint(BTC.bp, breaks = 2,level = 0.999)

par(mfrow=c(4,1))

plot(BTC.half.v,lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA")
axis(side=4)
par(new=TRUE)
plot(BTC.half.t,lwd=2.5,main="BTC 2nd Halving at 2016-07-10",xlab=NA,ylab="Price / Volume",xaxt="n",type = "o",col="black",cex=0.5,cex.main=1.5)
axis(1,labels=index(BTC.half),at=1:length(BTC.half.t),las=1) 
lines(BTC.ci,lwd=2)
lines(fitted(BTC.bp, breaks = 2), col = 4,lwd=2, lty=2)
abline(v=31,lwd=2,col="black")

par(mfrow=c(4,1))
plot(BTC.bp,main="BTC 2nd Halving",cex.main=1.5,pch=20,lwd=1.5,xlab="")


# BCH、BCG、B2X、BSV分叉结构突变点分析

BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
BTC <- na.omit(xts(BTC[,-1],order.by=as.Date(BTC$Date)))

BTC.v <- BTC$Volume
BTC <- BTC$Close


BCH.v <- BTC.v["2017-06-15/2017-09-15"]
BCG.v <- BTC.v["2017-09-10/2017-12-10"]
B2X.v <- BTC.v["2017-10-01/2018-01-01"]
BSV.v <- BTC.v["2018-10-01/2019-01-01"]

BCH.fork.v <- as.ts(BCH.v)
BCG.fork.v <- as.ts(BCG.v)
B2X.fork.v <- as.ts(B2X.v)
BSV.fork.v <- as.ts(BSV.v)


BCH.fork <- BTC["2017-06-15/2017-09-15"]
BCG.fork <- BTC["2017-09-10/2017-12-10"]
B2X.fork <- BTC["2017-10-01/2018-01-01"]
BSV.fork <- BTC["2018-10-01/2019-01-01"]

BCH.fork.t <- as.ts(BCH.fork)
BCG.fork.t <- as.ts(BCG.fork)
B2X.fork.t <- as.ts(B2X.fork)
BSV.fork.t <- as.ts(BSV.fork)


BCH.f <- Fstats(BCH.fork.t ~ 1)
BCG.f <- Fstats(BCG.fork.t ~ 1)
B2X.f <- Fstats(B2X.fork.t ~ 1)
BSV.f <- Fstats(BSV.fork.t ~ 1)

sctest(BCH.f)
sctest(BCG.f)
sctest(B2X.f)
sctest(BSV.f)

BCH.bp <- breakpoints(BCH.fork.t~1)
BCG.bp <- breakpoints(BCG.fork.t~1)
B2X.bp <- breakpoints(B2X.fork.t~1)
BSV.bp <- breakpoints(BSV.fork.t~1)

BCH.ci <- confint(BCH.bp, breaks = 2,level = 0.999)
BCG.ci <- confint(BCG.bp, breaks = 2,level = 0.999)
B2X.ci <- confint(B2X.bp, breaks = 2,level = 0.999)
BSV.ci <- confint(B2X.bp, breaks = 2,level = 0.999)

par(mfrow=c(2,2))

plot(BCH.fork.v,lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA")
axis(side=4)
par(new=TRUE)
plot(BCH.fork.t,lwd=2.5,main="BCH Fork at 2017-08-01",xlab=NA,ylab="Price / Volume",xaxt="n",type = "l",col="black",cex=1)
axis(1,labels=index(BCH.fork),at=1:length(BCH.fork.t),las=1) 
lines(BCH.ci,lwd=2)
lines(fitted(BCH.bp, breaks = 2), col = 4,lwd=1.5, lty=2)
abline(v=48,lwd=2,col="black")

plot(BCG.fork.v,lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA")
axis(side=4)
par(new=TRUE)
plot(BCG.fork.t,lwd=2.5,main="BCG Fork at 2017-10-24",xlab=NA,ylab="Price / Volume",xaxt="n",type = "l",col="black",cex=1)
axis(1,labels=index(BCG.fork),at=1:length(BCG.fork.t),las=1) 
lines(BCG.ci,lwd=2)
lines(fitted(BCG.bp, breaks = 2), col = 4,lwd=1.5, lty=2)
abline(v=45,lwd=2,col="black")

plot(B2X.fork.v,lwd=2.5,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA")
axis(side=4)
par(new=TRUE)
plot(B2X.fork.t,lwd=3,main="B2X Fork at 2017-11-16",xlab=NA,ylab="Price / Volume",xaxt="n",type = "l",col="black",cex=1)
axis(1,labels=index(B2X.fork),at=1:length(B2X.fork.t),las=1) 
lines(B2X.ci,lwd=2)
lines(fitted(B2X.bp, breaks = 2), col = 4,lwd=1.5, lty=2)
abline(v=47,lwd=2,col="black")

plot(BSV.fork.v,lwd=2,main=NA,xlab=NA,ylab=NA,xaxt="n",yaxt="n",type = "h",col="#B3B2BA")
axis(side=4)
par(new=TRUE)
plot(BSV.fork.t,lwd=2.5,main="BSV Fork at 2018-11-15",xlab=NA,ylab="Price / Volume",xaxt="n",type = "l",col="black",cex=1)
axis(1,labels=index(BSV.fork),at=1:length(BSV.fork.t),las=1) 
lines(BSV.ci,lwd=2)
lines(fitted(BSV.bp, breaks = 2), col = 4,lwd=1.5, lty=2)
abline(v=46,lwd=2,col="black")

par(mfrow=c(2,2))

plot(BCH.bp,main="BCH Fork at 2017-08-01",pch=20,xlab="")
plot(BCG.bp,main="BCG Fork at 2017-10-24",pch=20,xlab="")
plot(B2X.bp,main="B2X Fork at 2017-11-16",pch=20,xlab="")
plot(BSV.bp,main="BSV Fork at 2018-11-15",pch=20,xlab="")
