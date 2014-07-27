#GCD

##Repo for Getting and Cleaning Data course project

###From the course website:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

---------------------------------------------------------------------------

###This repo includes a single R script named run_analysis.R and a codebook (CodeBook.md) for the output file created by the script. The script contains detailed comments, and does the following:  

- Preprocessing.  

	The setwd command is used to point to the location of the original data files. It is important to not modify the names or locations of the original data files within the "UCI HAR Dataset" folder. The output file name and location are designated in the "outfilename" variable within the run\_analysis.R script. A flag called DEBUG, if set to TRUE, writes useful info to the console.  

1. Merges the training and the test sets to create one data set.  

	In the original distro, data points were divided across two identically-formatted  files, "X\_train.txt" and "X\_test.txt", the variable names were in "features.txt", subject ID numbers were in the "subject\_train.txt" and "subject_test.txt" files, and the activities performed by each participant were in "Y\_train.txt" and "Y\_test.txt".  In this script, the complete train and complete test files are each put together with cbind, and then a single dataset is created by rbind-ing train and test.  
	
2. Extracts only the measurements on the mean and standard deviation for each measurement.

	grep is used to create a vector of the column numbers of the SubjectID, Activity, and requested mean and std variables.     
	
3. Uses descriptive activity names to name the activities in the data set. 

	The integers in the Activity field are replaced with their corresponding labels (initially described in the "activity\_Labels.txt" file, and modified for clarity and to remove underscores from the labels.  All modifications are done with gsub.
	 
4. Appropriately labels the data set with descriptive variable names.   

	The original variable names included characters that R does not allow. These were removed, and the somewhat terse prefixes "t" and "f" were replaced with the more descritive "Time" and "Freq".  
	
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

	The aggregate function is used to create a new tidy file of means of every variable across subject-activity pairs. Variable names in this file are identical to those in the first data frame created with "MeanOf." added to the beginning of each name. The cleaned up table is then written to disk as a tab-delimited text file.

---------------------------------------  

This file last modified on July 27, 2014.
 