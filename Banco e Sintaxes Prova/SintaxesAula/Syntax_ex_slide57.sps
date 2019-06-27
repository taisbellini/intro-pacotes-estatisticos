********* ITEM 1.
IF  (FUMO = 0 & ATIVIDADE = 1) FUMOATIV=1.
IF  (FUMO = 0 & ATIVIDADE = 2) FUMOATIV=2.
IF  (FUMO = 1 & ATIVIDADE = 1) FUMOATIV=3.
IF  (FUMO = 1 & ATIVIDADE = 2) FUMOATIV=4.
EXECUTE.

* Define Variable Properties.
*FUMOATIV.
VALUE LABELS FUMOATIV
  1.00 'Não fumantes sedentários'
  2.00 'Não fumantes atividade moderada'
  3.00 'Fumantes sendentários'
  4.00 'Fumantes de atividade moderada'.
EXECUTE.



****** ITENS 2 a 4.

* Visual Binning.
*IMC.
RECODE  IMC (MISSING=COPY) (30.0 THRU HI=1) (LO THRU HI=0) (ELSE=SYSMIS) INTO IMCbin.
VARIABLE LABELS  IMCbin 'IMC (Binned)'.
FORMATS  IMCbin (F5.0).
VALUE LABELS  IMCbin 0 '< 30,00' 1 '30,00+'.
VARIABLE LEVEL  IMCbin (ORDINAL).
*GLICOSE.
RECODE  GLICOSE (MISSING=COPY) (100.0 THRU HI=1) (LO THRU HI=0) (ELSE=SYSMIS) INTO GLICbin.
VARIABLE LABELS  GLICbin 'Nível de Glicose (em mg%) (Binned)'.
FORMATS  GLICbin (F5.0).
VALUE LABELS  GLICbin 0 '< 100' 1 '100+'.
VARIABLE LEVEL  GLICbin (ORDINAL).
*SISTOLICA.
RECODE  SISTOLICA (MISSING=COPY) (120.0 THRU HI=1) (LO THRU HI=0) (ELSE=SYSMIS) INTO SISbin.
VARIABLE LABELS  SISbin 'Pressão sistólica (em mmHg) (Binned)'.
FORMATS  SISbin (F5.0).
VALUE LABELS  SISbin 0 '< 120' 1 '120+'.
VARIABLE LEVEL  SISbin (ORDINAL).
EXECUTE.



******** ITEM 5.

COUNT Sintomas=IMCbin GLICbin SISbin(1).
EXECUTE.

COMPUTE Sintomas2=IMCbin + GLICbin + SISbin.
EXECUTE.
