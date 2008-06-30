#!/usr/bin/env ruby
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

host = Host.find(3)
exercise = Exercise.create(:host => host)

opts = {
        :login => '/login/login',
        :fields => {:login => 'login', :password => 'password'},
        :host => host,
        :exercise => exercise
       }       
       
runner = RmcRunner.new(opts)
runner.memory_test('/displays/show/3')
#runner.memory_test('/displays/new')