GettingAndCleaningDataCourseProject
===================================

Contains the project assignment files

This is the project assignment of "getting and cleaning data" course.
The project was based on the data files in https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip that contain the result of an experiment that measures human activities ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) using a smasung galaxy sensors.
In the project we were asked to merge the training and datasets, filter only the measurements on the mean and standard deviation for each measurement, change the activity indices into their labels, give descriptive variable names and then creste another dataset  with the average of each variable for each activity and each subject.  

##The assignment is composed of 3 files:

* 'mean_var.txt' - holds the final output (was uploaded directly to the assignment page). 
* 'run_analysis.R' - The code that was used to clean and process the raw data. It can be used to recreate the mean_var.txt file from the data provided in 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* 'CodeBook.md' - a code book that describes the variables, the data and the transformations that were done on the raw data.
