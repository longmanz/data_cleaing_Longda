CodeBook for Class Project by Longda
===================

Dataset "new_data_Longda.txt" is the final clean & tidy data I produced according to the guidence.
It contains 67 columns, with one column describing the specific subject doing specific activity, and
other 66 columns being the average of each measurement from the original datasets.


FIRST, let's check out the variables in the dataset "new_data_Longda.txt".

* category: This variable describes the specific subject doing specific activity. For example, "sub1 WALKING" represents subject-1-doing-walking circumstances.

* tBodyAcc-mean()-X: A time domain signals (prefix 't' to denote time), the mean of the means of X-axail body linear acceleration.

* tBodyAcc-mean()-Y: A time domain signals (prefix 't' to denote time), the mean of the means of Y-axail body linear acceleration.

* tBodyAcc-mean()-Z: A time domain signals (prefix 't' to denote time), the mean of the means of Z-axail body linear acceleration.

* tGravityAcc-mean()-X: The mean of the means of X-axail gravity acceleration signals

* tGravityAcc-mean()-Y: The mean of the means of Y-axail gravity acceleration signals

* tGravityAcc-mean()-Z: The mean of the means of Z-axail gravity acceleration signals 

* tBodyAccJerk-mean()-X: The mean of the means of X-axail linear acceleration and angular velocity derived in time, so we have Jerk signals

* ......

* tBodyGyro-mean()-X: The mean of the means of X-axail signals that obtained by gyroscope.

* ......

* tBodyGyroJerk-mean()-X: The mean of the means of X-axail signals that obtained by gyroscope, and then derived in time to obtain the Jerk signals

* ......

* tBodyAccMag-mean(): The magnitude of the means of body acceleration, calculated from three-dimensional signals using the Euclidean norm

* ......

* fBodyAcc-mean()-X: (the 'f' to indicate frequency domain signals) The mean of the means of X-axail body linear acceleration

* ......

* fBodyAccJerk-mean()-X: (the 'f' to indicate frequency domain signals) The mean of the means of X-axail linear acceleration and angular velocity derived in time, so we have Jerk signals

* ......

* ......

* tBodyAcc-std()-X: A time domain signals (prefix 't' to denote time), the mean of the standard deviations of X-axail body linear acceleration.

* ......

* ......



SECOND, these are the procedures that lead to the final tidy dataset. 

(ALL the procedures and explanation are also in the R-SCRIPT, run_analysis.R. It may be easier for you to go directly to that file.)

## First we need to input the two datasets we need to generate.

## Combine them into one giant dataset.

## Notice that we need to substract the mean & sd of each signal(about 561 sinals). From the "features.txt" we can see that for every signal, it has many variables.It's not hard to tell the pattern: for a mean or sd variable, it must contains the key word "-mean" or "-std". So we can use agrep() to locate them.

## Input the variables names file, and substract the name vector.

## And we can locate them by keywords("-mean" & "-std"). We name the location vector M_S_Vector.

## So we can apply it to the giant dataset above.

## Oh, maybe we shouldn't forget the original names for each variable. We still need to deal with them later. Let's add it to the subset.

## One thing I just recall: Note that these 2 steps also returns the variables of "-meanFreq", which I think should be ruled out.

## And now we should add 2 columns of the activity names, as well as the subjects who conduct the experiments, for each observation. Input the y_test.txt and y_train.txt, merge it into a long vector for the combined dataset of "testRAW" and "trainRAW". Don't get the order wrong. 

## Replace the "1,2..." with actual activity names, refering to the activity_lebels.txt.

## Add it to the allSUB dataset. Since ylong is actually a data.frame, I use a [,1] here to make sure only a vector is passed to the allSUB.

## The same for the subject column.

## Make it a "factor" column.

## So now we have finished step 1, 2, 3, & 4.

## Now in step 5, we need to calculate mean of every measurement for every subject doing each activity. It may be easier if we generate a new column as an INDEX for later use.

## Let's use a loop to calculate all the variables (from column 1 to 66).

## Rename the new dataset "lalala", according to the original name of allSUB.

## So now we've generated a new dataset as the step 5 ask us to. It contains both column-names (different measurements) and row-names (different subject doing defferent activity). 

## But since the guidence require us not to contain any rownames. So We need to create a column to serve as the rownames. I name it "category".

## Reorder it.

## Let's output the file.





