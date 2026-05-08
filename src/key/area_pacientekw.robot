*** Comments ***
###################################################################################################
# Name:                AreaPacienteKW.robot
# Description:         Keywords dos cenários
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Documentation                    URL DA DOCUMENTACAO DO WB
Resource                         ../global/sharedkw.robot

*** Keywords ***
Dado que estou autenticado no sistema
    Realizar Login

Quando acessar a área do ${MODULO} ${TITULO}
    acessar o modulo ${MODULO} ${TITULO}

E informar uma nova senha válida
    Alterar senha    ${SENHA_VALIDA}    ${NOVA_SENHA}

E informar uma senha atual inválida
    Alterar senha    ${SENHA_INVALIDA}    ${NOVA_SENHA}

E informar a nova senha utilizando a mesma senha atual
    Alterar senha    ${SENHA_VALIDA}    ${SENHA_VALIDA}

E clicar no botão "Atualizar senha" sem preencher os campos
    Alterar senha    ${EMPTY}    ${EMPTY}

E informar uma nova senha fora do padrão permitido
    Alterar senha    ${SENHA_VALIDA}    ${SENHA_INVALIDA}
    
Então devo visualizar meus dados cadastrados
    validar dados do paciente
    Capture Page Screenshot