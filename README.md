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

The run_analysis.R file contains the R code to build the working dataset from the various files in the top level, test and train directories.

Note that in the run_analysis.R file, the working directory was set to the top level directory containing the README.md, run_analysis, and "UCI\ HAR\ Dataest" files and directories.

The two output files from the run_analysis.R are:

+ working_data_set.csv
  + This csv file contains the dataset built by merging all of the information form the input files. From the course description, this dataset is what was produced by working through step four.
<br><br>
+ wearable_tidy_data.txt
  + This is the tidy dataset built from step five.
