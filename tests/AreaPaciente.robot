*** Comments ***
###################################################################################################
# Name:                AreaPaciente.robot
# Description:         BDD para automação de testes
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Resource                         ../src/global/SharedKW.robot


Test Setup                       Abrir aplicação
Test Teardown                    Fechar aplicação

*** Test Cases ***
Validar informações exibidas do paciente
    [Documentation]    Validar dados do paciente
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    Então devo visualizar meus dados cadastrados

Alterar senha com sucesso
    [Documentation]    Alteração de senha
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    E informar uma nova senha válida
    Então vejo a mensagem de sucesso ${MSG_ALTERACAO_DE_SENHA}

Alterar senha com senha atual incorreta
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    E informar uma senha atual inválida
    Então vejo a mensagem de erro ${MSG_SENHA_ATUAL_INCORRETA}

Alterar senha utilizando a mesma senha atual
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    E informar a nova senha utilizando a mesma senha atual
    Então vejo a mensagem de erro ${MSG_SENHA_IGUAIS}

Validar campos obrigatórios da alteração de senha
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    E clicar no botão "Atualizar senha" sem preencher os campos
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}

Alterar senha fora do padrão permitido
    [Tags]     AreaPaciente    regressivo
    Dado que estou autenticado no sistema
    Quando acessar a área do ${MODULO_PACIENTE} ${TITLE_AREA_DO_PACIENTE}
    E informar uma nova senha fora do padrão permitido
    Então vejo a mensagem de erro ${MSG_CADASTRO_SENHA_FORA_DO_PADRAO}