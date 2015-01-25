### JHU_GettingCleaningData
Getting and Cleaning data, JHU Coursera courses-3

#####My summary

When dealing with the data, I split the code into four parts

1. Reading feature & activity labels
2. Reading train and test data separately, replace the rowname from feature, combine x, y (activity id) and subject (people 1-30) together. 
3. Combining train and test data using rbind, only keep those vars with mean and std
4. Create a new tidy dataset, to get the average mean of each feature by activity and people

