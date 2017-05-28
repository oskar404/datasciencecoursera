# Getting and Cleaning Data Course Project
#
# Copyright (c) 2017 Oskar Lönnberg

library(utils)

# Download the data and unzip files
#
# The download operation is separated to avoid excessive downloading the same
# data.
download_data <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zip_file <- "dataset.zip"
    download.file(url, zip_file)
    unzip(zip_file)
}