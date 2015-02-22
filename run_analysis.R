run_analysis <- function () {
# 1. Merge the training and the test sets to create one data set, following the steps below:
#	1.1. Read into Zip file, then unzip the zip file 
	download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ","Dataset.zip", mode="wb")
	unzip ("./Dataset.zip")
#	1.2. Read Subject datasets for both Training and Test
	Subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
	Subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
#	1.3. Read Activity datasets for both Training and Test
	Activity_train <- read.table("UCI HAR Dataset/train/y_train.txt")
	Activity_test <- read.table("UCI HAR Dataset/test/y_test.txt")
#	1.4. Read Measurements datasets for both Training and Test	
	Measurements_train <- read.table("UCI HAR Dataset/train/X_train.txt")
	Measurements_test <- read.table("UCI HAR Dataset/test/X_test.txt")
#	1.5. Merge all Training and Test datasets 	
	Subject_all <- rbind(Subject_train,Subject_test)
	Activity_all <- rbind (Activity_train,Activity_test)
	Measurements_all <- rbind (Measurements_train, Measurements_test)
	
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.	
#	2.1. Read Measurement names	and using filter by mean and standard deviation.
	Measurement_names <- read.table ("UCI HAR Dataset/features.txt")
	Measurement_filter <- grepl("(-std\\(\\)|-mean\\(\\))",Measurement_names$V2)
#	2.1. Apply filter to Measurements datasets
	Measurements_all_selected <- Measurements_all[, which(Measurement_filter == TRUE)]
	
# 3. Uses descriptive activity names to name the activities in the data set
#	3.1. Read Activity labels 
	Activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
#	3.2. Replace activity labels in Activity datasets
	Activity <- as.factor(Activity_all$V1)
	levels(Activity) <- Activity_labels$V2

# 4. Appropriately labels the data set with descriptive variable names. 
#	4.1. Replace variable names with Measurements names
	Measurement_names <- (cbind(Measurement_names,Measurement_filter)[Measurement_filter==TRUE,])$V2
#	4.2. Clean up Measurements names, replacing abbreviations with more descriptive labels	
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("(\\(|\\)|\\-)","",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("mean",".Mean.",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("std",".Standard.Deviation.",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("Acc",".Acceleration",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("GyroJerk","Angular.Acceleration",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("Gyro","Angular.Speed",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("Mag","Magnitude",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("^t","Time.Domain.",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("^f","Frequency.Domain.",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("Freq\\.","Frequency.",t)})
	Measurement_names <- sapply(Measurement_names,function(t) {gsub("Freq$","Frequency.",t)})
	names(Measurements_all_selected) <- Measurement_names
#	4.3. Coerce Subject dataset to factor prior to binding along with the other datasets (Activity, Measurements)
	Subject <- as.factor(Subject_all$V1)
#	4.4. Bind all datasets into one data set	
	Data_all <- cbind(Subject,Activity,Measurements_all_selected)
	
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#	5.1. Use Reshape2 functions (molten, dcast) to regroup dataset and calculate the average per Subject and Activity 
	library(reshape2)
	molten <- melt(Data_all,id.vars=c("Subject","Activity"))
	Data_all2 <- dcast(molten,Subject + Activity ~ variable,mean)
#	5.2. Create tidy data
	write.table(Data_all2,"TidyData.txt",row.names = FALSE)
}


