gettingandcleaning_prj
======================

This repo contains the script and results of the Coursera Getting and Cleaning Data project. The
raw data were downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
You can clone it in your computer, the uncompressed required files are part the repo


## Description

The purpose of this project is reading data from two separate sets (test and training) with measurements
of different features sampled with Samsung mobile phones accelerometers, in order to detect six classes
of activities.

Both sets are merged and properly labeled. All columns that are not the mean or variance of one feature are
discarded. As a first result the clean_raw_data_set.csv is produced, with one row of selected features
per activity and subject. There may be several rows for each individual and activity.

The tidy final set contains just one row per activity and individual, with the averages of the features of
all the combinations activity+subject found in the original sets.

## Directory structure.

gettingandcleaning_prj        (Contains the Read_and_clean_data.R script, this README, 
      |                       the codebook and the output files)
      |
     UCI HAR Dataset   (Created unzipping the original data file from the root directory)
                |
                +-  test  (Contains the test data files)
                |
                +-  train (Contains the train data sets)

