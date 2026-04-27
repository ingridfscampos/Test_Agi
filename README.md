# Test_Agi
Repositório teste prático QA

# Testes do Agi Blog

## Sobre
Projeto de testes automatizados para validar funcionalidades de busca no site Agi Blog usando **Robot Framework**.

* Os testes validam:

1. Validar visibilidade do ícone de busca: Verifica se o ícone da lupa está visível na página inicial do Blog do Agi.
2. Pesquisar por termo sem resultados: Valida que ao pesquisar por um termo inexistente ("Vinagre"), o sistema exibe a mensagem de nenhum resultado encontrado.
3. Pesquisar por termo com resultados: Valida que ao pesquisar pelo termo "Inss", o sistema retorna posts relacionados.

## Tecnologias
* Robot Framework
* SeleniumLibrary
* Navegador Google Chrome
* ChromeDriver
* Python


## Estrutura
blog_agi.robot         # Testes
blog.resources.robot   # Keywords
README.md              # Documentação do projeto

## Testes implementados
* Listar raças
* Buscar imagens por raça
* Buscar imagem aleatória
* Buscar raça inválida


## Como executar
Instalar dependências:
pip install robotframework robotframework-requests

* Rodar os testes:
  robot blog_agi.robot

## Relatório de Execução de Testes - Blog Agi
Ferramenta: Robot Framework
Data da execução: 27/04/2026
Ambiente: Local

* Resumo Geral
* Total de testes: 3
* Passaram: 3
* Falharam: 0
* Ignorados: 0
* Tempo total: 28s

## Resultados dos Testes
Caso de Teste                  | Descrição                                                | Status   
------------------------------ | -------------------------------------------------------- | -------- 
CT01 - Validar ícone de busca  | Verifica se o ícone de busca (lupa) está visível no Blog | ✅ Passou 
CT02 - Pesquisa sem resultados | Valida comportamento ao buscar termos inexistentes       | ✅ Passou 
CT03 - Pesquisa com resultados | Valida retorno ao buscar um termo existente ("inss")     | ✅ Passou 

## Observação
Todos os testes foram executados com sucesso, validando os principais comportamentos da funcionalidade de busca do Blog Agi:
* Exibição correta do campo de busca
* Tratamento adequado para buscas sem resultado
* Retorno correto para buscas válidas

## Relatório Completo
Para mais detalhes, acesse o relatório gerado pelo Robot Framework: /RobotFramework/BlogAgi/report.html

----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Testes da Dog API

## Sobre
Projeto de testes automatizados para a Dog API usando **Robot Framework**.

Os testes validam:

* Status das respostas
* Retorno da API

## Tecnologias
* Robot Framework
* RequestsLibrary
* Python

## Estrutura
dog_api.robot         # Testes
dog.resources.robot   # Keywords
README.md             # Documentação do projeto

## Testes implementados
* Listar raças
* Buscar imagens por raça
* Buscar imagem aleatória
* Buscar raça inválida

## Como executar
Instalar dependências:
pip install robotframework robotframework-requests

Rodar os testes:
robot dog_api.robot

## Relatório de Execução de Testes - Dog API
Ferramenta: Robot Framework
Data da execução: 27/04/2026
Ambiente: Local

* Resumo Geral
* Total de testes: 4
* Passaram: 3
* Falharam: 1
* Ignorados: 0
* Tempo total: 1.253s

 ## Resultados dos Testes
 Caso de Teste                  | Descrição                                  | Status            
 ------------------------------ | ------------------------------------------ | ----------------- 
 CT01 - Listar todas as raças   | Valida retorno da lista completa de raças  | ✅ Passou         
 CT02 - Buscar imagens por raça | Valida retorno de imagens por raça válida  | ✅ Passou        
 CT03 - Buscar imagem aleatória | Valida retorno de imagem aleatória         | ✅ Passou        
 CT04 - Buscar raça inválida    | Valida comportamento para raça inexistente | ⚠️ Falha esperada

## Detalhe da Falha Esperada
* Endpoint: /breed/invalidbreed/images
* Status retornado: 404 Not Found
* Motivo: A API não encontrou a raça informada

## Observação:
Este teste foi projetado para validar um cenário negativo.
A falha é esperada e considerada sucesso do ponto de vista de validação, pois a API respondeu corretamente com erro 404 para uma raça inexistente.

