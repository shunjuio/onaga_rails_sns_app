FROM ruby:3.3.5

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
