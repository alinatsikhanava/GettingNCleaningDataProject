library(dplyr)
#Download and unzip file if doesn't exist
filename <- "HAR.zip"
if(!file.exists(filename)){
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dlMethod <- "curl" # sets default for OSX / Linux
  if(substr(Sys.getenv("OS"),1,7) == "Windows") dlMethod <- "wininet"
  download.file(url,
                destfile='HAR.zip',
                method=dlMethod, # for OSX / Linux 
                mode="wb")
}
if (!file.exists("UCI HAR Dataset")) { 
  unzip(zipfile = "HAR.zip") 
}

#Load features
features <- read.table("./UCI HAR Dataset/features.txt")
#Select only mean() and std() features
featuresSelected <- grep("mean\\(\\)|std\\(\\)", features[,2])
featuresSelected.names <- features[featuresSelected,2]
featuresSelected.names <- gsub('-mean', 'Mean', featuresSelected.names)
featuresSelected.names <- gsub('-std', 'Std', featuresSelected.names)
featuresSelected.names <- gsub('[-()]', '', featuresSelected.names)


#Load Activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("Activity_ID","Activity")

#Load training set. Merge train observations with train labels and subjects
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")[featuresSelected]
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_set <- bind_cols(trainX,trainY,trainSub)

#Load test set. Merge test observations with test labels and subjects
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")[featuresSelected]
testY <- read.table("./UCI HAR Dataset/test/Y_test.txt")
test_set <- bind_cols(testX,testY, testSub)

#Merge 2 sets together
data <- bind_rows(train_set, test_set)

#Assign descriptive names to columns
colnames(data) <- c(featuresSelected.names,"Activity_ID","Subject")

#Merge by Activity_ID to assign Activity Descriptive Name
data <- merge(data, activities, by.x = "Activity_ID", by.y = "Activity_ID")

#Group by Subject and Activity
tidy <- group_by(data, Subject, Activity)
tidy <- summarize_all(tidy, mean)

write.table(tidy, file = "tidy.txt", row.names = FALSE)
