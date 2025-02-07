codebook
======================

This codebook contains the explanation of the variables of Coursera Getting and Cleaning Data project. 

The script produces two files.

## clean_raw_data_set.csv

A set of observations of 66 features, each one of a pair activity+subject. There may be several rows per each activity+subject combination

* ACTIVITY_LABEL. String with one of six possible labels:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* SUBJECT_ID. An integer that identifies one of the subjects of the experiment
(range 1:30)
<P>
66 values correspoding to means and standard deviations of speed and acceleration signals. Samples are a real numbers between -1.0000 and 1.0000 . The detailed explanation of the physical meaning of these signals is described at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* tBodyAcc-mean()-X 
* tBodyAcc-mean()-Y 
* tBodyAcc-mean()-Z	
* tBodyAcc-std()-X 
* tBodyAcc-std()-Y	
* tBodyAcc-std()-Z	
* tGravityAcc-mean()-X	
* tGravityAcc-mean()-Y	
* tGravityAcc-mean()-Z	
* tGravityAcc-std()-X	
* tGravityAcc-std()-Y	
* tGravityAcc-std()-Z	
* tBodyAccJerk-mean()-X	
* tBodyAccJerk-mean()-Y	
* tBodyAccJerk-mean()-Z	
* tBodyAccJerk-std()-X	
* tBodyAccJerk-std()-Y	
* tBodyAccJerk-std()-Z	
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y	
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()	
* tBodyAccJerkMag-mean()	
* tBodyAccJerkMag-std()	
* tBodyGyroMag-mean()	
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X	
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z	
* fBodyAcc-std()-X
* fBodyAcc-std()-Y	
* fBodyAcc-std()-Z	
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z	
* fBodyAccJerk-std()-X	
* fBodyAccJerk-std()-Y	
* fBodyAccJerk-std()-Z	
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z	
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* FbodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroJerkMag-mean()	
* FbodyBodyGyroJerkMag-std()

## clean_data_set.csv

This is the final tidy data set. Per each unique combination activity+subject the file contains a row with the averages of the 66 features. 
* ACTIVITY_LABEL. String with one of six possible labels:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* SUBJECT_ID. An integer that identifies one of the subjects of the experiment
(range 1:30)
<P>
66 columns with the features in the same order as explained for clean_raw_data_set.csv . A prefix is added to the name of this magnitudes, for instance, AGV_fBodyGyro-std()-X. Each of these vairables is a real number between -1.0000 and 1.0000
