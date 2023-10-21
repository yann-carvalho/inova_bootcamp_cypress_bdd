#language: pt

Funcionalidade: Login no Saucedemo

    Como usuário
    Quero logar no site
    Para fazer compras

Contexto:
    Dado que eu acesse a página de autenticação do site Saucedemo

    Cenario: Autenticação válida
        Quando for digitado o usuário "standard_user"
        E for digitada a senha "secret_sauce"
        Então deve ser exibida a página de compras com o termo "Products"

    Cenario: Usuário inexistente
        Quando for digitado o usuário usuario_invalido
        E for digitada a senha "secret_sauce"
        Então será exibida a mensagem "Epic sadface: Username and password do not match any user in this service"

    Cenario: Senha inválida
        Quando for digitado o usuário "standard_user"
        E for digitada a senha "chama_na_bota"
        Então será exibida a mensagem "Epic sadface: Username and password do not match any user in this service"

    Cenario: Usuário em branco
        Quando não for digitado nada no campo de usuário
        E for digitada a senha "secret_sauce"
        Então será exibida a mensagem "Epic sadface: Username is required"

    Esquema do Cenario: Logins inválidos com tabela
        Quando eu digitar o <usuario>
        E a senha <senha>
        Então deve ser exibida a mensagem <mensagem>
        Exemplos:
        |        usuario        |          senha          |                                    mensagem                                       |
        |  "usuario_invalido"   |   "secret_sauce"        |    "Epic sadface: Username and password do not match any user in this service"    |
        |   "standard_user"     |   "chama_na_bota"       |    "Epic sadface: Username and password do not match any user in this service"    |
        |   usuario em branco   |    "secret_sauce"       |    "Epic sadface: Username is required"                                           |
        |   "standard_user"     |    "secret_sauce"       |    exibida a página de compras com o termo "Products"                             |
