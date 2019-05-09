DATASET ACTIVATE DataSet1.
SORT CASES BY sex(D) agewed(A).

DATASET COPY  GSS93_female_married_under20.
DATASET ACTIVATE  GSS93_female_married_under20.
FILTER OFF.
USE ALL.
SELECT IF (agewed < 20 & sex = 2).
EXECUTE.
DATASET ACTIVATE  DataSet1.