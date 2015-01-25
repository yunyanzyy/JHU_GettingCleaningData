##Read the data
setwd("F:/R/Coursera-JHU/3rd-Getting-And-Cleaning-Data/getdata-projectfiles")
library(data.table)
library(dplyr)
library(tidyr)

#Read Feature & activities' name, do not input factors using stringsAsFactors=FALSE
feature<-read.table("features.txt",sep="",stringsAsFactors = FALSE)
label<-read.table("activity_labels.txt",sep="",stringsAsFactors = FALSE)
colnames(label)<-c("ID","activity")

#Read training data, rename them with rownames=feature, add activity and people name
#Read subject (people)
train_subject<-read.csv("train/subject_train.txt")
#Read y (activity),and combine it with activity name (6 activity, combined with label)
train_y<-read.csv("train/y_train.txt")
colnames(train_y)<-"ID"
train_label<-left_join(train_y,label,by=NULL)
#Read x (531 vars,and combine it with feature)
train_x<-read.table("train/X_train.txt",sep="",header=T)
train_x<-data.table(train_x)
#rename train_x
colnames(train_x)<-feature[,2]
#Combine all together with people(1-30),activity name and source
train_total<-mutate(people=train_subject,activity=train_label[,2],source="train",train_x)

####
#Read test data, similiar with reading training data
test_subject<-read.csv("test/subject_test.txt")
test_y<-read.csv("test/y_test.txt")
colnames(test_y)<-"ID"
test_label<-left_join(test_y,label,by=NULL)
test_x<-read.table("test/X_test.txt",sep="",header=T)
test_x<-data.table(test_x)
colnames(test_x)<-feature[,2]
test_total<-mutate(people=test_subject,activity=test_label[,2],source="test",test_x)

###Combined data,and pick up those vars with "mean" and "std" using contains()
#use gred is ok, but I prefer using contains. Overall 69 vars (including people, activity)
total<-rbind(test_total,train_total)
total_pure<-select(total,people,activity,source,contains("mean()"),contains("std()"))

#Finaly, create a tidy dataset (Step5)
#My method is that, create a narrow tidy data first(using gather to reshape the data), then summarize the var
#Finaly use spread to change a narrow tidy dataset to a wide tidy data set, about 180 * 68 vars
total_new<-gather(total_pure,var,count,-(1:3))
total_new1<-total_new %>%
        group_by(people,activity,var,add=TRUE) %>%
        summarize(mean=mean(count)) %>%
        spread(var,mean)
#write out the final tidy data
write.table(total_new1,"final.text",row.name=FALSE)

##another way to create a tidy dataset (setp5), don't need to narrow down the dataset
total_new2<-total_pure %>%
        select(-source)%>%
        group_by(people,activity,add=TRUE) %>%
        summarise_each(funs(mean)) 

#the third way to create a tidy dataset (setp5), using data.table function as melt and dcast
library(reshape2)
total_pure1<-select(total_pure,-source)
tidyset<-melt(total_pure1,id.vars=c("people","activity"))
tidyset<-dcast(tidyset,people+activity~variable,mean)
