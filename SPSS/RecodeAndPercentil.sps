*frequencia da variavel climate.

DATASET ACTIVATE DataSet2.
FREQUENCIES VARIABLES=climate
  /ORDER=ANALYSIS.

*classificar o clima em temperado, tropical e outro.
RECODE climate (5=1) (8=2) (MISSING=SYSMIS) (ELSE=3) INTO climate_3cat.
VARIABLE LABELS  climate_3cat 'Clima em 3 categorias'.
EXECUTE.

* Visual Binning.
*populatn.
RECODE  populatn (MISSING=COPY) (LO THRU 5100.0=1) (LO THRU 10400.0=2) (LO THRU 35600.0=3) (LO THRU 
    HI=4) (ELSE=SYSMIS) INTO populatn_quartis.
VARIABLE LABELS  populatn_quartis 'Population in thousands (Binned)'.
FORMATS  populatn_quartis (F5.0).
VALUE LABELS  populatn_quartis 1 '<= 5100' 2 '5101 - 10400' 3 '10401 - 35600' 4 '35601+'.
VARIABLE LEVEL  populatn_quartis (ORDINAL).
EXECUTE.

FREQUENCIES VARIABLES=populatn_quartis
  /ORDER=ANALYSIS.