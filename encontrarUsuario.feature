Feature: encontrar usuário
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario: Buscar user por id
        * call read("hook.feature@criarUsuario")
        * def payload = read("payloadUsuario.json")
        Given url baseUrl
        And path "/users", id
        When method get
        Then status 200
        And match response == { id: "#(payload.id)", updatedAt: "#(payload.updatedAt)", createdAt: "#(payload.createdAt)", name: "#(payload.name)", email: "#(payload.email)" }

    Scenario: Buscar usuario por id inexistente
        * def undId = java.util.UUID.randomUUID().toString()
        Given url baseUrl
        And path "/users", undId
        When method get
        Then status 404

