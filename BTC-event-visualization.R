# 重大事件可视化

library(ggplot2)
library(ggfortify)
library(ggpubr)
library(quantmod)
library(magrittr)
library(xts)

library(xts)
BTC <- read.csv("./Cryptocurrency/Crypto/BTCforks/BTC.csv")
BCH <- read.csv("./Cryptocurrency/Crypto/BTCforks/BCHex.csv")
B2X <- read.csv("./Cryptocurrency/Crypto/BTCforks/B2Xex.csv")
BSV <- read.csv("./Cryptocurrency/Crypto/BTCforks/BSVex.csv")
BCG <- read.csv("./Cryptocurrency/Crypto/BTCforks/BCGex.csv")

BTC <- xts(BTC[,-1],order.by=as.Date(BTC$Date))
BCH <- xts(BCH[,-1],order.by=as.Date(BCH$Date))
B2X <- xts(B2X[,-1],order.by=as.Date(B2X$Date))
BSV <- xts(BSV[,-1],order.by=as.Date(BSV$Date))
BCG <- xts(BCG[,-1],order.by=as.Date(BCG$Date))

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

autoplot(BTC$Close,ts.colour = 'black',ylim=c(0,20000),size=0.6) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BCH$Close,ts.colour = 'orange',ylim=c(0,20000),linetype="longdash",size=0.5) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(B2X$Close,ts.colour = '#5DCB79',ylim=c(0,20000),linetype="longdash",size=0.5) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BSV$Close,ts.colour = '#F04186',ylim=c(0,20000),linetype="longdash",size=0.5) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BCG$Close,ts.colour = '#0D6BAF',ylim=c(0,20000),linetype="longdash",size=0.5) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')

autoplot(BCH$Close[c("2018","2019")],ts.colour = 'orange',ylim=c(0,600),linetype="longdash",size=0.7) + theme_btc() +
  xlab('Time') + ylab('Price')
autoplot(B2X$Close[c("2018","2019")],ts.colour = '#5DCB79',ylim=c(0,600),linetype="longdash",size=0.7) + theme_btc() +
  xlab('Time') + ylab('Price')
autoplot(BSV$Close[c("2018","2019")],ts.colour = '#F04186',ylim=c(0,600),linetype="longdash",size=0.7) + theme_btc() +
  xlab('Time') + ylab('Price')
autoplot(BCG$Close[c("2018","2019")],ts.colour = '#0D6BAF',ylim=c(0,600),linetype="longdash",size=0.7) + theme_btc() +
  xlab('Time') + ylab('Price')

autoplot(BTC$Close[c("2017-07","2017-08")],ts.colour = 'black',ylim=c(0,5000),size=1) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BCH$Close[c("2017-07","2017-08")],ts.colour = 'orange',ylim=c(0,5000),linetype="longdash",size=0.8) + theme_void() +
  xlab('Time') + ylab('Price')

autoplot(BTC$Close["2017-10-01/2017-11-10"],ts.colour = 'black',ylim=c(0,10000),size=1) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(B2X$Close["2017-10-01/2017-11-10"],ts.colour = '#5DCB79',ylim=c(0,10000),linetype="longdash",size=0.8) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BCG$Close["2017-10-01/2017-11-10"],ts.colour = '#0D6BAF',ylim=c(0,10000),linetype="longdash",size=0.8) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
#autoplot(BSV$Close,ts.colour = '#FF500B',ylim=c(0,20000),linetype="longdash",size=0.5) + theme_btc() +
#xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')

autoplot(BTC$Close["2018-10-25/2018-12-05"],ts.colour = 'black',ylim=c(0,10000),size=1) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(BSV$Close["2018-10-25/2018-12-05"],ts.colour = '#F04186',ylim=c(0,10000),linetype="longdash",size=0.8) + theme_void() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')

# ETH Halving

library(xts)
ETH <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETH.csv")
ETC <- read.csv("./Cryptocurrency/Crypto/ETHforks/ETCex.csv")

ETH <- xts(ETH[,-1],order.by=as.Date(ETH$Date))
ETC <- xts(ETC[,-1],order.by=as.Date(ETC$Date))

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

autoplot(ETH$Close,ts.colour = '#F7941D',ylim=c(0,1500),size=0.7) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')
autoplot(ETC$Close,ts.colour = '#5DCB79',ylim=c(0,1500),linetype="longdash",size=0.5) + theme_btc() +
  xlab('Time') + ylab('Price') #+ ggtitle('Bitcoin and Its Hard Forks Historical Price')