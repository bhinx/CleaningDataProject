library( dplyr )
library( reshape2 )

# library( data.table )

setwd( '/Users/bhinks/Dropbox/coursera/data_clean/project' )

# Process features.txt to pull out only the mean and std measurement columns
#
features <- read.table( "./UCI HAR Dataset/features.txt" )

# Process activity_labels so they can merged into the dataframe while the y_files
# are being read in.
#
activity.labels <- read.table( "./UCI HAR Dataset/activity_labels.txt")

# Function to use x.test, y.test, and subject.test information
# to build a dataframe. The features dataframe contains the
# names of all the variables found in the x.test columns. This
# function also pulls in the real column names and filters the
# dataframe such that only columns for std and mean are kept.
#
build.data <- function ( x_filename, y_filename, subject_filename )
{
  # read in the x file and pull only the mean and std
  #
  x.test <- read.table( x_filename )
  names(x.test) <- make.names( features$V2, unique=TRUE, allow_ = TRUE )
  x.test <- select( x.test, matches( "\\.mean\\.|\\.std\\."))
  
  # Read the y file and add a factor for the various activities
  #
  y.test <- read.table( y_filename )
  y.test$act.name <- factor( y.test$V1, levels=1:6, labels=activity.labels$V2 )
  
  # read in the subject file as the resp dataframe and add activity factor and
  # the std and mean numbers from X file measurements.
  #
  resp <- read.table( subject_filename ) %>% rename( subject_val = V1 )
  resp$activity_val <- y.test$act.name
  cbind( resp, x.test )
}

test.df <- build.data( "./UCI HAR Dataset/test/X_test.txt",
                       "./UCI HAR Dataset/test/y_test.txt",
                       "./UCI HAR Dataset/test/subject_test.txt" )

train.df <- build.data( "./UCI HAR Dataset/train/X_train.txt",
                       "./UCI HAR Dataset/train/y_train.txt",
                       "./UCI HAR Dataset/train/subject_train.txt" )

measurement.set <- rbind( test.df, train.df )
measurement.set <- arrange( measurement.set, subject_val, activity_val )
write.csv( measurement.set, "working_data_set.csv" )

# need to get the mean of the measurements for each subject/activity pair
#
# start by converting the dataset from wideform to longform
longform.measurement.set <- melt( measurement.set, id.vars=c( "subject_val", "activity_val" ) )
#
# use dcast to go back to wideform performing the "mean" operation on all cases where su
# subject/activity are the same
average.measurement.set <- dcast( longform.measurement.set, subject_val + activity_val ~ variable, fun.aggregate = mean )
#
# switch back to longform since it seems that is considered "tidy data" and many of R's funcitons require
# longform data rather than wideform. Use arrange to order the columns based on subject and activity.
longform.average.measurement.set <- melt( average.measurement.set, 
                                          id.vars=c( "subject_val", "activity_val" ),
                                          variable.name="measurement_type",
                                          value.name="measurement_value" )
longform.average.measurement.set <- arrange( longform.average.measurement.set, subject_val, activity_val, measurement_type )
write.table( longform.average.measurement.set, "wearable_tidy_data.txt", row.name=FALSE )



