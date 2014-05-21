# Load relevant libraries
library(datasets)
library(graphics)
library(grDevices)
library(methods)
library(stats)
library(utils)
library(reshape2)

# Import training data
setwd("train")
training <- read.table("subject_train.txt")
training[2:562] <- read.table("X_train.txt")
training[563] <- read.table("y_train.txt")

# Import test data
setwd("../test")
testing <- read.table("subject_test.txt")
testing[2:562] <- read.table("X_test.txt")
testing[563] <- read.table("y_test.txt")

# Merges the training and the test sets to create one data set.
allData <- rbind(training, testing)

# Imports feature names
allData_names <- read.table("../features.txt")
# Slots into place along with sub & activity ID
names(allData) <- c("subjectID", as.character(allData_names[[2]]), "activityID")

# Uses descriptive activity names to name the activities in the data set 
allData[[563]] <- factor(allData[[563]], labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

# Extracts only the measurements on the mean and standard deviation for each measurement.
allDataMSD <- allData[intersect(grep("mean|std", as.character(names(allData))), grep("Freq", as.character(names(allData)), invert = TRUE))]

# Adds sub & activity IDs
allDataMSD <- cbind(allData[1], allData[563], allDataMSD)

# Creates a second, independent tidy data set with the average of each variable for each
# activity and each subject.
allDataMelt <- melt(allDataMSD, id=c("subjectID", "activityID"), measure.vars=names(allDataMSD[3:68]))
allDataAgg <- aggregate(allDataMelt$value, by=list(subject = allDataMelt$subjectID, activity = allDataMelt$activityID, measure = allDataMelt$variable), FUN=mean)

## Rework feature names
# Extract feature names
names <- levels(allDataAgg$measure)
from <- c("\\(\\)", "^t", "^f")
# Create vector of things to change to
to <- c("", "time", "freq")
# Create function for vectorizing replacement
gsub2 <- function(pattern, replacement, x, ...) {
        for(i in 1:length(pattern))
                x <- gsub(pattern[i], replacement[i], x, ...)
        x
}
# Do replacement
names <- gsub2(from, to, names)
# Feed cleaned names back to data
levels(allDataAgg$measure) <- names

## Export cleaned data
write.csv(file="GCD_project.txt", x=allDataAgg) 
