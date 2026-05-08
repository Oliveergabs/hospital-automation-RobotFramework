*** Comments ***
###################################################################################################
# Name:           Shared.robot         
# Description:    Arquivo responsável por armazenar keywords globais utilizadas, em múltiplos cenários de teste do sistema hospitalar.
# Project:        Sistema Hospitalar
# Author:         Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################


*** Settings ***
Documentation       URL DA DOCUMENTACAO

### LIBRARYS ###

Library                 SeleniumLibrary
Library                 ScreenCapLibrary
Library                 OperatingSystem
Library                 String
Library                 Collections
Library                 DateTime
Library                 FakerLibrary    locale=pt_BR
Library                 ../utils/cpf_utils.py


### KEYWORDS ###
Resource                ../key/loginkw.robot
Resource                ../key/cadastrokw.robot
Resource                ../key/area_pacientekw.robot
Resource                ../key/telemedicinakw.robot
Resource                ../key/consultapresencialkw.robot


### VARIAVEIS ###
Resource                ../data/variables.robot

## LOCATORS ##
Resource                ../mappings/locators.robot


*** Keywords ***
Iniciar gravação
    ${suite}=    Replace String
    ...    ${SUITE NAME}
    ...    ${SPACE}
    ...    _

    ${teste}=    Replace String
    ...    ${TEST NAME}
    ...    ${SPACE}
    ...    _

    Create Directory
    ...    ${OUTPUT DIR}/${suite}
    
    Start Video Recording    name=${OUTPUT DIR}/${suite}/${teste}

Remover benchmarks

    ${arquivos}=    List Files In Directory
    ...    ${OUTPUT DIR}

    FOR    ${arquivo}    IN    @{arquivos}

        IF    'benchmark_' in '${arquivo}'
            Remove File
            ...    ${OUTPUT DIR}/${arquivo}
        END

    END
    
Abrir aplicação
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    # Iniciar gravação
    

Fechar aplicação
    # Stop Video Recording  
    Remover benchmarks  
    Close Browser
    

Realizar Login
    Dado que acesso a aplicação no ambiente ${URL}
    Quando digito ${EMAIL_VALIDO} e ${SENHA_VALIDA}
    Então sou direcionado para ${URL_HOME} ${TITLE_HOME}

Acessar rota da aplicação ${URL}
    ${GET_URL}=    Get Location
    Should Be Equal As Strings    ${GET_URL}    ${URL}
    Log    ${URL}

Inserir dados do usuario ${USER} e ${PASS}
    Wait Until Page Contains    ${TITLE_LOGIN}       timeout=10
    Input Text    ${INPUT_LOGIN_EMAIL}    ${USER}
    Input Text    ${INPUT_LOGIN_SENHA}    ${PASS}

    Click Button    ${BUTTON_ENTRAR}

Redirecionar para uma página especifica ${PAGE} ${TITLE}
    Wait Until Keyword Succeeds    10    1    Page Should Contain   ${TITLE}
    ${GET_URL}=    Get Location
    Should Be Equal As Strings    ${GET_URL}    ${PAGE}

Validar mensagem ${MSG}
    Wait Until Keyword Succeeds    10    1    Page Should Contain     ${MSG}


acessar o modulo ${MODULO} ${TITULO}
    Wait Until Keyword Succeeds    10    1    Click Element           ${MODULO}
    Wait Until Keyword Succeeds    10    1    Page Should Contain     ${TITULO}

validar dados do paciente
    Element Text Should Be    ${TXT_NOME}     ${PACIENTE_NOME}
    Element Text Should Be    ${TXT_EMAIL}    ${PACIENTE_EMAIL}
    Element Text Should Be    ${TXT_CPF}      ${PACIENTE_CPF}
    Element Text Should Be    ${TXT_SEXO}     ${PACIENTE_SEXO}

