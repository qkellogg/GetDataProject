## This code takes the training and test data sets from the UCI Maching
## Learning Repository. The Code Book is 
install.packages("plyr")
library(plyr)
install.packages("reshape2")
library(reshape2)
## Read in column labels
colNames <- read.table(file="./UCI HAR Dataset/features.txt")
colNames <- colNames[,2]
## Read in test data
data.test <- read.table(file="./UCI HAR Dataset/test/X_test.txt",
                        colClasses="numeric")
names(data.test) <- colNames
## Read in test subject data
id <- read.table(file="./UCI HAR Dataset/test/subject_test.txt",
                        colClasses="factor")
Subject <- id[,1]
## Read in test activity data
act <- read.table(file="./UCI HAR Dataset/test/Y_test.txt",
                        colClasses="numeric")
Activity <- act[,1]
## Add subject and activity columns using cbind
data.test2 <- cbind(Subject,Activity,data.test)
## Read in training data
data.train <- read.table(file="./UCI HAR Dataset/train/X_train.txt",
                        colClasses="numeric")
names(data.train) <- colNames
## Read in training subject data
id <- read.table(file="./UCI HAR Dataset/train/subject_train.txt",
                        colClasses="factor")
Subject <- id[,1]
## Read in training activity data
act <- read.table(file="./UCI HAR Dataset/train/Y_train.txt",
                        colClasses="numeric")
Activity <- act[,1]
data.train2 <- cbind(Subject,Activity,data.train)
## Merge the two data sets by using rbind
data.all <- rbind(data.train2,data.test2)
## Subset the data to use only the columns that have mean() and std() of the measurements
cols1 <- grep("std\\(",colNames)
cols2 <- grep("mean\\(",colNames)
cols3 <- c(cols1,cols2)
cols <- sort(cols3)
cols <- c(1,2,cols + 2)
data.sub <- data.all[,cols]
## Change activity code to activity name
activity.lab <- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in seq_along(activity.lab[,1])){
        temp <- data.sub$Activity==i
        act.lab <- as.character(activity.lab[i,2])
        data.sub$Activity[temp] <- act.lab
}
data.sub$Activity <- as.factor(data.sub$Activity)
## Summarize by taking the mean of each of the variables for each Subject
## and each Activity
measVars <- names(data.sub)
ncolumns <- ncol(data.sub)
data.sub.melt <- melt(data.sub,id=c("Subject","Activity"),measure.vars=measVars[3:ncolumns])
tidy3 <- dcast(data.sub.melt,Subject + Activity ~ variable,mean)
## reorder by ascending Subject id
temp <- as.character(tidy3$Subject)
tidy3$Subject <- as.numeric(temp)
finaltidy <- arrange(tidy3,Subject)
write.table(finaltidy,file="TidyData.txt",row.names=FALSE)