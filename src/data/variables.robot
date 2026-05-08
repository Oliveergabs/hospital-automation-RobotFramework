*** Comments ***
###################################################################################################
# Name:                Variables.robot
# Description:         Massa de dados dos testes
# Project:             Sistema Hospitalar
# Author:              Gabriel Henrique - oliveerhenrique21@gmail.com
###################################################################################################

*** Variables ***

# Ambientes
${URL}                              http://localhost:8006/
${BROWSER}                          Chrome

# Paginas
${URL_HOME}                         ${URL}pages/home.html
${URL_CADASTRAR}                    ${URL}pages/cadastro.html
${URL_CONSULTA}                     ${URL}pages/consulta.html
${URL_TELEMEDICINA}                 ${URL}pages/telemedicina.html
${URL_PACIENTE}                     ${URL}pages/paciente.html

# Usuario e dados invalidos
${EMAIL_VALIDO}                      admin@hospital.com
${SENHA_VALIDA}                      Admin123
${EMAIL_INVALIDO}                    admin123hospital.com
${SENHA_INVALIDA}                    Admin
${CPF_INVALIDO}                      99999999999

# Dados do paciente
${PACIENTE_NOME}                     Administrador
${PACIENTE_EMAIL}                    admin@hospital.com
${PACIENTE_CPF}                      000.000.000-00
${PACIENTE_SEXO}                     Masculino
${NOVA_SENHA}                        Teste@123


