*** Settings ***
Resource        ../main.robot

*** Keywords ***
Dado que eu acesse o Organo
    Open Browser      url=http://localhost:3000/    browser=chrome   # Abre o navegador Chrome e acessa a URL

Fechar o navegador
    Close Browser                                                    # Fecha o navegador