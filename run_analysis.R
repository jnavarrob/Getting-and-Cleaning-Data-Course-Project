## Getting and Cleaning Data
## Final Project
## Student:  Javier Navarro B.
## Date:  June 17, 2017

## STEP 1:  Merges the training and the test sets to create one data set.
## Train data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Descriptive data
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Column names dessignation
colnames(x_train) <- features[,2]
colnames(y_train) <- "activity_id"
colnames(subject_train) <- "subject_id"
colnames(x_test) <- features[,2]
colnames(y_test) <- "activity_id"
colnames(subject_test) <- "subject_id"
colnames(activity_labels) <- c("activity_id", "activity_type")

## Data sets merge
train <- cbind(y_train, subject_train, x_train)
test  <- cbind(y_test, subject_test, x_test)
train_test <- rbind(train, test)


## STEP 2:  Extracts only the measurements on the mean and standard deviation for each measurement.
column_names <- colnames(train_test)

mean_standard <- (grepl("activity_id", column_names) | grepl("subject_id", column_names) | grepl("mean..", column_names) | grepl("std..", column_names))

mean_std_subset <- train_test[,mean_standard==TRUE]


## STEP 3:  Uses descriptive activity names to name the activities in the data set
mean_std_act <- merge(mean_std_subset, activity_labels, by = "activity_id")


## STEP 4:  Appropriately labels the data set with descriptive variable names.
current_colnames <- colnames(mean_std_act)
current_colnames <- gsub("^t", "Times", current_colnames)
current_colnames <- gsub("^f", "Frequency", current_colnames)
current_colnames <- gsub("Acc", "Accelerometer", current_colnames)
current_colnames <- gsub("Gyro", "Gyroscope", current_colnames)
current_colnames <- gsub("Mag", "Magnitude", current_colnames)
current_colnames <- gsub("BodyBody", "Body", current_colnames)
colnames(mean_std_act) <- current_colnames

## STEP 5:  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
avg_activity_subject <- aggregate(. ~subject_id+activity_id, mean_std_act, mean)
avg_activity_subject <- avg_activity_subject[order(avg_activity_subject$activity_type, avg_activity_subject$subject_id),]


## Write the outcome to a txt file
write.table(avg_activity_subject, "./activity_subjects.txt", row.names = FALSE)