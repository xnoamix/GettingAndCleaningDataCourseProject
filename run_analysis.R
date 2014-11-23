library(dplyr)

unzip("getdata_projectfiles_UCI HAR Dataset.zip")

## Loading all the different files belong to the training and test sets
features <-  read.table("UCI HAR Dataset/features.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## First, merging separetly activity labels, subjects and datasets from training and test,
## then, extracting from the datasets only those columns which calculate mean or std.
## Only then merging all together to "all_merged".

activity_merged <- rbind(activity_train, activity_test)
subject_merged <- rbind(subject_train, subject_test)
merged <- rbind(train_data, test_data)
cname <-  features[, 2]
rel_col <- grepl("mean\\(\\)|std\\(\\)", cname)
all_merged <- cbind(subject_merged, activity_merged, merged[ , rel_col])

##Setting the columns names to be clean and descriptive, replacing activity indices with labels
col_names <- c("Subject", "Activity", as.character(cname[rel_col]))
colnames(all_merged) <- col_names           
all_merged$Activity <- cut(all_merged$Activity, breaks=6, labels=activity_labels[, 2])
clean_col <- gsub("_|\\(|\\)|,|-", "", colnames(all_merged))
clean_col <- gsub("^t", "Time", clean_col)
clean_col <- gsub("^f", "Freq", clean_col)
clean_col <- gsub("BodyBody", "Body", clean_col)
clean_col <- gsub("std", "Std", clean_col)
clean_col <- gsub("mean", "Mean", clean_col)
clean_col <- make.names(clean_col, unique=TRUE)
colnames(all_merged) <- clean_col

## Creating another data frame that holds the average of each variable per subject and activity
mean_var <- group_by(all_merged, Subject, Activity) %>% summarise_each(funs(mean))
