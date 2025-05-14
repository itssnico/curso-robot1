*** Settings ***
Resource             ../main.robot     # Importa o arquivo principal com as configurações do projeto

*** Variables ***             
${CAMPO_NOME}             id:form-nome
${CAMPO_CARGO}            id:form-cargo
${CAMPO_IMAGEM}           id:form-imagem
${CAMPO_TIME}             class:lista-suspensa
@{selecionar_time}
...                       //option[contains(.,'Programação')]
...                       //option[contains(.,'Front-End')]
...                       //option[contains(.,'Data Science')]
...                       //option[contains(.,'Devops')]
...                       //option[contains(.,'UX e Design')]
...                       //option[contains(.,'Mobile')]
...                       //option[contains(.,'Inovação')]
${BOTAO_CARD}             id:form-botao


*** Keywords ***
Dado que eu preencha os campos do formulário
    ${Nome}             FakerLibrary.First Name        # Gera um nome aleatório
    Input Text          ${CAMPO_NOME}        ${Nome}   # Preenche o campo de nome com o nome gerado
    ${Cargo}            FakerLibrary.Job               # Gera um cargo aleatório
    Input Text          ${CAMPO_CARGO}      ${Cargo}   # Preenche o campo de cargo com o cargo gerado
    ${Imagem}           FakerLibrary.Image Url    width=100    height=100         # Gera uma URL de imagem aleatória com largura e altura de 100px
    Input Text          ${CAMPO_IMAGEM}     ${Imagem}  # Preenche o campo de imagem com a URL gerada
    Click Element       ${CAMPO_TIME}                  # Clica na lista suspensa de times
    Click Element       ${selecionar_time}[0]          # Seleciona a opção Programação

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador     # Verifica se o colaborador foi adicionado
    Sleep    10s                                       # Aguarda 10 segundos para o card ser criado e salvo

Então identificar 3 cards no time esperado
    FOR    ${i}    IN RANGE  1  3
        Dado que eu preencha os campos do formulário
        E clique no botão criar card
    END
    Sleep    10s                                       # Aguarda 10 segundos para o card ser criado e salvo


Então criar e identificar 1 card em cada time disponível
    FOR    ${indice}    ${times}    IN ENUMERATE    @{selecionar_time}   # FOR ENUMERATE itera sobre a lista @{selecionar_times} e retorna o índice e o elemento
        Dado que eu preencha os campos do formulário
        Click Element    locator=${times}                                # Clica na lista suspensa de times
        E clique no botão criar card  
    END
    Sleep    10s                                                         # Aguarda 10 segundos para o card ser criado e salvo

E clique no botão criar card
    Click Element     ${BOTAO_CARD}                                      # Clica no botão de adicionar colaborador