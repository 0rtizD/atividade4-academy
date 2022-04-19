Feature: listar
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários

    Scenario: Listar usuarios
        * call read("hook.feature@criarUsuario")
        Given url baseUrl
        And path "/users"
        When method get
        Then status 200
        And match response  == "#array"
        And match response[0] == "#object"