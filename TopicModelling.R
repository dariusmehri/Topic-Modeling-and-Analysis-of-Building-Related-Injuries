
install.packages("SnowballC")
library(SnowballC)

install.packages("tseries")
library(tseries)

install.packages("stm")
library(stm)

install.packages("reshape")
library(reshape)

install.packages("tm")
library(tm)

install.packages("qtl")
library(qtl)

install.packages("igraph")
library(igraph)

install.packages("wordcloud")
library(wordcloud)

install.packages("stringr")
library(stringr)





data <- read.csv('S:\\Office of Risk Management\\User Folders\\Darius Mehri\\Topic Modelling Incidents\\Topic Modelling Incidents 3 CLEANED injury.csv', header=T, na.strings=c("","NA"))



names(data)
data <-  data[,c('Date','Boro','Notes', 'Injury') ]
data <- rename(data, c('Notes'="documents"))
data <- na.omit(data)


#PREPARE DATA FOR ANALYSIS
data$documents <- str_replace_all(data$documents,"[^[:graph:]]", " ")

processed_uc <- textProcessor(data$documents, metadata=data)

out <- prepDocuments(processed_uc$documents, processed_uc$vocab, processed_uc$meta)

docs <- out$documents
vocab <- out$vocab
meta <- out$meta



#CREATE MODELS

#SELECT MODEL W/ COVARIATES
modelSelect <- selectModel(out$documents,out$vocab,K=30, prevalence =~ Injury + Date, max.em.its=1000,data=meta,runs=20)

#SELECT MODEL WO/ COVARIATES
#seed = 9962680
modelSelect <- selectModel(out$documents,out$vocab,K=50, max.em.its=1000,data=meta,runs=20)

plotModels(modelSelect)
#take a look at the plotModel and choose the model with the highest average
#exclusivity and coherence, then dump the model into object to analyze
model <- modelSelect$runout[[2]]

#get the seed to use in model wo/ covariates
model$settings$seed

#get output for each respondent
model$theta


#BEGIN INTERPRETING MODEL
#plot the  topic proportions
plot.STM(model, type="summary", xlim=c(0,.4))
#lists topics, and those with highest words, plus other diagnostics 
labelTopics(model, c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30, 47))
#this command spits out: 
#Error in t.default(logbeta) : argument is not a matrix



#word cloud
cloud(model, topic=8)
cloud(model)

#look at the documents associated with the topic
labelTopics(model, c(1))
thoughts1<-findThoughts(model, texts=out$meta$documents, n=60, topics=1)$docs[[1]]
thoughts1 

labelTopics(model, c(2))
thoughts2<-findThoughts(model, texts=out$meta$documents, n=30, topics=2)$docs[[1]]
thoughts2 

labelTopics(model, c(3))
thoughts3<-findThoughts(model, texts=out$meta$documents, n=60, topics=3)$docs[[1]]
thoughts3 

labelTopics(model, c(4))
thoughts4<-findThoughts(model, texts=out$meta$documents, n=30, topics=4)$docs[[1]]
thoughts4 

labelTopics(model, c(5))
thoughts5<-findThoughts(model, texts=out$meta$documents, n=50, topics=5)$docs[[1]]
thoughts5 

labelTopics(model, c(6))
thoughts6<-findThoughts(model, texts=out$meta$documents, n=30, topics=6)$docs[[1]]
thoughts6 

labelTopics(model, c(7))
thoughts7<-findThoughts(model, texts=out$meta$documents, n=30, topics=7)$docs[[1]]
thoughts7 

labelTopics(model, c(8))
thoughts8<-findThoughts(model, texts=out$meta$documents, n=50, topics=8)$docs[[1]]
thoughts8 

labelTopics(model, c(9))
thoughts9<-findThoughts(model, texts=out$meta$documents, n=30, topics=9)$docs[[1]]
thoughts9 

labelTopics(model, c(10))
thoughts10<-findThoughts(model, texts=out$meta$documents, n=20, topics=10)$docs[[1]]
thoughts10

thoughts11<-findThoughts(model, texts=out$meta$documents, n=30, topics=11)$docs[[1]]
thoughts11

thoughts12<-findThoughts(model, texts=out$meta$documents, n=30, topics=12)$docs[[1]]
thoughts12

labelTopics(model, c(13))
thoughts13<-findThoughts(model, texts=out$meta$documents, n=30, topics=13)$docs[[1]]
thoughts13

