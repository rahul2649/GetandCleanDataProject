1. The file run_analysis.R is present in the working Directory.
2. There should be to directories inside the working directory namely "test" and "train"
3. The above two directories should contain their respective X, y and subject files

4. The run_analysis.R script reads the files "X_test.txt","y_test.txt" and "subject_test.txt" from the test folder and "X_train.txt","y_train.txt" and "subject_train.txt" from the train folder 
5. X_train and X_test datasets are merged using rbind()
6. y_train and y_test datasets are merged using rbind()
7. subject_train and subject_test datasets are merged using rbind()
8. Each of the above row binds will give us 10299 rows which are then merged using cbind() i.e X, y and subject datasets are merged by columns to 10229 rows and 68 columns. This would complete the Step 1 of the Assignment
9. Then "features.txt" file is read  from the working directory.
10. Here we will find the indexes of the names having Mean or Std as their part(Any feature name containing Mean or Std ignoring values where Mean is accompanied by other characters like meanFreq)
11. With Indexes for columns names having mean or standard deviation retrieved, we subset the merged dataset to obtain a dataset having columns for only Mean or Standard Deviation. This completes Step 2 of Assignment
12. The Activity labels are then substituted for Activity Factors (1=WALKING, 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING ) using merge function. The Activity Code column was removed. This completes step 3 of the Assignment
13. Then the columns in the dataset are names from the feature names by first making feature names readable. To achieve this, following operations were applied on Feature Name
	* Removed brackets ()
	* Removed - 
	* Expanded short Forms
	* Removed Body from names where Bodywas repeating
	* Converted every name to Lowercase
	* Finally Each column was Assigned their respecting Column Names
14. Aggregate function (Mean) is  applied over Subject and Activity Labels to obtain mean for each column by aggregating these two columns. Thus resulting in 30(subjects) * 6 (Activities) = 180 Rows by 68 Columns
15. Write the output to the file "df.txt" in the working directory
16. The file can read by using the following command
	read.table("./df.txt",header=TRUE)   