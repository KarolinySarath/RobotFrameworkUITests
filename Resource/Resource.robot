*** Settings ***
Library                     SeleniumLibrary    
Library                     String        

*** Variables ***
${BROWSER}                  chrome
${URL}                      http://automationpractice.com
&{CLIENTE}                  firstname=Metaline   
...                         lastname=Oliveira  
...                         password=Met@l1ne
...                         email=metaline@mailinator.com
...                         address=Rua da Alegria, 426    
...                         city=Porto    
...                         state=Puerto Rico  
...                         postcode=00927   
...                         country=United States  
...                         phonemobile=+351999999999  
...                         alias=Rua da Alegria, 426
#Texts  
${HomePageTitle}            My Store
${SearchPageTitle}          Search - My Store
${SummerDresses}            Summer Dresses - My Store
${AddedItemOk}              Product successfully added to your shopping cart
${ProductName}              t-shirt
${AccountPageTitle}         My account
${CreateAccountTitle}       Create an account
${LoginPageTitle}           Login - My Store
${LoginAuthentication}      Authentication
${CartEmpty}                Your shopping cart is empty.
${CartPageTitle}            Order - My Store
${YourCart}                 Your shopping cart
#Locators   
${SearchBar}                name=search_query
${SearchSubmit}             name=submit_search
${SearchPage}               CSS=#center_column > h1
${CategoryWoman}            //a[@title="Women"]
${ProductList}              //*[@id="center_column"]
${ProductImage}             //*[@src="http://automationpractice.com/img/p/7/7-home_default.jpg"]
${ProductLink}              //a[@class="product-name"][contains(text(),"\${PRODUTO}")]
${NoResultsMessage}         //*[contains(text(),'No results were found for your search') and contains(text(),'"\${PRODUTO}"')]
${SubcategoryDresses}       /..//*[@title="Dresses"]   
${SubcategoryLink}          /..//*[@title="\${SUB_CATEGORIA}"]
${SummerDressesCat}         //span[@class="category-name"][contains(text(), 'Summer Dresses')]
${ProductBox}               //ul[@class="product_list grid row"]/li
${ProductBoxHovered}        //li[@class="ajax_block_product col-xs-12 col-sm-6 col-md-4 first-in-line last-line first-item-of-tablet-line first-item-of-mobile-line last-mobile-line hovered"]
${AddToCart}                //a[@class="button ajax_add_to_cart_button btn btn-default"]
${ConfirmationDiv}          //div[@id='layer_cart']//h2
${GoToCheckout}             //*[@id="layer_cart"]//*[@title="Proceed to checkout"]
${CartProduct}              //*[@id="product_1_1_0_0"]
${CartProductImage}         //img[@src="http://automationpractice.com/img/p/1/1-small_default.jpg"]
${CartProductLink}          //a[contains(text(),"Faded Short Sleeve T-shirts")]
${CartProductColor}         //small/a[@href="http://automationpractice.com/index.php?id_product=1&controller=product#/size-s/color-orange"]
${CartProductPrice}         //*[@id="product_price_1_1_0"]/span[contains(text(),'$16.51')]
${Header}                   //*[@id="header"]
${FullPage}                 //*[@id="page"]
${Cart}                     ${Header}//a[@title="View my shopping cart"]
${CartQuantity}             ${Cart}//span[@class="ajax_cart_quantity"][contains(text(),'1')]
${CartPage}                 //*[@id="order"]
${DeleteToCart}             //a[@title="Delete"]
${SignIn}                   ${Header}//a[@class="login"]
${CreateAccountButton}      //*[@id="SubmitCreate"]
${RegisterButton}           //*[@id="submitAccount"]
${LoginButton}              //*[@id="SubmitLogin"]
${EmailCreateField}         //*[@id="email_create"]
${CustomerFirstnameField}   //*[@id="customer_firstname"]
${CustomerLastnameField}    id=customer_lastname
${PasswordField}            //*[@id="passwd"]
${FirstnameField}           //*[@id="firstname"]
${LastnameField}            //*[@id="lastname"]
${AddressField}             //*[@id="address1"]
${CityField}                //*[@id="city"]
${StateField}               //*[@id="id_state"]
${PostCodeField}            //*[@id="postcode"]
${CountryField}             //*[@id="id_country"]
${PhoneMobileField}         //*[@id="phone_mobile"]
${AliasField}               //*[@id="alias"]

*** Keywords ***
### Setup e Teardown - Arrange
Abrir navegador
    Open Browser                    about:blank                       ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Close Browser

Acessar página home do site
    Go To                           ${URL}
    Title Should Be                 ${HomePageTitle}

### Actions  - Act
Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                      ${SearchBar}                      ${PRODUTO}

Clicar no botão pesquisar
    Click Element                   ${SearchSubmit}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
    Mouse Down  					${CategoryWoman}
                          
Clicar na sub categoria "${SUB_CATEGORIA}"
    ${Locator}=                     Replace Variables                 ${SubcategoryLink}
    Click Link                      ${CategoryWoman}${Locator}
    Mouse Up      					${CategoryWoman}

