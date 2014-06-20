gettingandcleaning_prj
======================

This repo contains the script and results of the Coursera Getting and Cleaning Data project. The raw data were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
You can clone it in your computer, the uncompressed required files are part of the repo.


## Description

The purpose of this project is merging data from two separate sets (test and training) with measurements of different features sampled with Samsung mobile phones accelerometers, in order to detect six classes of activities.

## Processing

Raw set data are recorded in three files. The first one stores one row per subject and activity and the values of 561 measured features. The second one stores the ids of the subjects, and the third one the ids of the activies. So, a complete observation record is composed by:

(*) Activity Id - Subject Id - 561 feature measurements

There may be several rows for each combination of Subject Id + Activity Id.

The first step in our processing procedure is reading the three files of the
training data, and binding in one data frame them as in (*), with an additional imporvement, the activity ids are replaced by the activity labels contained in file activity_labels.txt. Colums are renamed as ACTIVITY_LABEL, SUBJECT_ID and the 561 feature labels contained in features.txt.

The same procedure is performed with the test set and both resulting data frames are row binded.

Next step is selecting the features that are a mean or a standard deviation. All columns whose names don't contain "std()" or "mean()" are discarded. Only
66 features remain in the resulting data frame.

As a first result this data frame is written as the file clean_raw_data_set.csv. It contains one row of selected features
per activity and subject. There may be several rows for each individual and activity.

The tidy final set must store just one row per activity and subject, with the averages of the features of all the combinations activity+subject found in the original sets. This task is performed at the end of the R script. We add the prefix "AVG_" to the names of the 66 features to make clear that they are the
averaged value for all the original records with the pair Activity + Subject.

The results are stored in the file clean_data_set.csv

## Directory structure.
```
python gettingandcleaning_prj        (Contains the Read_and_clean_data.R script, this README,
      |                       the codebook and the output files)
      |
     UCI HAR Dataset   (Created unzipping the original data file from the root directory)
                |
                +-  test  (Contains the test data files)
                |
                +-  train (Contains the train data set)
```

