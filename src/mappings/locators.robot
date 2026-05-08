*** Comments ***
###################################################################################################
# Name:                Locators.robot
# Description:         Elementos mapeados usados na automação
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Variables ***
## Titulos ##
${TITLE_LOGIN}                               Sistema Hospitalar
${TITLE_HOME}                                O que você deseja fazer?
${TITLE_CADASTRO}                            Cadastro
${TITLE_AREA_DO_PACIENTE}                    Área do Paciente
${TITLE_TELEMEDICINA}                        Telemedicina
${TITLE_CONSULTA}                            Consultas Presenciais
${PARAGRAFO_NENHUMA_CONSULTA}                Nenhuma consulta agendada

## Mensagens ##
${MSG_ERRO_LOGIN}                            Credenciais inválidas!
${MSG_CAMPOS_OBRIGATORIOS}                   Preencha todos os campos!
${MSG_CADASTRADO_REALIZADO}                  Cadastro realizado com sucesso!
${MSG_CADASTRO_CAMPOS_OBRIGATORIOS}          Preencha todos os campos obrigatórios!
${MSG_CADASTRO_EMAIL_INVALIDO}               Email inválido!
${MSG_CADASTRO_CPF_INVALIDO}                 CPF inválido!
${MSG_CADASTRO_SENHA_FORA_DO_PADRAO}         Senha deve ter no mínimo 8 caracteres, com letra maiúscula, minúscula e número!
${MSG_ALTERACAO_DE_SENHA}                    Senha atualizada com sucesso!
${MSG_SENHA_ATUAL_INCORRETA}                 Senha atual incorreta!
${MSG_SENHA_IGUAIS}                          A nova senha não pode ser igual à atual!
${MSG_AGENDAMENTO}                           Consulta agendada com sucesso!

## Modulos ##
${MODULO_PACIENTE}                           xpath=//div[@onclick='irPaciente()']
${MODULO_TELEMEDICINA}                       xpath=//div[@onclick='irTelemedicina()']
${MODULO_CONSULTA}                           xpath=//div[@onclick='irConsulta()']

## Login ##
${INPUT_LOGIN_EMAIL}                         id=email
${INPUT_LOGIN_SENHA}                         id=senha
${BUTTON_ENTRAR}                             xpath=//button[contains(.,"Entrar")]

## Cadastro ##
${BUTTON_CRIAR_CONTA}                        xpath=//button[contains(.,"Criar conta")]
${INPUT_CADASTRO_NOME_COMPLETO}              id=nome
${INPUT_CADASTRO_EMAIL}                      id=email                    
${INPUT_CADASTRO_SEXO}                       id=sexo
${INPUT_CADASTRO_CPF}                        id=cpf
${INPUT_CADASTRO_TELEFONE}                   id=telefone
${INPUT_CADASTRO_SENHA}                      id=senha
${BUTTON_CADASTRAR}                          xpath=//button[contains(.,"Cadastrar")]

## Area do Paciente ##
${TXT_NOME}                                  xpath=//span[@id='nome']
${TXT_EMAIL}                                 xpath=//span[@id='email']
${TXT_CPF}                                   xpath=//span[@id='cpf']
${TXT_SEXO}                                  xpath=//span[@id='sexo']
${INPUT_SENHA_ATUAL}                         id=senhaAtual
${INPUT_NOVA_SENHA}                          id=novaSenha
${BUTTON_ATUALIZAR_SENHA}                    xpath=//button[contains(.,"Atualizar senha")]

## Consulta Telemedicina
${SELECT_ESPECIALIDADE}                      id=especialidade
${SELECT_MEDICO_TELE}                        id=medicoTele
${INPUT_DATA}                                id=data
${BUTTON_AGENDAR_TELE}                       xpath=//button[@onclick='agendarTelemedicina()']
${BUTTON_CANCELAR}                           id=cancelar


## Consulta Presencial
${SELECT_MEDICO_CONSULTA}                    id=medico
${BUTTON_AGENDAR_CONSULTA}                   xpath=//button[@onclick='agendarConsulta()']

