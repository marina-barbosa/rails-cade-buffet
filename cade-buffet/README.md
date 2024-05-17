# Cade Buffet

**Cade Buffet** é uma app desenvolvida durante o curso TreinaDev 12 da Campus Code. Esta API foi criada para facilitar a conexão entre donos de buffets e pessoas interessadas em organizar eventos. Através desta plataforma, donos de buffets podem gerenciar suas empresas, enquanto usuários regulares podem encontrar e reservar o buffet ideal para suas festas.

Este projeto demonstra minha aprendizagem em **Ruby on Rails**, **Desenvolvimento Orientado por Testes (TDD)** e uma introdução ao **Vue.js**. Para ver o repositório do aplicativo Vue.js utilizado neste projeto, [clique aqui](https://github.com/marina-barbosa/vue-cade-buffet).



<img src="rails-cade-buffet\cade-buffet\app\assets\images\screenshot.png" alt="Screenshot do App">




## Funcionalidades

### Autenticação de Usuários (usando Devise):
<br>Criar, atualizar e deletar sessões de usuário (login/logout).
<br>Resetar e editar senhas.
<br>Registrar novos usuários, editar perfis e cancelar contas.

### Gestão de Buffets:
<br>**Rota raiz**: `root` Página inicial que lista os buffets.
<br>Listar, criar, editar, atualizar e exibir detalhes de buffets.
<br>Exibir formulários para criação e edição de buffets.

### Endereços:
<br>Listar, criar, editar, atualizar e exibir detalhes de endereços.
<br>Exibir formulários para criação e edição de endereços.

### Métodos de Pagamento:
<br>Listar, criar, editar, atualizar e exibir detalhes de métodos de pagamento.
<br>Exibir formulários para criação e edição de métodos de pagamento.

### Eventos:
<br>Listar, criar, editar, atualizar e exibir detalhes de eventos.
<br>Exibir formulários para criação e edição de eventos.

### Preços:
<br>Listar, criar, editar, atualizar e exibir detalhes de preços.
<br>Exibir formulários para criação e edição de preços.

### Pedidos e Avaliações:
<br>Listar, criar, editar, atualizar e exibir detalhes de pedidos.
<br>Exibir formulários para criação e edição de pedidos.
<br>Concluir pedidos.
<br>Avaliar os serviços prestados.

### Busca Personalizada:
<br>Realizar buscas customizadas com base no tipo de evento, número de convidados e localização.

### API (versão 1):
<br>Listar e exibir detalhes de buffets.
<br>Listar eventos de um buffet específico.
<br>Verificar a disponibilidade de um evento.






## Tecnologias e Gems Utilizadas

<br>**Ruby on Rails**: Framework principal utilizado no desenvolvimento da API. [Link](https://github.com/rails/rails)
<br>**SQLite**: Banco de dados utilizado para armazenar as informações durante o desenvolvimento.
<br>**RSpec**: Ferramenta utilizada para testes.
<br>**Vue.js**: Framework JavaScript utilizado para o frontend.
<br>**rails** (~> 7.1.3, >= 7.1.3.2): Framework principal para desenvolvimento web. [Link](https://github.com/rails/rails)
<br>**rack-cors**: Middleware para habilitar CORS (Cross-Origin Resource Sharing).
<br>**sprockets-rails**: Pipeline de ativos original para Rails.
<br>**sqlite3** (~> 1.4): Banco de dados utilizado durante o desenvolvimento.
<br>**puma** (>= 5.0): Servidor web para Ruby/Rails.
<br>**devise**: Autenticação de usuários. [Link](https://github.com/heartcombo/devise)
<br>**tzinfo-data**: Necessário para fuso horário em plataformas Windows.
<br>**debug**: Ferramenta de depuração para Rails.
<br>**rspec-rails**: Ferramenta de testes para Rails. [Link](https://github.com/rspec)
<br>**capybara**: Ferramenta de teste de integração. [Link](https://github.com/teamcapybara/capybara)




## Requisitos


**Rails version**: `7.1.3.2`

**Ruby version**: `3.2.3 (2024-01-18 revision 52bb2ac0a6) [x64-mingw-ucrt]`

## Configuração do Ambiente

**Clonar o repositório**:



```sh

git clone git@github.com:marina-barbosa/rails-cade-buffet.git
cd cade-buffet

```


**Instalar as dependências**:


```sh

bundle install

```


**Configurar o banco de dados**:


Criar o banco de dados:

```sh
rails db:create
```

Rodar as migrações:

```sh
rails db:migrate
```


**Inicializar a base de dados com dados de exemplo (opcional)**:


```sh
rails db:seed
```

## Executar a Aplicação

**Iniciar o servidor**:


```sh
rails server

```


Acesse [http://localhost:3000](http://localhost:3000) no seu navegador para usar a aplicação.



## Testes


Rodar as migrações:
```sh
rails db:migrate RAILS_ENV=test
```
**Rodar a suíte de testes**:

```sh
rspec --format=documentation
```


## Endpoints

### Autenticação de Usuários (Devise)
<br>`GET    /users/sign_in`        - `devise/sessions#new`
<br>`POST   /users/sign_in`        - `devise/sessions#create`
<br>`DELETE /users/sign_out`       - `devise/sessions#destroy`
<br>`GET    /users/password/new`   - `devise/passwords#new`
<br>`GET    /users/password/edit`  - `devise/passwords#edit`
<br>`PATCH  /users/password`       - `devise/passwords#update`
<br>`PUT    /users/password`       - `devise/passwords#update`
<br>`POST   /users/password`       - `devise/passwords#create`
<br>`GET    /users/cancel`         - `devise/registrations#cancel`
<br>`GET    /users/sign_up`        - `devise/registrations#new`
<br>`GET    /users/edit`           - `devise/registrations#edit`
<br>`PATCH  /users`                - `devise/registrations#update`
<br>`PUT    /users`                - `devise/registrations#update`
<br>`DELETE /users`                - `devise/registrations#destroy`
<br>`POST   /users`                - `devise/registrations#create`

### Gestão de Buffets
<br>`GET    /`                     - `buffet#index`
<br>`GET    /buffet`               - `buffet#index`
<br>`GET    /buffet/new`           - `buffet#new`
<br>`GET    /buffet/:id/edit`      - `buffet#edit`
<br>`GET    /buffet/:id`           - `buffet#show`
<br>`PATCH  /buffet/:id`           - `buffet#update`
<br>`PUT    /buffet/:id`           - `buffet#update`
<br>`POST   /create_buffet`        - `buffet#create`

### Endereços
<br>`GET    /address`              - `address#index`
<br>`POST   /address`              - `address#create`
<br>`GET    /address/new`          - `address#new`
<br>`GET    /address/:id/edit`     - `address#edit`
<br>`GET    /address/:id`          - `address#show`
<br>`PATCH  /address/:id`          - `address#update`
<br>`PUT    /address/:id`          - `address#update`

### Métodos de Pagamento
<br>`GET    /payment_method`       - `payment_method#index`
<br>`POST   /payment_method`       - `payment_method#create`
<br>`GET    /payment_method/new`   - `payment_method#new`
<br>`GET    /payment_method/:id/edit` - `payment_method#edit`
<br>`GET    /payment_method/:id`   - `payment_method#show`
<br>`PATCH  /payment_method/:id`   - `payment_method#update`
<br>`PUT    /payment_method/:id`   - `payment_method#update`

### Eventos
<br>`GET    /event`                - `event#index`
<br>`POST   /event`                - `event#create`
<br>`GET    /event/new`            - `event#new`
<br>`GET    /event/:id/edit`       - `event#edit`
<br>`GET    /event/:id`            - `event#show`
<br>`PATCH  /event/:id`            - `event#update`
<br>`PUT    /event/:id`            - `event#update`

### Preços
<br>`GET    /price`                - `price#index`
<br>`POST   /price`                - `price#create`
<br>`GET    /price/new`            - `price#new`
<br>`GET    /price/:id/edit`       - `price#edit`
<br>`GET    /price/:id`            - `price#show`
<br>`PATCH  /price/:id`            - `price#update`
<br>`PUT    /price/:id`            - `price#update`

### Pedidos
<br>`PATCH  /order/:id/conclude`   - `order#conclude`
<br>`GET    /order`                - `order#index`
<br>`POST   /order`                - `order#create`
<br>`GET    /order/new`            - `order#new`
<br>`GET    /order/:id/edit`       - `order#edit`
<br>`GET    /order/:id`            - `order#show`
<br>`PATCH  /order/:id`            - `order#update`
<br>`PUT    /order/:id`            - `order#update`

### Busca
<br>`GET    /search`               - `home#search`

### API (versão 1)
<br>`GET    /api/v1/buffet/:buffet_id/event` - `api/v1/event#index`
<br>`GET    /api/v1/buffet`         - `api/v1/buffet#index`
<br>`GET    /api/v1/buffet/:id`     - `api/v1/buffet#show`
<br>`POST   /api/v1/check_availability` - `api/v1/event#check_availability`



## Contribuição

Contribuições são bem-vindas! Por favor, abra um pull request ou uma issue para discutirmos sua ideia.

## Licença

Este projeto está licenciado sob a licença MIT - veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## Autor

**Marina Barbosa** - Desenvolvedora Principal