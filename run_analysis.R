# Getting and Cleaning Data Course Project
#
# Copyright (c) 2017 Oskar Lönnberg

library(utils)
library(dplyr)

# Download the data and unzip files
#
# The download operation is separated to avoid excessive downloading the same
# data.
#
# The dataset used here is provided by:
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and
#     Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a
#     Multiclass Hardware-Friendly Support Vector Machine. International
#     Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain.
#     Dec 2012
#
download_data <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zip_file <- "dataset.zip"
    download.file(url, zip_file)
    unzip(zip_file)
}

# Reads the data and provides a tidy data.frame with these requirements:
#
# 1. Merges the training and the test sets
# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the dataset
# 4. Appropriately labels the data set with descriptive variable names.
#
# The argument nrows is for testing. If positive number it limits the reading
# from data to maximum lines defined by the argument. (See read.table for more)
#
clean_data <- function(nrows = -1) {

    workdir <- getwd()
    # Data directory is created by download_data() function
    datadir <- file.path(workdir, "UCI HAR Dataset")

    # Reads file with two columns separated by space and returns the labels
    read_labels <- function(name) {
        fn <- file.path(datadir, name)
        data <- read.table(fn, sep = " ")
        data[,2] # Has two columns, return only the names
    }

    # Reads dataset. This knows the directory structure of the dataset.
    # - The set_name is "train" or "test"
    # - The file_id is "subject", "y" or "X"
    read_dataset <- function(set_name, file_id) {
        fn <- file.path(datadir, set_name, paste0(file_id, "_", set_name, ".txt"))
        data <- read.table(fn, nrows = nrows)
        tbl_df(data)
    }

    # Read the activity labels
    activity_labels <-  read_labels("activity_labels.txt")

    # Read the names of the measurements from features.txt
    # The file describes the X_train.txt and X_test.txt variables
    feature_names <- read_labels("features.txt")

    # Read the data in train/ and test/ directories
    # - The set_name is "train" or "test"
    read_subset <- function(set_name) {
        # Read subject list
        subject <- read_dataset(set_name, "subject")
        colnames(subject) <- c("subject")
        # Read activity list and replace the codes with labels
        activity <- read_dataset(set_name, "y") %>%
            mutate(activity = activity_labels[V1]) %>%
            select(activity)
        # Read feature data
        # and select only measurement mean() and std() variables
        selector <- grep("-(mean|std)\\(\\)", feature_names)
        features <- read_dataset(set_name, "X") %>%
            select(selector)
        colnames(features) <- feature_names[selector]

        cbind(subject, activity, features)
    }

    # Combine the data from train/ and test/ directory
    data <- read_subset("train")
    data <- rbind(data, read_subset("test"))
    data
}


# Returns average of each variable for each activity and each subject
#
# Input x is what clean_data() provides.
#
analyze_data <- function(x) {
    analysis <- data %>%
        group_by(subject, activity) %>%
        summarize_all(mean)
    analysis
}


# run_analysis() function downloads the dataset, cleans the data and runs an
# analysis on the set. The function stores the results to two files:
# - clean_data.csv contains the data provided by clean_data() function.
# - analysis.csv which contains the average of each variable for each activity
#   and each subject.
#
# Returns the analysis result as a data.frame
#
# The arguments can be used for testing:
# - Set download argument to FALSE if data exists already
# - Set test argument to TRUE if a small sample is needed to test the output
#
run_analysis <- function(download = TRUE, test = FALSE) {
    if (download) {
        download_data()
    }
    nrows = -1
    if (test) {
        nrows = 50
    }
    # Get clean data
    data <- clean_data(nrows)
    write.csv(data, "clean_data.csv", row.names = FALSE)

    # Analyze the data
    analysis <- analyze_data(data)
    write.csv(analysis, "analysis.csv", row.names = FALSE)

    analysis
}
