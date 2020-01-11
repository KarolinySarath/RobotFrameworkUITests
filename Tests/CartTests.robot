*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste 01: Adicionar produtos no carrinho
    Acessar página home do site
    Digitar o nome de produto "t-shirt" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart" do produto
    Conferir se a tela de confirmação foi exibida
    Clicar no botão "Proceed to checkout"
    Conferir se a tela do carrinho de compras foi exibida com os dados do produto adicionado e os devidos valores
    
Caso de Teste 02: Remover produtos
    Adicionar produto no carrinho
    Acessar página home do site
    Clicar no ícone carrinho de compras no menu superior direito
    Conferir se a tela do carrinho de compras foi exibida
    Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Conferir mensagem "Your shopping cart is empty."
