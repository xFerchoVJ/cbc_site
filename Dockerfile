# Dockerfile
FROM ruby:3.2.0

RUN apt-get update -qq \
    && apt-get install -y nodejs postgresql-client
RUN apt install -y --no-install-recommends libvips42

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]