FROM ruby:3.0

WORKDIR /usr/src/app

# COPY Gemfile Gemfile.lock ./

COPY . .

CMD ["echo", "'hi'"]