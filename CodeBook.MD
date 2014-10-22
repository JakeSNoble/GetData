##The Data:
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. See 
'features_info.txt' for more details. 

For each record it is provided:
======================================

* A unique number to identify the subject and an action label for the 6 
different actions tested.
* Triaxial acceleration from the accelerometer (total acceleration) and the 
estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 25-feature vector with time and frequency domain variables. 
* An identifier of the subject who carried out the experiment.
* Each numeric value represents the mean value for all observations of a 
particular subject performing a particular action.

##The Variables:
subject: A numberic identifier to distinguish each of the 30 participants
activity: A label for each of the 6 activities tested.

There are two features for each of the following variables.  One has a 't' prefix
to denote the time domain.  The other has an 'f' prefix to denote the frequency
domain, this value is obtained using a fast fourier transformation.

BodyAccMag-mean(): mean value for the mean of the magnitude of the body accelleration
BodyAccMag-std(): mean value for the stdev of the magnitude of the body accelleration
BodyAccJerkMag-mean():mean value for the mean of the magnitude of Jerks measured
BodyAccJerkMag-std():mean value for the stdev of the magnitude of Jerks measured
BodyGyroMag-mean(): mean value for the mean of the magnitude of the angular acceleration
BodyGyroMag-std(): mean value for the stdev of the magnitude of the angular acceleration
BodyGyroJerkMag-mean(): mean value for the mean of the magnitude of the angular Jerks measured
BodyGyroJerkMag-std(): mean value for the stdev of the magnitude of the angular Jerks measured

angle(tBodyAccMean,gravity):the mean value for the angle between the body accelleration vector and the downward gravity vector
angle(tBodyGyroMean,gravityMean): mean value for the angle between the gyroscopic mean vector and gravity vector
angle(tBodyGyroJerkMean,gravityMean): mean value for the angle beteen the body jerk vector and gravity vector
angle(X,gravityMean):mean value for the angle between the x component of acceleration and the gravity vector
angle(Y,gravityMean):mean value for the angle between the y component of acceleration and the gravity vector
angle(Z,gravityMean):mean value for the angle between the z component of acceleration and the gravity vector

##Setps I took to create a tidy data set:

1) unzip files downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, 
and saved them to "C:/Coursera/Getting and Cleaning Data/Course Project"
2) In R studio create a script called run_analysis.R
3) create a variable to hold the activity labels, 'ActLabs'
4) read the features file into a variable named 'Features'
5) remove the numeric component of the feature name to improve appearance
6) create a vector of column numbers that have relevant/desired information based on visual inspection of features.
7) read the test data into a variable called 'test'
8) redefine 'test' as a subset of 'test' with only the desired columns
9) assign the columns of test the feature names subsetted appropriately
10) read the y_test.txt file to extract the vector of activities each observation refers to.
11) read the subject_test.txt file to extract the vector of subjects who preformed each observation.
12) bind the subject and activity vectors to the test data frame with cbind.
13) repeat steps 7-12 for the train data.
14) rbind the test data and train data to create a new 'data' data frame with 10299 observations of 25 variables.
15) replace the numeric values in the activities column with the 'ActLabs' vlaues created in step 1 and define it as a factor
16) create a new tidy data set called 'datasum' by summarising each subject and activity combination by taking the mean of all observed instances for each subject activity combination.