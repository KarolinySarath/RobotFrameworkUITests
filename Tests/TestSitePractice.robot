*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois de uma suite ou antes de um teste

*** Test Case ***
Caso de Teste 01: Pesquisar produtos existentes
    Acessar página home do site
    Digitar o nome de produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produtos não existentes
    Acessar página home do site
    Digitar o nome de produto "itemNãoExistente" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar produtos
    Acessar página home do site
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    Conferir se as subcategorias foram exibidas
    Clicar na sub categoria "Summer Dresses"
    Conferir se a página com os produtos da categoria selecionada foi exibida

Caso de Teste 04: Adicionar produtos no carrinho
    Acessar página home do site
    Digitar o nome de produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto
    Conferir se a tela de confirmação foi exibida
    Clicar no botão "Proceed to checkout"
    Conferir se a tela do carrinho de compras foi exibida com os dados do produto adicionado e os devidos valores
    
Caso de Teste 05: Remover produtos
    Adicionar produto no carrinho
    Acessar página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    Conferir se a tela do carrinho de compras foi exibida
    Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Conferir mensagem "Your shopping cart is empty."

Caso de Teste 06: Adicionar cliente
    Acessar página home do site
    Clicar no botão superior direito “Sign in”
    Conferir se a página para fazer login foi exibida
    Inserir um e-mail válido
    Clicar no botão "Create an account"
    Conferir se a página com os campos de cadastro foi exibida
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro
    Conferir se a página de gerenciamento da conta foi exibida

*** Keywords ***