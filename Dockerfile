FROM ruby:3.0.2-buster

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN apt-get update -qq && apt-get install -y postgresql-client 

WORKDIR /code
COPY . .

RUN gem install bundler
RUN bundle config unset frozen
RUN bundle config set without 'development test'
RUN bundle install

ENV RAILS_ENV production
ENV SECRET_KEY_BASE $(rails secret)
RUN chmod +x ./entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 3000

CMD bundle exec rails db:migrate && rails s -b 0.0.0.0