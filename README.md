# Getting-and-Cleaning-data
Repository for the peer reviewed project for the getting and cleaning data Coursera course.

## Project Parameters

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to run run_analysis.R

1. Download the data from the link given in Codebook.md.
2. Set your working directory to the same working directory as the zipped data folder with the ```setwd(directory)```.
3. Place the ```run_analysis.R``` file in the same directory.
3. Run ```source("run_analysis.R")```, The script will output a fule called ```tidyData.csv``` in the directory you set before.

## Required Libraries

The ```run_analysis.R``` file has one dependency, ```dplyr```, which it installs automatically if it is not already installed.
