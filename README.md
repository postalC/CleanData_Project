## Project for Getting and Cleaning Data


### Introduction

------------------------------------------------------------------------------------------------
  

#### About the Project
The purpose of this project is to demonstrate your ability 
to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

* a tidy data set as described below, 
* a link to a Github repository with your script for performing the analysis, 
* a code book that describes the variables, the data, and any transformations 
or work that you performed to clean up the data called `CodeBook.md`. 

You should also include a `README.md` in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

------------------------------------------------------------------------------------------------
  

#### About the Dataset
One of the most exciting areas in all of data science right now is wearable computing - see for example  <a href="http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/">this article</a>. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">UCI
web site</a> 

Here are the data for the project: <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">UCI HAR Dataset</a> `[59.7 Mb]`

##### Introduction in Dataset README.txt (under the unzipped file directory)
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

> For each record it is provided:
>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

**_Note_** Please read the `README.txt` for more details.    


#### About the Study - how the data is been processed 
Create R script called `run_analysis.R` that does the following.  
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
5. From the data set in step (4), creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Note and assumption
* The files in the **_Inertial Signals folders_** are **NOT USED** in this study  
* The environment (i.e. R-studio) have the required library such as `data.table` installed

------------------------------------------------------------------------------------------------
  


### Step to reproduce the result
##### Preliminaries :: Download and unzip data file
1. Load library **_data.table_**
2. Declare Variables (required file name)
3. Check if file downloaded (does not download again if exist)
4. Get path (current working directory) 
5. Set variable for the dataset directory (for navigate to dataset path)
6. List the files in the dataset directory (quick check on the filepath structure)  

`list.files(pathIn, recursive=TRUE)`  
> [1] "activity_labels.txt"                          "features.txt"                                
> [3] "features_info.txt"                            "README.txt"                                  
> [5] "test/Inertial Signals/body_acc_x_test.txt"    "test/Inertial Signals/body_acc_y_test.txt"   
> [7] "test/Inertial Signals/body_acc_z_test.txt"    "test/Inertial Signals/body_gyro_x_test.txt"  
> [9] "test/Inertial Signals/body_gyro_y_test.txt"   "test/Inertial Signals/body_gyro_z_test.txt"  
> [11] "test/Inertial Signals/total_acc_x_test.txt"   "test/Inertial Signals/total_acc_y_test.txt"  
> [13] "test/Inertial Signals/total_acc_z_test.txt"   "test/subject_test.txt"                       
> [15] "test/X_test.txt"                              "test/y_test.txt"                             
> [17] "train/Inertial Signals/body_acc_x_train.txt"  "train/Inertial Signals/body_acc_y_train.txt"  
> [19] "train/Inertial Signals/body_acc_z_train.txt"  "train/Inertial Signals/body_gyro_x_train.txt"  
> [21] "train/Inertial Signals/body_gyro_y_train.txt" "train/Inertial Signals/body_gyro_z_train.txt"  
> [23] "train/Inertial Signals/total_acc_x_train.txt" "train/Inertial Signals/total_acc_y_train.txt"  
> [25] "train/Inertial Signals/total_acc_z_train.txt" "train/subject_train.txt"                     
> [27] "train/X_train.txt"                            "train/y_train.txt"  

------------------------------------------------------------------------------------------------
  
   
   
------------------------------------------------------------------------------------------------   

##### Part #1 :: Merges the training and the test sets to create one data set.

**_Abstract_**  
Based on the information provided in `README.txt`  
* `train/X_train.txt`: Training set  
* `train/y_train.txt`: Training labels  
* `test/X_test.txt`: Test set  
* `test/y_test.txt`: Test labels  
* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. 
Its range is from 1 to 30  
  
Observed that the Training set cvs is a 'matrix' data - each row contain the detail of training set seperated by space.
  
