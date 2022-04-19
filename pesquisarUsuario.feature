Feature: Pesquisar Usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: buscar usuário por nome
        * call read("hook.feature@criarUsuario")
        
        Given url baseUrl
        And path "/search"
        * def payload = read("payloadNovoUsuario.json")
        And param value = payload.name
        When method get
        Then status 200
        And match response[*] == [{ id: "#notnull", updatedAt: "#notnull", createdAt: "#notnull", name: "#(payload.name)", email: "#notnull" }]    
    
    Scenario: buscar usuário por email
         * call read("hook.feature@criarUsuario")
        
        Given url baseUrl
        And path "/search"
        * def payload = read("payloadNovoUsuario.json")
        And param value = payload.email
        When method get
        Then status 200
        And match response[*] == [{ id: "#notnull", updatedAt: "#notnull", createdAt: "#notnull", name: "#notnull", email: "#(payload.email)" }]    