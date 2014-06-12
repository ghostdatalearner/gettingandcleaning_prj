# Coursera JHU Spec Data Science
#
# Getting and Clenaning Data project
#
#
# Read_and_clean_data.R
#
#
# This script reads the raw data of the Samsung experiment and produces
# as output two files:
# 1- clean_raw_data_set.csv . Contains one observation per row, with the subjet ID, the feature
#    label and the values of the selected features (66 being them 'std' or 'mean' measures)
# 2- clean_data_set.csv . The final result set of observations. It contains per row the averages
#    of the 66 selected features, per activity and subject.
#
# Expected directory structure.
#
# root_directory        (Contains this script, the original zip data file, 
#      |                (the explanation files and the output files)
#      |
#     UCI HAR Dataset   (Created unzipping the original data file from the root directory)
#                |
#                +-  test  (Contains the test data files)
#                |
#                +-  train (Contains the train data sets)
#
#

# clean all variables
rm(list=ls(all=TRUE)) 


# Auxiliary function to return as a string one activity label given as input the activity id
getactivitylabel <- function(activityid)
  return(as.character(activity_labels[activity_labels$ACTIVITY_ID == activityid,]$ACTIVITY_LABEL))


# Read the activity and feature labels and store them as data frames
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("ACTIVITY_ID","ACTIVITY_LABEL"))
feature_labels <- read.table("UCI HAR Dataset/features.txt",col.names=c("FEATURE_ID","FEATURE_LABEL"))

# Read the features data set from X file and the activity ids from Y file
X_train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train_data <- read.table("UCI HAR Dataset/train/y_train.txt")
# Create a vector with the activity labels
activity_train_labeled <- sapply(Y_train_data[[1]],getactivitylabel)
# Read the subject ids
subject_train_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Bind by columns the activity labels, the subject ids and the features data
train_binded <- cbind(activity_train_labeled,subject_train_data,X_train_data)
# Label properly the first two columns of the binded data frame
names(train_binded)[1] <- "ACTIVITY_LABEL"
names(train_binded)[2] <- "SUBJECT_ID"

# Repeat the same operations for the test set.
X_test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test_data <- read.table("UCI HAR Dataset/test/Y_test.txt")
activity_test_labeled <- sapply(Y_test_data[[1]],getactivitylabel)
subject_test_data <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_binded <- cbind(activity_test_labeled,subject_test_data,X_test_data)
names(test_binded)[1] <- "ACTIVITY_LABEL"
names(test_binded)[2] <- "SUBJECT_ID"

# Bind by rows the train and test sets. 
all_binded <- rbind(train_binded,test_binded)

# Renanme the feature cols names, replacing the 'Vx' by default with the feature label
for (i in 1:length(X_train_data))
  names(all_binded)[i+2]<-as.character(feature_labels$FEATURE_LABEL[i])

# Find the column names that contain 'std()' and 'mean()'
cols_std_mean <- grep("mean\\(\\)|std\\(\\)",names(all_binded))
# Create a df with the first two columns and those that contains 'std()' or 'mean()'
clean_cols <- c(c(1,2),cols_std_mean)
clean_raw_data <-all_binded[,clean_cols]
# Write this data frame as the output file 'clean_raw_data_set.csv'
write.table(clean_raw_data, file = "clean_raw_data_set.csv",sep=",", row.names = FALSE,)
# create an empty data frame with the names of clean_raw_data
ncolfeatures <- ncol(clean_raw_data)
clean_proc_data <- data.frame(matrix(nrow=0, ncol=ncolfeatures))
temprow <- matrix(c(rep.int(NA,length(clean_proc_data))),nrow=1,ncol=ncolfeatures)
newrow <- data.frame(temprow)
names(clean_proc_data) <- names(clean_raw_data)
names(newrow) <- names(clean_proc_data)
# Sort the subjects ids
vsubjects <- sort(unique(clean_raw_data$SUBJECT_ID))
# This double loop computes the average value of each feature by unique combinations of
# ACTIVITY_LABEL and SUBJECT_ID
for (i in activity_labels$ACTIVITY_LABEL)
{  
  for (j in vsubjects)
  {
    newrow$ACTIVITY_LABEL <- i
    newrow$SUBJECT_ID <- j
    p <- clean_raw_data[clean_raw_data$SUBJECT_ID==j & clean_raw_data$ACTIVITY_LABEL == i,]
    means_vector <- sapply(p[3:ncolfeatures],mean)
    newrow[3:ncolfeatures] <- means_vector
    clean_proc_data <- rbind(clean_proc_data,newrow)
  }
}
# Rename the feature cols pasting "AVG_" to make clear that is an average value
names(clean_proc_data)[3:ncol(clean_proc_data)] <- paste0("AVG",names(clean_proc_data[3:ncol(clean_proc_data)]))
# Wirte the tidy file "clean_data_set.csv"
write.table(clean_proc_data, file = "clean_data_set.csv",sep=",", row.names = FALSE,)