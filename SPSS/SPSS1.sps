
DATASET ACTIVATE DataSet1.
* Define Variable Properties.
*numero.
VARIABLE LABELS  numero 'Nro do sujeito'.
*civil.
VARIABLE LABELS  civil 'Estado civil'.
VALUE LABELS civil
  1 'Solteiro'
  2 'Casado'.
*instrucao.
VARIABLE LABELS  instrucao 'Grau de instrucao'.
VALUE LABELS instrucao
  1 'Fundamental'
  2 'Medio'
  3 'Superior'.
*filhos.
VARIABLE LABELS  filhos 'Nro de filhos'.
*salario.
VARIABLE LABELS  salario 'Salarios minmos'.
FORMATS  salario(F11.2).
*ano.
VARIABLE LABELS  ano 'Idade em anos'.
*mes.
VARIABLE LABELS  mes 'Meses desde o ultimo aniversario'.
*regiao.
VARIABLE LABELS  regiao 'Regiao onde mora'.
MISSING VALUES regiao(9).
VALUE LABELS regiao
  1 'Capital'
  2 'Interior'.
EXECUTE.
