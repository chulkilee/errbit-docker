FROM ruby:2.3.1

WORKDIR /usr/src/app
EXPOSE 3000
RUN gem install bundler
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && apt-get -y --no-install-recommends install nodejs && rm -rf /var/lib/apt/lists/*

COPY errbit/Gemfile errbit/Gemfile.lock UserGemfile /usr/src/app/
RUN bundle install --jobs 8 --retry 5

COPY errbit /usr/src/app
RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