Clicar no botão "Add to cart" do produto
    Scroll Element Into View        ${ProductList}${ProductBox}
    Mouse Over                      ${ProductList}${ProductBox}
    Wait Until Element Is Visible   ${ProductList}${ProductBoxHovered}
    Click Element                   ${AddToCart}


Clicar no botão "Proceed to checkout"
    Click Element                   ${GoToCheckout}

Adicionar produto no carrinho
    Go To                           ${URL}
    Input Text                      ${SearchBar}                      ${ProductName}
    Click Element                   ${SearchSubmit}
    Scroll Element Into View        ${ProductList}${ProductBox}
    Mouse Over                      ${ProductList}${ProductBox}
    Wait Until Element Is Visible   ${ProductList}${ProductBoxHovered}
    Click Element                   ${AddToCart}
    Wait Until Element Is Visible   ${ConfirmationDiv}
    Click Element                   ${GoToCheckout}

Clicar no ícone carrinho de compras no menu superior direito
    Click Element                   ${Cart}

Clicar no botão de remoção de produtos (delete) no produto do carrinho
    Click Element                   ${CartProduct}${DeleteToCart}

Clicar no botão superior direito “Sign in”
    Click Element                   ${SignIn}

Inserir um e-mail válido
    ${RANDOM}=                      Generate Random String            4
    Input Text                      ${EmailCreateField}               ${RANDOM}${CLIENTE.email}

Clicar no botão "Create an account"
    Click button                    ${CreateAccountButton}

Clicar em "Register" para finalizar o cadastro
    Click button                    ${RegisterButton}

Preencher os campos obrigatórios
    Input Text                      ${CustomerFirstnameField}         ${CLIENTE.firstname}
    Input Text                      ${CustomerLastnameField}          ${CLIENTE.lastname}
    Input Text                      ${PasswordField}                  ${CLIENTE.password}
    Input Text                      ${FirstnameField}                 ${CLIENTE.firstname}
    Input Text                      ${LastnameField}                  ${CLIENTE.lastname}
    Input Text                      ${AddressField}                   ${CLIENTE.address}
    Input Text                      ${CityField}                      ${CLIENTE.city}
    Select From List By Label       ${StateField}                     ${CLIENTE.state}
    Input Text                      ${PostCodeField}                  ${CLIENTE.postcode}
    Select From List By Label       ${CountryField}                   ${CLIENTE.country}
    Input Text                      ${PhoneMobileField}               ${CLIENTE.phonemobile}
    Input Text                      ${AliasField}                     ${CLIENTE.alias}
  
#Assertions - Assert
Conferir se a página de gerenciamento da conta foi exibida
    Wait Until Element Is Visible   ${ProductList}
    Page Should Contain             ${AccountPageTitle}

Conferir se a página com os campos de cadastro foi exibida
    Wait Until Element Is Visible   ${CustomerFirstnameField}         10s
    Page Should Contain             ${CreateAccountTitle}

Conferir se a página para fazer login foi exibida
    Wait Until Element Is Visible   ${FullPage}
    Title Should Be                 ${LoginPageTitle}
    Page Should Contain             ${LoginAuthentication}
    Page Should Contain Element     ${CreateAccountButton}
    Page Should Contain Element     ${LoginButton}

Conferir mensagem "Your shopping cart is empty."
    Wait Until Element Is Visible   ${FullPage}
    Page Should Contain             ${CartEmpty}

Conferir se a tela do carrinho de compras foi exibida
    Wait Until Element Is Visible   ${CartPage}
    Title Should Be                 ${CartPageTitle}
    Page Should Contain             ${YourCart}

Conferir se a tela do carrinho de compras foi exibida com os dados do produto adicionado e os devidos valores
    Title Should Be                 ${CartPageTitle}
    Page Should Contain Element     ${CartQuantity}
    Page Should Contain Image       ${CartProduct}${CartProductImage}
    Page Should Contain Element     ${CartProduct}${CartProductLink}
    Page Should Contain Link        ${CartProduct}${CartProductColor}
    Page Should Contain Element     ${CartProductPrice}

Conferir se a tela de confirmação foi exibida
    Wait Until Element Is Visible   ${ConfirmationDiv}
    Page Should Contain	            ${AddedItemOk}

Conferir se a página com os produtos da categoria selecionada foi exibida
    Wait Until Element Is Visible   ${SearchPage}
    Title Should Be                 ${SummerDresses}
    Page Should Contain Element     ${ProductList}${SummerDressesCat}

Conferir se as subcategorias foram exibidas
    Wait Until Element Is Visible	${CategoryWoman}${SubcategoryDresses}
  
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible   ${SearchPage}
    Title Should Be                 ${SearchPageTitle}
    Page Should Contain Image       ${ProductList}${ProductImage}
    ${Locator}=                     Replace Variables               ${ProductLink}
    Page Should Contain Link        ${ProductList}${Locator}

Conferir mensagem de erro "No results were found for your search "${PRODUTO}""
    Wait Until Element Is Visible   ${SearchPage}
    ${Locator}=                     Replace Variables               ${NoResultsMessage}
    Page Should Contain Element     ${ProductList}${Locator}
    