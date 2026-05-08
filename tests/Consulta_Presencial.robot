*** Comments ***
###################################################################################################
# Name:                Consulta_Presencial.robot
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
    [Documentation]             Funcionalidade responsável pelo agendamento e gerenciamento de consultas presencial.
    [Tags]    Consulta   regressivo    
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E realizar um agendamento de consulta presencial
    Então vejo a mensagem de sucesso ${MSG_AGENDAMENTO}
    E verifico se o agendamento de consulta esta visivel na listagem

Agendar consulta sem selecionar especialidade
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E não selecionar uma especialidade para consulta
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem selecionar médico
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E não selecionar um médico para consulta
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem informar data
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E não informar a data da agenda para consulta
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta sem selecionar horário
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E não selecionar um horário para consulta
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Agendar consulta com data retroativa
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E informar uma data anterior ao dia atual para consulta
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Cancelar agendamento
    [Tags]    Consulta    regressivo 
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_CONSULTA} ${TITLE_CONSULTA}
    E realizar um agendamento de consulta presencial
    E cancelar o agendamento
    Então verifico se o agendamento não esta visivel na listagem