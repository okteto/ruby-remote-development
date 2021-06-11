FROM ruby:2.7.1

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock /usr/src/app
RUN bundle install
COPY . /usr/src/app
EXPOSE 8080
CMD ["ruby", "app.rb"]