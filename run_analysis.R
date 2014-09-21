ytest<-read.table("./test/y_test.txt",colClasses="numeric")
xtest<-read.table("./test/X_test.txt",colClasses="numeric")
subjecttest<-read.table("./test/subject_test.txt")
ytrain<-read.table("./train/y_train.txt",colClasses="numeric")
xtrain<-read.table("./train/X_train.txt",colClasses="numeric")
subjecttrain<-read.table("./train/subject_train.txt")

x<-rbind(xtrain,xtest)
y<-rbind(ytrain,ytest)
subject<-rbind(subjecttrain,subjecttest)

merged<-cbind(x,subject,y)
features<-read.table("./features.txt")

mean1<-grep("mean",features[,2])
mean2<-grep("meanF",features[,2])
meanPos<-setdiff(mean1,mean2)


stdPos<-grep("std",features[,2])
meanstdcol<-merged[,c(meanPos,stdPos,562,563)]
activity<-read.table("./activity_labels.txt")

dataset<-merge(meanstdcol,activity,by.x=68,by.y=1)
dataset<-dataset[-c(1)]
name<-grep("mean\\(\\)|std",features[,2],value=TRUE)
name<-gsub("\\(","",name)
name<-gsub("\\)","",name)
name<-gsub("\\-","",name)
name<-gsub("BodyBody","Body",name)
name<-gsub("Gyro","Gyroscope",name)
name<-gsub("Acc","Accelerometer",name)
name<-c(name,"subject","activityname")
name<-tolower(name)
names(dataset)<-name
averagebysubactivity<-aggregate(dataset,list(subject=dataset$subject,name=dataset$activityname),mean)
averagebysubactivity<-averagebysubactivity[-c(69,70)]