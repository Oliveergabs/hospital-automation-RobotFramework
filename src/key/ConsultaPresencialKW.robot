*** Comments ***
###################################################################################################
# Name:                ConsultaPresencialKW.robot
# Description:         Keywords dos cenários
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Documentation                    URL DA DOCUMENTACAO DO WB
Resource                         ../global/SharedKW.robot

*** Keywords ***
E realizar um agendamento de consulta presencial
    Realizar agendamento
    ...     Consulta
    ...     Clínico Geral
    ...     Dr. João Silva
    ...     AUTO
    ...     11:00

E verifico se o agendamento de consulta esta visivel na listagem
    ${datas}=    Gerar data da consulta
    Validar consulta agendada
    ...    Clínico Geral
    ...    Dr. João Silva
    ...    ${datas.listagem}
    ...    11:00