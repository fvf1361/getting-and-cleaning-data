### Final project of "getting and cleaning data"
#### file contents
this reposoitory contains the following items
- `readme.md`
- `codebook.md` : describes the variables, the data, and any transformations or work performed to clean up the data
- `run_analysis.R` : the R script to read, merge and clean up the data
- `tidy_data.txt` : the final tidy dataset.

#### workflow
The R script does the following in the same order:
- loading the required libraries
- reading in the data
- merging the training and test sets
- extracting mean and std from merged data
- adding descriptive activity names
- adding descriptive variable names
- removing unnecessary objects from memory
- creating an independent tidy dataset with mean of each variable calculated
- writing the tidy data to a file called `tidy_data.txt`

