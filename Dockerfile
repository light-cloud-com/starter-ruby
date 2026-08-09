FROM ruby:3.3-alpine

RUN apk add --no-cache build-base

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle install --without development test

COPY . .

EXPOSE 8080

CMD ["bundle", "exec", "rackup", "-p", "8080", "-o", "0.0.0.0"]
