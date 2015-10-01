FROM ruby:2.2.3

ENV APP_HOME /opt/errbit

ENV RAILS_ENV production
ENV HEROKU 1

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

COPY UserGemfile errbit/Gemfile errbit/Gemfile.lock $APP_HOME/
RUN bundle install --without development test

COPY errbit $APP_HOME

RUN bundle exec rake assets:precompile

EXPOSE 8080
CMD bundle exec unicorn -p 8080 -o 0.0.0.0 -c ./config/unicorn.default.rb
