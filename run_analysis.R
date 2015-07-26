library(dplyr)

#read list de all features.txt
feat_list<-read.table("features.txt")

#get index from feat_list with mean and std
feat_index<-grep(pattern = "mean\\(\\)|std\\(\\)",feat_list[,2])


#read train set and merge with train label and subject
train<-read.table("./train/X_train.txt") #train set
train<-train[,feat_index] # get only mean and std
train_lb<-read.table("./train/y_train.txt") #train label
train_sub<-read.table("./train/subject_train.txt") #train subject

mtrain<-cbind(train_lb,train_sub,train) # merge test label and subject
remove(train)

#read test set and merge with test label
test<-read.table("./test/X_test.txt") #test set
test<-test[,feat_index]
test_lb<-read.table("./test/y_test.txt")
test_sub<-read.table("./test/subject_test.txt")

mtest<-cbind(test_lb,test_sub,test)
remove(test)

#merge mtest and mtrain
data_merge<-rbind(mtrain,mtest)

#activity names, replace numbers by names in data sets
ac_lb<-read.table("activity_labels.txt") #activity labels
#replace
data_merge[,1]<-apply(cbind(data_merge[,1]),1,function(x){ac_lb[x,2]})


#Data set col names
col_names<-feat_list[feat_index,2]
col_names<-as.character(col_names)
col_names<-append("subject",col_names)#second col is subject
col_names<-append("activity",col_names)#first col is activity
names(data_merge)<-col_names


#step 5
#group by activity and subject
by_ac_sub<-group_by(data_merge,activity,subject)
#summarise 
summ_data<-summarise_each(by_ac_sub,funs(mean))
#write tabel 
write.table(summ_data,file = "step5.txt",row.names = FALSE )