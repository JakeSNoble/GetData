#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement. 
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names. 
#5) From the data set in step 4, creates a second, independent tidy data set with the average
#   of each variable for each activity and each subject.

ActLabs <- c("WALKING","wALKING_UP","WALKING_DOWN","SITTING","STANDING","LAYING")

#get features
Features <- readLines(
        file(description="C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/features.txt",
             open="r"))
close(file(description="C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/features.txt",
             open="r"))
#remove the numeric part of feature, first 4 characters
Features <- substring(Features,5,1000)


#vector with column numbers for only the measurements on the mean and standard deviation for each measurement. 
featnum <- c(201,202,227,228,240,241,253,254,503,504,516,517,529,530,542,543,555,556,557,558,559,560,561)

#get test data
test <- read.table("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/X_test.txt")
test <- test[featnum]
names(test) <- Features[featnum]
#test labels
TestLabel <- read.csv("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/y_test.txt",
                      header=FALSE,
                      col.names="activity")
TestSubject <- read.csv("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/test/subject_test.txt",
                        header=FALSE,
                        col.names="subject")

#merge test data into single data frame
test <- cbind(TestSubject,
              TestLabel,
              test)

#get train data
train <- read.table("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/X_train.txt")
train <- train[featnum]
names(train) <- Features[featnum]
#train labels
TrainLabel <- read.csv("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/y_train.txt",
                       header=FALSE,
                       col.names="activity")
TrainSubject <- read.csv("C:/Coursera/Getting and Cleaning Data/Course Project/UCI HAR Dataset/train/subject_train.txt",
                         header=FALSE,
                         col.names="subject")

#merge train data into single data frame
train <- cbind(TrainSubject,
               TrainLabel,
               train)

#Merge the training and the test sets to create one data set.
data <- rbind(test,train)

#replace activity numbers with activity factor labels

data$activity <- factor(data$activity,levels=c(1,2,3,4,5,6),labels=ActLabs)

library(dplyr)
dataSum <- summarise_each(grouped_df(data,list("subject","activity")),funs(mean))
repo <- file("C:/Coursera/Getting and Cleaning Data/Course Project/GetData/datasum.txt",open="w")
write.table(dataSum,file=repo)