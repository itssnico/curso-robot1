*** Settings ***
Resource         ../resources/main.robot            # Importa o arquivo de configuração do navegador
Suite Setup       Dado que eu acesse o Organo       # Executa o setup do navegador
Suite Teardown    Fechar o navegador                # Executa o teardown do navegador


*** Test Cases ***
Verificar se ao preencher os campos do formulário corretamente os dados são inseridos e salvos em um novo card
    [Tags]    cadastro    regressivo
    [Documentation]    Verifica se ao preencher os campos do formulário corretamente os dados são inseridos e salvos em um novo card
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possivel criar mais de um card se preenchemos os campos corretamente
    [Tags]    criar3cards    regressivo
    Dado que eu preencha os campos do formulário
    E clique no botão criar card
    Então identificar 3 cards no time esperado
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possivel criar um card para cada time disponível se preenchermos os campos corretamente
    [Tags]    criar1cardcadatime    regressivo
    Dado que eu preencha os campos do formulário
    Então criar e identificar 1 card em cada time disponível
    E clique no botão criar card