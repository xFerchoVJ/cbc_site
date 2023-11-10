FROM ruby:3.2.0

RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

COPY Gemfile Gemfile.lock .

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]