While the Training lables and subject cvs only have one columns of data.  
(a) As such, first we will read-in the subject, training labels and training sets cvs for Training data set  
(b) And, change the column name for easy merging   
* The column name of subject data is changed to **_Subject_**  
* The column name of training labels data is changed to **_ActivityID_**  
(c) Next, merge them together using cbind() - column bind  
(d) Then, repeat the same steps for Test data set  
(e) Lastly, we merge the Training and Test data set together using rbind() - row bind  
  
  
**_Assumption_**  
For this study, only subject, training labels and training sets data is use  
  
  
**_Steps_**  
[1] Read Training Data (3 train files /3 steps)  
 * Read training Subject data and set the colomn name as **_Subject_**  
 * Read training Labels (Activity) data and set the colomn name as **_ActivityID_**    
 * Read training Sets data  
[2] Merge all 3 training data to one data set (with cbind)  
[3] Read Testing Data (3 test files /3 steps) 
 * Read testing Subject data and set the colomn name as **_Subject_**  
 * Read testing Labels (Activity) data and set the colomn name as **_ActivityID_**    
 * Read testing Sets data  
[4] Merge all 3 testing data to one data set (with cbind)  
[5] Merge **BOTH** training and testing data to one data set   
[6] Quick check with head(), names(), dim(), str() to check the header and structure  
 **_Note_** There should be 10299 obs of 563 variables in the merge result  

`dim(data)`    
> [1] 10299   563  

`str(data)`  
> 'data.frame':    10299 obs. of  563 variables:  
>     $ Subject : int  1 1 1 1 1 1 1 1 1 1 ...  
> $ ActivityID: int  5 5 5 5 5 5 5 5 5 5 ...  
> $ V1      : num  0.289 0.278 0.28 0.279 0.277 ...  
> $ V2      : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  
> $ V3      : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...  
> $ V4      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...  
> $ V5      : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...  
> $ V6      : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...  
> [list output truncated]   

  
------------------------------------------------------------------------------------------------  
  
  

------------------------------------------------------------------------------------------------
  
 

##### Part #2 :: Extracts only the measurements on the mean and standard deviation for each measurement.

**_Abstract_**  
Based on the information provided in `README.txt`  
* `features_info.txt`: Shows information about the variables used on the feature vector  
* `features.txt`: List of all features   
  
There are two column in `features.txt` - *feature id* and *feature name*. 
Where the *feature id* is the unique identifier of a feature type, 
while the *feature name* is the descriptive name of a feature type.  
  
In other word, each data column with prefix 'V' is represent a type feature and identify using *feature id* specified in `features.txt`  
(a) So, first we will read the feature.txt file and identify the *feature id* that presents mean and standard deviation  
(b) After that, we subset the *feature id* for mean and standard deviation ONLY  
(c) Because the feature column name have prefix 'V', we will add prefix 'V' in front of *feature id* (same format)  
(d) Then, we create a character vector named *useColumn* that contains **_Subject_**, **_ActivityID_** and the prefixed 'V' *feature id*  
(e) Next, we subset the data column with the created *useColumn*  
(f) As such the data column name does not found in the *useColumn* is been ignored  
(g) While the new subsetted data ONLY consists of data that related to mean and standard deviation ONLY  
  
  
  
**_Steps_**    
[1] Read the `features.txt` file  
* This tells which variables in dataset are measurements for the mean and standard deviation    
[2] Check Data Feature Structures and Colomn Name  
[3] Set Colomn Name to "FeatureID" and "FeatureName" for easy navigate and understand  
[4] Subset only measurements for the mean and standard deviation  
  * Based on the information provided in `features_info.txt`      
  - mean's feature name is consists of word "mean"  like tBodyAcc-mean()-Y, tBodyAcc-mean()-Y   
  - standard deviation's feature name is consists of word "str" such as tBodyAcc-std()-X, tBodyAcc-std()-Y  
  * Subset with function grepl + regular expression on column "FeatureName"  
