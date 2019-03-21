# The number of like of Best Reply 
numberofgood <- list()
G_number_F <- list()
# The number of hate of Best Reply 
numberofbad <- list()
B_number_F <- list()
# reply download
p_repl <- list()
p_reply <- list()


# selenium running

remDr<-remoteDriver(remoteServerAddr="localhost",port=4445L,browserName="chrome")

remDr$open()

remDr$navigate(url)

dom_G<-remDr$findElements(using ="css selector","em.u_cbox_cnt_recomm")

numberofgood <- sapply(dom_G,function(x){x$getElementText()})
G_number <- gsub(",", "", numberofgood)

G_number_F <- append(G_number_F, G_number)
G_number_F <- as.numeric(G_number_F)

doms_B <- remDr$findElements(using ="css selector","em.u_cbox_cnt_unrecomm")

numberofbad <- sapply(doms_B,function(x){x$getElementText()})
B_number<-gsub(",", "", numberofbad)

B_number_F <- append(B_number_F, B_number)
B_number_F <- as.numeric(B_number_F)

doms_R <- remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")

p_repl <- sapply(doms_R,function(x){x$getElementText()})
p_reply <- append(p_reply, p_repl)
p_reply <- unlist(p_reply)  
p_reply




remDr$close()


# G - B의 계산
result <- (G_number_F/(G_number_F+B_number_F))*100
result

#Data frame build
df <- data.frame("nums" = result)
df2 <- data.frame("reviews" = p_reply)
df3 <- data.frame("Id" = 670139)

# All best review
df_f_A <- cbind(df, df2, df3)
df_f_A

# Best Score
m <- max(result)
n <- min(result)

# best review!
df_f_B <- df_f_A[df_f_A$nums == m, ]
df_f_B

# Data_frame_A to CSV
write.csv(
  df_f_A,              # 파일에 저장할 데이터 프레임 또는 행렬
  file="유미의 세포들A",        # 데이터를 저장할 파일명
  row.names=TRUE  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.
)

# Data_frame to CSV
write.csv(
  df_f_B,              # 파일에 저장할 데이터 프레임 또는 행렬
  file="부활남B",        # 데이터를 저장할 파일명
  row.names=TRUE  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.
)


#Oracle connection
install.packages("RJDBC")
install.packages("rJava")
library(RJDBC)
library(rJava)

drv<-JDBC("oracle.jdbc.driver.OracleDriver","C:/ojdbc6.jar")
conn<-dbConnect(drv, "jdbc:oracle:thin:@localhost:1521:xe", 'sqltest', 'sqltest')
dbWriteTable(conn, "COMM", data, overwrite=TRUE)



data<-read.table("C:/종합평점.txt", header=T, sep=",")
data
