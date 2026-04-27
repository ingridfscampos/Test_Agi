*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                            chrome
${URL}                                https://blogdoagi.com.br/
${HEADER_AGIBANK}                     //span[@class='menu-text'][normalize-space()='O Agibank']
${TEXTO_HEADER_AGIBANK}               O Agibank
${ICON_SEARCH}                        xpath=//a[@aria-label='Search icon link']
${BOTTON_SEARCH}                      //button[@id='search_submit']
${TEXTO_RESULTADO_NAO_ENCONTRADO}     Lamentamos, mas nada foi encontrado para sua pesquisa, tente novamente com outras palavras.


*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible  ${HEADER_AGIBANK}

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que o usuário acesse o site 'Agi Blog'
    Go To    ${URL}

Quando a página inicial do blog for carregada
    Wait Until Page Contains Element    ${ICON_SEARCH}    10s
    Wait Until Page Contains    text=${TEXTO_HEADER_AGIBANK}

Então o ícone da lupa deve estar visível na tela
    Element Should Be Visible    ${ICON_SEARCH}

Quando clicar no ícone de busca
    Click Element     ${ICON_SEARCH}

E informar o termo "Vinagre"
    Input Text    //input[@placeholder='Digite sua busca']   text=Vinagre
    
E executar a pesquisa
    Click Element     ${BOTTON_SEARCH}

Então o sistema deve exibir uma mensagem informando que nenhum resultado foi encontrado
    Wait Until Page Contains    ${TEXTO_RESULTADO_NAO_ENCONTRADO}

E informar o termo "Inss"
    Input Text    //input[@placeholder='Digite sua busca']   text=Inss

Então devem ser exibidos posts relacionados à palavra "inss"
    Wait Until Page Contains    text=inss                 
    