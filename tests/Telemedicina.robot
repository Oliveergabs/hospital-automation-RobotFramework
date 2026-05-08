*** Comments ***
###################################################################################################
# Name:                Telemedicina.robot
# Description:         BDD para automação de testes
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Resource                         ../src/global/sharedkw.robot


Test Setup                       Abrir aplicação        
Test Teardown                    Fechar aplicação       

*** Test Cases ***
Agendar consulta com sucesso
    [Documentation]             Funcionalidade responsável pelo agendamento e gerenciamento de consultas online do módulo de telemedicina.
    [Tags]    Telemedicina    regressivo    
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E realizar um agendamento de telemedicina
    Então vejo a mensagem de sucesso ${MSG_AGENDAMENTO}
    E verifico se o agendamento de tele esta visivel na listagem

Agendar consulta sem selecionar especialidade
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E não selecionar uma especialidade para telemedicina
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem selecionar médico
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E não selecionar um médico para telemedicina
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem informar data
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E não informar a data da agenda para telemedicina
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem selecionar horário
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E não selecionar um horário para telemedicina
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta com data retroativa
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E informar uma data anterior ao dia atual para telemedicina
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Cancelar agendamento
    [Tags]    Telemedicina    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_TELEMEDICINA} ${TITLE_TELEMEDICINA}
    E realizar um agendamento de telemedicina
    E cancelar o agendamento
    Então verifico se o agendamento não esta visivel na listagem