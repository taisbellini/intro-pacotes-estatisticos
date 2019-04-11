
DATASET ACTIVATE DataSet1.
IF  (sex = 1 & race = 1) sexrace=1.
IF  (sex = 1 & race = 2) sexrace=2.
IF  (sex = 1 & race = 3) sexrace=3.
IF  (sex = 2 & race = 1) sexrace=4.
IF  (sex = 2 & race = 2) sexrace=5.
IF  (sex = 2 & race = 3) sexrace=6.
EXECUTE.
