*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Variables ***
${URL}              http://automationpractice.com
${BROWSER}          Chrome

*** Test Case ***
Cenário 01: Pesquisar produtos existentes
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produtos não existentes
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "itemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

Cenário 03: Listar produtos
    Dado que estou na página home do site
    Quando eu passar o mouse por cima da categoria "Women"
    E clicar na sub categoria "Summer Dresses"
    Então o site deve exibir a página com os produtos da sub categoria "Summer Dresses"

Caso de Teste 04: Adicionar produtos no carrinho
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "t-shirt"
    E clicar no botão "Add to cart" do produto
    E clicar no botão "Proceed to checkout"
    Então o sistema deve exibir tela do carrinho de compras com os dados do produto adicionado e os devidos valores

Caso de Teste 05: Remover produtos
    Dado que estou na página home do site
    Quando eu entrar na tela do carrinho de compras
    E clicar no botão de remoção de produtos (delete)
    Então a página deve exibir a mensagem "Your shopping cart is empty." 

Caso de Teste 06: Adicionar cliente
    Dado que estou na página home do site
    Quando eu clicar no botão “Sign in”
    E inserir um e-mail válido
    E clicar no botão "Create na account"
    E preencher os campos obrigatórios
    E clicar no botão "Register"
    Então o sistema deve exibir a página de gerenciamento da conta

*** Keywords ***
#Todos
Dado que estou na página home do site
    Acessar página home do site

#01,02 e 04
Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

#01
Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

#02
Então a página deve exibir a mensagem "No results were found for your search "${PRODUTO}""
    Conferir mensagem de erro "No results were found for your search "${PRODUTO}""

#03
Quando eu passar o mouse por cima da categoria "Women"
    Passar o mouse por cima da categoria "Women" no menu principal superior de categorias

E clicar na sub categoria "Summer Dresses"
    Clicar na sub categoria "Summer Dresses"

Então o site deve exibir a página com os produtos da sub categoria "Summer Dresses"
    Conferir se a página com os produtos da categoria selecionada foi exibida

#04
E clicar no botão "Add to cart" do produto
    Clicar no botão "Add to cart" do produto

E clicar no botão "Proceed to checkout"
    Conferir se a tela de confirmação foi exibida
    Clicar no botão "Proceed to checkout"

Então o sistema deve exibir tela do carrinho de compras com os dados do produto adicionado e os devidos valores
    Conferir se a tela do carrinho de compras foi exibida com os dados do produto adicionado e os devidos valores

#05
Quando eu entrar na tela do carrinho de compras
    Adicionar produto no carrinho
    Acessar página home do site
    Clicar no ícone carrinho de compras no menu superior direito

E clicar no botão de remoção de produtos (delete)
    Clicar no botão de remoção de produtos (delete) no produto do carrinho

Então a página deve exibir a mensagem "Your shopping cart is empty." 
    Conferir mensagem "Your shopping cart is empty."

#06
Quando eu clicar no botão “Sign in”
    Clicar no botão superior direito “Sign in”

E inserir um e-mail válido
    Conferir se a página para fazer login foi exibida
    Inserir um e-mail válido

E clicar no botão "Create an account"
    Clicar no botão "Create an account"
    Conferir se a página com os campos de cadastro foi exibida

E preencher os campos obrigatórios
    Preencher os campos obrigatórios

E clicar no botão "Register"
    Clicar em "Register" para finalizar o cadastro

Então o sistema deve exibir a página de gerenciamento da conta
    Conferir se a página de gerenciamento da conta foi exibida