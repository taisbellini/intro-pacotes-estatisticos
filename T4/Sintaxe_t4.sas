/*Criando uma LIB. */
LIBNAME T4 '/home/u39504929/T4/';

/*IMPORTANDO BANCO EM FORMATO SPSS */

FILENAME BANCO_T4 '/home/u39504929/T4/trabalho1_grupo.sav';

PROC IMPORT DATAFILE=BANCO_T4
	DBMS=SAV
	OUT=T4.BANCO replace;
RUN;

/*SALVAR O BANCO NA WORK PARA FAZER AS ALTERAÇÕES*/
DATA TRABALHO_4;
	SET T4.BANCO;
RUN;

/*Tarefa 1 - Labels para todas as variaveis */

DATA  TRABALHO_4;
   SET TRABALHO_4;
   LABEL  altura  ="Altura em metros"
          peso    ="Peso em kg"
          escolaridade_num="Grau de escolaridade"
          estudante_num="Se eh estudante"
          id="Identificador"
          tipo_trabalhador_num="Tipo de vinculo empregaticio"
          vezes_doente_num="Quantas vezes ficou doente no ano"
          cansado_num="Frequencia que se sente cansado"; /*corrigindo label errado*/
RUN;
/* Conferir */
PROC CONTENTS DATA=TRABALHO_4;
RUN;

/* Tarefa 2 - missing 999 para horas de estudo */
DATA  TRABALHO_4;
   SET TRABALHO_4;
   IF horas_estudo_num = 999 THEN horas_estudo_num = .;
RUN;

/*Conferir*/
PROC PRINT DATA=TRABALHO_4;
	VAR horas_estudo_num;
RUN;

/*Tarefa 3 - Recodificar variaveis ordinais para que sigam a ordem correta */
/* Gerar tabelas de frequencia antes para depois comparar e verificar se as frequencias seguiram as mesmas*/
PROC FREQ DATA=TRABALHO_4;
	TABLES escolaridade_num horas_sono_num acucar_num origem_animal_num desempenho_estudo_num desempenho_trabalho_num cansado_num vezes_doente_num;
RUN;

DATA TRABALHO_4;
	SET TRABALHO_4;
	IF escolaridade_num = 3 THEN escolaridade_rank = 4;
		ELSE IF escolaridade_num = 4 THEN escolaridade_rank = 3;
			ELSE escolaridade_rank=escolaridade_num;
	IF horas_sono_num = 3 THEN horas_sono_rank = 1;
		ELSE IF horas_sono_num = 1 THEN horas_sono_rank=2;
			ELSE IF horas_sono_num = 2 THEN horas_sono_rank=3;
	IF acucar_num = 2 THEN acucar_rank = 1;
		ELSE IF acucar_num = 3 THEN acucar_rank = 2;
			ELSE IF acucar_num = 1 THEN acucar_rank = 3;
				ELSE acucar_rank = acucar_num;
	IF origem_animal_num = 2 THEN origem_animal_rank = 1;
		ELSE IF origem_animal_num = 3 THEN origem_animal_rank = 2;
			ELSE IF origem_animal_num = 1 THEN origem_animal_rank = 3;
				ELSE origem_animal_rank = origem_animal_num;
	IF desempenho_estudo_num = 5 THEN desempenho_estudo_rank = 1;
		ELSE IF desempenho_estudo_num = 1 THEN desempenho_estudo_rank = 2;
			ELSE IF desempenho_estudo_num = 2 THEN desempenho_estudo_rank = 3;
				ELSE IF desempenho_estudo_num = 3 THEN desempenho_estudo_rank = 4;
					ELSE IF desempenho_estudo_num = 6 THEN desempenho_estudo_rank = 5;
						ELSE IF desempenho_estudo_num = 4 THEN desempenho_estudo_rank = 6;
	IF desempenho_trabalho_num = 2 THEN desempenho_trabalho_rank = 1;
		ELSE IF desempenho_trabalho_num = 1 THEN desempenho_trabalho_rank = 2;
			ELSE desempenho_trabalho_rank = desempenho_trabalho_num;
	IF cansado_num = 2 THEN cansado_rank = 1;
		ELSE IF cansado_num = 1 THEN cansado_rank = 2;
			ELSE cansado_rank = cansado_num;
	IF vezes_doente_num = 3 THEN vezes_doente_rank = 1;
		ELSE IF vezes_doente_num = 1 THEN vezes_doente_rank = 2;
			ELSE IF vezes_doente_num = 2 THEN vezes_doente_rank = 3;
RUN;

