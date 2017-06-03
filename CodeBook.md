# CodeBook: Getting and Cleaning Data Course Project

Each observation contains the following variables:

    subject: Test subject identifier
    activity: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING

The measurements come from accelerometer identified by 'Acc' and gyroscope
identified by 'Gyro' in the variable names. The time domain signals are prefixed
by 't'. The filteredsignals are prefixed by 'f'. The 'X', 'Y' and 'Z' denote the
direction in the variable. The filtered are normalized and bounded within
(-1,1). The string 'mean()' in the variable name denotes the mean value. The
string 'std()' in the variable name denotes the standard deviation.

The available sensor variables listed below:

    tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
    tBodyAcc-std()-X tBodyAcc-std()-Y tBodyAcc-std()-Z
    tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z
    tGravityAcc-std()-X tGravityAcc-std()-Y tGravityAcc-std()-Z
    tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
    tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
    tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
    tBodyGyro-std()-X tBodyGyro-std()-Y tBodyGyro-std()-Z
    tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
    tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z
    tBodyAccMag-mean()
    tBodyAccMag-std()
    tGravityAccMag-mean()
    tGravityAccMag-std()
    tBodyAccJerkMag-mean()
    tBodyAccJerkMag-std()
    tBodyGyroMag-mean()
    tBodyGyroMag-std()
    tBodyGyroJerkMag-mean()
    tBodyGyroJerkMag-std()
    fBodyAcc-mean()-X fBodyAcc-mean()-Y fBodyAcc-mean()-Z
    fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z
    fBodyAccJerk-mean()-X fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z
    fBodyAccJerk-std()-X fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z
    fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
    fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z
    fBodyAccMag-mean()
    fBodyAccMag-std()
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()
    fBodyBodyGyroMag-mean()
    fBodyBodyGyroMag-std()
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std()


For more details on the variables see the _README.txt_ and _features_info.txt_
files in the raw data set.

