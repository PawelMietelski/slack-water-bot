#!/bin/bash

# Exit on fail
set -e

rm -f $RAILS_ROOT/tmp/pids/server.pid

# If running the rails server then create or migrate existing database
if [ "${*}" == "./bin/rails server" ]; then
  ./bin/rails db:prepare
fi

exec "$@"
