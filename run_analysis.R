#!/usr/bin/env Rscript
## File Name: run_analysis.R

## Create R script called `run_analysis.R` that does the following. 
### 1. Merges the training and the test sets to create one data set.
### 2. Extracts only the measurements on the mean and standard deviation 
###    for each measurement. 
### 3. Uses descriptive activity names to name the activities in the data set
### 4. Appropriately labels the data set with descriptive variable names. 
### 5. From the data set in step 4, creates a second, independent tidy data 
###    set with the average of each variable for each activity and each subject.



## Step to reproduce the result
######################################################################

##### Preliminaries :: Download and unzip data file
################################################
## Pre-requirement
################################################
## -- Load Library --
library(data.table)

## -- Declare Variables --
sourceUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
sourceZip <- "dataset.zip"

################################################
## Enviroment Check 
################################################
## -- Check if file downloaded --
if (!file.exists(sourceZip)) {
    ## -- Download file from Web --
    download.file(
        sourceUrl, 
        destfile=sourceZip
    )
    unzip(sourceZip)  
}    

## -- Get Current Path --
path <- getwd()
path

## -- Set variable for the dataset directory --
pathIn <- file.path(path, "UCI HAR Dataset")
pathIn

## -- List the files in the dataset directory --
list.files(pathIn, recursive=TRUE)

######################################################################


##### Part #1 :: Merges the training and the test sets to create one data set.
################################################
## Read Training Data 
################################################
## -- Read - training - Subject data --
trainSubject <- read.csv(file.path(pathIn, "train/subject_train.txt"), header=FALSE)
colnames(trainSubject) <- c("Subject") 

## -- Read - training - Training Labels (Activity) data --
trainActivity <- read.csv(file.path(pathIn, "train/y_train.txt"), header=FALSE)
colnames(trainActivity) <- c("Activity") 

## -- Read - training - Training Sets data --
trainSet <- read.table(file.path(pathIn, "train/X_train.txt"))

## -- Column Bind - all 3 column Training Data -- 
trainData <- cbind.data.frame(trainSubject, trainActivity, trainSet)

## -- Set un-use data frame to null --
trainSubject <- NULL
trainActivity <- NULL
trainSet <- NULL

################################################
## Read Test Data 
################################################
## -- Read - testing - Subject data --
testSubject <- read.csv(file.path(pathIn, "test/subject_test.txt"), header=FALSE)
colnames(testSubject) <- c("Subject") 

## -- Read - testing - Training Labels (Activity) data --
testActivity <- read.csv(file.path(pathIn, "test/y_test.txt"), header=FALSE)
colnames(testActivity) <- c("Activity") 

## -- Read - testing - Training Sets data --
testSet <- read.table(file.path(pathIn, "test/X_test.txt"))

## -- Column Bind - all 3 column testing Data -- 
testData <- cbind.data.frame(testSubject, testActivity, testSet)

## -- Set un-use data frame to null --
testSubject <- NULL
testActivity <- NULL
testSet <- NULL

################################################
## Merge Data 
################################################
## -- Merge data - Train and Test data --
data <- rbind.data.frame(trainData, testData)

## -- Set un-use data frame to null --
trainData <- NULL
testData <- NULL

## -- Merge data - Quick check with head(), names(), dim() to check the header and structure --
head(data, n=2)

names(data)

### > dim(data)
### [1] 10299   563
dim(data)

### > str(data)
### 'data.frame':    10299 obs. of  563 variables:
### $ Subject : int  1 1 1 1 1 1 1 1 1 1 ...
### $ Activity: int  5 5 5 5 5 5 5 5 5 5 ...
### $ V1      : num  0.289 0.278 0.28 0.279 0.277 ...
### $ V2      : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
### $ V3      : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
### $ V4      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
### $ V5      : num  -0.983 -0.975 -0.967 -0.983 -0.981 ...
### $ V6      : num  -0.914 -0.96 -0.979 -0.991 -0.99 ...
### [list output truncated]
str(data)

## -- Merge data - Check result summaries with summary() --
summary(data)

######################################################################


##### Part #2 :: Extracts only the measurements on the mean and 
#####            standard deviation for each measurement.
## -- Read the features.txt file --
dataFeatures <- read.csv(file.path(pathIn, "features.txt"), sep=" ", header=FALSE) 

## -- Check Data Feature Structures and Colomn Name --
str(dataFeatures)

### > names(dataFeatures)
### [1] "X1"                "tBodyAcc.mean...X"
names(dataFeatures)

