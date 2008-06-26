#! /usr/bin/env ruby
require 'yaml'
require 'pp'

require 'rubygems'
require 'mechanize'
require 'peach'

class RxRunner
  
  def initialize(options)
    @options = options
    setup
  end
  
  def setup
    if yml = @options[:settings]
      if File.file?(yml)
        @settings = YAML::load( File.open(yml) )
      end
    end
  end
  
  def login_agent_webapp(agent)
    u = @settings['webapp']['url_username'].chomp
    p = @settings['webapp']['url_password'].chomp
    begin
      page = agent.get(page_url('webapp', '/login/login'))
      form = page.forms.first
      form['login'] = u
      form['password'] = p
      page = agent.submit(form)  # sign in
    rescue
      puts 'Argh - Login Failed'
    end
  end
  
  def page_url(role, url)
    File.join(@settings[role]['url'], url)
  end
  
  def user_message(user, message)
    pad = ' '
    1.upto(user) { pad += '   ' }
    pad + message.to_s
  end
  
  def pound(role, hits_per = 10, users = 2)
    users = Array.new(users) { |i| i + 1 }
    
    users.peach do |user|

      agent = WWW::Mechanize.new    
      agent.read_timeout = 15.0 # set a 15 second timeout
      
      puts user_message(user, "user #{user}")
      
      login_agent_webapp(agent)
      variables = {}    

      1.upto(hits_per) do |hit|
        
        @settings['urls'][role].to_a.sort.each do |section, url_array|
          
          puts user_message(user, "running #{user}-#{section}-#{hit}")
          url_array.each do |url|
            route, lookfor = url.split(' ')
            begin
              if m = /%(.*?)%/.match(route)
                arr = variables[m[1]]
                value = arr[rand(arr.size)].first rescue ''
                route = route.gsub("%#{m[1]}%", value)
              end
              puts user_message(user, page_url(role, route))
              
              start_time = Time.now
              page = agent.get(page_url(role, route))
              elapsed = (Time.now - start_time)
              
              if lookfor
                var, pattern = lookfor.gsub('[', '').gsub(']', '').split(':')
                values = page.body.scan(Regexp.new(pattern))
                variables[var] = values
              end
              # get amount of time taken
              puts user_message(user, page.body.size)
              puts user_message(user, page.response['status'])
              puts user_message(user, elapsed)
            rescue WWW::Mechanize::ResponseCodeError => e
              puts user_message(user, '404')
            rescue Timeout::Error          
              puts user_message(user, 'timeout')
            end
          end
          puts user_message(user, "ending #{user}-#{section}-#{hit}")
          
        end
      
      end
      
    end
    
  end
  
end

runner = RxRunner.new(:settings => 'settings.yml')
results = runner.pound('webapp', 5, 2)
pp results