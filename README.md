# Clonando o repositório
````ruby
git clone https://github.com/viniciuscurti/Teste4Asset.git

# Acessando a pasta do projeto
cd Teste4Asset/

# Instalando as dependências
bundle install

# Criando o banco de dados
rails db:create

# Rodando as migrações
rails db:migrate

# Rodar os testes completos
bundle exec rspec

# Rodar um teste específico
bundle exec rspec spec/path/to/file_spec.rb

# Rodar o servidor
rails s
````
#Endpoints
##Person
###GET /people
Retorna a lista de pessoas cadastradas.

###GET /people/:id
Retorna as informações de uma pessoa específica.

###POST /people

````json
Cria uma nova pessoa. 

"Payload":

{
  "person": {
    "name": "Nome da Pessoa",
    "email": "testemail@gmail.com",
    "phone": "123456789",
    "birthdate": "1990-01-01",
    }
}
````

###PUT /people/:id
`````json
Atualiza as informações de uma pessoa específica. 
"Payload":

{
  "person": {
    "name": "Novo Nome",
    }
}
`````

###DELETE /people/:id
Deleta uma pessoa específica.

#Address

###GET /addresses
Retorna a lista de endereços cadastrados.

###GET /addresses/:id
Retorna as informações de um endereço específico.

###POST /addresses
`````json
Cria um novo endereço.
Payload:
    
    {
    "address": {
        "street": "Rua Teste",
        "number": 123,
        "city": "Cidade Teste",
        "state": "Estado Teste",
        "country": "País Teste",
        "zipcode": "12345-678",
        "person_id": person.id
    }
}
        
`````
###PUT /addresses/:id
Atualiza as informações de um endereço específico

###DELETE /addresses/:id
Deleta um endereço específico