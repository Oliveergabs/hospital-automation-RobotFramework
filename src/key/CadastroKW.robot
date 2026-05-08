*** Comments ***
###################################################################################################
# Name:                CadastroKW.robot
# Description:         Keywords dos cenários
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Settings ***
Documentation                    URL DA DOCUMENTACAO DO WB
Resource                         ../global/SharedKW.robot

*** Keywords ***
Dado que estou na tela de cadastro de paciente
    Go To    ${URL_CADASTRAR}
    Acessar rota da aplicação ${URL_CADASTRAR}
    

Quando preencher o formulario de cadastro do paciente
    ${faker}=    Gerar Dados Faker

    Preencher formulário de cadastro do paciente    ${faker}

Quando tento realizar o cadastro sem preencher os campos obrigatórios
    ${faker}=    Gerar Dados Faker

    Set To Dictionary    ${faker}    nome=${EMPTY}
    Set To Dictionary    ${faker}    email=${EMPTY}
    Set To Dictionary    ${faker}    cpf=${EMPTY}
    Set To Dictionary    ${faker}    senha=${EMPTY}

    Preencher formulário de cadastro do paciente    ${faker}

Quando preencho o campo e-mail com um formato inválido
    ${faker}=    Gerar Dados Faker

    Set To Dictionary    ${faker}    email=${EMAIL_INVALIDO}

    Preencher formulário de cadastro do paciente    ${faker}

Quando preencho o campo CPF com um valor inválido
    ${faker}=    Gerar Dados Faker

    Set To Dictionary    ${faker}    cpf=${CPF_INVALIDO}

    Preencher formulário de cadastro do paciente    ${faker}

Quando informo uma senha fora do padrão permitido
    ${faker}=    Gerar Dados Faker

    Set To Dictionary    ${faker}    senha=${SENHA_INVALIDA}

    Preencher formulário de cadastro do paciente    ${faker}
    
Então vejo a mensagem de sucesso ${MSG_SUCESSO}
    Validar mensagem ${MSG_SUCESSO}
