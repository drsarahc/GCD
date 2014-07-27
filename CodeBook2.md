#CodeBook for Output File from run_analysis.R

=============================================================================

The output from the run_analysis.R program is a tidy dataset that was created from the “UCI HAR Dataset”, downloaded on July 14, 2014 from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

This CodeBook is based on text provided by the original researchers, whose contact information is as follows:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Universita degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws

###From the README.txt file included with the downloaded data files:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (Walking, WalkingUpStairs, WalkingDownStairs, Sitting, Standing, LyingDown) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." 

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details."

###From the features_info.txt file included with the downloaded data files:

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz."

"Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag)."

"Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate Frequency domain signals)."


The original data files included descriptive statistics and other variables that were generated from the raw data.  Only the mean and standard deviation for each signal measurement were retained for the purpose of this project. The variables retained were renamed for increased clarity (e.g. change “t” prefix to “Time.”, change “f” prefix to “Freq.”) and to eliminate characters that R does not support in variable names (e.g. dashes and parentheses).  Further details of how the output file was created can be found in the README.md file and in the comments of the run_analysis.R script, which should be present in this repository.


#CODEBOOK
=============================================================================
###SubjectID
	Identifying number assigned to each subject
		1..30
=============================================================================
###Activity
	Activity being performed when measurements were taken
		Walking
		WalkingUpStairs
		WalkingDownStairs
		Sitting
		Standing
		LyingDown
=============================================================================
The following fields contain the mean of means of all observations for this subject and activity for the indicated measurement; responses for every field are contained in [-1..1].

###MeanOf.Time.BodyAcc.mean.X
	Time domain signals, body acceleration, X coordinate
###MeanOf.Time.BodyAcc.mean.Y
	Time domain signals, body acceleration, Y coordinate
###MeanOf.Time.BodyAcc.mean.Z
	Time domain signals, body acceleration, Z coordinate
###MeanOf.Time.GravityAcc.mean.X
	Time domain signals, gravity acceleration, X coordinate
###MeanOf.Time.GravityAcc.mean.Y
	Time domain signals, gravity acceleration, Y coordinate
###MeanOf.Time.GravityAcc.mean.Z
	Time domain signals, gravity acceleration, Z coordinate
###MeanOf.Time.BodyAccJerk.mean.X
	Time domain signals, body acceleration Jerk, X coordinate
###MeanOf.Time.BodyAccJerk.mean.Y
	Time domain signals, body acceleration Jerk, Y coordinate
###MeanOf.Time.BodyAccJerk.mean.Z
	Time domain signals, body acceleration Jerk, Z coordinate
###MeanOf.Time.BodyGyro.mean.X
	Time domain signals, body gyro, X coordinate
###MeanOf.Time.BodyGyro.mean.Y
	Time domain signals, body gyro, Y coordinate
###MeanOf.Time.BodyGyro.mean.Z
	Time domain signals, body gyro, Z coordinate
###MeanOf.Time.BodyGyroJerk.mean.X
	Time domain signals, body gyro Jerk, X coordinate
###MeanOf.Time.BodyGyroJerk.mean.Y
	Time domain signals, body gyro Jerk, Y coordinate
###MeanOf.Time.BodyGyroJerk.mean.Z
	Time domain signals, body gyro Jerk, Z coordinate
###MeanOf.Time.BodyAccMag.mean
	Time domain signals, body acceleration magnitude
###MeanOf.Time.GravityAccMag.mean
	Time domain signals, gravity acceleration magnitude
###MeanOf.Time.BodyAccJerkMag.mean
	Time domain signals, body acceleration jerk magnitude
###MeanOf.Time.BodyGyroMag.mean
	Time domain signals, body gyro magnitude
###MeanOf.Time.BodyGyroJerkMag.mean
	Time domain signals, body gyro jerk magnitude
###MeanOf.Freq.BodyAcc.mean.X
	Frequency domain signals, body acceleration, X coordinate
###MeanOf.Freq.BodyAcc.mean.Y
	Frequency domain signals, body acceleration, Y coordinate
###MeanOf.Freq.BodyAcc.mean.Z
	Frequency domain signals, body acceleration, Z coordinate
###MeanOf.Freq.BodyAccJerk.mean.X
	Frequency domain signals, body acceleration Jerk, X coordinate
###MeanOf.Freq.BodyAccJerk.mean.Y
	Frequency domain signals, body acceleration Jerk, Y coordinate
###MeanOf.Freq.BodyAccJerk.mean.Z
	Frequency domain signals, body acceleration Jerk, Z coordinate
###MeanOf.Freq.BodyGyro.mean.X
	Frequency domain signals, body gyro, X coordinate
