
VARSTOCASES
  /MAKE trig FROM tg0 tg1 tg2 tg3 tg4
  /MAKE peso FROM wgt0 wgt1 wgt2 wgt3 wgt4
  /INDEX=Medida(5) 
  /KEEP=patid age gender
  /NULL=KEEP.

DATASET ACTIVATE DataSet1.
GRAPH
  /LINE(MULTIPLE)=MEAN(trig) BY Medida BY patid.