## -- Set Colomn Name to "FeatureID" and "FeatureName" --
colnames(dataFeatures) <- c("FeatureID", "FeatureName")

## -- Subset only measurements for the mean and standard deviation --
#### * mean is feature name that consists of word "mean()"
####    like tBodyAcc-mean()-Y, tBodyAcc-mean()-Y
####
#### * standard deviation is feature name that consists of word "str()"
####    such as tBodyAcc-std()-X, tBodyAcc-std()-Y
####

## -- Subset with function grepl + regular expression on column "name" -- 
subsetFeatures <- subset(dataFeatures, 
                         grepl("mean()", dataFeatures$FeatureName) | 
                             grepl("std()", dataFeatures$FeatureName))

## -- Convert the column numbers to code with "V" prefix --
featureCode <- paste0("V", subsetFeatures$FeatureID)

## -- Bind the created feature code to feature (mean & std) data set --
subsetFeatures <- cbind.data.frame(subsetFeatures, FeatureCode=featureCode)

## -- Quick check with head(), Str() --
### > head(subsetFeatures)
### FeatureID FeatureName       FeatureCode
### 
### 1      1 tBodyAcc-mean()-X   V1
### 2      2 tBodyAcc-mean()-Y   V2
### 3      3 tBodyAcc-mean()-Z   V3
### 4      4  tBodyAcc-std()-X   V4
### 5      5  tBodyAcc-std()-Y   V5
### 6      6  tBodyAcc-std()-Z   V6
head(subsetFeatures)

### > str(subsetFeatures)
### 'data.frame':    79 obs. of  3 variables:
### $ FeatureID  : int  1 2 3 4 5 6 41 42 43 44 45 ...
### $ FeatureName  : Factor w/ 477 levels "angle(tBodyAccJerkMean),gravityMean)",..: 243 244 249 250 251 454 455 456 461 462 ...
### $ FeatureCode  : Factor w/ 79 levels "V1", "V121","V122",..: 13 33 43 59 72 44 45 52 53 54 ..
str(subsetFeatures)

### > subsetFeatures$Code  
###  [1] V1   V2   V3   V4   V5   V6   V41  V42  V43  V44  V45  V46  V81  V82  V83  V84  V85  V86  V121  
###  [20] V122 V123 V124 V125 V126 V161 V162 V163 V164 V165 V166 V201 V202 V214 V215 V227 V228 V240 V241  
###  [39] V253 V254 V266 V267 V268 V269 V270 V271 V294 V295 V296 V345 V346 V347 V348 V349 V350 V373 V374  
###  [58] V375 V424 V425 V426 V427 V428 V429 V452 V453 V454 V503 V504 V513 V516 V517 V526 V529 V530 V539  
###  [77] V542 V543 V552
###  79 Levels: V1 V121 V122 V123 V124 V125 V126 V161 V162 V163 V164 V165 V166 V2 V201 V202 ... V86
subsetFeatures$FeatureCode  

### -- Column to be Use --
useColumn <- c("Subject","Activity", featureCode)

## -- Subset data with "mean" and "standard deviation" records only --
subData <- data[, which(colnames(data) %in% useColumn) ] 

## -- Check the subsetted column name --
names(subData)
### > names(subData)
###  [1] "Subject"  "Activity" "V1"       "V2"       "V3"       "V4"       "V5"       "V6"      
###  [9] "V41"      "V42"      "V43"      "V44"      "V45"      "V46"      "V81"      "V82"     
###  [17] "V83"      "V84"      "V85"      "V86"      "V121"     "V122"     "V123"     "V124"    
###  [25] "V125"     "V126"     "V161"     "V162"     "V163"     "V164"     "V165"     "V166"    
###  [33] "V201"     "V202"     "V214"     "V215"     "V227"     "V228"     "V240"     "V241"    
###  [41] "V253"     "V254"     "V266"     "V267"     "V268"     "V269"     "V270"     "V271"    
###  [49] "V294"     "V295"     "V296"     "V345"     "V346"     "V347"     "V348"     "V349"    
###  [57] "V350"     "V373"     "V374"     "V375"     "V424"     "V425"     "V426"     "V427"    
###  [65] "V428"     "V429"     "V452"     "V453"     "V454"     "V503"     "V504"     "V513"    
###  [73] "V516"     "V517"     "V526"     "V529"     "V530"     "V539"     "V542"     "V543"    
###  [81] "V552" 

