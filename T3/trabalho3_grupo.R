#Importar o banco
library(haven)
data <- read_sav("trabalho1_grupo.sav")

#Tarefa 1 - Labels para todas as variaveis
# R nao possui suporte nativamente para isto, mas a bibliteca Hmisc oferece este suporte

install.packages("Hmisc")
library(Hmisc)

#salvar labels ja existentes no banco 
old_labels <- label(data)

#ate aqui, vamos apenas salvar os labels antigos, pois as modificacoes no banco gerarao perdas e novas variaveis

#Tarefa 2 - Missing = 999 para horas de estudo

data <- transform(data, horas_estudo_num = ifelse(horas_estudo_num == 999, NA, horas_estudo_num))


#Tarefa 3 - Reclassificar as variaveis ordinais para que respeitem a ordem. 
#Realizado sobrescrevendo mesma variavel pois nao ha necessidade de manter a variavel com a ordem errada

data <- transform(data, 
                  escolaridade_num = ifelse(escolaridade_num == 3, 4, 
                                             ifelse(escolaridade_num == 4, 3, escolaridade_num)))
data$escolaridade_num <- as.factor(data$escolaridade_num)
levels(data$escolaridade_num) <- c("Ensino Fundamental Completo", 
                                    "Ensino Medio Completo", 
                                    "Ensino Superior incompleto", 
                                    "Ensino Superior completo") 

data <- transform(data, 
                  horas_sono_num = ifelse(horas_sono_num == 3, 1, 
                                            ifelse(horas_sono_num == 1, 2, 
                                                   ifelse(horas_sono_num == 2, 3, horas_sono_num))))
data$horas_sono_num <- as.factor(data$horas_sono_num)
levels(data$horas_sono_num) <- c("Menos de 6 horas", 
                                   "6 a 8 horas", 
                                   "8+ horas") 

data <- transform(data, 
                  acucar_num = ifelse(acucar_num == 2, 1, 
                                      ifelse(acucar_num == 3, 2,
                                             ifelse(acucar_num == 1, 3, acucar_num))))
data$acucar_num <- as.factor(data$acucar_num)
levels(data$acucar_num) <- c("Nunca", 
                             "Raramente",
                             "Alguns dias na semana",
                             "Todos os dias, em 1 ou 2 refeicoes",
                             "Todos os dias, em todas as refeicoes") 


data <- transform(data, 
                 origem_animal_num = ifelse(origem_animal_num == 2, 1,
                                            ifelse(origem_animal_num == 3, 2,
                                                   ifelse(origem_animal_num == 1, 3, origem_animal_num))))
data$origem_animal_num <- as.factor(data$origem_animal_num)
levels(data$origem_animal_num) <- c("Nunca",
                                    "Raramente",
                                    "Alguns dias na semana",
                                    "Todos os dias, em 1 ou 2 refeicoes",
                                    "Todos os dias, em todas as refeicoes") 

data <- transform(data, 
                  desempenho_estudo_num = ifelse(desempenho_estudo_num == 5, 1,
                                             ifelse(desempenho_estudo_num == 1, 2,
                                                    ifelse(desempenho_estudo_num == 2, 3, 
                                                           ifelse(desempenho_estudo_num == 3, 4,
                                                                  ifelse(desempenho_estudo_num == 6, 5, 
                                                                         ifelse(desempenho_estudo_num == 4, 6, desempenho_estudo_num)))))))
data$desempenho_estudo_num <- as.factor(data$desempenho_estudo_num)
levels(data$desempenho_estudo_num) <- c("Quase sempre A",
                                        "Variam entre A e B",
                                        "Variam entre A, B e C",
                                        "Variam entre B e C",
                                        "Quase sempre C",
                                        "Variam entre C e D") 


data <- transform(data, 
                  desempenho_trabalho_num = ifelse(desempenho_trabalho_num == 2, 1, 
                                                   ifelse(desempenho_trabalho_num == 1, 2, desempenho_trabalho_num)))
data$desempenho_trabalho_num <- as.factor(data$desempenho_trabalho_num)
levels(data$desempenho_trabalho_num) <- c("Excelente",
                                          "Bom",
                                          "Regular",
                                          "Ruim")

data <- transform(data, 
                  cansado_num = ifelse(cansado_num == 2, 1,
                                       ifelse(cansado_num == 1, 2, cansado_num)))
data$cansado_num <- as.factor(data$cansado_num)
levels(data$cansado_num) <- c("Raramente",
                              "Apenas quando dorme pouco",
                              "Sempre")

