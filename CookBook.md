## Project for Getting and Cleaning Data   

### CodeBook For Data Sets Produced By run_analysis.R  

------------------------------------------------------------------------------------------------  
  
#### Introduction  
  
The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant **rate of 50Hz**. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data.  
  
The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then 
**sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window)**. 
The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is `assumed` to have only low frequency components, therefore a
**filter with 0.3 Hz cutoff frequency** was used. From each window, a vector of 
features was obtained by calculating variables from the time and frequency domain.  
  
The features selected from the accelerometer and gyroscope 3-axial raw signals. 
These `time domain signals` were captured at a constant rate of 50 Hz. Then they were 
filtered using a median filter and a 3rd order low pass Butterworth filter with 
a corner frequency of 20 Hz to remove noise. Similarly, the `acceleration signal` 
was then **separated into body and gravity acceleration signals** using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz.  

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain `Jerk signals`. Also the magnitude of these three-dimensional 
signals were calculated using the `Euclidean norm`.   

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing.  
  
  
This resulting data sets are derived at [1].  
  
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
  
  
##### Time_Of_Body_Accelerometer_(mean)(Axis-X)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.   
    
##### Time_Of_Body_Accelerometer_(mean)(Axis-Y)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.     

##### Time_Of_Body_Accelerometer_(mean)(Axis-Z)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.      

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.   

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.   

##### Time_Of_Body_Accelerometer_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.   
 
##### Time_Of_GravityAccelerometer_(mean)(Axis-X)  
    Average Mean value of the gravity acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.    

##### Time_Of_GravityAccelerometer_(mean)(Axis-Y)  
    Average Mean value of the gravity acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.    

##### Time_Of_GravityAccelerometer_(mean)(Axis-Z)  
    Average Mean value of the gravity acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.    

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the gravity acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.    

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the gravity acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.     

##### Time_Of_GravityAccelerometer_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the gravity acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in time.      

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer X axis,
    obtained with body linear acceleration derived in time. The units are radians/second.     

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)  
    Average Mean value of Jerk signal for each window sample from the smartphone accelerometer Y axis,
    obtained with body linear acceleration derived in time.  The units are radians/second.         

##### Time_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer Z axis,
    obtained with body linear acceleration derived in time.  The units are radians/second.         

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer X axis,
    obtained with body linear acceleration derived in time.  The units are radians/second.    

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer Y axis,
    obtained with body linear acceleration derived in time.  The units are radians/second.    

##### Time_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer Z axis,
    obtained with body linear acceleration derived in time.  The units are radians/second.      

##### Time_Of_Body_Gyroscope_(mean)(Axis-X)  
    Average Mean value of the body angular velocity signals from the smartphone gyroscope X axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.       

##### Time_Of_Body_Gyroscope_(mean)(Axis-Y)  
    Average Mean value of the body angular velocity signals from the smartphone gyroscope Y axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.       

##### Time_Of_Body_Gyroscope_(mean)(Axis-Z)" 
    Average Mean value of the body angular velocity signals from the smartphone gyroscope Z axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.      

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-X)
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope X axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.        

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-Y)
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope Y axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.     

##### Time_Of_Body_Gyroscope_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope Z axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in time.     

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-X)"
    Average Mean value of the Jerk signal for each window sample from the smartphone gyroscope X axis,
    obtained with body angular velocity derived in time. The units are radians/second.  

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Y)  
    Average Mean value of the Jerk signal for each window sample from the smartphone gyroscope Y axis,
    obtained with body angular velocity derived in time. The units are radians/second.   

##### Time_Of_Body_Gyroscope_Jerk_(mean)(Axis-Z)  
    Average Mean value of the Jerk signal for each window sample from the smartphone gyroscope Z axis,
    obtained with body angular velocity derived in time. The units are radians/second.    

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone gyroscope X axis,
    obtained with body angular velocity derived in time. The units are radians/second.   

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone gyroscope Y axis,
    obtained with body angular velocity derived in time. The units are radians/second.    

##### Time_Of_Body_Gyroscope_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone gyroscope Z axis,
    obtained with body angular velocity derived in time. The units are radians/second.     

##### Time_Of_Body_Accelerometer_Magnitude_(mean)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer,
    obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time.  

