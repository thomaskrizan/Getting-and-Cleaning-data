#Ensure the dplyr package is installed
if(!require("dplyr")){
  install.packages('dplyr')
}

require(dplyr)
#setwd to folder in which data is stored.
#unzip data files
unzip(zipfile = 'getdata_projectfiles_UCI HAR Dataset.zip',exdir = paste(getwd(),'GCDproj',sep = '/'))
#explore what files arein the Data
path <- file.path("./GCDproj","UCI HAR Dataset")
dataset <- list.files(path,recursive = T)
#Read in the training datatables
trainx <- read.table(file.path(path,"train","X_train.txt"),header = F)
trainy <- read.table(file.path(path,"train","y_train.txt"),header = F)
trainsub <- read.table(file.path(path,"train","subject_train.txt"),header = F)
#Read in the testing datatables
testx <- read.table(file.path(path,"test","X_test.txt"),header = F)
testy <- read.table(file.path(path,"test","y_test.txt"),header = F)
testsub <- read.table(file.path(path,"test","subject_test.txt"),header = F)
#Read in the Feature and Activity label data
feat <- read.table(file.path(path,"features.txt"),header = F)
actLab <- read.table(file.path(path,"activity_labels.txt"),header = F)
#add colnames to the X datatables
colnames(trainx) <- feat$V2
colnames(testx) <- feat$V2
#add colnames to the Y datatables
colnames(trainy) <- "actId"
colnames(testy) <- "actId"
#add colnames to the sub datatables
colnames(trainsub) <- 'subId'
colnames(testsub) <- 'subId'
#add colnames to the actLab datatable
colnames(actLab) <- c("actId","actType")
#create train and test datatables
train <- cbind(trainy, trainsub,trainx)
test <- cbind(testy,testsub,testx)
#combine the train and test set
combData <- rbind(train,test)
#Extract mean and standard deviation measurements
Names <- colnames(combData)
meanSd <- (grepl(pattern = "actId",Names)|grepl("subId",Names)|grepl("mean..",Names)|grepl("std..",Names))
meanSdData <- combData[,meanSd==T]
#replace activity ID with the activiity names.
actNameData <- merge(meanSdData,actLab,by = 'actId',all.x = T)
#Create the second tidy dataset with the average of each variable for each activity and each subject.
tidyData <- actNameData %>% group_by(actType,subId) %>% summarise_at(.vars = vars(`tBodyAcc-mean()-X`:`fBodyBodyGyroJerkMag-meanFreq()`), list(mean))
write.table(tidyData,file = 'tidyData.txt',row.names = F)
