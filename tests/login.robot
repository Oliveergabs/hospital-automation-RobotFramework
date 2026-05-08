*** Comments ***
###################################################################################################
# Name:                Login.robot
# Description:         BDD para automação de testes
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Resource                         ../src/global/sharedkw.robot


Test Setup                       Abrir aplicação
Test Teardown                    Fechar aplicação

*** Test Cases ***
Realizar Login com usuario valido
    [Documentation]                Realizar Login com usuário válido
    [Tags]    loginUserValido    login    regressivo    
    Dado que acesso a aplicação no ambiente ${URL}
    Quando digito ${EMAIL_VALIDO} e ${SENHA_VALIDA}
    Então sou direcionado para ${URL_HOME} ${TITLE_HOME}

Realizar Login com email invalido
    [Documentation]                Realizar Login com Email inválido
    [Tags]    loginUserInvalido    login    regressivo
    Dado que acesso a aplicação no ambiente ${URL}
    Quando digito ${EMAIL_INVALIDO} e ${SENHA_VALIDA}
    Então vejo a mensagem de erro ${MSG_CADASTRO_EMAIL_INVALIDO}  

Realizar Login com senha invalida
    [Documentation]                Realizar Login com usuário inválido
    [Tags]    loginPassInvalido    login    regressivo    
    Dado que acesso a aplicação no ambiente ${URL}
    Quando digito ${EMAIL_VALIDO} e ${SENHA_INVALIDA}
    Então vejo a mensagem de erro ${MSG_ERRO_LOGIN}

Realizar Login com campos em branco
    [Documentation]                Realizar Login sem preencher email e senha
    [Tags]    campos_obrigatorios   login    regressivo    
    Dado que acesso a aplicação no ambiente ${URL}
    Quando tento realizar login sem preencher email e senha
    Então vejo a mensagem de erro ${MSG_CAMPOS_OBRIGATORIOS}
    