##### Time_Of_Body_Accelerometer_Magnitude_(standard deviation)
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer,
    obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time.   
    
##### Time_Of_GravityAccelerometer_Magnitude_(mean)  
    Average Mean value of the gravity acceleration signals from the smartphone accelerometer,
    obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time. 

##### Time_Of_GravityAccelerometer_Magnitude_(standard deviation)  
    Average Standard Deviation value of the gravity acceleration signals from the smartphone accelerometer,
    obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time. 

##### Time_Of_Body_Accelerometer_Jerk_Magnitude_(mean)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer, obtained with 
    body linear acceleration and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in time.  The units are radians/second.    

##### Time_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer, obtained with 
    body linear acceleration and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in time.  The units are radians/second.  

##### Time_Of_Body_Gyroscope_Magnitude_(mean)  
    Average Mean value of the body angular velocity signals from the smartphone gyroscope,
    obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time.  

##### Time_Of_Body_Gyroscope_Magnitude_(standard deviation)  
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope, obtained by 
    magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in time. 

##### Time_Of_Body_Gyroscope_Jerk_Magnitude_(mean)  
    Average Mean value of the Jerk signal for each window sample from the smartphone gyroscope, obtained with body 
    angular velocity and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in time.  The units are radians/second.    

##### Time_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone gyroscope, obtained with 
    body angular velocity and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in time.  The units are radians/second.  

##### Freq_Of_Body_Accelerometer_(mean)(Axis-X)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.   

##### Freq_Of_Body_Accelerometer_(mean)(Axis-Y)  
    Average Mean value of the body acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.  

##### Freq_Of_Body_Accelerometer_(mean)(Axis-Z)  
    Average Mean value of the the body acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-X)
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer X axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.  

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Y)" 
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer Y axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.  

##### Freq_Of_Body_Accelerometer_(standard deviation)(Axis-Z)
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer Z axis,
    obtained by subtracting the gravity unit 'g' from the total acceleration derived in frequency.   

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-X)          
    Average weighted average of the frequency components to obtain a mean frequency value of the body acceleration signals 
    from the smartphone accelerometer X axis, obtained by subtracting the gravity unit 'g' from the total acceleration 
    derived in frequency.    

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-Y)     
    Average weighted average of the frequency components to obtain a mean frequency value of the body acceleration signals 
    from the smartphone accelerometer Y axis, obtained by subtracting the gravity unit 'g' from the total acceleration 
    derived in frequency.    

##### Freq_Of_Body_Accelerometer_(weighted average)(Axis-Z)  
    Average weighted average of the frequency components to obtain a mean frequency value of the body acceleration signals 
    from the smartphone accelerometer Z axis, obtained by subtracting the gravity unit 'g' from the total acceleration 
    derived in frequency.    

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-X)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer X axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.  

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Y)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer Y axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.  

##### Freq_Of_Body_Accelerometer_Jerk_(mean)(Axis-Z)  
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer Z axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.  

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-X)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer X axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.   

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Y)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer Y axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.     

##### Freq_Of_Body_Accelerometer_Jerk_(standard deviation)(Axis-Z)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer Z axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.     
    
##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-X)  
    Average weighted average of the frequency components to obtain a mean frequency value of 
    the Jerk signal for each window sample from the smartphone accelerometer X axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.    
    
##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Y)  
    Average weighted average of the frequency components to obtain a mean frequency value 
    the Jerk signal for each window sample from the smartphone accelerometer Y axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.   

##### Freq_Of_Body_Accelerometer_Jerk_(weighted average)(Axis-Z)  
    Average weighted average of the frequency components to obtain a mean frequency value 
        the Jerk signal for each window sample from the smartphone accelerometer Z axis,
    obtained with body linear acceleration derived in frequency. The units are radians/second.  
   
##### Freq_Of_Body_Gyroscope_(mean)(Axis-X)                         
     Average Mean value of the body angular velocity signals from the smartphone gyroscope X axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.   

##### Freq_Of_Body_Gyroscope_(mean)(Axis-Y)                         
    Average Mean value of the body angular velocity signals from the smartphone gyroscope Y axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.  

##### Freq_Of_Body_Gyroscope_(mean)(Axis-Z)                         
    Average Mean value of the body angular velocity signals from the smartphone gyroscope Z axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.  

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-X)           
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope X axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.  

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Y)           
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope Y axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.   

