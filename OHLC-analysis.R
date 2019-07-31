# OHLC行情图绘制

library(quantmod)
library(zoo)
BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
BTC.ts <- xts(BTC[,-c(1)],order.by = as.Date(BTC$Date))
BTC.close <- BTC.ts$Close
summary(BTC.close)
BTC.close.lag <- lag(BTC.close,5)
names(BTC.close.lag) <- "LagClose"
BTC.close.2 <- merge(BTC.close,BTC.close.lag)
BTC.close.3 <- na.omit(BTC.close.2)
# 5天动量
BTC.close.m5 <- BTC.close.3$Close - BTC.close.3$LagClose
names(BTC.close.m5) <- "Momentum"
plot.zoo(merge(BTC.close,BTC.close.m5),col=c("black","blue"),
         main="BTC Historical Price vs. Its Momentum",xlab="Time")

library(ggplot2)
autoplot(BTC.close.m5,ts.colour = 'black',ylim=c(-7000,7000)) + theme_bw() +
  xlab('Time') + ylab('5 Day\'s Momentum') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')

library(xts)
BTC.w <- to.weekly(BTC.ts)
BTC.term <- BTC.w["2017-01/"]
chartSeries(BTC.term,theme="white",up.col="green",dn.col="red",name="BTC Price",type="candlesticks")
#addTA(Cl(BTC.term),on=1,col="black",type="l")
addTA(Cl(BTC.term),col="black",type="l")
addTA(momentum(Cl(BTC.term),n=5,na.pad=TRUE),col=4,type="l")
addBBands()
addMACD(32,50,12)