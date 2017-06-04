# Data Science Coursework for Coursera

This is repo for holding course work for [Coursera](https://www.coursera.org/)
Data Science studies.

## Getting and Cleaning Data Course Project

The target of the project is to produce clean data set from raw data generated
by mobile phone accelerometers. The sensor signals was collected with mobile
phone was on the waist of the subjects.

### The R-Script

Usage:

    source("run_analysis.R")
    run_analysis()

The provided R-script [run_analysis.R](run_analysis.R) does the cleaning in
following steps:

1. The raw data is downloaded and extracted to the working directory (see
   `download_data()` function).
2. The data is cleaned (see `clean_data()` function). The cleaning is done in
   following steps:
   - Read activity labels from _activity_labels.txt_ file
   - Read variable labels from _features.txt_ file
   - From both _train_ and _test_ data sets read:
     * subject identifiers
     * activity codes and convert them to labels
     * feature sensor data and select mean and standard deviation variables
3. From the data set independent data set with the average of each variable
   for each activity and each subject (see `analyze_data()` function)
4. Store the tidy data set and the collected data set to files _clean_data.csv_
   _analysis.csv_ (see `run_analysis()` function)

### Raw Data Set

The raw data is provided by

    [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge
        L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
        Multiclass Hardware-Friendly Support Vector Machine. International
        Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz,
        Spain. Dec 2012

The raw data set can be download manually from link provided by Coursera: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Cleaned Data Set

Cleaned data set containing the mean and standard deviations of the measurements
is provided as a CSV file: [clean_data.csv](clean_data.csv)

The average for each variable for each activity and each subject is provided as
CSV file: [analysis.csv](analysis.csv)

### Code Book

For result data set content read [CodeBook.md](CodeBook.md).
