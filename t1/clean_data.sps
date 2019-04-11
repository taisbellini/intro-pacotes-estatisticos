
* Define Variable Properties.
*nascimento.

ALTER TYPE  nascimento(SDATE10).
*nascimento.
VARIABLE LABELS  nascimento 'Data de nascimento'.
FORMATS  nascimento(SDATE10).
*genero.
VARIABLE LABELS  genero 'Gênero'.
VALUE LABELS genero
  'Feminino         ' '1'
  'Masculino        ' '2'
  'Prefiro não dizer' '0'.
*escolaridade.
VALUE LABELS escolaridade
  'Ensino Fundamental completo' '1'
  'Ensino Médio completo      ' '2'
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
VARIABLE LABELS  exercicios_fisicos 'Frequência exercícios físicos'.
VALUE LABELS exercicios_fisicos
  'Nenhuma' '0'.
*acucar.
VARIABLE LABELS  acucar 'Frequência que consome açúcar'.
VALUE LABELS acucar
  'Alguns dias na semana               ' '2'
  'Nunca                               ' '0'
  'Raramente                           ' '1'
  'Todos os dias, em 1 ou 2 refeições  ' '3'
  'Todos os dias, em todas as refeições' '4'.
*origem_animal.
VARIABLE LABELS  origem_animal 'Frequência que consome alimentos de origem animal'.
VALUE LABELS origem_animal
  'Alguns dias na semana               ' '2'
  'Nunca                               ' '0'
  'Raramente                           ' '1'
  'Todos os dias, em 1 ou 2 refeições  ' '3'
  'Todos os dias, em todas as refeições' '4'.
*estudante.
VALUE LABELS estudante
  'Não' '0'
  'Sim' '1'.
*turno.
VARIABLE LABELS  turno 'Turno que estuda'.
MISSING VALUES turno('        ').
VALUE LABELS turno
  'Mais de um turno' '4'
  'Manhã           ' '1'
  'Noite           ' '3'
  'Tarde           ' '2'.
*horas_estudo.
VARIABLE LABELS  horas_estudo 'Quantas horas estuda em casa'.
MISSING VALUES horas_estudo('NA').
*desempenho_estudo.
VARIABLE LABELS  desempenho_estudo 'Desempenho academico'.
MISSING VALUES desempenho_estudo('        ').
VALUE LABELS desempenho_estudo
  'Notas variam entre A e B (A é equivalente ao intervalo 9 a 10; B é equivalente ao intervalo '+
    '7,5 a 9)                                         ' '2'
  'Notas variam entre A, B e C (A é equivalente ao intervalo 9 a 10; B é equivalente ao '+
    'intervalo 7,5 a 9; C é equivalente ao intervalo 6 a 7,5)' '3'
  'Notas variam entre B e C (B é equivalente ao intervalo 7,5 a 9; C é equivalente ao intervalo '+
    '6 a 7,5)                                        ' '4'
  'Notas variam entre C e D (C é equivalente ao intervalo 6 a 7,5; D é reprovação)               '+
    '                                               ' '6'
  'Quase sempre nota A (A é equivalente ao intervalo de 9 a 10)                                  '+
    '                                               ' '1'
  'Quase sempre nota C (C é equivalente ao intervalo de 6 a 7,5)                                 '+
    '                                               ' '5'.
*empregado.
VARIABLE LABELS  empregado 'Possui emprego'.
VALUE LABELS empregado
  'Não' '0'
  'Sim' '1'.
*tipo_trabalhador.
VARIABLE LABELS  tipo_trabalhador 'Tipo de vínculo empgragatício'.
MISSING VALUES tipo_trabalhador('        ').
VALUE LABELS tipo_trabalhador
  'Assalariado(a)      ' '2'
  'Autônomo(a)         ' '3'
  'Empresário(a)       ' '7'
  'Estagiário(a)       ' '1'
  'Freelancer          ' '5'
  'Profissional liberal' '6'
  'Voluntário(a)       ' '4'.
*desempenho_trabalho.
VARIABLE LABELS  desempenho_trabalho 'Desempenho profissional'.
MISSING VALUES desempenho_trabalho('        ').
VALUE LABELS desempenho_trabalho
  'Bom                            ' '2'
  'Excelente, dou o máximo de mim ' '1'
  'Regular, posso performar melhor' '3'
  'Ruim, não estou motivado(a)    ' '4'.
*cansado.
VARIABLE LABELS  cansado 'Frequência que sente cansaço'.
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
VARIABLE LABELS  foi_medico 'Foi ao médico quando ficou doente'.
MISSING VALUES foi_medico('        ').
VALUE LABELS foi_medico
  'Não, em nenhuma' '0'
  'Sim, em algumas' '1'
  'Sim, em todas  ' '2'.
*medicacao.
VARIABLE LABELS  medicacao 'Precisou tomar medicação'.
MISSING VALUES medicacao('   ').
VALUE LABELS medicacao
  'Não' '0'
  'Sim' '1'.
*doador.
VARIABLE LABELS  doador 'É doador de sangue'.
VALUE LABELS doador
  'Não' '0'
  'Sim' '1'.
*doador_sentiu_mal.
VARIABLE LABELS  doador_sentiu_mal 'Se sentiu mal ao doar sangue'.
MISSING VALUES doador_sentiu_mal('   ').
VALUE LABELS doador_sentiu_mal
  'Não' '0'
  'Sim' '1'.
*doador_familia.
VARIABLE LABELS  doador_familia 'Familiar se sentiu mal ao doar sangue'.
MISSING VALUES doador_familia('       ').
VALUE LABELS doador_familia
  'Não    ' '0'
  'Não sei' '2'
  'Sim    ' '1'.
EXECUTE.

FREQUENCIES VARIABLES=nascimento genero escolaridade altura peso horas_sono exercicios_fisicos 
    acucar origem_animal estudante turno horas_estudo desempenho_estudo empregado tipo_trabalhador 
    desempenho_trabalho cansado vezes_doente foi_medico medicacao doador doador_sentiu_mal 
    doador_familia
  /ORDER=ANALYSIS.

SELECT IF (XDATE.YEAR(nascimento) ~= 2019).
EXECUTE.

