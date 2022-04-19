Feature: Remover usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

Scenario: Deletar usuario
        * call read("hook.feature@criarUsuario")
        Given url baseUrl
        And path "/users", id
        When method delete
        Then status 204