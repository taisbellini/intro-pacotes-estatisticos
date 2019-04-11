
* Define Variable Properties.
*nascimento.

ALTER TYPE  nascimento(SDATE10).
*nascimento.
VARIABLE LABELS  nascimento 'Data de nascimento'.
FORMATS  nascimento(SDATE10).
*genero.
VARIABLE LABELS  genero 'G�nero'.
VALUE LABELS genero
  'Feminino         ' '1'
  'Masculino        ' '2'
  'Prefiro n�o dizer' '0'.
*escolaridade.
VALUE LABELS escolaridade
  'Ensino Fundamental completo' '1'
  'Ensino M�dio completo      ' '2'
  'Ensino Superior completo   ' '4'
  'Ensino Superior incompleto ' '3'.
*peso.
FORMATS  peso(COMMA4.2).
*horas_sono.
VARIABLE LABELS  horas_sono 'Horas de sono por dia'.
VALUE LABELS horas_sono
  '6 a 8 horas     ' '2'
  'Mais de 8 horas ' '3'
  'Menos de 6 horas' '1'.
*exercicios_fisicos.
VARIABLE LABELS  exercicios_fisicos 'Frequ�ncia exerc�cios f�sicos'.
VALUE LABELS exercicios_fisicos
  'Nenhuma' '0'.
*acucar.
VARIABLE LABELS  acucar 'Frequ�ncia que consome a��car'.
VALUE LABELS acucar
  'Alguns dias na semana               ' '2'
  'Nunca                               ' '0'
  'Raramente                           ' '1'
  'Todos os dias, em 1 ou 2 refei��es  ' '3'
  'Todos os dias, em todas as refei��es' '4'.
*origem_animal.
VARIABLE LABELS  origem_animal 'Frequ�ncia que consome alimentos de origem animal'.
VALUE LABELS origem_animal
  'Alguns dias na semana               ' '2'
  'Nunca                               ' '0'
  'Raramente                           ' '1'
  'Todos os dias, em 1 ou 2 refei��es  ' '3'
  'Todos os dias, em todas as refei��es' '4'.
*estudante.
VALUE LABELS estudante
  'N�o' '0'
  'Sim' '1'.
*turno.
VARIABLE LABELS  turno 'Turno que estuda'.
MISSING VALUES turno('        ').
VALUE LABELS turno
  'Mais de um turno' '4'
  'Manh�           ' '1'
  'Noite           ' '3'
  'Tarde           ' '2'.
*horas_estudo.
VARIABLE LABELS  horas_estudo 'Quantas horas estuda em casa'.
MISSING VALUES horas_estudo('NA').
*desempenho_estudo.
VARIABLE LABELS  desempenho_estudo 'Desempenho academico'.
MISSING VALUES desempenho_estudo('        ').
VALUE LABELS desempenho_estudo
  'Notas variam entre A e B (A � equivalente ao intervalo 9 a 10; B � equivalente ao intervalo '+
    '7,5 a 9)                                         ' '2'
  'Notas variam entre A, B e C (A � equivalente ao intervalo 9 a 10; B � equivalente ao '+
    'intervalo 7,5 a 9; C � equivalente ao intervalo 6 a 7,5)' '3'
  'Notas variam entre B e C (B � equivalente ao intervalo 7,5 a 9; C � equivalente ao intervalo '+
    '6 a 7,5)                                        ' '4'
  'Notas variam entre C e D (C � equivalente ao intervalo 6 a 7,5; D � reprova��o)               '+
    '                                               ' '6'
  'Quase sempre nota A (A � equivalente ao intervalo de 9 a 10)                                  '+
    '                                               ' '1'
  'Quase sempre nota C (C � equivalente ao intervalo de 6 a 7,5)                                 '+
    '                                               ' '5'.
*empregado.
VARIABLE LABELS  empregado 'Possui emprego'.
VALUE LABELS empregado
  'N�o' '0'
  'Sim' '1'.
*tipo_trabalhador.
VARIABLE LABELS  tipo_trabalhador 'Tipo de v�nculo empgragat�cio'.
MISSING VALUES tipo_trabalhador('        ').
VALUE LABELS tipo_trabalhador
  'Assalariado(a)      ' '2'
  'Aut�nomo(a)         ' '3'
  'Empres�rio(a)       ' '7'
  'Estagi�rio(a)       ' '1'
  'Freelancer          ' '5'
  'Profissional liberal' '6'
  'Volunt�rio(a)       ' '4'.
*desempenho_trabalho.
VARIABLE LABELS  desempenho_trabalho 'Desempenho profissional'.
MISSING VALUES desempenho_trabalho('        ').
VALUE LABELS desempenho_trabalho
  'Bom                            ' '2'
  'Excelente, dou o m�ximo de mim ' '1'
  'Regular, posso performar melhor' '3'
  'Ruim, n�o estou motivado(a)    ' '4'.
*cansado.
VARIABLE LABELS  cansado 'Frequ�ncia que sente cansa�o'.
VALUE LABELS cansado
  'Apenas quando durmo pouco              ' '2'
  'Raramente                              ' '1'
  'Sempre, independente do quanto eu durmo' '3'.
*vezes_doente.
VALUE LABELS vezes_doente
  '1 a 2    ' '1'
  '3 ou mais' '2'
  'Nenhuma  ' '0'.
*foi_medico.
VARIABLE LABELS  foi_medico 'Foi ao m�dico quando ficou doente'.
MISSING VALUES foi_medico('        ').
VALUE LABELS foi_medico
  'N�o, em nenhuma' '0'
  'Sim, em algumas' '1'
  'Sim, em todas  ' '2'.
*medicacao.
VARIABLE LABELS  medicacao 'Precisou tomar medica��o'.
MISSING VALUES medicacao('   ').
VALUE LABELS medicacao
  'N�o' '0'
  'Sim' '1'.
*doador.
VARIABLE LABELS  doador '� doador de sangue'.
VALUE LABELS doador
  'N�o' '0'
  'Sim' '1'.
*doador_sentiu_mal.
VARIABLE LABELS  doador_sentiu_mal 'Se sentiu mal ao doar sangue'.
MISSING VALUES doador_sentiu_mal('   ').
VALUE LABELS doador_sentiu_mal
  'N�o' '0'
  'Sim' '1'.
*doador_familia.
VARIABLE LABELS  doador_familia 'Familiar se sentiu mal ao doar sangue'.
MISSING VALUES doador_familia('       ').
VALUE LABELS doador_familia
  'N�o    ' '0'
  'N�o sei' '2'
  'Sim    ' '1'.
EXECUTE.

FREQUENCIES VARIABLES=nascimento genero escolaridade altura peso horas_sono exercicios_fisicos 
    acucar origem_animal estudante turno horas_estudo desempenho_estudo empregado tipo_trabalhador 
    desempenho_trabalho cansado vezes_doente foi_medico medicacao doador doador_sentiu_mal 
    doador_familia
  /ORDER=ANALYSIS.

SELECT IF (XDATE.YEAR(nascimento) ~= 2019).
EXECUTE.

