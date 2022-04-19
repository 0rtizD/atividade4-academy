Feature: Criar Usuário 
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente
    
    Scenario: Cadastrar usuario
        * def name = java.util.UUID.randomUUID() + "academy"
        * def email = java.util.UUID.randomUUID() + "@academy.com"
        * def payload = read("payloadNovoUsuario.json")
        Given url baseUrl
        And path "/users"
        And request payload
        When method post
        Then status 201
        And match response == { id: "#notnull", updatedAt: "#notnull", createdAt: "#notnull", name: "#(payload.name)", email: "#(payload.email)" }

    Scenario: Cadastrar usuario com email existente
        * call read("hook.feature@criarUsuario")
        * def payload = {name: "#(name)", email: "#(email)" }
        Given url baseUrl
        And path "/users"
        And request payload
        When method post
        Then status 422
    
    Scenario: Cadastrar usuario com mais de 100 caracteres no nome
        * def name = java.util.UUID.randomUUID() + "07cf98a4-8070-4f74-bd40-43bb039e569b07cf98a4-8070-4f74-bd40-43bb0"
        * def email = java.util.UUID.randomUUID() + "@academy.com"
        * def payload = {name: "#(name)", email: "#(email)" }
        Given url baseUrl
        And path "/users"
        And request payload
        When method post
        Then status 400
    
    Scenario: Cadastrar usuario com mais de 60 caracteres no email
        * def name = java.util.UUID.randomUUID() + "07cf98a4-8070-4f74-bd40-43bb039e569b07cf98a4-8070-4f74-bd40-43bb0"
        * def email = java.util.UUID.randomUUID() + "094e3591c48bd@academy.com"
        * def payload = {name: "#(name)", email: "#(email)" }
        Given url baseUrl
        And path "/users"
        And request payload
        When method post
        Then status 400