labelTopics(model, c(14))
thoughts14<-findThoughts(model, texts=out$meta$documents, n=30, topics=14)$docs[[1]]
thoughts14

labelTopics(model, c(15))
thoughts15<-findThoughts(model, texts=out$meta$documents, n=50, topics=15)$docs[[1]]
thoughts15

labelTopics(model, c(16))
thoughts16<-findThoughts(model, texts=out$meta$documents, n=30, topics=16)$docs[[1]]
thoughts16

labelTopics(model, c(17))
thoughts17<-findThoughts(model, texts=out$meta$documents, n=30, topics=17)$docs[[1]]
thoughts17

labelTopics(model, c(18))
thoughts18<-findThoughts(model, texts=out$meta$documents, n=30, topics=18)$docs[[1]]
thoughts18

labelTopics(model, c(19))
thoughts19<-findThoughts(model, texts=out$meta$documents, n=30, topics=19)$docs[[1]]
thoughts19

labelTopics(model, c(20))
thoughts20<-findThoughts(model, texts=out$meta$documents, n=50, topics=20)$docs[[1]]
thoughts20

labelTopics(model, c(21))
thoughts21<-findThoughts(model, texts=out$meta$documents, n=30, topics=21)$docs[[1]]
thoughts21

labelTopics(model, c(22))
thoughts22<-findThoughts(model, texts=out$meta$documents, n=30, topics=22)$docs[[1]]
thoughts22

labelTopics(model, c(23))
thoughts23<-findThoughts(model, texts=out$meta$documents, n=30, topics=23)$docs[[1]]
thoughts23

dr = dr.rename(columns={'Topic22': 'SSM Miscellaneous Injury 7'})
thoughts24<-findThoughts(model, texts=out$meta$documents, n=30, topics=24)$docs[[1]]
thoughts24

labelTopics(model, c(25))
thoughts25<-findThoughts(model, texts=out$meta$documents, n=30, topics=25)$docs[[1]]
thoughts25

labelTopics(model, c(26))
thoughts26<-findThoughts(model, texts=out$meta$documents, n=30, topics=26)$docs[[1]]
thoughts26

thoughts29<-findThoughts(model, texts=out$meta$documents, n=20, topics=29)$docs[[1]]
thoughts29

labelTopics(model, c(27))
thoughts27<-findThoughts(model, texts=out$meta$documents, n=30, topics=27)$docs[[1]]
thoughts27

labelTopics(model, c(28))
thoughts28<-findThoughts(model, texts=out$meta$documents, n=30, topics=28)$docs[[1]]
thoughts28

thoughts29<-findThoughts(model, texts=out$meta$documents, n=30, topics=29)$docs[[1]]
thoughts29

labelTopics(model, c(30))
thoughts30<-findThoughts(model, texts=out$meta$documents, n=50, topics=30)$docs[[1]]
thoughts30

labelTopics(model, c(31))
thoughts31<-findThoughts(model, texts=out$meta$documents, n=50, topics=31)$docs[[1]]
thoughts31

labelTopics(model, c(32))
thoughts32<-findThoughts(model, texts=out$meta$documents, n=30, topics=32)$docs[[1]]
thoughts32

labelTopics(model, c(33))
thoughts33<-findThoughts(model, texts=out$meta$documents, n=30, topics=33)$docs[[1]]
thoughts33


labelTopics(model, c(34))
thoughts34<-findThoughts(model, texts=out$meta$documents, n=30, topics=34)$docs[[1]]
thoughts34

labelTopics(model, c(35))
thoughts35<-findThoughts(model, texts=out$meta$documents, n=30, topics=35)$docs[[1]]
thoughts35

thoughts36<-findThoughts(model, texts=out$meta$documents, n=30, topics=36)$docs[[1]]
thoughts36

thoughts37<-findThoughts(model, texts=out$meta$documents, n=30, topics=37)$docs[[1]]
thoughts37

thoughts38<-findThoughts(model, texts=out$meta$documents, n=30, topics=38)$docs[[1]]
thoughts38

labelTopics(model, c(39))
thoughts39<-findThoughts(model, texts=out$meta$documents, n=30, topics=39)$docs[[1]]
thoughts39

thoughts40<-findThoughts(model, texts=out$meta$documents, n=30, topics=40)$docs[[1]]
thoughts40

