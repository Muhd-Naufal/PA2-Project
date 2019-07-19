#Headline 1: Remaking our Heartland

raw1<-read.csv("HDB Resale Prices.csv")

#regroup data to year
year<-substr(raw1$month, start = 1, stop = 4)
df<-as.data.frame(year)
raw<-cbind(df,raw1)


#select towns with ROH

library(dplyr)
towndata<-raw%>%
  select(year,town,resale_price)

rohvalues<-which(towndata$town=="PUNGGOL"|
                   towndata$town=="YISHUN"|
                   towndata$town=="QUEENSTOWN"|
                   towndata$town=="MARINE PARADE"|
                   towndata$town=="HOUGANG"|
                   towndata$town=="JURONG EAST"|
                   towndata$town=="TOA PAYOH"|
                   towndata$town=="WOODLANDS"|
                   towndata$town=="PASIR RIS")

rohdf<-towndata[rohvalues,]

#change year from factor to numeric
rohdf$year <- as.numeric(as.character(rohdf$year))
str(rohdf)

#prices before ROH

pgb1<-which(rohdf$town=="PUNGGOL" & rohdf$year<2007)
pgb2<-rohdf[pgb1,]
punggolbef<-mean(pgb2$resale_price)

yishunb1<-which(rohdf$town=="YISHUN" & rohdf$year<2007)
ysb2<-rohdf[yishunb1,]
yishunbef<-mean(ysb2$resale_price)

qsb1<-which(rohdf$town=="QUEENSTOWN" & rohdf$year<2007)
qsb2<-rohdf[qsb1,]
queenstownbef<-mean(qsb2$resale_price)

mpb1<-which(rohdf$town=="MARINE PARADE" & rohdf$year<2011)
mpb2<-rohdf[mpb1,]
mpbef<-mean(mpb2$resale_price)

hgb1<-which(rohdf$town=="HOUGANG" & rohdf$year<2011)
hgb2<-rohdf[hgb1,]
hgbef<-mean(hgb2$resale_price)

jeb1<-which(rohdf$town=="JURONG EAST" & rohdf$year<2011)
jeb2<-rohdf[jeb1,]
jebef<-mean(jeb2$resale_price)

tpb1<-which(rohdf$town=="TOA PAYOH" & rohdf$year<2015)
tpb2<-rohdf[tpb1,]
tpbef<-mean(tpb2$resale_price)

wb1<-which(rohdf$town=="WOODLANDS" & rohdf$year<2015)
wb2<-rohdf[wb1,]
woodbef<-mean(wb2$resale_price)

prb1<-which(rohdf$town=="PASIR RIS" & rohdf$year<2015)
prb2<-rohdf[prb1,]
prbef<-mean(prb2$resale_price)


#prices after ROH

pga1<-which(rohdf$town=="PUNGGOL" & rohdf$year>2006)
pga2<-rohdf[pga1,]
punggolaft<-mean(pga2$resale_price)

ysa1<-which(rohdf$town=="YISHUN" & rohdf$year>2006)
ysa2<-rohdf[ysa1,]
yishunaft<-mean(ysa2$resale_price)

qsa1<-which(rohdf$town=="QUEENSTOWN" & rohdf$year>2006)
qsa2<-rohdf[qsa1,]
queenstownaft<-mean(qsa2$resale_price)

mpa1<-which(rohdf$town=="MARINE PARADE" & rohdf$year>2010)
mpa2<-rohdf[mpa1,]
mpaft<-mean(mpa2$resale_price)

hga1<-which(rohdf$town=="HOUGANG" & rohdf$year>2010)
hga2<-rohdf[hga1,]
hgaft<-mean(hga2$resale_price)

jea1<-which(rohdf$town=="JURONG EAST" & rohdf$year>2010)
jea2<-rohdf[jea1,]
jeaft<-mean(jea2$resale_price)

tpa1<-which(rohdf$town=="TOA PAYOH" & rohdf$year>2014)
tpa2<-rohdf[tpa1,]
tpaft<-mean(tpa2$resale_price)

wa1<-which(rohdf$town=="WOODLANDS" & rohdf$year>2014)
wa2<-rohdf[wa1,]
woodaft<-mean(wa2$resale_price)

pra1<-which(rohdf$town=="PASIR RIS" & rohdf$year>2014)
pra2<-rohdf[pra1,]
praft<-mean(pra2$resale_price)

#price difference due to ROH
dpunggol<-punggolaft-punggolbef
dyishun<-yishunaft-yishunbef
dqueenstown<-queenstownaft-queenstownbef
dmarineparade<-mpaft-mpbef
dhougang<-hgaft-hgbef
djurongeast<-jeaft-jebef
dtoapayoh<-tpaft-tpbef
dwoodlands<-woodaft-woodbef
dpasirris<-praft-prbef


#combine as vectors
Punggol<-c("Punggol",punggolbef,punggolaft,dpunggol)
Yishun<-c("Yishun",yishunbef,yishunaft,dyishun)
Queenstown<-c("Queenstown",queenstownbef,queenstownaft,dqueenstown)
MarineParade<-c("Marine Parade",mpbef,mpaft,dmarineparade)
Hougang<-c("Hougang",hgbef,hgaft,dhougang)
JurongEast<-c("Jurong East",jebef,jeaft,djurongeast)
ToaPayoh<-c("Toa Payoh",tpbef,tpaft,dtoapayoh)
Woodlands<-c("Woodlands",woodbef,woodaft,dwoodlands)
PasirRis<-c("Pasir Ris",prbef,praft,dpasirris)

#combine
prices<-data.frame(Punggol,Yishun,Queenstown,MarineParade,Hougang,JurongEast,ToaPayoh,Woodlands,PasirRis)

prices<-t(prices)

#rename column name
colnames(prices)<-c("Town","Prices before ROH","Prices after ROH","Price Difference due to ROH")

pricesfinal<-data.frame(prices)


#melt columns
library(reshape2)
melted<-melt(pricesfinal,id.vars="Town",measure.vars = c("Prices.before.ROH","Prices.after.ROH"))

#convert values from character to integer
melted$value <- as.numeric(as.character(melted$value))
str(melted)

#ggplot graph
library(ggplot2)
plot1<-ggplot(melted,aes(x=Town,y=value,fill=variable))+
  geom_bar(stat="identity",position='dodge')+
  ggtitle("Average Differences in Prices due to ROH")+xlab("ROH Town")+ylab("Amount")+
  theme(
    plot.title=element_text(color="black",size=12,face="bold.italic",hjust=0.5),
    axis.title.x = element_text(color="blue",size=12,face="bold"),
    axis.title.y = element_text(color="blue",size=12,face="bold")
    
  )
plot1

#rescale

plot1<-plot1+scale_y_continuous(breaks=seq(150000,1000000,by=100000))
plot1
#Interactive plot

#install plotly
#install.packages("plotly")

library(plotly)
ggplotly(plot1)

#Plot 2 - Zoom into Queenstown 
#(greatest price increase bc of ROH in 2006)


library(dplyr)
top3<-raw%>%
  select(year,town,resale_price)

top3data<-which(top3$town=="QUEENSTOWN"|top3$town=="MARINE PARADE"|top3$town=="TOA PAYOH")
top32<-top3[top3data,]

#plot line graph
library(ggplot2)

#geom_line
ggplot(top32, aes(x=top32$town, y=top32$year))+
  geom_line()

