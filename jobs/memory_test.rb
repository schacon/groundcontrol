#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

ex_id       = ARGV[0]
uri_to_test = ARGV[1]
exercise    = Exercise.find(ex_id)
host        = exercise.host
opts        = {
    :login    => '/login/login',
    :fields   => {:login => 'login', :password => 'password'},
    :host     => host,
    :exercise => exercise,
    :logger   => RAILS_DEFAULT_LOGGER
}

runner = RmcRunner.new(opts)
runner.exercise_memory(uri_to_test, 1)