##### Freq_Of_Body_Gyroscope_(standard deviation)(Axis-Z)           
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope Z axis,
    obtained by subtracting the gravity unit 'g' from the total angular velocity derived in frequency.  

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-X)             
    Average weighted average of the frequency components to obtain a mean frequency value of the body angular velocity signals 
    from the smartphone accelerometer X axis, obtained by subtracting the gravity unit 'g' from the total angular velocity 
    derived in frequency.    

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-Y)             
    Average weighted average of the frequency components to obtain a mean frequency value of the body angular velocity signals 
    from the smartphone accelerometer Y axis, obtained by subtracting the gravity unit 'g' from the total angular velocity 
    derived in frequency.

##### Freq_Of_Body_Gyroscope_(weighted average)(Axis-Z)             
    Average weighted average of the frequency components to obtain a mean frequency value of the body angular velocity signals 
    from the smartphone accelerometer Z axis, obtained by subtracting the gravity unit 'g' from the total angular velocity 
    derived in frequency.

##### Freq_Of_Body_Accelerometer_Magnitude_(mean)         
    Average Mean value of the body acceleration signals from the smartphone accelerometer, obtained by magnitude of these 
    three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency.  

##### Freq_Of_Body_Accelerometer_Magnitude_(standard deviation)     
    Average Standard Deviation value of the body acceleration signals from the smartphone accelerometer, obtained by 
    magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency.  

##### Freq_Of_Body_Accelerometer_Magnitude_(weighted average)       
    Average weighted average of the frequency components to obtain a mean frequency value of the body acceleration signals 
    from the smartphone accelerometer, obtained by magnitude of these three-dimensional (XYZ axis) signals calculated 
    using the Euclidean norm derived in frequency.  

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(mean)              
    Average Mean value of the Jerk signal for each window sample from the smartphone accelerometer, obtained with 
    body linear acceleration and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in frequency.  The units are radians/second.  

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(standard deviation)  
    Average Standard Deviation value of the Jerk signal for each window sample from the smartphone accelerometer,
    obtained with body linear acceleration and magnitude of these three-dimensional (XYZ axis) signals calculated using 
    the Euclidean norm derived in frequency.  The units are radians/second.  

##### Freq_Of_Body_Accelerometer_Jerk_Magnitude_(weighted average)  
    Average weighted average of the frequency components to obtain a mean frequency value of the Jerk signal for 
    each window sample from the smartphone accelerometer, obtained with body linear acceleration and magnitude of 
    these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency. 
    The units are radians/second.   

##### Freq_Of_Body_Gyroscope_Magnitude_(mean)                       
    Average Mean value of the body angular velocity signals from the smartphone gyroscope, obtained by magnitude of 
    these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency. 

##### Freq_Of_Body_Gyroscope_Magnitude_(standard deviation)         
    Average Standard Deviation value of the body angular velocity signals from the smartphone gyroscope, obtained by 
    magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency.   

##### Freq_Of_Body_Gyroscope_Magnitude_(weighted average)           
    Average weighted average of the frequency components to obtain a mean frequency value of the body angular velocity signals 
    from the smartphone gyroscope, obtained by magnitude of these three-dimensional (XYZ axis) signals calculated using the
    Euclidean norm derived in frequency.  

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(mean)                  
    Average Mean value of the Jerk signal for each window sample from the smartphone gyroscope, obtained with body angular velocity 
    and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm derived in frequency.
    The units are radians/second. 

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(standard deviation)    
    Average Standard Deviation value of t the Jerk signal for each window sample from the smartphone gyroscope, obtained with 
    body angular velocity and magnitude of these three-dimensional (XYZ axis) signals calculated using the Euclidean norm 
    derived in frequency. The units are radians/second.  

##### Freq_Of_Body_Gyroscope_Jerk_Magnitude_(weighted average)    
    Average weighted average of the frequency components to obtain a mean frequency value of the Jerk signal for each window sample 
    from the smartphone gyroscope, obtained with body angular velocity and magnitude of these three-dimensional (XYZ axis) signals 
    calculated using the Euclidean norm derived in frequency.  The units are radians/second.  
    
    


#### Reference:  
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
