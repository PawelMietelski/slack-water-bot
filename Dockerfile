FROM ruby:3.1.0

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV RAILS_ROOT /myapp
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Set production environment
ENV RAILS_LOG_TO_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"

COPY . .
RUN bundle install

RUN mkdir -p ./tmp/pids

# Script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["./bin/rails", "server"]