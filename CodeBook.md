## Codebook for Getting and Cleaning Data Course Project

#Raw Data
The raw data contained observations on 561 variables for each of 30 subjects(people) while performing 6 activities. It was split in two sets: a training set and a test set

#Tidy.txt
For the result data set we were only interested in variables that represented Mean or Standard Deviation metrics. So, only 66 out of 561 variables were included in the tidy data set. It contains the average of each variable(each of 66) for each activity and each subject.

Domensions:
  Subject: integer from 1 to 30
  Activity: factor
    LAYING
    SITTING
    STANDING
    WALKING
    WALKING_DOWNSTAIRS
    WALKING_UPSTAIRS
  Activity_ID: integer from 1 to 6
  
Variables:
  `tBodyAccMeanX`            
  `tBodyAccMeanY`            
  `tBodyAccMeanZ`           
  `tBodyAccStdX`
  `tBodyAccStdY` 
  `tBodyAccStdZ`            
  `tGravityAccMeanX`
  `tGravityAccMeanY`
  `tGravityAccMeanZ`        
  `tGravityAccStdX` 
  `tGravityAccStdY`
  `tGravityAccStdZ`         
  `tBodyAccJerkMeanX`
  `tBodyAccJerkMeanY`
  `tBodyAccJerkMeanZ`       
  `tBodyAccJerkStdX`
  `tBodyAccJerkStdY`
  `tBodyAccJerkStdZ`        
  `tBodyGyroMeanX`
  `tBodyGyroMeanY`
  `tBodyGyroMeanZ`          
  `tBodyGyroStdX`
  `tBodyGyroStdY`
  `tBodyGyroStdZ`           
  `tBodyGyroJerkMeanX`
  `tBodyGyroJerkMeanY`
  `tBodyGyroJerkMeanZ`      
  `tBodyGyroJerkStdX`
  `tBodyGyroJerkStdY`
  `tBodyGyroJerkStdZ`       
  `tBodyAccMagMean`
  `tBodyAccMagStd`
  `tGravityAccMagMean`      
  `tGravityAccMagStd`
  `tBodyAccJerkMagMean`
  `tBodyAccJerkMagStd`      
  `tBodyGyroMagMean`
  `tBodyGyroMagStd`
  `tBodyGyroJerkMagMean`    
  `tBodyGyroJerkMagStd`
  `fBodyAccMeanX`
  `fBodyAccMeanY`           
  `fBodyAccMeanZ`
  `fBodyAccStdX`
  `fBodyAccStdY`            
  `fBodyAccStdZ`
  `fBodyAccJerkMeanX`
  `fBodyAccJerkMeanY`       
  `fBodyAccJerkMeanZ`
  `fBodyAccJerkStdX`
  `fBodyAccJerkStdY`        
  `fBodyAccJerkStdZ`
  `fBodyGyroMeanX`
  `fBodyGyroMeanY`          
  `fBodyGyroMeanZ`
  `fBodyGyroStdX`
  `fBodyGyroStdY`           
  `fBodyGyroStdZ`
  `fBodyAccMagMean`
  `fBodyAccMagStd`          
  `fBodyBodyAccJerkMagMean`
  `fBodyBodyAccJerkMagStd`
  `fBodyBodyGyroMagMean`    
  `fBodyBodyGyroMagStd`
  `fBodyBodyGyroJerkMagMean`
  `fBodyBodyGyroJerkMagStd`

#Transformation
  dplyr package was used for transformations
  The training and test sets were loaded maintaining only the variables that were Mean or Standard Deviation. The rest were discarted.
  The 2 sets were merged
  The new data set was merged with Activity lables by Activity_ID in order to include descriptive activity names in the dataset
  The data set was labled with the variable names where special characters like '-', '(', and ')' were removed
  Finally the tidy data set was created and written into tidy.txt file. In the file you will find average variable values for each subject and activity.



