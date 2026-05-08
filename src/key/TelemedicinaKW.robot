*** Comments ***
###################################################################################################
# Name:                TelemedicinaKW.robot
# Description:         Keywords dos cenários
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Documentation                    URL DA DOCUMENTACAO DO WB
Resource                         ../global/sharedkw.robot

*** Keywords ***
E realizar um agendamento de telemedicina
    Realizar agendamento
    ...     telemedicina
    ...     Cardiologia
    ...     Dra. Ana Costa
    ...     AUTO
    ...     14:00

E verifico se o agendamento de tele esta visivel na listagem
    ${datas}=    Gerar data da consulta
    Validar consulta agendada
    ...    Cardiologia
    ...    Dra. Ana Costa
    ...    ${datas.listagem}
    ...    14:00

E não selecionar uma especialidade para ${tipo}
    Realizar agendamento
    ...     ${tipo}
    ...     ${EMPTY}
    ...     ${EMPTY}
    ...     AUTO
    ...     14:00

E não selecionar um médico para ${tipo}
    Realizar agendamento
    ...     ${tipo}
    ...     Cardiologia
    ...     ${EMPTY}
    ...     AUTO
    ...     14:00

E não informar a data da agenda para ${tipo}
    Realizar agendamento
    ...     ${tipo}
    ...     Cardiologia
    ...     Dra. Ana Costa
    ...     ${EMPTY}
    ...     14:00

E não selecionar um horário para ${tipo}
    Realizar agendamento
    ...     ${tipo}
    ...     Cardiologia
    ...     Dra. Ana Costa
    ...     AUTO
    ...     ${EMPTY}

E informar uma data anterior ao dia atual para ${tipo}
    Realizar agendamento
    ...     ${tipo}
    ...     Cardiologia
    ...     Dra. Ana Costa
    ...     AUTO
    ...     dias=-1
    
E cancelar o agendamento
    Wait Until Keyword Succeeds    10    1    Click element    ${BUTTON_CANCELAR}
    ${alerta}=      Alert Should Be Present
    Log To Console    ${alerta}
    
Então verifico se o agendamento não esta visivel na listagem
    Wait Until Keyword Succeeds    10    1      Page Should Contain      ${PARAGRAFO_NENHUMA_CONSULTA}    
    Capture Page Screenshot
    
