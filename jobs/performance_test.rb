#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

host_id = ARGV[0]
host = Host.find(host_id)

exercise = Exercise.create(:host => host)

opts = {
        :login => '/login/login',
        :fields => {:login => 'login', :password => 'password'},
        :host => host,
        :exercise => exercise
       }
       
       
runner = RmcRunner.new(opts)
runner.pound