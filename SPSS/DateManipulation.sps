
DATASET ACTIVATE DataSet1.
COMPUTE age_may02=DATEDIFF(DATE.DMY(2,5,2019),Data_nasc,"days")/365.25.
EXECUTE.
