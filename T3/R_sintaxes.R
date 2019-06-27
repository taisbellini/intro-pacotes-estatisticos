#### Slide 12 ####
2 * 4

2 *
  4

#### Slide 14 ####
sqrt(2)

log(,3)

#### Slide 17 ####
valor <- 2*4
valor

x = 25
x2 = x^2
x2

#### Slide 18 ####
valor
Valor

T
t

#### Slide 19 ####
valor = 2 *  4
valor

nome = "Sexo Feminino"
nome

nome = "Sexo  Feminino"
nome

#### Slide 20 ####
valor >= 5 & valor <= 10

#### Slide 25 ####
# Mudar diret?rio
# Colar a sintaxe

# Dica: ao definir diret?rio, n?o precisa mais informar todo o endere?o do arquivo
library(readxl)
honolulu <- read_excel("honolulu.xls")

#### Slide 26 ####
summary(honolulu)

honolulu$ID

table(honolulu$ID)
table(honolulu$EDUCA) # table = tabela de frequencias

honolulu$EDUCA <- as.factor(honolulu$EDUCA) #as.factor indica que a var é nominal
summary(honolulu)

#### Slide 27 ####
library(haven)
milsa <- read_sav("milsa_R.sav")
View(milsa)

# Vendo o banco com r?tulos
milsa2 = as_factor(milsa) #as_factor com _ é do haven -> transforma em factor o que é labelled
milsa
milsa2

summary(milsa2)
table(milsa2)

#### Slide 29 ####

honolulu$FUMO = as.factor(honolulu$FUMO) #converte os codigos numericos em ordem crescente ( 0-> 1; 1->2; ...)

levels(honolulu$FUMO) = c("Nao fumante", "Fumante") #levels faz em ordem crescente

summary(honolulu)

#### Slide 30 ####
honolulu2 = transform(honolulu, alturam = ALTURA/100)
summary(honolulu2)
#### Slide 31 ####
honolulu2 = transform(honolulu2,  pesopad = (PESO-mean(PESO))/sd(PESO) ) #transform = compute do SPSS


#### Slide 32 ####
honolulu2 = transform(honolulu2, idade3cat = cut(IDADE, breaks=c(min(IDADE), 50, 60, max(IDADE)), include.lowest = T))
summary(honolulu2)
# Se quiser intervalos fechados a esquerda e abertos a direita, usar o argumento right=F
# transform(honolulu2, idade3cat = cut(IDADE, breaks=c(min(IDADE), 50, 60, max(IDADE)), include.lowest = T, right=F))

#### Slide 33 ####
honolulu2 = transform(honolulu2, sist_quart = cut(SISTOLICA, breaks=quantile(SISTOLICA), include.lowest = T))

summary(honolulu2)

#### Slide 34 ####
honolulu2 = transform(honolulu2, 
                      educa3cat = ifelse(EDUCA == 1, 1, 
                                         ifelse(EDUCA ==2 | EDUCA ==3, 2, 3)))
honolulu2$educa3cat = as.factor(honolulu2$educa3cat)
levels(honolulu2$educa3cat) = c("Nenhuma", "1o incomp ou compl", "2o ou tecnico")
table(honolulu2$educa3cat)

#### Slide 38 ####
table(milsa2$civil)
milsa2 = transform(milsa2, 
                   civil = ifelse(civil == 4, 2, civil) )
table(milsa2$civil)
# Note que se deve atribuir novamente os rotulos


#### Slide 39 ####
table(milsa2$regiao)
milsa2 = transform(milsa2, 
                   regiao = ifelse(regiao == 8, NA, regiao) )
table(milsa2$regiao)

#### Slide 40 ####

library(readxl)
Ex_Datas <- read_excel("Ex_Datas.xlsx")

# Verificando que ? data
class(Ex_Datas$Data_nasc)

library(haven)
Ex_Datas2 <- read_sav("Ex_Datas.sav")

#### Slide 41 ####

exdatas = transform(Ex_Datas, idade = as.numeric(difftime( "2019-01-01", Data_nasc, units = "days"))/365.25 )


#### Slide 43 ####

milsa.10 = subset(milsa2, salario < 10)


#### Slide 44 ####
library(haven)
merge_casos1 = read_sav("MERGE_GSS93_p1_casos.sav")
merge_casos2 = read_sav("MERGE_GSS93_p2_casos.sav")

merge_1500 = rbind(merge_casos1, merge_casos2)

# As vari?veis n?o precisam estar na mesma ordem, no entanto,
# n?o funcionar? se uma das vari?veis s? estiver presente em um dos bancos de dados.
# Deve-se deletar a vari?vel extra ou cri?-la no outro banco preenchendo-a de missings.

# deletando a vari?vel wrkstat do primeiro banco
merge_casos1.1 = subset(merge_casos1, select=-c(wrkstat))

# rbind dar? erro
rbind(merge_casos1.1, merge_casos2)

# pode-se deletar a mesma vari?vel no segundo banco
merge_casos2.1 = subset(merge_casos2, select=-c(wrkstat))
merge_1500.1 = rbind(merge_casos1.1, merge_casos2.1)

# ou ent?o pode-se preencher a vari?vel com missings no banco onde a vari?vel n?o existe

merge_casos1.1$wrkstat = rep(NA, 1000)
merge_1500.2 = rbind(merge_casos1.1, merge_casos2)



#### Slide 45 ####
library(haven)
merge_var1 = read_sav("MERGE_GSS93_p1_var.sav")
merge_var2 = read_sav("MERGE_GSS93_p2_var.sav")

merge_79 = merge(merge_var1, merge_var2, by="id", all = T)

# O argumento all = T ? para que casos que estejam num ?nico banco perten?am ao banco final, sen?o s?o exclu?dos 

#### Slide 46 ####
library(haven)
dietstudy = read_sav("dietstudy.sav")

diet.reest = reshape(as.data.frame(dietstudy), idvar = "patid", 
                     varying = list(c("tg0","tg1","tg2","tg3","tg4"), c("wgt0","wgt1","wgt2","wgt3","wgt4")), 
                     v.names=c("tg", "wgt"), direction = "long")

# Em idvar coloca-se o identificador do caso
# Em varying deve-se separar os blocos de colunas que representam a mesma vari?vel
# Em v.names nomeia-se as colunas que conter?o todos os dados dos blocos anteriores
# direction="long" significa que os dados ser?o "empilhados"

# ordenando por patid

diet.reest = diet.reest[order(diet.reest$patid), ]
