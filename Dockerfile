FROM ruby:3.0.2

# Define o diretório de trabalho
WORKDIR /app

# Instala as dependências
COPY Gemfile Gemfile.lock /app/
RUN bundle install

# Copia o código fonte
COPY . /app

# Executa o servidor Rails
CMD ["rails", "s", "-b", "0.0.0.0"]
