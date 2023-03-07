FROM ruby:3.1.0

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV RAILS_ROOT /myapp
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT
COPY . .
RUN bundle install

RUN mkdir -p ./tmp/pids

# Script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]