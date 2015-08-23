# CleaningDataProject

This readme documents the steps to complete the project for the Coursera course "Getting and Cleaning Data"

Project Description
-------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

----------------------

The dataset was downloaded and the zip was exploded out to the dataset files.

The directory structure is as follows (bold indicates directory instead of file):

> bhinks$ ls
> 
| | |
| --------- | --------------- |
| README.md | **UCI HAR Dataset** |
| getdata-projectfiles-UCI HAR Dataset.zip | run_analysis.R |
| wearable_tidy_data.txt | working_data_set.csv |
| CodeBook.md | |
<br><br>
>bhinks$ ls UCI\ HAR\ Dataset/
>
| | |
| ------- | ------ |
| README.txt | activity_labels.txt |
| features.txt | features_info.txt |
| **test** | **train** |
<br><br>
>bhinks$ ls UCI\ HAR\ Dataset/test
>
| | |
| ----- | ----- |
| **Inertial Signals** | X_test.txt |
| subject_test.txt | y_test.txt |
<br><br>
>bhinks$ ls UCI\ HAR\ Dataset/train
>
| | | 
| ----- | ----- |
| **Inertial Signals** | X_train.txt |
| subject_train.txt | y_train.txt |
<br><br>

The run_analysis.R file contains the R code to build the working dataset from the various files in the top level, test and train directories. It also contains the logic to build the tidy dataset by manipulating the working dataset.

Note that in the run_analysis.R file, the working directory was set to the top level directory containing the README.md, run_analysis, and "UCI\ HAR\ Dataest" files and directories.

The two output files from the run_analysis.R are:

+ working_data_set.csv
  + This csv file contains the dataset built by merging all of the information form the input files. From the course description, this dataset is what was produced by working through step four.
<br><br>
+ wearable_tidy_data.txt
  + This is the tidy dataset built from step five.

<br><br>

##R-Script Logic
####Process the Features File
The features.txt file contains a name for each of the measurements conducted for the different subject/activity pairs. This file is loaded into a dataframe.
####Process the Activity Labels
The activity_labels.txt file contains the names for the different activities. The different records in the file are:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

A dataframe is built from loading in this file.
#### Build Function to Build a dataset from X, Y, and Subject input Files
There are three different files used to build up a dataset. This function is intended to be invoked with both a test and training dataset.

1. x_dataset.txt
2. y_dataset.txt
3. subject_dataset.txt

The x_dataset.txt contains the measurements for all the various features. However, only the features with a mean value or standard deviation are desired, so the others are filtered out.

The y_dataset.txt contains a numeric value for the different activities. The activity_labels dataframe and the dataframe from the y_dataset are combined to build a factor of activity labels associated with the x_dataset.

The subject_dataset.txt contains an indicator of which of the 30 people measured measurements are for.

This function returns a dataframe with the following columns.
+ subject_val
+ activity_val
+ column for each measurement

#### Invoke Function for test and training sets and Combine Results
The function above was invoked for both the test and training datasets. Each resulted in a dataframe. The dataframes were combined to produce a complete working set.
<br>
At the completion of this step, the working dataset from project steps one through four has been complete.
<br>
A file representing this data is in this repo. The name is *working_data_set.csv*.

#### Reshape Data to build Tidy Set
The working data set is wideform dataset with each measurement in a different column for the different subject/activity pairs. There are multiple instances of the same measurement for the subject/activity pairs.

The first step is to use a *melt* function to turn the data into a longform dataframe. In this case, the dataframe only has four columns (subject, activity, measurement type, measurement value).

The next step is to use the *dcast* function to build a wide dataset taking the average of each measurement type for the different subject/activity pairs.

The final step is to again *melt* to put the results into a longform. The longform dataframe is also ordered.
Work through a set of reshapes to convert to longform, take the average of the subject/activity measurements
