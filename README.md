### JHU_GettingCleaningData
Getting and Cleaning data, JHU Coursera courses-3

#####My summary

When dealing with the data, I split the code into four parts

1. Reading feature & activity labels
2. Reading train and test data separately, replace the rowname from feature, combine x, y (activity id) and subject (people 1-30) together. 
3. Combining train and test data using rbind, only keep those vars with mean and std
4. Create a new tidy dataset, to get the average mean of each feature by activity and people

#####The package I used

When dealing with the project, I used data.table, dplyr and tidyr packages.

1. data.table : used to deal with x, large dataset
2. dplyr&tidyr: select, group_by, summarise_each, summarise, mutate, spread

After discussion with my fellows, I marked down three method to get the tidy dataset. You can check with my code. Thanks.


#####Code Book

The final tidy dataset has 180 rows of 68 variables.

1. people: the volunteer ID, from 1-30
2. activity: the 6 activites, including Walking, laying or else
3. var (from col 3 to col 68), means/std for 

tBodyAcc-XYZ|
tGravityAcc-XYZ|
tBodyAccJerk-XYZ|
tBodyGyro-XYZ|
tBodyGyroJerk-XYZ|
tBodyAccMag|
tGravityAccMag|
tBodyAccJerkMag|
tBodyGyroMag|
tBodyGyroJerkMag|
fBodyAcc-XYZ|
fBodyAccJerk-XYZ|
fBodyGyro-XYZ|
fBodyAccMag|
fBodyAccJerkMag|
fBodyGyroMag|
fBodyGyroJerkMag|

#####Final
Finally, thanks all who help me finishing this assignment!

Especially thank David Hood, CTA of the course, and the author of writing the related swirl course.

I also provdie the [Datarawdata](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) link and a screenshot.jpg

![Rawdata Summary](https://raw.githubusercontent.com/yunyanzyy/JHU_GettingCleaningData/master/screenshot.jpg)
