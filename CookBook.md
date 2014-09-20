## Project for Getting and Cleaning Data   

### CodeBook For Data Sets Produced By run_analysis.R  

------------------------------------------------------------------------------------------------  
  
#### Introduction  
  
The purpose of this project is to demonstrate your ability 
to collect, work with, and clean a data set.  This resulting data sets are derived at [1].  
  
Below is some high-level info on what steps that the `run_analysis.R` performs.     
1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive variable names.  
  
For more details, please refer to the `README.md`.  

Both data sets list observations over 81 variables:  

##### Subject  
    Experiments Subject  
        A group of 30 volunteers within an age bracket of 19-48 years  

##### Activity  
    Experiments Activities  
        Each person performed six activities  
        1  WALKING  
        2  WALKING_UPSTAIRS  
        3  WALKING_DOWNSTAIRS  
        4  SITTING  
        5  STANDING  
        6  LAYING  
    
###### Time_Of_Body_Accelerometer_(mean)(Axis-X)  
    Average Mean value of the denote time of body acceleration signals obtains at axial X  
    
###### Time_Of_Body_Accelerometer_(mean)(Axis-Y)  
    Average Mean value of the denote time of body acceleration signals obtains at axial Y  

###### Time_Of_Body_Accelerometer_(mean)(Axis-Z)  
    Average Mean value of the denote time of body acceleration signals obtains at Z  

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the denote time of body acceleration signals obtains at axial X   

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the denote time of body acceleration signals obtains at axial Y   

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the denote time of body acceleration signals obtains at axial Z  
 
##### Time_Of_GravityAccelerometer_(mean)(Axis-X)  
    Average Mean value of the denote time of gravity acceleration signals obtains at axial X   

##### Time_Of_GravityAccelerometer_(mean)(Axis-Y)  
    Average Mean value of the denote time of gravity acceleration signals obtains at axial Y   

##### Time_Of_GravityAccelerometer_(mean)(Axis-Z)  
    Average Mean value of the denote time of gravity acceleration signals obtains at axial Z   

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the denote time of gravity acceleration signals obtainsat axial X   

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the denote time of gravity acceleration signals obtains at axial Y   

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the denote time of gravity acceleration signals obtains at axial Z   

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)  
    Average Mean value of the denote time of body acceleration in Jerk signals obtains at axial X   

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)  
    Average Mean value of the denote time of body acceleration in Jerk signals obtains at axial Y   

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)  
    Average Mean value of the denote time of body acceleration in Jerk signals obtains at axial Z   

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the denote time of body acceleration in Jerk signals obtains at axial X   

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the denote time of body acceleration in Jerk signals obtains at axial Y   

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the denote time of body acceleration in Jerk signals obtains at axial Z   

##### Time_Of_Body_Gyroscope_(mean)(Axis-X)  
    Average Mean value of the denote time of body gyroscope obtains at axial X   

##### Time_Of_Body_Gyroscope_(mean)(Axis-Y)  
    Average Mean value of the denote time of body gyroscope obtains at axial Y   

##### Time_Of_Body_Gyroscope_(mean)(Axis-Z)" 
    Average Mean value of the denote time of body gyroscope obtains at axial Z   

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-X)
    Average Standard Deviation value of the denote time of body gyroscope obtains at axial X   

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-Y)
    Average Standard Deviation value of the denote time of body gyroscope obtains at axial Y   

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the denote time of body gyroscope obtains at axial Z   

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-X)"
    Average Mean value of the denote time of body gyroscope in Jerk signals obtains at axial X   

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Y)  
    Average Mean value of the denote time of body gyroscope in Jerk signals obtains at axial Y   

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Z)  
    Average Mean value of the denote time of body gyroscope in Jerk signals obtains at axial Z   

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the denote time of body gyroscope in Jerk signals obtains at axial X   

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the denote time of body gyroscope in Jerk signals obtains at axial Y   

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the denote time of body gyroscope in Jerk signals obtains at axial Z   

##### Time_Of_Body_Accelerometer_Magnitude_(mean)  
    Average Mean value of the denote time of body acceleration obtains with Magnitude     

##### Time_Of_Body_Accelerometer_Magnitude_(standard deviation)
    Average Standard Deviation value of the denote time of body acceleration obtains with Magnitude   
    
##### Time_Of_GravityAccelerometer_Magnitude_(mean)  
    Average Mean value of the denote time of gravity acceleration obtains with Magnitude  

