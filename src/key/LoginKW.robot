*** Comments ***
###################################################################################################
# Name:                LoginKW.robot
# Description:         Keywords dos cenários
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Documentation                    URL DA DOCUMENTACAO DO WB
Resource                         ../global/SharedKW.robot

*** Keywords ***
Dado que acesso a aplicação no ambiente ${URL}
    Acessar rota da aplicação ${URL}

Quando digito ${USER} e ${PASS}
    Inserir dados do usuario ${USER} e ${PASS}

Quando tento realizar login sem preencher email e senha
    Wait Until Page Contains    ${TITLE_LOGIN}       timeout=10
    Click Button    ${BUTTON_ENTRAR}
 
Então sou direcionado para ${PAGE} ${TITLE}
    Redirecionar para uma página especifica ${PAGE} ${TITLE}

Então vejo a mensagem de erro ${MSG_ERRO}
    Validar mensagem ${MSG_ERRO}

