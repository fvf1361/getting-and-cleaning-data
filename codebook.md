#### Original data

These signals were used to estimate variables of the feature vector for each pattern in the X, Y and Z directions.

* `tBodyAcc-XYZ`
* `tGravityAcc-XYZ`
* `tBodyAccJerk-XYZ`
* `tBodyGyro-XYZ`
* `tBodyGyroJerk-XYZ`
* `tBodyAccMag`
* `tGravityAccMag`
* `tBodyAccJerkMag`
* `tBodyGyroMag`
* `tBodyGyroJerkMag`
* `fBodyAcc-XYZ`
* `fBodyAccJerk-XYZ`
* `fBodyGyro-XYZ`
* `fBodyAccMag`
* `fBodyAccJerkMag`
* `fBodyGyroMag`
* `fBodyGyroJerkMag`

The set of variables that were estimated from these signals are: 

* `mean()`: Mean value
* `std()`: Standard deviation
* `mad()`: Median absolute deviation 
* `max()`: Largest value in array
* `min()`: Smallest value in array
* `sma()`: Signal magnitude area
* `energy()`: Energy measure. Sum of the squares divided by the number of values. 
* `iqr()`: Interquartile range 
* `entropy()`: Signal entropy
* `arCoeff()`: Autorregresion coefficients with Burg order equal to 4
* `correlation()`: correlation coefficient between two signals
* `maxInds()`: index of the frequency component with largest magnitude
* `meanFreq()`: Weighted average of the frequency components to obtain a mean frequency
* `skewness()`: skewness of the frequency domain signal 
* `kurtosis()`: kurtosis of the frequency domain signal 
* `bandsEnergy()`: Energy of a frequency interval within the 64 bins of the FFT of each window.
* `angle()`: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* `gravityMean`
* `tBodyAccMean`
* `tBodyAccJerkMean`
* `tBodyGyroMean`
* `tBodyGyroJerkMean`

These measurements are performed multiple times on each subject, and during several activities as stated here:

* `WALKING`: subject walking
* `WALKING_UPSTAIRS`: subject walking up a set of stairs
* `WALKING_DOWNSTAIRS`: subject walking down a set of stairs
* `SITTING`: subject sitting
* `STANDING`: subject standing
* `LAYING`: subject laying down

#### tidy data
Includes only the `mean` and `std` variables. the original data contaings repeated measurements for each `subject` and each `activity`.
In the tidy dataset, the average of measurements per `subject`, per `activity` are calculated and reported.

#### workflow processes
- training and test data sets are read into tables, and appropriate column names are assigned for `subject` and `activity`
- the tables are merged using `rbind` command
- feature labels are read into a table, and columns with words `mean` or `std` are selected using the `grep` command
- a smaller subset of data from selected columns is created
- activity labels are read into a table, and are substituded for the activity numbers using `mapvalues` command
- variable names are inserted in the smaller data set
- the `melt` and `dcast` commands are used to re-shape the data and populate average values for each variable.
- the final tidy data set is written into a text file.