###MeanOf.Freq.BodyGyro.mean.Y
	Frequency domain signals, body gyro, Y coordinate
###MeanOf.Freq.BodyGyro.mean.Z
	Frequency domain signals, body gyro, Z coordinate
###MeanOf.Freq.BodyAccMag.mean
	Frequency domain signals, body acceleration magnitude
###MeanOf.Freq.BodyAccJerkMag.mean
	Frequency domain signals, body acceleration jerk magnitude
###MeanOf.Freq.BodyGyroMag.mean
	Frequency domain signals, body gyro magnitude
###MeanOf.Freq.BodyGyroJerkMag.mean
	Frequency domain signals, body gyro jerk magnitude
=============================================================================
The following fields contain the mean of standard deviations of all observations for this subject and activity for the indicated measurement; responses for every field are contained in [-1..1].

###MeanOf.Time.BodyAcc.std.X
	Time domain signals, body acceleration, X coordinate
###MeanOf.Time.BodyAcc.std.Y
	Time domain signals, body acceleration, Y coordinate
###MeanOf.Time.BodyAcc.std.Z
	Time domain signals, body acceleration, Z coordinate
###MeanOf.Time.GravityAcc.std.X
	Time domain signals, gravity acceleration, X coordinate
###MeanOf.Time.GravityAcc.std.Y
	Time domain signals, gravity acceleration, Y coordinate
###MeanOf.Time.GravityAcc.std.Z
	Time domain signals, gravity acceleration, Z coordinate
###MeanOf.Time.BodyAccJerk.std.X
	Time domain signals, body acceleration Jerk, X coordinate
###MeanOf.Time.BodyAccJerk.std.Y
	Time domain signals, body acceleration Jerk, Y coordinate
###MeanOf.Time.BodyAccJerk.std.Z
	Time domain signals, body acceleration Jerk, Z coordinate
###MeanOf.Time.BodyGyro.std.X
	Time domain signals, body gyro, X coordinate
###MeanOf.Time.BodyGyro.std.Y
	Time domain signals, body gyro, Y coordinate
###MeanOf.Time.BodyGyro.std.Z
	Time domain signals, body gyro, Z coordinate
###MeanOf.Time.BodyGyroJerk.std.X
	Time domain signals, body gyro Jerk, X coordinate
###MeanOf.Time.BodyGyroJerk.std.Y
	Time domain signals, body gyro Jerk, Y coordinate
###MeanOf.Time.BodyGyroJerk.std.Z
	Time domain signals, body gyro Jerk, Z coordinate
###MeanOf.Time.BodyAccMag.std
	Time domain signals, body acceleration magnitude
###MeanOf.Time.GravityAccMag.std
	Time domain signals, gravity acceleration magnitude
###MeanOf.Time.BodyAccJerkMag.std
	Time domain signals, body acceleration jerk magnitude
###MeanOf.Time.BodyGyroMag.std
	Time domain signals, body gyro magnitude
###MeanOf.Time.BodyGyroJerkMag.std
	Time domain signals, body gyro jerk magnitude
###MeanOf.Freq.BodyAcc.std.X
	Frequency domain signals, body acceleration, X coordinate
###MeanOf.Freq.BodyAcc.std.Y
	Frequency domain signals, body acceleration, Y coordinate
###MeanOf.Freq.BodyAcc.std.Z
	Frequency domain signals, body acceleration, Z coordinate
###MeanOf.Freq.BodyAccJerk.std.X
	Frequency domain signals, body acceleration Jerk, X coordinate
###MeanOf.Freq.BodyAccJerk.std.Y
	Frequency domain signals, body acceleration Jerk, Y coordinate
###MeanOf.Freq.BodyAccJerk.std.Z
	Frequency domain signals, body acceleration Jerk, Z coordinate
###MeanOf.Freq.BodyGyro.std.X
	Frequency domain signals, body gyro, X coordinate
###MeanOf.Freq.BodyGyro.std.Y
	Frequency domain signals, body gyro, Y coordinate
###MeanOf.Freq.BodyGyro.std.Z
	Frequency domain signals, body gyro, Z coordinate
###MeanOf.Freq.BodyAccMag.std
	Frequency domain signals, body acceleration magnitude
###MeanOf.Freq.BodyAccJerkMag.std
	Frequency domain signals, body acceleration jerk magnitude
###MeanOf.Freq.BodyGyroMag.std
	Frequency domain signals, body gyro magnitude
###MeanOf.Freq.BodyGyroJerkMag.std
	Frequency domain signals, body gyro jerk magnitude
=============================================================================

Last updated July 26, 2014 at 21:00 PST






