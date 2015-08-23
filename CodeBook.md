# Code Book for wearable_tidy_data.txt

This code book describes the data built by working through the project for the Coursera "Getting and Cleaning Data" class. The project involved manipulating data associated with wearable computing.

### Input Data Set
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

###### For each record the following was provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Description of the study: who did it, why they did it, how they did it.
Sampling information: what was the population studied, how was the sample drawn, what was the response rate.
Technical information about the files themselves: number of observations, record length, number of records per observation, etc.
Structure of the data within the file: hierarchical, multiple cards, etc.
Details about the data: columns in which specific variables can be found, whether they are character or numeric, and if numeric, what format.
Text of the questions and responses: some even have how many people responded a particular way.

### Processing
The input dataset contained test and training sets. Those sets were combined to make a single dataset. The 561-feature vector was filtered to include only the standard deviation and mean measurements. This resulted in a vector of 66 variable. 
Each subject/activity pair included multiple measurements. The average of those measurements was taken to build the final tidy data set.

### Data Description
The output tidy dataset contains four columns. Each row in the dataset represents a different measurement.

+ **subject_val**
  + There were 30 different subjects. This column contains a numeric from 1-30 denoting the subject for which the measurement was recorded. 
+ **activity_val**
  + This column indicates which of the six activities was being undertaken when the measurement occurred.
    + The possible choices are:
      1. WALKING
      2. WALKING_UPSTAIRS
      3. WALKING_DOWNSTAIRS
      4. SITTING
      5. STANDING
      6. LAYING 
+ **measurement_type**
  + As mentioned in the processing section, not all of the 561 measurements were kept. Only those invoking mean and standard deviation were included in the tidy output set.
  + The possible choices are:
    + fBodyAcc.mean...X
    + fBodyAcc.mean...Y
    + fBodyAcc.mean...Z
    + fBodyAcc.std...X
    + fBodyAcc.std...Y
    + fBodyAcc.std...Z
    + fBodyAccJerk.mean...X
    + fBodyAccJerk.mean...Y
    + fBodyAccJerk.mean...Z
    + fBodyAccJerk.std...X
    + fBodyAccJerk.std...Y
    + fBodyAccJerk.std...Z
    + fBodyAccMag.mean..
    + fBodyAccMag.std..
    + fBodyBodyAccJerkMag.mean..
    + fBodyBodyAccJerkMag.std..
    + fBodyBodyGyroJerkMag.mean..
    + fBodyBodyGyroJerkMag.std..
    + fBodyBodyGyroMag.mean..
    + fBodyBodyGyroMag.std..
    + fBodyGyro.mean...X
    + fBodyGyro.mean...Y
    + fBodyGyro.mean...Z
    + fBodyGyro.std...X
    + fBodyGyro.std...Y
    + fBodyGyro.std...Z
    + tBodyAcc.mean...X
    + tBodyAcc.mean...Y
    + tBodyAcc.mean...Z
    + tBodyAcc.std...X
    + tBodyAcc.std...Y
    + tBodyAcc.std...Z
    + tBodyAccJerk.mean...X
    + tBodyAccJerk.mean...Y
    + tBodyAccJerk.mean...Z
    + tBodyAccJerk.std...X
    + tBodyAccJerk.std...Y
    + tBodyAccJerk.std...Z
    + tBodyAccJerkMag.mean..
    + tBodyAccJerkMag.std..
    + tBodyAccMag.mean..
    + tBodyAccMag.std..
    + tBodyGyro.mean...X
    + tBodyGyro.mean...Y
    + tBodyGyro.mean...Z
    + tBodyGyro.std...X
    + tBodyGyro.std...Y
    + tBodyGyro.std...Z
    + tBodyGyroJerk.mean...X
    + tBodyGyroJerk.mean...Y
    + tBodyGyroJerk.mean...Z
    + tBodyGyroJerk.std...X
    + tBodyGyroJerk.std...Y
    + tBodyGyroJerk.std...Z
    + tBodyGyroJerkMag.mean..
    + tBodyGyroJerkMag.std..
    + tBodyGyroMag.mean..
    + tBodyGyroMag.std..
    + tGravityAcc.mean...X
    + tGravityAcc.mean...Y
    + tGravityAcc.mean...Z
    + tGravityAcc.std...X
    + tGravityAcc.std...Y
    + tGravityAcc.std...Z
    + tGravityAccMag.mean..
    + tGravityAccMag.std..
+ **measurement_value**
  + Each of the mesurements mentioned in the section above has a value specified in this column
  + Note that for each subject/activity pair, there were multiple instances of each measurement. The average of those measures across the subject/activity pair was recorded in this column.