[5] Convert the column numbers to code with "V" prefix, this is preparation for "merge" into main data set  
[6] Merge the created feature code to feature (mean & std) data set  
[7] Quick check with head(), Str() to ensure the column name and structure is correct   
  * **_Note_** There should be 79 obs of 3 variables in the subset result  
  
`str(subsetFeatures)`    
> 'data.frame':    79 obs. of  3 variables:  
> $ FeatureID: int  1 2 3 4 5 6 41 42 43 44 45 ...  
> $ FeatureName  : Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",
..: 243 244 249 250 251 454 455 456 461 462 ...  
> $ Code  : Factor w/ 79 levels "V1", "V121","V122",..: 13 33 43 59 72 44 45 52 53 54 ..  
  
[8] Create the Column to be Use (for subsetting in next step)  
[9] Subset data with "mean" and "standard deviation" records only  
[10] Check the subsetted data column name and structure   
**_Note_** Some of the data column is removed because it is not related to "mean" and "standard deviation"  
  
`str(subData)`  
> 'data.frame':    10299 obs. of  81 variables:  
> $ Subject : int  1 1 1 1 1 1 1 1 1 1 ...  
> $ ActivityID: int  5 5 5 5 5 5 5 5 5 5 ...  
> $ V1      : num  0.289 0.278 0.28 0.279 0.277 ...  
> $ V2      : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...  
> $ V3      : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...  
> $ V4      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...  
> [list output skipped here :)]  
> $ V543    : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...  
> $ V552    : num  -0.0743 0.1581 0.4145 0.4046 0.0878 ...  
       
  
  
------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------
  

##### Part #3 :: Uses descriptive activity names to name the activities in the data set
**_Abstract_**  
Based on the information provided in `README.txt`  
* `activity_labels.txt`: Links the class labels with their activity name     
  
There are two column in `activity_labels.txt` - **activity id** and **activity name**. 
Where the **activity id** is unique identifier of an activity type, 
while the **activity name** is the descriptive name of an activity type.  
    
