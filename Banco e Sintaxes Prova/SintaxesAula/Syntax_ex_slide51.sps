******* ITEM 1.
DATASET ACTIVATE DataSet1.
COMPUTE IMC=PESO / ((ALTURA / 100) ** 2).
EXECUTE.

* Visual Binning.
*IMC.
RECODE  IMC (MISSING=COPY) (30.0 THRU HI=3) (25.0 THRU HI=2) (LO THRU HI=1) (ELSE=SYSMIS) INTO 
    IMCcat.
VARIABLE LABELS  IMCcat 'IMC (Binned)'.
FORMATS  IMCcat (F5.0).
VALUE LABELS  IMCcat 1 '< 25,00' 2 '25,00 - 29,99' 3 '30,00+'.
VARIABLE LEVEL  IMCcat (ORDINAL).
EXECUTE.



********** ITEM 2.
DATASET ACTIVATE DataSet1.
* Visual Binning.
*COLESTEROL.
RECODE  COLESTEROL (MISSING=COPY) (LO THRU 188.0=1) (LO THRU 216.0=2) (LO THRU 238.5=3) (LO THRU 
    HI=4) (ELSE=SYSMIS) INTO Colesterol_quartis.
VARIABLE LABELS  Colesterol_quartis 'Nível de Colesterol Sérico (em mg%) (Binned)'.
FORMATS  Colesterol_quartis (F5.0).
VALUE LABELS  Colesterol_quartis 1 '<= 188' 2 '189 - 216' 3 '217 - 239' 4 '240+'.
VARIABLE LEVEL  Colesterol_quartis (ORDINAL).
EXECUTE.