data <- transform(data, 
                  vezes_doente_num = ifelse(vezes_doente_num == 3, 1,
                                            ifelse(vezes_doente_num == 1, 2,
                                                   ifelse(vezes_doente_num == 2, 3, vezes_doente_num))))
data$vezes_doente_num <- as.factor(data$vezes_doente_num)
levels(data$vezes_doente_num) <- c("Nenhuma",
                                   "1 ou 2",
                                   "3 ou mais")


#Tarefa 4 - Calcular o IMC = peso/ altura^2

data <- transform(data, imc=peso/(altura^2))

#Tarefa 5 - Criar a variavel idade

data <- transform(data, idade = as.numeric(difftime( "2019-05-31", nascimento, units = "days"))/365.25 )

#Tarefa 6 - Criar a variavel idade dividida em quartis

data <- transform(data, idade_quart = cut(idade, breaks=quantile(idade), include.lowest = T))

#Tarefa 7 - Conferencia geral via tabela de frequencias

#rotular variaveis para melhor analise e verificar frequencias
data$genero_num <- as.factor(data$genero_num)
levels(data$genero_num) <- c("Feminino", "Masculino", "Prefiro nao dizer")
table(data$genero_num)

data$estudante_num <- as.factor(data$estudante_num)
levels(data$estudante_num) <- c("Nao", "Sim")
table(data$estudante_num)

data$turno_num <- as.factor(data$turno_num)
levels(data$turno_num) <- c("Mais de um turno", "Manha", "Noite", "Tarde")
table(data$turno_num)

data$empregado_num <- as.factor(data$empregado_num)
levels(data$empregado_num) <- c("Nao", "Sim")
table(data$empregado_num)

data$tipo_trabalhador_num <- as.factor(data$tipo_trabalhador_num)
levels(data$tipo_trabalhador_num) <- c("Assalariado",
                                       "Autonomo",
                                       "Empresario",
                                       "Estagiario",
                                       "Freelancer",
                                       "Profissional Liberal")

table(data$tipo_trabalhador_num)

data$foi_medico_num <- as.factor(data$foi_medico_num)
levels(data$foi_medico_num) <- c("Nao",
                                 "Sim, algumas",
                                 "Sim, todas")
table(data$foi_medico_num)

data$medicacao_num <- as.factor(data$medicacao_num)
levels(data$medicacao_num) <- c("Nao",
                                "Sim")
table(data$medicacao_num)

data$doador_num <- as.factor(data$doador_num)
levels(data$doador_num) <- c("Nao",
                             "Sim")
table(data$doador_num)

data$doador_sentiu_mal_num <- as.factor(data$doador_sentiu_mal_num)
levels(data$doador_sentiu_mal_num) <- c("Nao",
                                        "Sim")
table(data$doador_sentiu_mal_num)

data$doador_familia_num <- as.factor(data$doador_familia_num)
levels(data$doador_familia_num) <- c("Nao",
                                     "Nao sei",
                                     "Sim")
table(data$doador_familia_num)

#verificar frequencias das variaveis restantes
table(data$escolaridade_num)
table(data$horas_sono_num)
table(data$acucar_num)
table(data$origem_animal_num)
table(data$desempenho_estudo_num)
table(data$desempenho_trabalho_num)
table(data$cansado_num)
table(data$exercicios_fisicos_num)
table(data$idade_quart)

#Tarefa 1 - Labels para todas as variaveis
#continuacao - fazemos aqui o mapeamento dos labels, pois todas as alteracoes ja foram feitas


#remover os labels vazios da lista de labels que salvamos anteriormente
old_labels <- old_labels[old_labels != ""]

#criar uma nova lista com os labels faltantes
labels = c(altura="Altura em metros", 
           peso="Peso em kg",
           escolaridade_num="Grau de escolaridade",
           estudante_num="Se eh estudante",
           id="Identificador",
           vezes_doente_num="Quantas vezes ficou doente no ano",
           imc= "IMC",
           idade= "Idade em 31 de maio de 2019",
           idade_quart="Intervalo de idade")


#instalar e carregar o pacote que faz o merge de duas listas
install.packages("rlist")
library(rlist)

#fazer o merge dos labels que já tinham no banco com os faltantes que foram definidos na variavel labels
merged_labels <- list.append(old_labels, labels)

#redefinir a lista de labels do banco de dados para usar a lista atualizada e incluir os faltantes
label(data) = as.list(merged_labels[match(names(data), names(merged_labels))])

#conferir se esta correto
label(data)
View(data)

#exportar banco de dados
write_sav(data, "tabalho3_grupo.sav")
