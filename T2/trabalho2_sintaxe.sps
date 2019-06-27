
DATASET ACTIVATE DataSet1.

*Corrigir o tipo das variaveis. 
* Define Variable Properties.
*escolaridade_num.
VARIABLE LEVEL  escolaridade_num(ORDINAL).
*horas_sono_num.
VARIABLE LEVEL  horas_sono_num(ORDINAL).
*desempenho_estudo_num.
VARIABLE LEVEL  desempenho_estudo_num(ORDINAL).
EXECUTE.


*Tarefa 1 - dar labels para todas as variaveis (as que nao estao listadas ja estavam com label anteriormente).

* Define Variable Properties.
*altura.
VARIABLE LABELS  altura 'Altura em metros'.
*peso.
VARIABLE LABELS  peso 'Peso em kg'.
*escolaridade_num.
VARIABLE LABELS  escolaridade_num 'Grau de escolaridade'.
*estudante_num.
VARIABLE LABELS  estudante_num 'Se é estudante'.
*id.
VARIABLE LABELS  id 'Identificador'.
*tipo_trabalhador_num.
VARIABLE LABELS  tipo_trabalhador_num 'Tipo de vínculo empregatício'.
*vezes_doente_num.
VARIABLE LABELS  vezes_doente_num 'Quantas vezes ficou doente no ano'.
EXECUTE.

*Tarefa 2 - colocar o missing 999 para horas de estudo. (outras foram conferidas e ja estavam indicando o valor missing).

* Define Variable Properties.
*horas_estudo_num.
MISSING VALUES horas_estudo_num(999).
EXECUTE.

*Tarefa 3 - Recodificar variaveis categoricas ordinais de forma que os codigos numericos respeitem a natureza ordinal.

*Grau de escolaridade.
RECODE escolaridade_num (3=4)(4=3) (ELSE=Copy) INTO escolaridade_rank.
VARIABLE LABELS  escolaridade_rank 'Grau de Escolaridade'.

*Horas de sono.
RECODE horas_sono_num (3=1)(1=2)(2=3) (ELSE=Copy) INTO horas_sono_rank.
VARIABLE LABELS  horas_sono_rank 'Horas de sono por dia'.

*Acucar e origem animal.
RECODE acucar_num origem_animal_num (2=1) (3=2) (1=3) (ELSE=Copy) INTO acucar_rank 
    origem_animal_rank.
VARIABLE LABELS  acucar_rank 'Frequencia que consome acucar' /origem_animal_rank 'Frequencia que '+
    'consome alimentos de origem animal'.

*Desempenho academico.
RECODE desempenho_estudo_num (5=1) (1=2) (2=3) (3=4) (6=5) (4=6) (ELSE=Copy) INTO 
    desempenho_estudo_rank.
VARIABLE LABELS  desempenho_estudo_rank 'Desempenho academico'.

*Desempenho profissional.
RECODE desempenho_trabalho_num (2=1) (1=2) (ELSE=Copy) INTO desempenho_trabalho_rank.
VARIABLE LABELS  desempenho_trabalho_rank 'Desempenho profissional'.

*Frequencia que sente cansaco.
RECODE cansado_num (2=1) (1=2) (ELSE=Copy) INTO cansado_rank.
VARIABLE LABELS  cansado_rank 'Frequencia que sente cansaço'.

*Quantas vezes ficou doente.
RECODE vezes_doente_num (3=1) (1=2) (2=3) INTO vezes_doente_rank.
VARIABLE LABELS  vezes_doente_rank 'Quantas vezes ficou doente no ano'.
EXECUTE.

*Adicionar labels aos valores recodificados:

*escolaridade_rank.
VARIABLE LEVEL  escolaridade_rank(ORDINAL).
FORMATS  escolaridade_rank(F8.0).
VALUE LABELS escolaridade_rank
  1 'Ensino Fundamental Completo'
  2 'Ensino Medio Completo'
  3 'Ensino Superior Incompleto'
  4 'Ensino Superior Completo'.
*horas_sono_rank.
VARIABLE LEVEL  horas_sono_rank(ORDINAL).
FORMATS  horas_sono_rank(F8.0).
VALUE LABELS horas_sono_rank
  1 'Menos de 6 horas'
  2 '6 a 8 horas'
  3 '8 horas'.
