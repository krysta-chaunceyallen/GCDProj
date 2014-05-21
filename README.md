**Input**

This script works on a dataset from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones; there is more information at that link and in the codebook.

**How to Run the Script**

Put this script in the same folder as the dataset, and run  (in Rstudio, by typing source("run_analysis.R") at the prompt, or by highlighting the whole file and hitting ctrl-R).

**What It Does**

This takes the raw data as provided by the UCI Machine Learning site, merges the test & training data into one set, extracts the mean & standard deviation of each measurement, creates a data frame of the means by participant and activity.

**Output**

This script outputs a data frame called "allDataAgg" as well as a csv called GCD_project.txt of the mean & standard deviation, with each measurement labeled by domain (time or frequency),  sensor (acceloratometer, gyrometer, etc), statistic (mean or standard deviation), and axis (x, y, or z), participant (1-30), and activity (walking, walking up stairs, walking down stairs, sitting, standing, and laying).  
 