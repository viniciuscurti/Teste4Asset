Teste4Asset
Este é um aplicativo web simples em Rails que permite o gerenciamento de endereços de pessoas.

Utilização com Docker
Este aplicativo pode ser executado em um ambiente Docker usando o Docker Compose. Para iniciar o aplicativo em um ambiente Docker, execute o seguinte comando:

Copy code
docker-compose up -d
Para parar o aplicativo em um ambiente Docker, execute o seguinte comando:

Copy code
docker-compose down
Testes
Os testes são executados usando o RSpec. Para executar os testes em um ambiente Docker, use o seguinte comando:

arduino
Copy code
docker-compose run web bundle exec rspec
Endpoints
A API possui os seguintes endpoints:

GET /people
Retorna uma lista de todas as pessoas registradas.

GET /people/:id
Retorna os detalhes de uma pessoa específica.

POST /people
Cria uma nova pessoa.

Payload
json
Copy code
{
  "name": "John Doe",
  "email": "johndoe@example.com"
}
PUT /people/:id
Atualiza uma pessoa existente.

Payload
json
Copy code
{
  "name": "Jane Doe",
  "email": "janedoe@example.com"
}
DELETE /people/:id
Exclui uma pessoa existente.

Contribuindo
Se você encontrar algum problema ou tiver alguma sugestão para melhorar este aplicativo, sinta-se à vontade para criar uma issue ou pull request.