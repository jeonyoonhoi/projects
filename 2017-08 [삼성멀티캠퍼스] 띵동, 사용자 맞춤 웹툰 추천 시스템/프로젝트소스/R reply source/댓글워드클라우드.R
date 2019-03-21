library(RSelenium)
repl_v = NULL;

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'

remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")

remDr$open()

remDr$navigate(url)

doms1<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")

p_repl <- sapply(doms1,function(x){x$getElementText()})

#p_repl_v 에는 프리미엄 댓글이 들어가게 됩니다.

p_repl_v <- unlist(p_repl)

# 댓글더보기를 자동 클릭하는 부분입니다.

more<-remDr$findElements(using='css','span.u_cbox_in_view_comment')

sapply(more,function(x){x$clickElement()})

# 전체댓글은 15개씩 10페이지로 구성되지요? 

# 이 부분은 첫번째 댓글 15개를 읽어서 벡더로 변환한 다음 repl_v 에 추가합니다.

doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")

repl <-sapply(doms2,function(x){x$getElementText()})

repl_v <- c(repl_v, unlist(repl))

repeat {
  
  # 이 부분은 두번째 페이지부터 10번째 페이지까지 댓글 15개를 읽어서 벡더로 변환한 다음 repl_v 에 추가합니다.
  
  for (i in 4:12) {               
    
    nextCss <- paste("#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(",i,") > span", sep="")
    
    
    
    try(nextPage<-remDr$findElements(using='css',nextCss))
    
    if(length(nextPage) == 0)
      
      break;
    
    sapply(nextPage,function(x){x$clickElement()})
    
    # 랜더링보다 읽는 속도가 빠르면 바로 죽어버려요... 해서 수행을 약간 지연시키는 부분이에요.
    
    # 네트워크 속도에 영향을 받기도하니(ㅠ) 
    
    Sys.sleep(1)
    
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    
    repl <-sapply(doms3,function(x){x$getElementText()})
    
    repl_v <- c(repl_v, unlist(repl))                
    
  }
  
  # 10개 페이지를 다 읽으면 다음이라는 링크를 클릭하게 하여 다음 10개 페이지를 읽을 처리를 하는 부분입니다.
  
  try(nextPage<-remDr$findElements(using='css',
                                   
                                   "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  
  if(length(nextPage) == 0)
    
    break;
  
  sapply(nextPage,function(x){x$clickElement()})
  
  # 랜더링보다 읽는 속도가 빠르면 바로 죽어버려요... 해서 수행을 약간 지연시키는 부분이에요.
  
  # 네트워크 속도에 영향을 받기도하니 이 부분은 숫자를 2 정도 하는 것도 좋을거 같아요.
  
  Sys.sleep(1)
  
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  
  repl <-sapply(doms2,function(x){x$getElementText()})
  
  repl_v <- c(repl_v, unlist(repl))        
  
}

print(p_repl_v)

write(p_repl_v, "webtoon.txt")

install.packages('KoNLP')
install.packages('RColorBrewer')
install.packages('wordcloud')
library(KoNLP)
library(RColorBrewer)
library(wordcloud)
useSejongDic()

pal2<-brewer.pal(8,"Dark2")

text<-readLines(file.choose())
text

text<-gsub("[[:punct:]]", "", text)
text<-gsub("[a-z]", "", text)
text<-gsub("[A-Z]", "", text)
text<-gsub("[[:digit:]]", "", text)
text<-gsub("^ㅋ", "", text)
text<-gsub("맴", "", text)
text<-gsub(length(text)==1, "", text)

text

install.packages("qdapRegex")
library(qdapRegex)


test<-extractNoun(text, autoSpacing = T)
rm_nchar_words(test, "1,2")
test<-gsub("(\\", "", test)
test

test2<-unlist(test) 
test2
word_count<-table(test2)
word_count
wordcloud(names(word_count),freq = word_count,scale=c(6,0.3), min.freq = 3, max.words = 20
          random.order=F, rot.per = .1,colors = pal2)

?wordcloud





install.packages("stringr")
install.packages("dplyr")
library(stringr)
library(dplyr)
library(wordcloud)
noun<-sapply(test,extractNoun,USE.NAMES=F)
noun
noun2<-unlist(noun)
noun2
word_count<-table(noun2)
word_count   
head(sort(word_count,decreasing = TRUE),10)
ZZZ <- gsub("U","",text)
