*** Settings ***
Resource       dog.resources.robot
Suite Setup    Criar Sessao

*** Test Cases ***
Caso de teste 01 - Listar todas as raças
    [Documentation]    Valida que a API retorna a lista completa de raças de cães com sucesso.
    [Tags]             positivo
    Dado que a API está disponível
    Quando eu faço GET em /breeds/list/all
    Então o status deve ser 200
    E o retorno deve ser sucesso

Caso de teste 02 - Buscar imagens por raça
    [Documentation]    Valida que a API retorna imagens para uma raça válida.
    [Tags]             positivo
    Dado que a API está disponível
    Quando eu faço GET em /breed/hound/images
    Então o status deve ser 200
    E deve retornar dados

Caso de teste 03 - Buscar imagem aleatória
    [Documentation]    Valida que a API retorna uma imagem aleatória com sucesso.
    [Tags]             positivo
    Dado que a API está disponível
    Quando eu faço GET em /breeds/image/random
    Então o status deve ser 200
    E o retorno deve ser sucesso

Caso de teste 04 - Buscar raça inválida
    [Documentation]    Valida o comportamento da API ao buscar uma raça inexistente.
    [Tags]             negativo    erro
    Dado que a API está disponível
    Quando eu faço GET em /breed/invalidbreed/images
    Então o status deve ser 404    