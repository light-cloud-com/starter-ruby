FROM ruby:3.3-alpine

RUN apk add --no-cache build-base

WORKDIR /app

COPY Gemfile Gemfile.lock* ./
RUN bundle install --without development test

COPY . .

EXPOSE 8080

# Bind the port the platform injects as $PORT; a hardcoded port fails the
# platform health check when they differ.
CMD ["sh", "-c", "bundle exec rackup -p ${PORT:-8080} -o 0.0.0.0"]
