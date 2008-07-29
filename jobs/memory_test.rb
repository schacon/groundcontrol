#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

ex_id       = ARGV[0]
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
# TODO:GVT: the call to RmcRunner.memory_test needs to be changed to have a different signature
runner.memory_test('/')
