### Rselenium을 이용한 웹툰 '조아요' 수 그래프로 나타내기
install.packages("RSelenium")
library(RSelenium)
rate<-list()
name<-list()
for(i in seq(from = 197, to=1, by=-2)) {
  url3<-paste('http://comic.naver.com/webtoon/detail.nhn?titleId=642700&no=',i, sep = "")
  remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")
  remDr$open()
  remDr$navigate(url3)
  doms3<-remDr$findElements(using ="css selector","em.u_cnt")
  doms3
  wtreview2 <- sapply(doms3,function(x){x$getElementText()})
  tmp<-gsub(",","",wtreview2)
  tmp<-as.numeric(tmp)
  
  rate<-append(tmp, rate)
  name<-append(paste(i, '화'), name)
  remDr$close()
}
rate <- unlist(rate)
rate 
name<-unlist(name)
name
#그래프 만들기 
barplot(height=rate, names.arg = name, main="공복의저녁식사",col=rainbow(200))
