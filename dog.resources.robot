*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://dog.ceo/api

*** Keywords ***
Criar Sessao
    Create Session    dog    ${BASE_URL}

Dado que a API está disponível
    No Operation

Quando eu faço GET em ${endpoint}
    ${resposta}=    GET On Session    dog    ${endpoint}
    Set Test Variable    ${resposta}

Então o status deve ser ${status}
    Should Be Equal As Integers    ${resposta.status_code}    ${status}

E o retorno deve ser sucesso
    ${json}=    Evaluate    json.loads($resposta.text)    json
    Should Be Equal    ${json['status']}    success

E deve retornar dados
    ${json}=    Evaluate    json.loads($resposta.text)    json
    Should Not Be Empty    ${json['message']}