PROC FORMAT;
	VALUE ESCOLARIDADE_RANK 1='Ensino Fundamental completo' 2='Ensino Medio completo' 3='Ensino Superior incompleto' 4='Ensino Superior completo';
	VALUE HORAS_SONO_RANK 1='Menos de 6 horas' 2='6 a 8 horas' 3='8+ horas';
	VALUE ALIMENTACAO_RANK 1='Nunca' 2='Raramente' 3='Alguns dias na semana' 4='Todos os dias, em 1 ou 2 refeicoes' 5='Todos os dias, em todas as refeicoes';
	VALUE DESEMPENHO_ESTUDO_RANK 1='Quase sempre A' 2='Variam entre A e B' 3='Variam entre A, B e C' 4='Variam entre B e C' 5='Quase sempre C' 6='Variam entre C e D';
	VALUE DESEMPENHO_TRABALHO_RANK 1='Excelente' 2='Bom' 3='Regular' 4='Ruim';
	VALUE CANSADO_RANK 1='Raramente' 2='Apenas quando dorme pouco' 3='Sempre';
	VALUE DOENTE_RANK 1='Nenhuma' 2='1 ou duas' 3='3 ou mais';
RUN;

/*Labels para as novas variaveis*/
DATA  TRABALHO_4;
   SET TRABALHO_4;
   LABEL  escolaridade_rank="Grau de escolaridade (ordenado)"
          horas_sono_rank="Horas de sono por dia (ordenado)"
          acucar_rank="Frequencia que consome acucar (ordenado)"
          origem_animal_rank="Frequencia que consome origem animal (ordenado)"
          desempenho_estudo_rank="Desempenho academico (ordenado)"
          desempenho_trabalho_rank="Desempenho profissional (ordenado)"
          cansado_rank="Frequencia que se sente cansado (ordenado)"
          vezes_doente_rank="Quantas vezes ficou doente no ano (ordenado)";
RUN;

DATA TRABALHO_4;
	SET TRABALHO_4;
	FORMAT escolaridade_rank ESCOLARIDADE_RANK. horas_sono_rank HORAS_SONO_RANK. acucar_rank ALIMENTACAO_RANK. origem_animal_rank ALIMENTACAO_RANK.
	desempenho_estudo_rank DESEMPENHO_ESTUDO_RANK. desempenho_trabalho_rank DESEMPENHO_TRABALHO_RANK. cansado_rank CANSADO_RANK. vezes_doente_rank DOENTE_RANK.;
RUN;

/*Gerar tabelas de frequencia com as novas variaveis ordenadas para conferir*/
PROC FREQ DATA=TRABALHO_4;
	TABLES escolaridade_rank horas_sono_rank acucar_rank origem_animal_rank desempenho_estudo_rank desempenho_trabalho_rank cansado_rank vezes_doente_rank;
RUN;

/*Tarefa 4 - Calcular o IMC */

DATA TRABALHO_4;
	SET TRABALHO_4;
	imc=peso/(altura**2);
	LABEL  imc="Imc";
RUN;

/*Tarefa 5 - Criar variavel idade em 31 de maio de 2019*/

DATA TRABALHO_4;
	SET TRABALHO_4;
	data_ref='31MAY2019'd;
	idade=DATDIF(nascimento,data_ref,'act/act')/365.25;
RUN;

/*Conferir*/
PROC PRINT DATA=TRABALHO_4;
	VAR idade;
RUN;

PROC MEANS DATA=TRABALHO_4;
	VAR idade;
RUN;

/*Adicionar label */
DATA  TRABALHO_4;
   SET TRABALHO_4;
   LABEL  idade="Idade em 31 de maio de 2019" data_ref="Data referencia para idade";
RUN;

/*Tarefa 6 - Criar variavel idade em quartis*/

PROC RANK DATA=TRABALHO_4 OUT=TRABALHO_4 GROUPS=4;
	VAR idade;
	RANKS idade_quart;
RUN;

/*Adicionar label*/
DATA TRABALHO_4;
	SET TRABALHO_4;
	LABEL idade_quart='Intervalo de idade';
RUN;

/*Tarefa 7 - Conferência via tabela de frequências*/

/*Verificacao da frequencia das variaveis que ja nao foram conferidas anteriormente*/
PROC FREQ DATA=TRABALHO_4;
	TABLES 
	turno_num tipo_trabalhador_num medicacao_num genero_num 
	foi_medico_num exercicios_fisicos_num estudante_num doador_num
	doador_familia_num doador_sentiu_mal_num empregado_num;
RUN;

/*Verificacao das variaveis quantitativas atraves das estatisticas*/
PROC MEANS DATA=TRABALHO_4;
	VAR idade altura peso imc idade;
RUN;

/*Copiar o banco da work para T4*/
DATA T4.TRABALHO4_BANCO_FINAL;
	SET TRABALHO_4;
RUN;



	









