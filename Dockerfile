FROM ruby:2.5.1-alpine

WORKDIR /dogs
COPY . .

RUN apk add --no-cache --update \
    build-base \
    postgresql-dev \
    tzdata

RUN bundle install

COPY . .