Gerar nome randomico
    ${nome}=    FakerLibrary.Name
    ${nome}=    Remove String    ${nome}    Dr.     ${EMPTY}
    ${nome}=    Remove String    ${nome}    Dra.    ${EMPTY}
    ${nome}=    Remove String    ${nome}    Sr.     ${EMPTY}
    ${nome}=    Remove String    ${nome}    Sra.    ${EMPTY}
    ${nome}=    Remove String    ${nome}    Srta.   ${EMPTY}
    ${nome}=    Remove String    ${nome}    `       ${EMPTY}
    ${nome}=    Remove String    ${nome}    ^       ${EMPTY}
    ${nome}=    Remove String    ${nome}    ~       ${EMPTY}
    ${nome}=    Strip String     ${nome}
    Set Test Variable    ${nome}
    RETURN    ${nome}


Gerar Dados Faker
    ${nome}=        Gerar nome randomico
    ${email}=       FakerLibrary.Email
    ${cpf}=         Gerar Cpf
    ${senha}=       FakerLibrary.Password
    ${telefone}=    FakerLibrary.Phone Number

    &{faker}=    Create Dictionary
    ...    nome=${nome}
    ...    email=${email}
    ...    cpf=${cpf}
    ...    senha=${senha}
    ...    telefone=${telefone}

    RETURN    ${faker}

Preencher formulário de cadastro do paciente
    [Arguments]    ${faker}
    
    Wait Until Keyword Succeeds    10    1    Page Should Contain   ${TITLE_CADASTRO}
    Input Text    ${INPUT_CADASTRO_NOME_COMPLETO}    ${faker.nome}
    Input Text    ${INPUT_CADASTRO_EMAIL}            ${faker.email}
    Select From List By Value    ${INPUT_CADASTRO_SEXO}    Masculino
    Input Text    ${INPUT_CADASTRO_CPF}              ${faker.cpf}
    Input Text    ${INPUT_CADASTRO_TELEFONE}         ${faker.telefone}
    Input Text    ${INPUT_CADASTRO_SENHA}            ${faker.senha}
    Click Button      ${BUTTON_CADASTRAR}

Alterar senha
    [Arguments]    ${senha_atual}    ${nova_senha}

    Wait Until Element Is Visible    ${INPUT_NOVA_SENHA}

    Input Text    ${INPUT_SENHA_ATUAL}    ${senha_atual}
    Input Text    ${INPUT_NOVA_SENHA}     ${nova_senha}

    Click Button    ${BUTTON_ATUALIZAR_SENHA}

Gerar data da consulta
    [Arguments]    ${dias}=7

    ${data_obj}=    Get Current Date
    ...    increment=${dias} days

    ${data_input}=    Convert Date
    ...    ${data_obj}
    ...    result_format=%d/%m/%Y

    ${data_listagem}=    Convert Date
    ...    ${data_obj}
    ...    result_format=%Y-%m-%d

    ${datas}=    Create Dictionary
    ...    formulario=${data_input}
    ...    listagem=${data_listagem}

    Log To Console    ${datas}

    RETURN    ${datas}

# Converter data
#     [Arguments]    ${dias}=7

#     ${data}=    Get Current Date    increment=${dias} days    result_format=%d/%m/%Y

#     RETURN    ${data}

Clicar no horário

    [Arguments]    ${horario}

    Click Element    xpath=//button[@onclick='selecionarHora(this)' and contains(.,'${horario}')]

Selecionar médico

    [Arguments]    ${tipo_consulta}    ${medico}

    Log To Console    ${tipo_consulta}

    IF    '${tipo_consulta}' == 'telemedicina'
        ${select_medico}=    Set Variable    ${SELECT_MEDICO_TELE}
    ELSE
        ${select_medico}=    Set Variable    ${SELECT_MEDICO_CONSULTA}
    END

    Select From List By Label
    ...    ${select_medico}
    ...    ${medico}

Realizar agendamento

    [Arguments]
    ...    ${tipo}
    ...    ${especialidade}=${EMPTY}
    ...    ${medico}=${EMPTY}
    ...    ${data}=AUTO
    ...    ${horario}=${EMPTY}
    ...    ${dias}=7
    

    ${datas}=    Gerar data da consulta    ${dias}

    
    IF    '${especialidade}' != '${EMPTY}'
        Select From List By Label
        ...    ${SELECT_ESPECIALIDADE}
        ...    ${especialidade}
    END

    IF    '${medico}' != '${EMPTY}'
        Selecionar médico
        ...    ${tipo}
        ...    ${medico}  
    END

    IF    '${data}' == 'AUTO'
        Input Text
        ...    ${INPUT_DATA}
        ...    ${datas.formulario}
        ...    timeout=10
    END

    IF    '${data}' != 'AUTO' and '${data}' != '${EMPTY}'
        Input Text
        ...    ${INPUT_DATA}
        ...    ${data}
    END

    IF    '${horario}' != '${EMPTY}'
        Clicar no horário
        ...    ${horario}
    END

    IF    '${tipo}' == 'telemedicina'
        Click Button
        ...    ${BUTTON_AGENDAR_TELE}

    ELSE
        Click Button
        ...    ${BUTTON_AGENDAR_CONSULTA}

    END

    RETURN    ${datas}

Validar consulta agendada
    [Arguments]
    ...    ${especialidade}
    ...    ${medico}
    ...    ${data}
    ...    ${horario}

    Wait Until Element Is Visible
    ...    xpath=//div[@id='listaConsultas']
    ...    timeout=10

    Wait Until Page Contains
    ...    ${medico}
    ...    timeout=10

    Wait Until Page Contains
    ...    ${horario}
    ...    timeout=10

    ${xpath}=    Set Variable
    ...    (//div[@id='listaConsultas']//*[contains(., '${especialidade}') and contains(., '${medico}') and contains(., '${data}') and contains(., '${horario}')])[2]

    Element Should Be Visible
    ...    xpath=${xpath}