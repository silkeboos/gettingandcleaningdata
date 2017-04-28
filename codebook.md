# Codebook
The codebook describes the data used in this project and the processing for creating the final tidy data set.

### Experimental design
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Description of input  data
* `features.txt`: Names of the 561 features.
* `activity_labels.txt`: Names and IDs of each of the 6 activities.

* `X_train.txt`: 7352 measurements of the 561 features of 21 of the 30 volunteers.
* `subject_train.txt`: A vector of 7352 integer consisting the ID of the volunteer related to each of the measurements in `X_train.txt`.
* `y_train.txt`: A vector of 7352 integer consisting the ID of the activity related to each of the measurements in `X_train.txt`.

* `X_test.txt`: 2947 measurements of the 561 features of 9 of the 30 volunteers.
* `subject_test.txt`: A vector of 2947 integers consisting the ID of the volunteer related to each of the measurements in `X_test.txt`.
* `y_test.txt`: A vector of 2947 integers consisting the ID of the activity related to each of the measurements in `X_test.txt`.

All measurements are floating-point values, normalised and bounded within [-1,1].

### Processing steps

1. The relevant input data were read into data frames, appropriate column headers were added, and the training and test sets were merged into one single data set.
2. All feature columns of standard deviation and mean were extracted. 
3. The activity and subject column were converted into factors, and the activity column is labeled by the description of the belonging activity.
4. Conversion of the data from a wide format to a long format and building the mean of each feature for each subject and each activity.
5. The ressultant tidy dataset was written into a text file called tidy.txt.
