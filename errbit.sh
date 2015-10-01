#!/bin/sh

export MONGO_URL=mongodb://$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/$ERRBIT_MONGO_DATABASE

bundle exec unicorn -p 8080 -o 0.0.0.0 -c ./config/unicorn.default.rb
