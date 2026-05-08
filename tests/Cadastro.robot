*** Comments ***
###################################################################################################
# Name:                Cadastro.robot
# Description:         BDD para automação de testes
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Resource                         ../src/global/SharedKW.robot


Test Setup                       Abrir aplicação
Test Teardown                    Fechar aplicação

*** Test Cases ***
Cadastrar paciente
    [Documentation]    Validar cadastro de usuário com dados válidos
    [Tags]    CadastroValido   cadastro    regressivo
    Dado que estou na tela de cadastro de paciente
    Quando preencher o formulario de cadastro do paciente
    Então vejo a mensagem de sucesso ${MSG_CADASTRADO_REALIZADO}

Cadastro com campos obrigatórios em branco
    [Documentation]    Validar mensagens ao tentar cadastrar sem preencher os campos obrigatórios
    [Tags]    CamposObrigatorios    Cadastro    regressivo    

    Dado que estou na tela de cadastro de paciente
    Quando tento realizar o cadastro sem preencher os campos obrigatórios
    Então vejo a mensagem de erro ${MSG_CADASTRO_CAMPOS_OBRIGATORIOS}

Cadastro com e-mail inválido
    [Documentation]    Validar bloqueio de cadastro com e-mail inválido
    [Tags]    CadastroEmailInvalido    Cadastro    regressivo

    Dado que estou na tela de cadastro de paciente
    Quando preencho o campo e-mail com um formato inválido
    Então vejo a mensagem de erro ${MSG_CADASTRO_EMAIL_INVALIDO}

Cadastro com CPF inválido
    [Documentation]    Validar bloqueio de cadastro com CPF inválido
    [Tags]    CadastroCpfInvalido     Cadastro    regressivo

    Dado que estou na tela de cadastro de paciente
    Quando preencho o campo CPF com um valor inválido
    Então vejo a mensagem de erro ${MSG_CADASTRO_CPF_INVALIDO}

Cadastro com senha fora do padrão permitido
    [Documentation]    Validar regras de complexidade da senha
    [Tags]    CadastroSenha    Cadastro    regressivo

    Dado que estou na tela de cadastro de paciente
    Quando informo uma senha fora do padrão permitido
    Então vejo a mensagem de erro ${MSG_CADASTRO_SENHA_FORA_DO_PADRAO}