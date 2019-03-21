install.packages("XML")
library(XML)

# ?Š¤?¬?˜?•‘
doc<-'http://comic.naver.com/webtoon/weekday.nhn'
doc<-htmlParse(doc, encoding='UTF-8')

list<-xpathSApply(doc, "//div[@id='container']//div[@id='content']//div[@class='list_area daily_all']
                   //div[@class='col_inner']//a[@class='title']", xmlGetAttr, 'href')
webtoon_list<-list()

for(i in 1 : length(list)) {
  url<-paste("http://comic.naver.com", list[i])
  url<-gsub(' ','', url)
  webtoon_list<-append(url, webtoon_list)
}

author<-list()
title<-list()
id<-list()
cnt<-list()
day<-list()
img_url<-list()
text<-list()


tmp_id<-list()
tmp_cnt<-list()
tmp_day<-list()
tmp_img_url<-list()
tmp_text<-list()


# ê¸°ì´ˆ? •ë³? ì¶”ì¶œ
for(i in 1 : length(webtoon_list)) {
  url<-webtoon_list[[i]]
  url<-htmlParse(url, encoding='UTF-8')
  info<-xpathSApply(url, "//div[@id='content']//div[@class='detail']//h2",xmlValue)

  #1 ?‘ê°€?´ë¦?, ? œëª?(author, title)
  info<-gsub('\t','', info)
  info<-gsub('  ','', info)
  info<-strsplit(info,"\r\n")

  author<-append(info[[1]][3], author)
  title<-append(info[[1]][2], title)
##?‘ê°€,? œëª©ì— ì¶”ê?€
  
#img ê°€? ¸?˜¤ê¸?
  
  tmp_img_url<-xpathSApply(url, "//div[@id='content']
                    //div[@class='comicinfo']
                         //div[@class='thumb']
                         //img"
                         , xmlGetAttr,'src')
# text
  
  tmp_text<- xpathSApply(url, "//div[@id='content']
                    //div[@class='comicinfo']
                     //div[@class='detail']
                     //p"
                     , xmlValue)
  tmp_text
  tmp_text<-gsub('"','-',tmp_text)
  tmp_text<-gsub("'",'-',tmp_text)
  tmp_text<-gsub('\r','', tmp_text)
  tmp_text<-gsub('\n',' ', tmp_text)
#2 ê³ ìœ ë²ˆí˜¸, ë§ˆì?€ë§‰íšŒì°?, ?—°?¬?‚ ì§?(id, cnt, day)

  info<-xpathSApply(url, "//div[@id='content']
                    //table[@class='viewList']
                    //td[@class='title']//a"
                    , xmlAttrs)
info
  info<-info[[1]] # ê°€?¥ ìµœì‹ ?™”ë§? ë½‘ì•„?„œ ì²˜ë¦¬.
  info<-strsplit(info,"\\?") # ì¿¼ë¦¬ì¶”ì¶œ
  info<-info[[1]][2]

  info<-strsplit(info,"&")
    tmp_id<-info[[1]][1]
  tmp_cnt<-info[[1]][2]
  tmp_day<-info[[1]][3]
  
  tmp_id<-strsplit(tmp_id, "titleId=")
  id<-append(tmp_id[[1]][2], id)
  
  tmp_cnt<-strsplit(tmp_cnt, "no=")
  cnt<-append(tmp_cnt[[1]][2], cnt)
  
  tmp_day<-strsplit(tmp_day, "weekday=")
  day<-append(tmp_day[[1]][2], day)

  img_url<-append(tmp_img_url[1],img_url)
  text<-append(tmp_text[1],text)
tmp_text
  }

#DB ?—°?™
install.packages("DBI")
install.packages("rJava")
install.packages("RJDBC")
library(DBI)
library(rJava)
library(RJDBC)

drv<-JDBC("oracle.jdbc.driver.OracleDriver","C:/Users/student/Desktop/driver/ojdbc6.jar")
conn<-dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe", 'project', 'project')

for(i in 1:length(webtoon_list)) {
  query<-paste("INSERT INTO NAVER VALUES (",id[[i]],", '",title[[i]],"', '",day[[i]],"', '",author[[i]],"', ",cnt[[i]],", '",img_url[[i]],"','",text[[i]],"')")
  query
  dbSendUpdate(conn, query)
  }


dbCommit(conn)
dbDisconnect(conn)

