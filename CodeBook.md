#Code Book for TidyData.txt

VARIABLE NAME           |CLASS  |DESCRIPTION
----------------        |-------|---------------
Subject                 |Numeric |Test subject ID
Activity                |Factor	|Activity performed by subject
tBodyAcc-mean()-X       |Numeric|Mean body acceleration in the X direction
tBodyAcc-mean()-Y       |Numeric|Mean body acceleration in the Y direction
tBodyAcc-mean()-Z       |Numeric|Mean body acceleration in the Z direction
tBodyAcc-std()-X        |Numeric|Standard deviation of body acceleration in X dir
tBodyAcc-std()-Y        |Numeric|Standard deviation of body acceleration in Y dir
tBodyAcc-std()-Z        |Numeric|Standard deviation of body acceleration in Z dir
tGravityAcc-mean()-X    |Numeric|Mean gravity acceleration in X direction
tGravityAcc-mean()-Y    |Numeric|Mean gravity acceleration in Y direction
tGravityAcc-mean()-Z    |Numeric|Mean gravity acceleration in Z direction
tGravityAcc-std()-X     |Numeric|Std dev of gravitaty acceleration in X direction
tGravityAcc-std()-Y     |Numeric|Std dev of gravitaty acceleration in Y direction
tGravityAcc-std()-Z     |Numeric|Std dev of gravitaty acceleration in Z direction
tBodyAccJerk-mean()-X   |Numeric|Mean body jerk acceleration in X direction
tBodyAccJerk-mean()-Y   |Numeric|Mean body jerk acceleration in Y direction 
tBodyAccJerk-mean()-Z   |Numeric|Mean body jerk acceleration in Z direction
tBodyAccJerk-std()-X    |Numeric|Std dev of body jerk acceleration in X direction
tBodyAccJerk-std()-Y    |Numeric|Std dev of body jerk acceleration in Y direction
tBodyAccJerk-std()-Z    |Numeric|Std dev of body jerk acceleration in Z direction
tBodyGyro-mean()-X      |Numeric|Mean body movement from gyroscope in X direction
tBodyGyro-mean()-Y      |Numeric|Mean body movement from gyroscope in Y direction
tBodyGyro-mean()-Z      |Numeric|Mean body movement from gyroscope in Z direction
tBodyGyro-std()-X       |Numeric|Std dev body movement from gyroscope in X dir
tBodyGyro-std()-Y       |Numeric|Std dev body movement from gyroscope in Y dir
tBodyGyro-std()-Z       |Numeric|Std dev body movement from gyroscope in Z dir
tBodyGyroJerk-mean()-X  |Numeric|Mean body jerk from gyroscope in X direction
tBodyGyroJerk-mean()-Y  |Numeric|Mean body jerk from gyroscope in Y direction
tBodyGyroJerk-mean()-Z  |Numeric|Mean body jerk from gyroscope in Z direction
tBodyGyroJerk-std()-X   |Numeric|Std dev body jerk from gyroscope in X direction
tBodyGyroJerk-std()-Y   |Numeric|Std dev body jerk from gyroscope in Y direction
tBodyGyroJerk-std()-Z   |Numeric|Std dev body jerk from gyroscope in Z direction
tBodyAccMag-mean()      |Numeric|Mean magnitude of body acceleration
tBodyAccMag-std()       |Numeric|Std deviation of magnitude of body acceleration
tGravityAccMag-mean()   |Numeric|Mean magnitude of gravity acceleration
tGravityAccMag-std()    |Numeric|Std dev of magnitude of gravity acceleration
tBodyAccJerkMag-mean()  |Numeric|Mean magnitude of jerk acceleration
tBodyAccJerkMag-std()   |Numeric|Std deviation of magnitude of jerk acceleration
tBodyGyroMag-mean()     |Numeric|Mean magnitude of body movement from gyroscope
tBodyGyroMag-std()      |Numeric|Std dev of magnitude of movement from gyroscope
tBodyGyroJerkMag-mean() |Numeric|Mean magnitude of jerk from gyroscope
tBodyGyroJerkMag-std()  |Numeric|Std dev of magnitude of jerk from gyroscope
fBodyAcc-mean()-X       |Numeric|Mean body acceleration in X direction (FFT)
fBodyAcc-mean()-Y       |Numeric|Mean body acceleration in Y direction (FFT)
fBodyAcc-mean()-Z       |Numeric|Mean body acceleration in Z direction (FFT)
fBodyAcc-std()-X        |Numeric|Std dev of body acceleration in X direction (FFT)
fBodyAcc-std()-Y        |Numeric|Std dev of body acceleration in Y direction (FFT)
fBodyAcc-std()-Z        |Numeric|Std dev of body acceleration in Z direction (FFT)
fBodyAccJerk-mean()-X   |Numeric|Mean body jerk acceleration in X direction (FFT)
fBodyAccJerk-mean()-Y   |Numeric|Mean body jerk acceleration in Y direction (FFT)
fBodyAccJerk-mean()-Z   |Numeric|Mean body jerk acceleration in Z direction (FFT)
fBodyAccJerk-std()-X    |Numeric|Std dev of body jerk acceleration in X dir (FFT)
fBodyAccJerk-std()-Y    |Numeric|Std dev of body jerk acceleration in Y dir (FFT)
fBodyAccJerk-std()-Z    |Numeric|Std dev of body jerk acceleration in Z dir (FFT)
fBodyGyro-mean()-X      |Numeric|Mean body movement from gyroscope in X dir (FFT)
fBodyGyro-mean()-Y      |Numeric|Mean body movement from gyroscope in Y dir (FFT)
fBodyGyro-mean()-Z      |Numeric|Mean body movement from gyroscope in Z dir (FFT)
fBodyGyro-std()-X       |Numeric|Std dev of movement from gyroscope in X dir (FFT)
fBodyGyro-std()-Y       |Numeric|Std dev of movement from gyroscope in Y dir (FFT)
fBodyGyro-std()-Z       |Numeric|Std dev of movement from gyroscope in Z dir (FFT)
fBodyAccMag-mean()      |Numeric|Mean magnitude of body acceleration (FFT)
fBodyAccMag-std()       |Numeric|Std dev of magnitude of body acceleration (FFT)
fBodyBodyAccJerkMag-mean()|Numeric|Mean magnitude body jerk accel (FFT)
fBodyBodyAccJerkMag-std()|Numeric|Std dev of magnitude body jerk accel (FFT)
fBodyBodyGyroMag-mean() |Numeric|Mean magnitude of body movement from gyros (FFT)
fBodyBodyGyroMag-std()  |Numeric|Std dev of magnitude of movement from gyro (FFT)
fBodyBodyGyroJerkMag-mean()|Numeric|Mean magnitude of jerk from gyroscope (FFT)
fBodyBodyGyroJerkMag-std()|Numeric|Std dev of magnitude of jerk from gyro (FFT)

