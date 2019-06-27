
DATASET ACTIVATE DataSet1.

*DEFINIR RÓTULOS PARA AS VARIÁVEIS E VALORES.

* Define Variable Properties.
*id.
VARIABLE LABELS  id 'Número do Respondente'.
*idadecasam.
VARIABLE LABELS  idadecasam 'Idade quando casou'.
*filhos.
VARIABLE LABELS  filhos 'Número de filhos'.
*idade.
VARIABLE LABELS  idade 'Idade'.
*sexo.
VARIABLE LABELS  sexo 'Sexo'.
VALUE LABELS sexo
  1 'Masculino'
  2 'Feminino'.
EXECUTE.

*IDENTIFICAR CASOS DUPLICADOS.
*Cria uma coluna que indica e é duplicado ou nao (PrimaryLast).

* Identify Duplicate Cases.
SORT CASES BY id(A) filhos(A) idade(A) idadecasam(A) sexo(A).
MATCH FILES
  /FILE=*
  /BY id filhos idade idadecasam sexo
  /FIRST=PrimaryFirst
  /LAST=PrimaryLast.
DO IF (PrimaryFirst).
COMPUTE  MatchSequence=1-PrimaryLast.
ELSE.
COMPUTE  MatchSequence=MatchSequence+1.
END IF.
LEAVE  MatchSequence.
FORMATS  MatchSequence (f7).
COMPUTE  InDupGrp=MatchSequence>0.
SORT CASES InDupGrp(D).
MATCH FILES
  /FILE=*
  /DROP=PrimaryFirst InDupGrp MatchSequence.
VARIABLE LABELS  PrimaryLast 'Indicator of each last matching case as Primary'.
VALUE LABELS  PrimaryLast 0 'Duplicate Case' 1 'Primary Case'.
VARIABLE LEVEL  PrimaryLast (ORDINAL).
FREQUENCIES VARIABLES=PrimaryLast.
EXECUTE.

*TABELA DE FREQUENCIAS.

FREQUENCIES VARIABLES=idadecasam filhos idade sexo
  /ORDER=ANALYSIS.

*CRIAR CATEGORIAS DE VARIAVEIS.
*cria uma variavel que indica em qual quartil de idade que casou se encontra aquela pessoa.

DATASET ACTIVATE DataSet1.
* Visual Binning.
*idadecasam.
RECODE  idadecasam (MISSING=COPY) (LO THRU 20.0=1) (LO THRU 22.0=2) (LO THRU 25.0=3) (LO THRU HI=4) 
    (ELSE=SYSMIS) INTO idadecasam_cat.
VARIABLE LABELS  idadecasam_cat 'Idade quando casou (Binned)'.
FORMATS  idadecasam_cat (F5.0).
VALUE LABELS  idadecasam_cat 1 '<= 20' 2 '21 - 22' 3 '23 - 25' 4 '26+'.
VARIABLE LEVEL  idadecasam_cat (ORDINAL).
EXECUTE.

*MERGE 2 BANCOS IGUAIS.
*dois bancos com as mesmas variaveis.
ADD FILES /FILE=*
  /RENAME (idadecasam_cat PrimaryLast=d0 d1)
  /FILE='C:\Users\bellini\workspace\intro-pacotes-estatisticos\Banco e Sintaxes Prova\Prova_p2.sav'
  /DROP=d0 d1.
EXECUTE.

*MERGE 2 BANCOS DIFERENTES.
*adicionar colunas em um banco a partir de outro.
MATCH FILES /FILE=*
  /FILE='C:\Users\bellini\workspace\intro-pacotes-estatisticos\Banco e Sintaxes '+
    'Prova\Prova_var2.sav'
  /BY id.
EXECUTE.

*DAR LABELS para as novas variaveis.

* Define Variable Properties.
*nflideal.
VARIABLE LABELS  nflideal 'Número de filhos que considera ideal'.
*horastv.
VARIABLE LABELS  horastv 'Número de horas de TV por dia'.
*casa.
VARIABLE LABELS  casa 'Casa própria ou alugada?'.
VALUE LABELS casa
  1 'Propria'
  2 'Alugada'.
*superior.
VARIABLE LABELS  superior 'Concluiu curso superior?'.
VALUE LABELS superior
  1 'Sim'
  2 'Nao'.
EXECUTE.