*acucar_rank.
VARIABLE LEVEL  acucar_rank(ORDINAL).
FORMATS  acucar_rank(F8.0).
VALUE LABELS acucar_rank
  1 'Nunca'
  2 'Raramente'
  3 'Alguns dias na semana'
  4 'Todos os dias, em 1 ou 2 refeicoes'
  5 'Todos os dias, em todas as refeicoes'.
*origem_animal_rank.
VARIABLE LEVEL  origem_animal_rank(ORDINAL).
FORMATS  origem_animal_rank(F8.0).
VALUE LABELS origem_animal_rank
  1 'Nunca'
  2 'Raramente'
  3 'Alguns dias na semana'
  4 'Todos os dias, em 1 ou duas refeicoes'
  5 'Todos os dias, em todas as refeicoes'.
*desempenho_estudo_rank.
VARIABLE LEVEL  desempenho_estudo_rank(ORDINAL).
FORMATS  desempenho_estudo_rank(F8.0).
MISSING VALUES desempenho_estudo_rank(7).
VALUE LABELS desempenho_estudo_rank
  1 'Quase sempre nota A'
  2 'Notas variam entre A e B'
  3 'Notas variam entre A, B e C'
  4 'Notas variam entre B e C'
  5 'Quase sempre nota C'
  6 'Notas variam entre C e D'.
*desempenho_trabalho_rank.
VARIABLE LEVEL  desempenho_trabalho_rank(ORDINAL).
FORMATS  desempenho_trabalho_rank(F8.0).
MISSING VALUES desempenho_trabalho_rank(5).
VALUE LABELS desempenho_trabalho_rank
  1 'Excelente'
  2 'Bom'
  3 'Regular'
  4 'Ruim'.
*cansado_rank.
VARIABLE LEVEL  cansado_rank(ORDINAL).
FORMATS  cansado_rank(F8.0).
VALUE LABELS cansado_rank
  1 'Raramente'
  2 'Apenas quando dorme pouco'
  3 'Sempre'.
*vezes_doente_rank.
VARIABLE LEVEL  vezes_doente_rank(ORDINAL).
FORMATS  vezes_doente_rank(F8.0).
VALUE LABELS vezes_doente_rank
  1 'Nenhuma'
  2 '1 ou 2'
  3 '3 ou mais'.
EXECUTE. 

*Tarefa 4 - criar a variavel IMC= peso_kg/(altura_m2).
COMPUTE imc=peso / (altura * altura).
VARIABLE LABELS  imc 'IMC'.
EXECUTE.

*Tarefa 5 - criar a varaivel idade em 31/05/2019.
COMPUTE idade=DATEDIFF(DATE.DMY(31,5,2019),nascimento,"days")/365.25.
VARIABLE LABELS  idade 'idade em 31 de maio de 2019'.
EXECUTE.

*Tarefa 6 - Criar a variavel idade dividida em quartis.
* Visual Binning.
*idade.
RECODE  idade (MISSING=COPY) (LO THRU 23.72347707049966=1) (LO THRU 28.227241615331966=2) (LO THRU 
    32.4435318275154=3) (LO THRU HI=4) (ELSE=SYSMIS) INTO idade_quartis.
VARIABLE LABELS  idade_quartis 'Idade em quartis (Binned)'.
FORMATS  idade_quartis (F5.0).
VALUE LABELS  idade_quartis 1 '' 2 '' 3 '' 4 ''.
VARIABLE LEVEL  idade_quartis (ORDINAL).
EXECUTE.

*Tarefa 7 - conferencia geral via frequencias.
FREQUENCIES VARIABLES=nascimento altura peso genero_num estudante_num turno_num empregado_num 
    tipo_trabalhador_num foi_medico_num medicacao_num doador_num doador_sentiu_mal_num 
    doador_familia_num horas_estudo_num exercicios_fisicos_num escolaridade_rank horas_sono_rank 
    acucar_rank origem_animal_rank desempenho_estudo_rank desempenho_trabalho_rank cansado_rank 
    vezes_doente_rank imc idade idade_quartis
  /ORDER=ANALYSIS.
EXECUTE.