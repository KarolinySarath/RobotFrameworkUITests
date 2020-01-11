*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste 01: Adicionar cliente
    Acessar página home do site
    Clicar no botão superior direito “Sign in”
    Conferir se a página para fazer login foi exibida
    Inserir um e-mail válido
    Clicar no botão "Create na account"
    Conferir se a página com os campos de cadastro foi exibida
    Preencher os campos obrigatórios
    Clicar em "Register" para finalizar o cadastro
    Conferir se a página de gerenciamento da conta foi exibida