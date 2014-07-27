##===================================================================
##       run_analysis.R       Last mod: July 26, 2014 at 16:30 PDT
##===================================================================
## This program takes as input files found in the "UCI HAR Dataset" 
## folder. The output is a single tidied tab-delimited text file, 
## which is written to the "UCI HAR Dataset" folder.  Change setwd
## statement and outfilename as necessary.
##
## Created for the "Getting and Cleaning Data" course by S. Carroll
##===================================================================
## Initialize environment
##===================================================================
setwd("/Users/SarahMBP/Desktop/Data Science Courses/Rcode/UCI HAR Dataset")
outfilename <- "Carroll_GCD_Tidy2.txt"
DEBUG <- TRUE   ## set to TRUE if debugging output is desired, else set to FALSE

##===================================================================
## 1. Merge the training and the test sets to create one data set.
##===================================================================

## Extract field labels from the features.txt file
## Note that Xcol.names[,2] contains original field labels, and later must be
## converted to contain only R-approved characters.
Xcol.names <- read.table("features.txt",sep="",header=FALSE)

## Combine contents of test file, subject IDs, and activity performed
Xtest<-read.table("test/X_test.txt",sep="",header=FALSE,col.names=Xcol.names[,2])
Ytest<-read.table("test/Y_test.txt",sep="",header=FALSE,col.names=c("Activity"))
subtest<-read.table("test/subject_test.txt",sep="",header=FALSE,col.names=c("SubjectID"))
alltest<-cbind(subtest,Ytest,Xtest)

## Combine contents of train file, subject IDs, and activity performed
Xtrain<-read.table("train/X_train.txt",sep="",header=FALSE,col.names=Xcol.names[,2])
Ytrain<-read.table("train/Y_train.txt",sep="",header=FALSE,col.names=c("Activity"))
subtrain<-read.table("train/subject_train.txt",sep="",header=FALSE,col.names=c("SubjectID"))
alltrain<-cbind(subtrain,Ytrain,Xtrain)

## Combine test and train (order does not matter)
alldata<-rbind(alltest,alltrain)

##===================================================================
## 2. Extract only the mean and standard deviation for each measurement. 
## The colnames function changes all special characters to "."
## For example, tBodyAcc-mean()-X will become tBodyAcc.mean...X
## These variables are indicated by .mean. or .std. in the variable names
## that come out of the colnames function.
## Names will be tidied in step 4.
##===================================================================
allcolnames<-colnames(alldata)

## grep with value=FALSE returns a vector of the *indices* that match
subjcol.ndx <- grep("SubjectID", allcolnames, value=FALSE)
actcol.ndx <- grep("Activity", allcolnames, value=FALSE)
meancols.ndx <- grep("\\.mean\\.", allcolnames, value = FALSE)
stdcols.ndx <- grep("\\.std\\.", allcolnames, value = FALSE)
desiredcols.ndx <- rbind(c(subjcol.ndx,actcol.ndx,meancols.ndx,stdcols.ndx))
desiredcol.names <- allcolnames[desiredcols.ndx]

extracted <- data.frame(alldata[,desiredcols.ndx])

if (DEBUG) { names(extracted); dim(extracted) }

##===================================================================
## 3. Use descriptive activity names to name the activities in the data set.
## actlabels contains V1: the integer values and V2: the factor names
## Integer values in the Activity field of the extracted table
## are replaced by corresponding factor names.
##===================================================================
actlabels <- read.table("activity_Labels.txt",sep="",header=FALSE)

if (DEBUG) { actlabels; head(extracted[1:5]) }

extracted$Activity <- factor(extracted$Activity, labels = actlabels$V2)

if (DEBUG) { head(extracted[1:5]) }

##===================================================================
## 4. Label the data set with descriptive variable names. 
## a. Replace ... with .
## b. Replace .. with ""
## c. Replace leading t with Time.
## d. Replace leading f with Freq.
## e. Replace BodyBody with Body
##===================================================================
if (DEBUG) { names(extracted) }

temp <- names(extracted)
temp <- gsub("...", ".", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("..", "", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("tBody", "Time.Body", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("tGrav", "Time.Grav", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("fBody", "Freq.Body", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("fGrav", "Freq.Grav", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp <- gsub("BodyBody", "Body", temp, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)

if (DEBUG) { temp }

names(extracted) <- temp

if (DEBUG) { names(extracted) }

##===================================================================
## 5. Create a second tidy data set with the average of each variable 
## for each activity and each subject. 
## Since this file contains means of means, and means of standard deviations,
## also change all of the variable names to start with MeanOf.
##===================================================================

foo <- aggregate(extracted, by=list(extracted$SubjectID, extracted$Activity), mean)

## The aggregate function created two new fields, Group.1 containing the ID 
## and Group.2 containing the activity.  The SubjectID field remains intact but 
## the Activity field gets set to NA.  I don't understand why this happens but
## am hard-coding a workaround by creating the "bar" table, dropping Group.1 and Group.2
## and then replacing the contents of bar$Activity with what is in foo$Group.2
bar <-foo[,c(-1,-2)]   
bar$Activity <- foo$Group.2

if (DEBUG) { head(bar[1:5]) }

temp2 <- names(bar)
temp2 <- gsub("Time.", "MeanOf.Time.", temp2, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
temp2 <- gsub("Freq.", "MeanOf.Freq.", temp2, ignore.case = FALSE, perl = FALSE, fixed = TRUE, useBytes = FALSE)
names(bar) <- temp2

if (DEBUG) { names(bar) }

## Write the table as a tab-delimited text file.
write.table(bar, file=outfilename, append=FALSE, sep="\t", row.names=FALSE)

if (DEBUG)  { print("kthxbai") }

##============================ EOF run_analysis.R ==================================