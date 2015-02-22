#Feature Selection 

##Overview
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Dataset files
The dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_train.txt': Each row identifies the subject who performed the training activity. 
* 'test/subject_test.txt': Each row identifies the subject who performed the test activity. 
 
# List of variables in the output tidy data
 It is a data.frame comprised of 180 observations of the following 68 variables:
* Subject                                                                   : int 
* Activity                                                                  : Factor 
* Time.Domain.Body.Acceleration.Mean.X                                      : num 
* Time.Domain.Body.Acceleration.Mean.Y                                      : num 
* Time.Domain.Body.Acceleration.Mean.Z                                      : num 
* Time.Domain.Body.Acceleration.Standard.Deviation.X                        : num  
* Time.Domain.Body.Acceleration.Standard.Deviation.Y                        : num 
* Time.Domain.Body.Acceleration.Standard.Deviation.Z                        : num  
* Time.Domain.Gravity.Acceleration.Mean.X                                   : num  
* Time.Domain.Gravity.Acceleration.Mean.Y                                   : num  
* Time.Domain.Gravity.Acceleration.Mean.Z                                   : num 
* Time.Domain.Gravity.Acceleration.Standard.Deviation.X                     : num  
* Time.Domain.Gravity.Acceleration.Standard.Deviation.Y                     : num 
* Time.Domain.Gravity.Acceleration.Standard.Deviation.Z                     : num  
* Time.Domain.Body.AccelerationJerk.Mean.X                                  : num  
* Time.Domain.Body.AccelerationJerk.Mean.Y                                  : num  
* Time.Domain.Body.AccelerationJerk.Mean.Z                                  : num  
* Time.Domain.Body.AccelerationJerk.Standard.Deviation.X                    : num  
* Time.Domain.Body.AccelerationJerk.Standard.Deviation.Y                    : num  
* Time.Domain.Body.AccelerationJerk.Standard.Deviation.Z                    : num  
* Time.Domain.BodyAngular.Speed.Mean.X                                      : num  
* Time.Domain.BodyAngular.Speed.Mean.Y                                      : num  
* Time.Domain.BodyAngular.Speed.Mean.Z                                      : num  
* Time.Domain.BodyAngular.Speed.Standard.Deviation.X                        : num  
* Time.Domain.BodyAngular.Speed.Standard.Deviation.Y                        : num 
* Time.Domain.BodyAngular.Speed.Standard.Deviation.Z                        : num  
* Time.Domain.BodyAngular.Acceleration.Mean.X                               : num 
* Time.Domain.BodyAngular.Acceleration.Mean.Y                               : num 
* Time.Domain.BodyAngular.Acceleration.Mean.Z                               : num  
* Time.Domain.BodyAngular.Acceleration.Standard.Deviation.X                 : num  
* Time.Domain.BodyAngular.Acceleration.Standard.Deviation.Y                 : num  
* Time.Domain.BodyAngular.Acceleration.Standard.Deviation.Z                 : num  
* Time.Domain.Body.AccelerationMagnitude.Mean.                              : num  
* Time.Domain.Body.AccelerationMagnitude.Standard.Deviation.                : num  
* Time.Domain.Gravity.AccelerationMagnitude.Mean.                           : num  
* Time.Domain.Gravity.AccelerationMagnitude.Standard.Deviation.             : num  
* Time.Domain.Body.AccelerationJerkMagnitude.Mean.                          : num  
* Time.Domain.Body.AccelerationJerkMagnitude.Standard.Deviation.            : num  
* Time.Domain.BodyAngular.SpeedMagnitude.Mean.                              : num  
* Time.Domain.BodyAngular.SpeedMagnitude.Standard.Deviation.                : num  
* Time.Domain.BodyAngular.AccelerationMagnitude.Mean.                       : num  
* Time.Domain.BodyAngular.AccelerationMagnitude.Standard.Deviation.         : num  
* Frequency.Domain.Body.Acceleration.Mean.X                                 : num 
* Frequency.Domain.Body.Acceleration.Mean.Y                                 : num  
* Frequency.Domain.Body.Acceleration.Mean.Z                                 : num  
* Frequency.Domain.Body.Acceleration.Standard.Deviation.X                   : num  
* Frequency.Domain.Body.Acceleration.Standard.Deviation.Y                   : num  
* Frequency.Domain.Body.Acceleration.Standard.Deviation.Z                   : num  
* Frequency.Domain.Body.AccelerationJerk.Mean.X                             : num  
* Frequency.Domain.Body.AccelerationJerk.Mean.Y                             : num 
* Frequency.Domain.Body.AccelerationJerk.Mean.Z                             : num 
* Frequency.Domain.Body.AccelerationJerk.Standard.Deviation.X               : num 
* Frequency.Domain.Body.AccelerationJerk.Standard.Deviation.Y               : num  
* Frequency.Domain.Body.AccelerationJerk.Standard.Deviation.Z               : num  
* Frequency.Domain.BodyAngular.Speed.Mean.X                                 : num  
* Frequency.Domain.BodyAngular.Speed.Mean.Y                                 : num  
* Frequency.Domain.BodyAngular.Speed.Mean.Z                                 : num 
* Frequency.Domain.BodyAngular.Speed.Standard.Deviation.X                   : num 
* Frequency.Domain.BodyAngular.Speed.Standard.Deviation.Y                   : num  
* Frequency.Domain.BodyAngular.Speed.Standard.Deviation.Z                   : num  
* Frequency.Domain.Body.AccelerationMagnitude.Mean.                         : num  
* Frequency.Domain.Body.AccelerationMagnitude.Standard.Deviation.           : num  
* Frequency.Domain.BodyBody.AccelerationJerkMagnitude.Mean.                 : num  
* Frequency.Domain.BodyBody.AccelerationJerkMagnitude.Standard.Deviation.   : num  
* Frequency.Domain.BodyBodyAngular.SpeedMagnitude.Mean.                     : num  
* Frequency.Domain.BodyBodyAngular.SpeedMagnitude.Standard.Deviation.       : num  
* Frequency.Domain.BodyBodyAngular.AccelerationMagnitude.Mean.              : num  
* Frequency.Domain.BodyBodyAngular.AccelerationMagnitude.Standard.Deviation.: num  