##### Time_Of_GravityAccelerometer_Magnitude_(standard deviation)  
    Average Standard Deviation value of the denote time of gravity acceleration obtains with Magnitude  

##### Time_Of_Body_Accelerometer_Jerk_Magnitude_(mean)  
    Average Mean value of the denote time of body acceleration obtains in Jerk signal with Magnitude  

##### Time_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the denote time of body acceleration obtains in Jerk signal with Magnitude  

##### Time_Of_Body_Gyroscope_Magnitude_(mean)  
    Average Mean value of the denote time of body gyroscope obtains with Magnitude  

##### Time_Of_Body_Gyroscope_Magnitude_(standard deviation)  
    Average Standard Deviation value of the denote time of body gyroscope obtains with Magnitude  

##### Time_Of_Body_Gyroscope_Jerk_Magnitude_(mean)  
    Average Mean value of the denote time of body gyroscope obtains obtains in Jerk signal with Magnitude  

##### Time_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the denote time of body gyroscope obtains obtains in Jerk signal with Magnitude  

##### Freq_Of_Body_Accelerometer_(mean)(Axis-X)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains at axial X  

##### Freq_Of_Body_Accelerometer_(mean)(Axis-Y)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains at axial Y  

##### Freq_Of_Body_Accelerometer_(mean)(Axis-Z)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains at axial Z  

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-X)
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains at axial X  

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Y)" 
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains at axial Y  

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Z)
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains at axial Z  

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-X)          
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains at axial X  

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-Y)     
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains at axial Y      

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-Z)  
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains at axial Z   

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial X  

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Y  

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)  
    Average Mean value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Z  

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial X  

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Y  

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Z  
    
##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-X)  
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial X  
    
##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Y)  
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Y  

##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Z)  
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains in Jerk signals at axial Z  
   
##### Freq_Of_Body_Gyroscope_(mean)(Axis-X)                         
    Average Mean value of the frequency domain signals of body gyroscope signals obtains at axial X  

##### Freq_Of_Body_Gyroscope_(mean)(Axis-Y)                         
    Average Mean value of the frequency domain signals of body gyroscope signals obtains at axial Y  

##### Freq_Of_Body_Gyroscope_(mean)(Axis-Z)                         
    Average Mean value of the frequency domain signals of body gyroscope signals obtains at axial Z  

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-X)           
    Average Standard Deviation value of the frequency domain signals of body gyroscope signals obtains at axial X  

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Y)           
    Average Standard Deviation value of the frequency domain signals of body gyroscope signals obtains at axial Y  

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Z)           
    Average Standard Deviation value of the frequency domain signals of body gyroscope signals obtains at axial Z  

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-X)             
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body gyroscope signals obtains at axial X  

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-Y)             
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body gyroscope signals obtains at axial Y  

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-Z)             
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body gyroscope signals obtains at axial Z  

##### Freq_Of_Body_Accelerometer_Magnitude_(mean)                   
    Average Mean value of the frequency domain signals of body acceleration signals obtains with Magnitude  

##### Freq_Of_Body_Accelerometer_Magnitude_(standard deviation)     
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains with Magnitude  

##### Freq_Of_Body_Accelerometer_Magnitude_(weighted average)       
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains with Magnitude  

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(mean)              
    Average Mean value of the frequency domain signals of body acceleration signals obtains in Jerk signal with Magnitude   

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the frequency domain signals of body acceleration signals obtains in Jerk signal with Magnitude   

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(weighted average)  
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body acceleration signals obtains in Jerk signal with Magnitude  

##### Freq_Of_Body_Gyroscope_Magnitude_(mean)                       
    Average Mean value of the frequency domain signals of body gyroscope signals obtains with Magnitude   

##### Freq_Of_Body_Gyroscope_Magnitude_(standard deviation)         
    Average Standard Deviation value of the frequency domain signals of body gyroscope signals obtains with Magnitude   

##### Freq_Of_Body_Gyroscope_Magnitude_(weighted average)           
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body gyroscope signals obtains with Magnitude   

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(mean)                  
    Average Mean value of the frequency domain signals of body gyroscope signals obtains in Jerk signals with Magnitude   

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)    
    Average Standard Deviation value of the frequency domain signals of body gyroscope signals obtains in Jerk signals with Magnitude   

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(weighted average)    
    Average weighted average of the frequency components to obtain a mean frequency value of the frequency domain signals of body gyroscope signals obtains in Jerk signals with Magnitude   
    
    


#### Reference:  
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
