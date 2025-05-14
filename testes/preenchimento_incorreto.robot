*** Settings ***
Resource         ../resources/main.robot              # Importa o arquivo de configuração do navegador
Test Setup       Dado que eu acesse o Organo          # Executa o setup do navegador
Test Teardown    Fechar o navegador                   # Executa o teardown do navegador

*** Variables ***
${BOTAO_CARD}             id:form-botao

*** Test Cases ***
Verificar se quando um campo obrigatório não é preenchido, o card não é criado e exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então o sistema deve apresentar mensagem de campo obrigatório
    

*** Keywords ***
Dado que eu clique no botão criar card
    Click Element     ${BOTAO_CARD}                   # Clica no botão de adicionar colaborador
    Sleep    3s                                       # Aguarda 3 segundos

Então o sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro    # Verifica se a mensagem de erro é exibida
    Element Should Be Visible    id:form-cargo-erro   # Verifica se a mensagem de erro é exibida
    Element Should Be Visible    id:form-times-erro   # Verifica se a mensagem de erro é exibida
    Sleep    3s                                       # Aguarda 3 segundos