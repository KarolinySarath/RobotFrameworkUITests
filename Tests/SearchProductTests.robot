*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Setup
Test Teardown       Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite ou antes de um teste

*** Test Case ***
Caso de Teste 01: Pesquisar produtos existentes
#    Acessar página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produtos não existentes
#    Acessar página home do site
    Digitar o nome de produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar produtos
#    Acessar página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Conferir se as subcategorias foram exibidas
    Clicar na sub categoria "Summer Dresses"
    Conferir se a página com os produtos da categoria selecionada foi exibida

***Keywords***
Setup
    Abrir navegador
    Acessar página home do site