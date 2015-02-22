# Getting and Cleaning Data
## OBJECTIVE

The aim of the project is to clean and extract usable data from the above zip file, and to obtain at the end a tidy dataset for further analysis. 
R script called run_analysis.R does the following
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

After running the R script run_analysis, the final result Tidy Data ("TidyData.txt") can be read using the function read.table ("TidyData.txt", header=TRUE).

Below the detailed steps of the R script run_analysis:

## 1. Merge the training and the test sets to create one data set, following the steps below:
	1.1. Extract the Zip file into local disk folder "Dataset.zip", then unzip the zip file 
	1.2. Read Subject datasets for both Training and Test from "UCI HAR Dataset/train/subject_train.txt" and "UCI HAR Dataset/test/subject_test.txt"
	1.3. Read Activity datasets for both Training and Test from "UCI HAR Dataset/train/y_train.txt" and "UCI HAR Dataset/test/y_test.txt"
	1.4. Read Measurements datasets for both Training and Test from "UCI HAR Dataset/train/X_train.txt" and "UCI HAR Dataset/test/X_test.txt"
	1.5. Merge all Training and Test respective datasets (Subject, Activity and Measurements)
	
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.	
	2.1. Read Measurement names	from "UCI HAR Dataset/features.txt" and use the function grepl to filter them by mean and standard deviation.
	2.1. Apply filter to Measurements datasets

## 3. Uses descriptive activity names to name the activities in the data set
	3.1. Read Activity labels from "UCI HAR Dataset/activity_labels.txt"
	3.2. Replace activity labels in Activity dataset

## 4. Appropriately labels the data set with descriptive variable names. 
	4.1. Apply above filter to Measurement names 
	4.2. Clean up Measurements names, replacing abbreviations with more descriptive labels	
	* removing "(\\", "\\)", "\\-)"
	* replacing "mean" with ".Mean."
	* replacing"std" with ".Standard.Deviation."
	* replacing"Acc" with ".Acceleration"
	* replacing"GyroJerk" with "Angular.Acceleration"
	* replacing"Gyro" with "Angular.Speed"
	* replacing"Mag" with "Magnitude"
	* replacing"^t" with "Time.Domain."
	* replacing"^f" with "Frequency.Domain."
	* replacing"Freq\\." with "Frequency."
	* replacing"Freq$" with "Frequency."
	4.3. Coerce Subject dataset to factor prior to binding along with the other datasets (Activity, Measurements)
	4.4. Bind all datasets into one single data set	
	
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	5.1. Use Reshape2 functions (molten, dcast) to regroup dataset and calculate average per Subject and Activity 
	5.2. Create tidy data ("TidyData.txt") using write.table with row.names = FALSE
