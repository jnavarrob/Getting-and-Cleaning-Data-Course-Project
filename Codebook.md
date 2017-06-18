Code book

## Getting and Cleaning Data
## Final Project
## Student:  Javier Navarro B.
## Date:  June 17, 2017

## STEP 1:  Merges the training and the test sets to create one data set.
## Train data
Data extraction into variables x_train, y_train and subject_train

## Test data
Data extraction into variables x_test, y_test and subject_test

## Descriptive data
Data extraction into variables features and activity_labels

## Column names dessignation
In this step, the column names are assigned as corresponds to each data table extracted

## Data sets merge
The merge of the process occurs by combining two techniques:  cbind and rbind.
The final data table is the variable train_test

## STEP 2:  Extracts only the measurements on the mean and standard deviation for each measurement.
The measurements that contains mean and standard deviation are extracted to the variable mean_std_subset

## STEP 3:  Uses descriptive activity names to name the activities in the data set
The Activity Type is added into a new variable by merging the mean_std_subset and the activity_labels variables into the variable mean_std_act

## STEP 4:  Appropriately labels the data set with descriptive variable names.
For easy understanding of the process, the column names are adjusted to reflect the most appropriate names for each column.

## STEP 5:  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The avg_activity_subject variable is computed with the mean of the different columns by subject_id and activity_id

## Write the outcome to a txt file
Finally, when all the computations are done then the "activity_subjects.txt" file is created in the working directory.

