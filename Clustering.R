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
  path <- paste("./Cryptocurrency/Crypto/",name,".csv",sep ="")
  coin <- read.csv(path)
  
  coin <- xts(coin[,-c(1)],order.by = as.Date(coin$Date))
  coin.r <- na.omit(CalculateReturns(coin$Close,method="discrete"))
  
  # 币种
  i = paste("币种：",name,sep="")
  # 当前价格
  a = paste("当前对数价格：",as.numeric(log(coin$Close["2019-05-25"])),sep="")
  # 当前市值
  b = paste("当前对数市值：",as.numeric(log(coin$Market.Cap["2019-05-25"])))
  # 发行时长
  c = paste("发行对数时长：",log(as.numeric(as.Date("2019-05-25") - index(coin)[1])))
  # 平均日交易量
  d = paste("平均日交易量：",log(mean(na.omit(coin)$Volume)))
  # 下行风险
  e = paste("下行风险：",DownsideDeviation(coin.r))
  # 期望收益率
  f = paste("期望收益：",mean(coin.r))
  # 平均差价
  g = paste("对数平均差价：",log(mean(coin$High - coin$Low)))
  # 最高价格
  h = paste("对数最高价格：",log(max(coin$High)))
  # 加权平均价格
  j = paste("加权平均对数价格：",log(weighted.mean(coin$Close,c(1:length(coin$Close))/sum(1:length(coin$Close)))))
  # 加权平均方差
  k = paste("加权平均对数方差：",log(weighted.var(coin$Close,c(1:length(coin$Close))/sum(1:length(coin$Close)))))
  
  list <- list(i,a,b,c,d,e,f,g,h,j,k)
  
  return(list)
}

coin("BTC")

# K-均值聚类

coin <- read.csv("./Cryptocurrency/Coins.csv")
label <- coin$coin
coin <- scale(coin[,-1])
rownames(coin) <- label

library(useful)
best <- FitKMeans(coin, max.clusters = 10, nstart = 25, seed=666)
PlotHartigan(best,smooth = F,linesize = 1L,linetype = 2L) + theme_bw()

k <- kmeans(x = coin, centers = 3, nstart = 25)
centers <- k$centers[k$cluster, ]
distances <- sqrt(rowSums((coin - centers)^2))
outliers <- order(distances, decreasing=T)[5]
print(outliers)
print(coin[outliers,])

library(cluster)
# plot(k, data = coin, labels = 2) + theme_bw()
clusplot(coin, k$cluster, main='',
         color=TRUE, shade=T,
         labels=2, lines=1)
points(coin[outliers], pch=20, col=4, cex=3)

library(factoextra)
set.seed(5)
k <- kmeans(x = coin, centers = 3, nstart = 100,algorithm = "Hartigan-Wong")
fviz_cluster(k, data = coin, main="",ellipse = T) + theme_bw()

fviz_nbclust(coin, kmeans, method = "wss") + theme_bw()
fviz_nbclust(coin, kmeans, method = "gap_stat") + theme_bw()
