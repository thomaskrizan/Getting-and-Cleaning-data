# Codebook
This codebook decribes the variables, data, and any transforms performed to the dataset.
## Data Source
Starting dataset description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Starting dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## Dataset Description
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
## Data Attribute
The zipped data file includes:
1. README.txt
2. features_info.txt : Contains information abou the variables in the feature vector.
3. features.txt : List of the features.
4. activity_labels.txt : Contains the links of the activity names to the activities classes.
5. train/X_train.txt : Training set.
6. train/y_train.txt : Training labels.
7. train/subject_train.txt : Identifies which subjects are represented in each row.
8. test/X_test.txt : Test set.
9. test/y_test.txt : Test labels.

The following files are also available but are not used by the ```run_analysis.R``` script.

1. train/Inertial Signals/total_acc_x_train.txt : This is the acceleration signal gathered from the smartphonein the x axis in units of gravity 'g'. Each row has 128 elements. The same is true for the total_acc_y_train.txt and total_acc_z_train.txt for the y and z axis respectively.
2. train/Inertial Signals/body_acc_x_train.txt : This is the acceleration signal from the total_acc_x_train.txt after subtracting gravity. There is also files included for the y and z axis as well.
3. train/Inertial Signals/body_gyro_x_train.txt : This the angular velocity measured from the gyroscope for each sample. units are radians/sec. There is also files for the y and z axis.

The above 3 files also exist in the test file folder with the same descriptions.

## Transforms Performed

There where 5 parts to the data transformation:
1. Merges the training and the test sets to create one data set.
2. Remove all but the measurements of mean and standard deviation for each observation.
3. Descriptevely name the subject and activity_ID columns.
4. Apply the activity names to the dataset.
5. Create a second, tidy dataset which averages each variable activity per subject.

## ```run_analysis.R``` implementation of above steps

1. load the ```dplyr``` library
2. load the train and test data
3. load the features and activity labels
4. combine all the data and remove all the features not containing the mean and standard deviation information.
5. use the ```group_by``` and ```summarise_at``` functions from the ```dplyr``` package to create the second tidy dataset.