labelTopics(model, c(41))
thoughts41<-findThoughts(model, texts=out$meta$documents, n=30, topics=41)$docs[[1]]
thoughts41

labelTopics(model, c(42))
thoughts42<-findThoughts(model, texts=out$meta$documents, n=30, topics=42)$docs[[1]]
thoughts42

labelTopics(model, c(43))
thoughts43<-findThoughts(model, texts=out$meta$documents, n=30, topics=43)$docs[[1]]
thoughts43

labelTopics(model, c(44))
thoughts44<-findThoughts(model, texts=out$meta$documents, n=30, topics=44)$docs[[1]]
thoughts44

labelTopics(model, c(45))
thoughts45<-findThoughts(model, texts=out$meta$documents, n=30, topics=45)$docs[[1]]
thoughts45

labelTopics(model, c(46))
thoughts46<-findThoughts(model, texts=out$meta$documents, n=60, topics=46)$docs[[1]]
thoughts46

labelTopics(model, c(47))
thoughts47<-findThoughts(model, texts=out$meta$documents, n=50, topics=47)$docs[[1]]
thoughts47

labelTopics(model, c(48))
thoughts48<-findThoughts(model, texts=out$meta$documents, n=30, topics=48)$docs[[1]]
thoughts48

labelTopics(model, c(49))
thoughts49<-findThoughts(model, texts=out$meta$documents, n=30, topics=49)$docs[[1]]
thoughts49

thoughts50<-findThoughts(model, texts=out$meta$documents, n=30, topics=50)$docs[[1]]
thoughts50



#PLOTS USING COVARIATES
#before plotting, run estimate effect
meta$Illegal<-as.factor(meta$Illegal)


prep <- estimateEffect(1:30 ~ Injury,model,meta=meta, uncertainty = "Global")

#plot of young vs old cohort as indepent variable
plot.estimateEffect(prep, covariate = "Illegal", topics = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12), model=model, method="difference", cov.value1="0", cov.value2="1", main = "Effect of Cohort Young vs Old", xlim = c(-0.25,0.25), xlab = "Younger .............. Older",labeltype = "custom", custom.labels = c('Church, class', 'Meetup', 'Join in w/ social group', 'daily soc inter', 'Volunteer'))

#plot of married vs never married
plot.estimateEffect(prep, covariate = "married", topics = c(4, 1, 3, 5, 2), model=model, method="difference", cov.value1="5", cov.value2="1", main = "Married vs Never Married", xlim = c(-0.20,0.20), xlab = "Married ........ Never Married",labeltype = "custom", custom.labels = c('Church, class', 'Meetup', 'Join in w/ social group', 'daily soc inter', 'Volunteer'))

#pet
plot.estimateEffect(prep, covariate = "pet", topics = c(1, 2, 3, 4, 5), model=model, method="difference", cov.value1="1", cov.value2="2", main = "Effect of Have Pet", xlim = c(-0.1,0.1), xlab = "No .............. Yes")


##see graphical of how closely related topics are to one another, 
#(i.e., how likely they are to appear in the same document) Requires 'igraph' package
mod.out.corr<-topicCorr(model)
plot.topicCorr(mod.out.corr)

##VISUALIZE DIFFERENCES BETWEEN TWO DIFFERENT TOPICS using the ,type="perspectives" option
plot.STM(model,type="perspectives", topics=c(7, 10))



#PLOT TIME SERIES


prep <- estimateEffect(1:30 ~ Date,model,meta=meta, uncertainty = "Global")
prep <- estimateEffect(1:30 ~ Injury + s(Date),model,meta=meta, uncertainty = "Global")


plot.estimateEffect(prep, "Date", method="continuous", topics=24, model=z, printlegend=FALSE, xaxt="n", xlab="Time Jan 2007 - Aug 2016")
yearseq <- seq(from=as.Date("2007-01-01"), to=as.Date("2016-08-31"), by="year")

yearnames <- months(yearseq)
axis(1, at=as.numeric(yearseq)-min(as.numeric(yearseq)),labels=yearnames)




#MERRGE TOPICS WITH ORIGINAL DATA


meta[, paste("Topic", 1:50, sep="")] <- model$theta

write.table(meta, "S:\\Office of Risk Management\\User Folders\\Darius Mehri\\Topic Modelling Incidents\\TM Results 2.csv", row.names=FALSE, sep=",")


