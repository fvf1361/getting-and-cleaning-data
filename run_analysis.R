# this script is created for the final assignment of the Coursera course "getting and 
# cleaning data"
#
# this R script does the following:
# 1- Merges the training and the test sets to create one data set.
# 2- Extracts only the measurements on the mean and standard deviation for each measurement.
# 3- Uses descriptive activity names to name the activities in the data set
# 4- Appropriately labels the data set with descriptive variable names.
# 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# loading the required libraries
library(dplyr)
library(reshape2)
library(plyr)

# reading in the data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
sub_test <- read.table("./test/subject_test.txt")
names(y_test) <- "activity"
names(sub_test) <- "subject"

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
sub_train <- read.table("./train/subject_train.txt")
names(y_train) <- "activity"
names(sub_train) <- "subject"

# 1- merging the training and test sets
data <- rbind(cbind(sub_test, y_test, x_test), cbind(sub_train, y_train, x_train))

    # reading the feature labels
    feats <- read.table("features.txt", colClasses = "character")
    ind <- grep("(mean\\(\\)|std\\(\\))", feats$V2)   # locating mean and std variables

# 2- extracting mean and std from merged data + subject and activity columns
data.small <- data[, c(1,2,ind+2)]

# 3- Adding descriptive activity names
    
    # reading activity names
    labels <- read.table("activity_labels.txt", colClasses = "character")
    
data.small$activity <- mapvalues(data.small$activity, labels$V1, labels$V2)  #replacing activity codes with names

# 4- Adding descriptive variable names
names(data.small)[3:NCOL(data.small)] <- feats[ind,2]

# removing unnecessary objects
rm(list= ls()[!(ls() %in% c('data.small'))])

# 5- creating an independent tidy dataset with mean of each variable calculated
data.melted <- melt(data.small, id = c("subject", "activity"))
data.tidy <- dcast(data.melted, subject + activity ~ variable, mean)

# Writing the tidy data to a file
write.table(data.tidy, file = "tidy_data.txt", quote = FALSE)
