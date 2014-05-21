The original documentation for this dataset (including measurement acquisition and the full set of original measurements) is here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Pseudocode for this Script

Imports all training data & all test data, and merges them into a single data set (allData).

Imports the names of all features from features.txt, and inserts them between the subject ID and the activity ID.

Matches activity labels to activity indices.

Extracts the mean & std deviation from all the measurements--not including meanFreq (which is a quite different information domain which should be analysed with different tools from a standard mean).

Melts the data into "tall" form, with one row for each measurement, qualified by subject, activity, and measurement.

Averages the data by subject and activity

Reworks the feature names by removing (), replacing t with time and f with freq.

Feature naming:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.