*FFT denotes Fast Fourier Transform was applied to these signals*

## Data Processing
Data were downloaded 19 Aug 2014 from the Coursera course website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

More information about these data may be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The training and test data were read in and processed using the R script, Run_analysis.R, as follows

        Instrument data (X\_train.txt, X\_test.txt)
        - Variables were relabeled using features.txt
        Subject data (subject\_train.txt, subject\_test.txt)
        Activity data (Y\_train.txt, Y\_test.txt)
        Activity label ids (activity\_labels.txt)
Training and test data sets were assembled with the following columns:
        Subject, Activity, Measured variables 1 through 561 as listed in features.txt

These two data sets were then merged using rbind because there are no common Subjects

The data were then subset to include only those variables that are a mean or standard deviation of some measured variables. This was accomplished by identifying those column names that had "mean\(" or "std\(" in their names, resulting in 66 variables being retained in addition to Subject and Activity.

The activity codes were then changed to labels

The data were then summarized further by taking the mean of each variable for every combination of Subject and Activity, using melt() and dcast() functions, resulting in a data set that is 180 rows (30 subjects X 6 activities), and 68 columns (Subject, Activity, followed the by 66 variables). See the following discussion for more on how tidy data could be represented either wide or long:
https://class.coursera.org/getdata-006/forum/thread?thread_id=236

The final tidy data set (finaltidy) was then written to a text file, TidyData.txt, using write.table, with the argument row.names=FALSE. 

TidyData.txt should be read back into R using read.table, with the argument header=TRUE.
