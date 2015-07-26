
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Data source description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The script work as described below:

1) First, obtain de index number of variables with mean() and std(). It used to filter the columns
2) read train set and merge with train label and subject label. Obtain new train set
3) read test set and merge with test label and subject label. Obtain new test set
4) merge new train set and new test set 
5) change the variables from data set obtain in (4)
6) After, generate the data table of the step 5. 


Run the script: It must be in root data source directory