str(subData)
### > str(subData)
### 'data.frame':    10299 obs. of  81 variables:  
### $ Subject : int  1 1 1 1 1 1 1 1 1 1 ...  
### $ Activity: int  5 5 5 5 5 5 5 5 5 5 ...
### $ V1      : num  0.289 0.278 0.28 0.279 0.277 ...
### $ V2      : num  -0.0203 -0.0164 -0.0195 -0.0262 -0.0166 ...
### $ V3      : num  -0.133 -0.124 -0.113 -0.123 -0.115 ...
### $ V4      : num  -0.995 -0.998 -0.995 -0.996 -0.998 ...
### [list output skipped]
### $ V543    : num  -0.991 -0.996 -0.995 -0.995 -0.995 ...
### $ V552    : num  -0.0743 0.1581 0.4145 0.4046 0.0878 ...

######################################################################



##### Part #3 :: Uses descriptive activity names to name the activities 
#####            in the data set
## -- Read the activity_labels.txt file --
dataActivityLabels <- read.csv(file.path(pathIn, "activity_labels.txt"), sep=" ", header=FALSE) 

## -- Set Colomn Name to "Activity" and "ActivityName" --
colnames(dataActivityLabels) <- c("Activity", "ActivityName")

## -- Quick check with head(), names(), Str() --
head(dataActivityLabels, n=2)
### > head(dataActivityLabels, n=2)
### Activity     ActivityName
### 1  1          WALKING
### 2  2          WALKING_UPSTAIRS

names(dataActivityLabels)
### > names(dataActivityLabels)
### [1] "Activity"   "ActivityName

str(dataActivityLabels)
### > str(dataActivityLabels)
### 'data.frame':    6 obs. of  2 variables:
###     $ Activity  : int  1 2 3 4 5 6
###     $ ActivityName: Factor w/ 6 levels "LAYING","SITTING",..: 4 6 5 2 3 1

## -- Loop the SubData to do update Activity -- 
for (i in 1 : 6) {
    subData$Activity<-sub(i, dataActivityLabels[i,2], subData$Activity,)
}


######################################################################



