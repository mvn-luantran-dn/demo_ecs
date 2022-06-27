FROM ruby:2.7.5-slim

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock .

RUN gem install bundler -v 2.2.16
RUN bundle install

COPY . .

EXPOSE 3000