## Relatório Completo
Para mais detalhes, acesse o relatório gerado pelo Robot Framework: /RobotFramework/DogApi/report.html 

----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Testes do BlazeDemo

## Sobre
Esse projeto tem como objetivo validar a performance do fluxo de compra de passagem aérea no site BlazeDemo **Jmeter**.

Os testes validam:

1- Acesso a página inicial
2- Seleção da origem e destino
3- Busca dos voos disponíveis
4- Escolha de um voo
5- Preenchimento dos dados de compra
6- Finalização da compra

URL testada:
https://www.blazedemo.com

## Tecnologias
* JMeter
* Java JDK 8+
* Pluggin Throughput Shaping Timer

## Estrutura
* Passagem area2.jmx   Script de teste de carga do JMeter
* README.md            Documentação do projeto

## Controle de Throughput
Durante a configuração do teste, foi identificado que o componente nativo do JMeter, Constant Throughput Timer, permite configurar a taxa de execução apenas em amostras por minuto, não oferecendo controle direto de requisições por segundo.
Como o cenário exigia atingir 250 requisições por segundo, foi necessário utilizar o plugin Throughput Shaping Timer, disponível no pacote de plugins do JMeter.
Esse plugin possibilita definir a taxa de throughput por segundo de forma mais precisa, permitindo configurar e manter a carga desejada ao longo da execução do teste, atendendo melhor ao critério estabelecido.
E além disso também me ajudou com o teste de pico e carga, porque através dele foi possível configurar a quantidade inicial e final de requisições desejada.

## Configuração do Teste - Pico
* Thread Group
    Threads (Users): 1000
    Ramp-up: 1 segundos
    Loop Count: Forever
* Timer
    Throughput Shaping Timer: 
        Start RPS: 250
        End RPS: 250
        Duration, sec: 60

## Resultados Obtidos - Pico
Durante a execução do teste, foi possível atingir uma vazão máxima de 238 req/s.
O objetivo inicial era alcançar:

* Vazão de 250 req/s
* Percentil 90 inferior a 2000 ms
* Taxa de erro igual a 0%

Entretanto, ao aumentar a carga para acima de 1000 usuários simultâneos, a máquina utilizada para execução apresentou limitações de recursos e desligava durante o teste.
Dessa forma, o melhor resultado estável obtido foi:

* Vazão máxima de 238 req/s
* Execução estável até 1000 threads
* Sem falhas críticas durante a execução nessa carga

Esse resultado demonstra que o cenário configurado ficou próximo da meta estabelecida, porém limitado pela capacidade da infraestrutura local utilizada para geração da carga.

Arquivo relátorio: Teste_Pico.jtl

## Configuração do Teste - Carga
* Thread Group
    Threads (Users): 700
    Ramp-up: 1 segundos
    Loop Count: Forever
* Timer
    Throughput Shaping Timer: 
        Start RPS: 0
        End RPS: 250
        Duration, sec: 60

## Resultados Obtidos - Carga
Durante a execução do teste, foi possível atingir uma vazão média de 94,2 req/s.
O objetivo inicial era alcançar:

* Vazão de 250 req/s
* Percentil 90 inferior a 2000 ms
* Taxa de erro igual a 0%

Entretanto, ao aumentar a carga para acima de 700 usuários simultâneos, a máquina utilizada para execução apresentou limitações de recursos, causando travamentos durante o teste e impossibilitando a continuidade da execução com cargas maiores.
Dessa forma, o melhor resultado estável obtido foi:

* Vazão média de 94,2 req/s
* Execução estável até 700 threads
* Sem falhas críticas durante a execução nessa carga

Esse resultado demonstra que o cenário configurado ficou abaixo da meta estabelecida, principalmente devido às limitações da infraestrutura local utilizada para geração da carga, que não conseguiu acompanhar a demanda necessária para atingir o throughput esperado.

Arquivo relátorio: Teste_Carga.jtl

## Como executar
* Como Executar
    Abrir o Apache JMeter
    Carregar o arquivo Passagem area2.jmx
    Executar o teste clicando em Start
    Acompanhar resultados no Summary Report
* Ou via linha de comando:
    jmeter -n -t Passagem area2.jmx -l resultados.jtl

## Autor
Ingrid
