#! /usr/bin/env ruby


runner = RxRunner.new(:settings => 'settings.yml')
results = runner.pound('webapp', 5, 2)
pp results