##### Part #4 :: Appropriately labels the data set with 
#####            descriptive variable names.
## -- Define the regular-expression and replace Feature Name One by One --
subsetFeatures$FeatureName<-sub("^t", "Time_Of_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Freq()", "", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("^f", "Freq_Of_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Acc", "Accelerometer_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Gyro", "Gyroscope_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("-mean\\(\\)", "(mean)", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("-std\\(\\)", "(standard deviation)", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Jerk", "Jerk_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Mag", "Magnitude_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("BodyBody", "Body", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("Body", "Body_", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("-X", "(Axis-X)", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("-Y", "(Axis-Y)", subsetFeatures$FeatureName,)
subsetFeatures$FeatureName<-sub("-Z", "(Axis-Z)", subsetFeatures$FeatureName,)

## -- Extract Feature Name to use in Column Name --
featureName <- subsetFeatures$FeatureName

## -- Refine Column to be Use --
useColumn <- c("Subject","Activity_ID", featureName)

## -- Replace Column Name wiht Refined Name --
colnames(subData) <- useColumn

## -- Check Data --
names(subData)
### > names(subData)
### [1] "Subject"                                                       
### [2] "Activity_ID"                                                   
### [3] "Time_Of_Body_Accelerometer_(mean)(Axis-X)"                     
### [4] "Time_Of_Body_Accelerometer_(mean)(Axis-Y)"                     
### [5] "Time_Of_Body_Accelerometer_(mean)(Axis-Z)"                     
### [6] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-X)"       
### [7] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-Y)"       
### [8] "Time_Of_Body_Accelerometer_(standard deviation)(Axis-Z)"       
### [9] "Time_Of_GravityAccelerometer_(mean)(Axis-X)"                   
### [10] "Time_Of_GravityAccelerometer_(mean)(Axis-Y)"                   
### [11] "Time_Of_GravityAccelerometer_(mean)(Axis-Z)"                   
### [12] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-X)"     
### [13] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-Y)"     
### [14] "Time_Of_GravityAccelerometer_(standard deviation)(Axis-Z)"     
### [15] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)"                
### [16] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)"                
### [17] "Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)"                
### [18] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)"  
### [19] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)"  
### [20] "Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)"  
### [21] "Time_Of_Body_Gyroscope_(mean)(Axis-X)"                         
### [22] "Time_Of_Body_Gyroscope_(mean)(Axis-Y)"                         
### [23] "Time_Of_Body_Gyroscope_(mean)(Axis-Z)"                         
### [24] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-X)"           
### [25] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-Y)"           
### [26] "Time_Of_Body_Gyroscope_(standard deviation)(Axis-Z)"           
### [27] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-X)"                    
### [28] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Y)"                    
### [29] "Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Z)"                    
### [30] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-X)"      
### [31] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Y)"      
### [32] "Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Z)"      
### [33] "Time_Of_Body_Accelerometer_Magnitude_(mean)"                   
### [34] "Time_Of_Body_Accelerometer_Magnitude_(standard deviation)"     
### [35] "Time_Of_GravityAccelerometer_Magnitude_(mean)"                 
### [36] "Time_Of_GravityAccelerometer_Magnitude_(standard deviation)"   
### [37] "Time_Of_Body_Accelerometer_Jerk_Magnitude_(mean)"              
### [38] "Time_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)"
### [39] "Time_Of_Body_Gyroscope_Magnitude_(mean)"                       
### [40] "Time_Of_Body_Gyroscope_Magnitude_(standard deviation)"         
### [41] "Time_Of_Body_Gyroscope_Jerk_Magnitude_(mean)"                  
### [42] "Time_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)"    
### [43] "Freq_Of_Body_Accelerometer_(mean)(Axis-X)"                     
### [44] "Freq_Of_Body_Accelerometer_(mean)(Axis-Y)"                     
### [45] "Freq_Of_Body_Accelerometer_(mean)(Axis-Z)"                     
### [46] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-X)"       
### [47] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Y)"       
### [48] "Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Z)"       
### [49] "Freq_Of_Body_Accelerometer_(mean)(Axis-X)"                     
### [50] "Freq_Of_Body_Accelerometer_(mean)(Axis-Y)"                     
### [51] "Freq_Of_Body_Accelerometer_(mean)(Axis-Z)"                     
### [52] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)"                
### [53] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)"                
### [54] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)"                
### [55] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)"  
### [56] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)"  
### [57] "Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)"  
### [58] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)"                
### [59] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)"                
### [60] "Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)"                
### [61] "Freq_Of_Body_Gyroscope_(mean)(Axis-X)"                         
### [62] "Freq_Of_Body_Gyroscope_(mean)(Axis-Y)"                         
### [63] "Freq_Of_Body_Gyroscope_(mean)(Axis-Z)"                         
### [64] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-X)"           
### [65] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Y)"           
### [66] "Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Z)"           
### [67] "Freq_Of_Body_Gyroscope_(mean)(Axis-X)"                         
### [68] "Freq_Of_Body_Gyroscope_(mean)(Axis-Y)"                         
### [69] "Freq_Of_Body_Gyroscope_(mean)(Axis-Z)"                         
### [70] "Freq_Of_Body_Accelerometer_Magnitude_(mean)"                   
### [71] "Freq_Of_Body_Accelerometer_Magnitude_(standard deviation)"     
### [72] "Freq_Of_Body_Accelerometer_Magnitude_(mean)"                   
### [73] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(mean)"              
### [74] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)"
### [75] "Freq_Of_Body_Accelerometer_Jerk_Magnitude_(mean)"              
### [76] "Freq_Of_Body_Gyroscope_Magnitude_(mean)"                       
### [77] "Freq_Of_Body_Gyroscope_Magnitude_(standard deviation)"         
### [78] "Freq_Of_Body_Gyroscope_Magnitude_(mean)"                       
### [79] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(mean)"                  
### [80] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)"    
### [81] "Freq_Of_Body_Gyroscope_Jerk_Magnitude_(mean)"    


######################################################################


##### Part #5 :: From the data set in step 4, creates a second, independent
#####            tidy data set with the average of each variable 
#####            for each activity and each subject.

## -- Create tidy data with mean of subject and activity --
meanData <- aggregate(subData[, 3:dim(subData)[2]],
                                list(subData$Subject,
                                     subData$Activity_ID),
                                mean)

## -- Refine Column Name --
names(meanData) <- c("Subject", "Activity", featureName)

## -- Quick check with names() --
names(meanData)[1:5]
### > names(meanData)[1:5]
### [1] "Subject"                                   "Activity"                                 
### [3] "Time_Of_Body_Accelerometer_(mean)(Axis-X)" "Time_Of_Body_Accelerometer_(mean)(Axis-Y)"
### [5] "Time_Of_Body_Accelerometer_(mean)(Axis-Z)"

# -- Write mean data set to txt --
write.table(meanData, file = "run_analysis_v1.txt", row.names=FALSE)

######################################################################

