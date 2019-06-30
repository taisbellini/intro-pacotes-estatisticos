
DATASET ACTIVATE DataSet1.
* Define Variable Properties.
*genero_num.
VARIABLE LABELS  genero_num 'Genero'.
VALUE LABELS genero_num
  1 'Feminino'
  2 'Masculino'
  3 'Prefiro nao dizer'.
*escolaridade_num.
VALUE LABELS escolaridade_num
  1 'Ensino Fundamental completo'
  2 'Ensino Medio completo'
  3 'Ensino Superior completo'
  4 'Ensino Superior incompleto'.
*acucar_num.
VARIABLE LABELS  acucar_num 'Frequencia que consome acucar'.
VALUE LABELS acucar_num
  1 'Alguns dias na semana'
  2 'Nunca'
  3 'Raramente'
  4 'Todos os dias, em 1 ou 2 refeicos'
  5 'Todos os dias, em todas as refeicoes'.
*origem_animal_num.
VARIABLE LABELS  origem_animal_num 'Frequencia que consome alimentos de origem animal'.
VALUE LABELS origem_animal_num
  1 'Alguns dias na semana'
  2 'Nunca'
  3 'Raramente'
  4 'Todos os dias, em 1 ou 2 refeicoes'
  5 'Todos os dias, em todas as refeicoes'.
*turno_num.
VALUE LABELS turno_num
  1 'Mais de um turno'
  2 'Manha'
  3 'Noite'
  4 'Tarde'.
*desempenho_estudo_num.
VALUE LABELS desempenho_estudo_num
  1 'Notas variam entre A e B '
  2 'Notas variam entre A, B e C'
  3 'Notas variam entre B e C'
  4 'Notas variam entre C e D'
  5 'Quase sempre nota A '
  6 'Quase sempre nota C'.
*tipo_trabalhador_num.
VARIABLE LABELS  tipo_trabalhador_num 'Tipo de vinculo empregaticio'.
VALUE LABELS tipo_trabalhador_num
  1 'Assalariado(a)'
  2 'Autonomo(a)'
  3 'Empresario(a)'
  4 'Estagiario(a)'
  5 'Freelancer'
  6 'Profissional liberal'.
*desempenho_trabalho_num.
VALUE LABELS desempenho_trabalho_num
  1 'Bom'
  2 'Excelente'
  3 'Regular'
  4 'Ruim'.
*cansado_num.
VARIABLE LABELS  cansado_num 'Frequencia que sente cansaço'.
VALUE LABELS cansado_num
  1 'Apenas quando durmo pouco'
  2 'Raramente'
  3 'Sempre, independente do quanto eu durmo'.
*vezes_doente_num.
VALUE LABELS vezes_doente_num
  1 '1 a 2'
  2 '3 ou mais'
  3 'Nenhuma'.
*foi_medico_num.
VARIABLE LABELS  foi_medico_num 'Foi ao medico quando ficou doente'.
VALUE LABELS foi_medico_num
  1 'Nao'
  2 'Sim, em algumas'
  3 'Sim, em todas'.
*medicacao_num.
VARIABLE LABELS  medicacao_num 'Precisou tomar medicacao'.
*doador_num.
VARIABLE LABELS  doador_num 'Doador de sangue'.
EXECUTE.

*Mudar formato data de nascimento.
FORMATS  nascimento(ADATE10).
EXECUTE.


