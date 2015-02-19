run_analysis <- function () {
# 1. Merges the training and the test sets to create one data set.

	subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
	subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
	
	y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
	y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
	
	X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
	X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
	
	subject_All <- rbind(subject_train,subject_test)
	y_All <- rbind (y_train,y_test)
	X_All <- rbind (X_train, X_test)
	
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.	
	
	features <- read.table ("UCI HAR Dataset/features.txt")
	feature_filter <- grepl("(-std\\(\\)|-mean\\(\\))",features$V2)
	
	X_All_selected <- X_All[, which(feature_filter == TRUE)]
	
# 3. Uses descriptive activity names to name the activities in the data set
	
	features_selected <- (cbind(features,feature_filter)[feature_filter==TRUE,])$V2
	names(X_All_selected) <- features_selected
	
# 4. Appropriately labels the data set with descriptive variable names. 
	
	features_selected <- sapply(features_selected,function(featurename) {gsub("(\\(|\\)|\\-)","",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("mean",".Mean.",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("std",".Standard.Deviation.",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("Acc",".Acceleration",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("GyroJerk","Angular.Acceleration",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("Gyro","Angular.Speed",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("Mag","Magnitude",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("^t","Time.Domain.",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("^f","Frequency.Domain.",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("Freq\\.","Frequency.",featurename)})
	features_selected <- sapply(features_selected,function(featurename) {gsub("Freq$","Frequency.",featurename)})
	
	names(X_All_selected) <- features_selected
	activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
	activity <- as.factor(y_All$V1)
	levels(activity) <- activity_labels$V2
	subject <- as.factor(subject_All$V1)
	data_All <- cbind(subject,activity,X_All_selected)
	
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	
	library(reshape2)
	molten <- melt(data_All,id.vars=c("subject","activity"))
	data_All2 <- dcast(molten,subject + activity ~ variable,mean)
	write.table(data_All2,"tidyData.txt",row.names = FALSE)
}


