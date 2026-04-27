*** Settings ***
Documentation    Essa suite testa o Blog do Agi
Resource         blog.resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 01 - Validar visibilidade do ícone de busca no Blog do Agi
    [Documentation]        Esse teste verifica se o ícone lupa está sendo apresentado corretamente no Agi Blog
    [Tags]                 pesquisa
    Dado que o usuário acesse o site 'Agi Blog'
    Quando a página inicial do blog for carregada
    Então o ícone da lupa deve estar visível na tela
  
Caso de teste 02 - Pesquisar por termo sem resultados no Blog do Agi
    [Documentation]        Esse teste verifica o comportamento da busca com termos inexistentes no Agi Blog
    [Tags]                 pesquisa
    Dado que o usuário acesse o site 'Agi Blog'
    Quando clicar no ícone de busca
    E informar o termo "Vinagre"
    E executar a pesquisa
    Então o sistema deve exibir uma mensagem informando que nenhum resultado foi encontrado

Caso de teste 03 - Pesquisar pela palavra "inss" no blog do Agi
    [Documentation]        Esse teste verifica o comportamento da busca com termos existentes no Agi Blog
    [Tags]                 pesquisa        
    Dado que o usuário acesse o site 'Agi Blog'
    Quando clicar no ícone de busca
    E informar o termo "Inss"
    E executar a pesquisa
    Então devem ser exibidos posts relacionados à palavra "inss"
 



