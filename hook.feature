Feature: hook

    @criarUsuario
    Scenario: Criar usuario    
        * def name = java.util.UUID.randomUUID() + "academy"
        * def email = java.util.UUID.randomUUID() + "@academy.com"
        * def payload = read("payloadNovoUsuario.json")
        Given url baseUrl
        And path "/users"
        And request payload
        When method post
        * def id = response.id
        * def createdAt = response.createdAt
        * def updatedAt = response.updatedAt
