Feature: atualizar usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Scenario: Atualizar usuario
            * call read("hook.feature@criarUsuario")
            * def novoNome = java.util.UUID.randomUUID() + "academy"
            * def novoEmail = java.util.UUID.randomUUID() + "@academy.com"
            * def payload = {name: "#(novoNome)", email: "#(novoEmail)"}

            Given url baseUrl
            And path "/users", id
            And request payload
            When method put
            Then status 200
            And match response == { id: "#notnull", updatedAt: "#notnull", createdAt: "#notnull", name: "#(payload.name)", email: "#(payload.email)" }
    
    