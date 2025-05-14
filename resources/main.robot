*** Settings ***
Library         SeleniumLibrary
Library         FakerLibrary    locale=pt_BR           # Importa a biblioteca Faker para gerar dados aleatórios Brasileiros

Resource        shared/setup_teardown.robot            # Importa o arquivo de configuração do navegador
Resource        pages/cadastro.robot                   # Importa o arquivo de palavras-chave compartilhadas