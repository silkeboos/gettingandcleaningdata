library (reshape2)

# Loading of activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extracting of data of maean and standard deviation
extractedFeatures <- grep(".*mean.*|.*std.*", features[,2])
extractedFeatures.names <- features[extractedFeatures,2]
extractedFeatures.names <- gsub('-mean', 'Mean',extractedFeatures.names)
extractedFeatures.names <- gsub('-std', 'Std',extractedFeatures.names)
extractedFeatures.names <- gsub('[-()]', '',extractedFeatures.names)

# Loading and Merging of training and test sets to one dataset
##############################################################

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[extractedFeatures]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Create train-dataset
train_data <- cbind( subject_train,y_train,x_train)



x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[extractedFeatures]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Create test-dataset
test_data <- cbind(subject_test,y_test,x_test)



#Merging and labeling
mergedData <- rbind(test_data,train_data)
colnames(mergedData) <- c("subject","activity",extractedFeatures.names)

#Turning of activities & subjects into factors
mergedData$activity <- factor(mergedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergedData$subject <- as.factor(mergedData$subject)

mergedData.melted <- melt(mergedData, id =c("subject","activity"))
mergedData.mean <- dcast(mergedData.melted, subject + activity ~ variable, mean)

write.table(mergedData.mean, "tidy.txt", row.names = FALSE, quote= FALSE)