In other word, each row value in data "Activity" column is equal to the **activity id** listed in `activity_labels.txt.  

(a) As such, we will able to find the respective the descriptive name of an activity type **activity name**; when  we able to identify the **activity id** in data "Activity" column.    
(b) So, here we will read the activity_labels.txt file and identify the **activity id** that each activity type (descriptive name) one by one and check their data structure  
  
  
**_Steps_**  
[1] Read the `activity_labels.txt` file  
- This tells which variables is the performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) by each person (subject in data)   
[2] Set Colomn Name to "ActivityID" and "ActivityName" for easy navigate and understand  
[3] Quick check with head(), names(), Str() to ensure the column name and structure is correct   
[4] Loop the throught 'ActivityID' in subData, replace with 'ActivityName' if pattern matched  
  * **_Note_** There should be 6 obs of 2 variables in the activity labels    
  
`str(dataActivityLabels)`  
> 'data.frame':    6 obs. of  2 variables:  
> $ ActivityID  : int  1 2 3 4 5 6  
> $ ActivityName: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1   
  
  
  
------------------------------------------------------------------------------------------------
  
  
  
------------------------------------------------------------------------------------------------
  

##### Part #4 :: Appropriately labels the data set with descriptive variable names.
**_Abstract_**  
Based on the information provided in `feature_info.txt`  

We have basic understand on the "Feature Labels", so we will try to search for their pattern using
regular expression and replace with a more appropriate / meaningful name.  
  
For example, "Feature Labels" begin with **_prefix_** **t** is the denote time and
**_prefix_** **_f_** indicate frequency domain signals. 

(a) So, we will search for "Feature Labels" start with **t** using regular expression **^t** and,   
(b) Replace it as "Time_Of_" if matched. 
(c) Likewise for **f** and others short name, we will search for "Feature Labels" start with **f** using regular expression **^f** and,   
(d) Replace it as "Freq_Of_" if matched.  
(e) Similiar steps is repeated for all other feature name matches and replaces,   
(f) After, all the "Feature Labels" is refined, we add it to the data set column name (overwrite the old one).  
  
  
**_Steps_**  
[1] Define the regular-expression and replace Feature Labels One by One  
[2] Extract the refined Feature Labels and replace existing Column Name  
[3] Quick check on the new redefined Column Name  

`names(subData)`  
> [1] "Subject"                                                       
> [2] "Activity_ID"                                                   
> [3] "Time_Of_Body_Accelerometer_(mean)(Axis-X)"                     
> [4] "Time_Of_Body_Accelerometer_(mean)(Axis-Y)"                     
> [5] "Time_Of_Body_Accelerometer_(mean)(Axis-Z)"                     
> [6] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-X)"       
> [7] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-Y)"       
> [8] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-Z)"       
> [9] "Time_Of_GravityAccelerometer_(mean)(Axis-X)"                   
> [10] "Time_Of_GravityAccelerometer_(mean)(Axis-Y)"                   
> [11] "Time_Of_GravityAccelerometer_(mean)(Axis-Z)"                   
> [12] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-X)"     
> [13] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-Y)"     
> [14] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-Z)"     
> [15] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)"                
> [16] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)"                
> [17] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)"                
> [18] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)"  
> [19] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)"  
> [20] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)"  
> [21] "Time_Of_Body_Gyroscope_(mean)(Axis-X)"                         
> [22] "Time_Of_Body_Gyroscope_(mean)(Axis-Y)"                         
> [23] "Time_Of_Body_Gyroscope_(mean)(Axis-Z)"                         
> [24] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-X)"           
> [25] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-Y)"           
> [26] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-Z)"           
> [27] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-X)"                    
> [28] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Y)"                    
> [29] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Z)"                    
> [30] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-X)"      
> [31] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Y)"      
> [32] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Z)"      
> [33] "Time_Of_Body_Accelerometer_Magnitude_(mean)"                   
> [34] "Time_Of_Body_Accelerometer_Magnitude_(standard deviation)"     
> [35] "Time_Of_GravityAccelerometer_Magnitude_(mean)"                 
> [36] "Time_Of_GravityAccelerometer_Magnitude_(standard deviation)"   
> [37] "Time_Of_Body_Accelerometer_Jerk_Magnitude_(mean)"              
> [38] "Time_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)"  
> [39] "Time_Of_Body_Gyroscope_Magnitude_(mean)"                       
> [40] "Time_Of_Body_Gyroscope_Magnitude_(standard deviation)"         
> [41] "Time_Of_Body_Gyroscope_Jerk_Magnitude_(mean)"                  
> [42] "Time_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)"    
> [43] "Freq_Of_Body_Accelerometer_(mean)(Axis-X)"                     
> [44] "Freq_Of_Body_Accelerometer_(mean)(Axis-Y)"                     
> [45] "Freq_Of_Body_Accelerometer_(mean)(Axis-Z)"                     
> [46] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-X)"       
> [47] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Y)"       
> [48] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Z)"       
> [49] "Freq_Of_Body_Accelerometer_(weighted average)(Axis-X)"         
> [50] "Freq_Of_Body_Accelerometer_(weighted average)(Axis-Y)"         
> [51] "Freq_Of_Body_Accelerometer_(weighted average)(Axis-Z)"         
> [52] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)"                
> [53] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)"                
> [54] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)"                
> [55] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)"  
> [56] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)"  
> [57] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)"  
> [58] "Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-X)"    
> [59] "Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Y)"    
> [60] "Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Z)"    
> [61] "Freq_Of_Body_Gyroscope_(mean)(Axis-X)"                         
> [62] "Freq_Of_Body_Gyroscope_(mean)(Axis-Y)"                         
> [63] "Freq_Of_Body_Gyroscope_(mean)(Axis-Z)"                         
> [64] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-X)"           
> [65] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Y)"           
> [66] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Z)"           
> [67] "Freq_Of_Body_Gyroscope_(weighted average)(Axis-X)"             
> [68] "Freq_Of_Body_Gyroscope_(weighted average)(Axis-Y)"             
> [69] "Freq_Of_Body_Gyroscope_(weighted average)(Axis-Z)"             
> [70] "Freq_Of_Body_Accelerometer_Magnitude_(mean)"                   
> [71] "Freq_Of_Body_Accelerometer_Magnitude_(standard deviation)"     
> [72] "Freq_Of_Body_Accelerometer_Magnitude_(weighted average)"       
> [73] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(mean)"              
> [74] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)"   
> [75] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(weighted average)"   
> [76] "Freq_Of_Body_Gyroscope_Magnitude_(mean)"                       
> [77] "Freq_Of_Body_Gyroscope_Magnitude_(standard deviation)"         
> [78] "Freq_Of_Body_Gyroscope_Magnitude_(weighted average)"           
> [79] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(mean)"                  
> [80] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)"    
> [81] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(weighted average)"  

  
  
  
------------------------------------------------------------------------------------------------
  
  
  
------------------------------------------------------------------------------------------------
  

##### Part #5 :: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
**_Abstract_**  
Based on the information provided in `Discussion Forum`  

> What is asking for is, for every combination of subject and activity, tell me what there average is.  For example, if you were to subset the entire dataset based on Joe doing Activity X, you may perhaps have a 100 rows left.  Step 5 is saying to turn those 100 rows into just one row, being the average of the 100 rows.  Of course keep in mind that the columns themselves are being left alone.  So in your new dataset, one row will be Joe doing X, Joe doing Y, Ann doing X, Ann doing Y, etc.
  
  
**_Steps_**   
[1] Create tidy data with mean of subject and activity  
[2] Refine Column Name  
[3] Quick check with names() if any mistake   
[4] Create the mean data set to txt extension and no row names.  
write.table(meanData, file = "run_analysis_v1.txt", row.names=FALSE)  
[5] Lastly, we can goto the working directory to verify file the output file named `run_analysis_v1.txt`.  
  * **_Note_** The suffix **_v1** is use for **version control**, if you happen to change the logic `run_analysis.R`. Simple change the outfile to next version like **_v2**.  
  
`names(meanData)[1:5]`  
> [1] "Subject"                                   "Activity"                                 
> [3] "Time_Of_Body_Accelerometer_(mean)(Axis-X)" "Time_Of_Body_Accelerometer_(mean)(Axis-Y)"  
> [5] "Time_Of_Body_Accelerometer_(mean)(Axis-Z)"  
  

  
  
------------------------------------------------------------------------------------------------
  
  
------------------------------------------------------------------------------------------------
  
### Summary
As conclusion, through this exercise we learns some basic idea and technic on `getting and cleanning data`. Let us quick recap the steps:  

[1] Merged the 'training labels' and 'traning sets' data of subject from 2 group namely 'train' and 'test' in to single data set  
[2] Filtered out ONLY the mean and standard deviation measurements out from data set result of step #1 by ONLY  
[3] Updated the 'Activity' unique Id with a more descriptive 'Activity Name' 
  - According to the info provided in 'activity_labels.txt'  
  - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
[4] Refined the column name (V1:xx) with a more appropriate 'Feature Label' or feature selection  
  - Based on the details provided in 'feature_info.text'  
[5] Calculated the average of each variable for each activity and each subject, assigned to a new variables and output as txt file  
  
As you may already notice that, on top of the 5 steps above, there is still alot of 'cleaning' process 
that we can do to further refine and tidy the data step.  Yes, but we will stop as it is for this exercise, and shall reopen/continue if required.  


Lastly, I wanted to thank you very much for you patience and time to go through this study. 
Thank you. Appreciate it.  
  
  
###### By postalC  

------------------------------------------------------------------------------------------------
