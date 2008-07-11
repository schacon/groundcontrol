require 'yaml'
require 'pp'

require 'rubygems'
require 'mechanize'
require 'peach'

class RmcRunner
  def initialize(options)
    @logger  = options.delete(:logger)
    @options = options
  end
  
  def logger
    @logger
  end
  private :logger
  
  def login_agent(agent)
    u = @options[:host].url_username
    p = @options[:host].url_password
    begin
      get_page = agent.get(page_url(@options[:login]))
      form = get_page.forms.first
      form[@options[:fields][:login]] = u
      form[@options[:fields][:password]] = p
      page = agent.submit(form)  # sign in
    rescue Timeout::Error          
      puts 'timeout'
    rescue
      puts 'Argh - Login Failed'
    end
  end
  
  def page_url(url)
    File.join(@options[:host].url, url)
  end
  
  def user_message(user, message)
    pad = ' '
    1.upto(user) { pad += '   ' }
    pad + message.to_s
  end
  
  def memory_test(route, times = 20)
    
    agent = WWW::Mechanize.new
    agent.log = logger unless logger.nil?
    agent.read_timeout = 15.0 # set a 15 second timeout
    login_agent(agent)
    
    1.upto(times) do |run|
      sample = hit_page(agent, route)
      puts
    end
    
  end
  
  def pound(hits_per = 10, users = 1)
    ex = @options[:exercise]
    ex.users = users
    ex.save
    
    users = Array.new(users) { |i| i + 1 }
    
    users.peach do |user|

      agent = WWW::Mechanize.new    
      agent.read_timeout = 15.0 # set a 15 second timeout
            
      login_agent(agent)
      variables = {}    

      1.upto(hits_per) do |hit|
        @options[:host].role.pages.each do |page|
          route = page.uri_pattern
          if m = /%(.*?)%/.match(route)
            arr = variables[m[1]]
            value = arr[rand(arr.size)].first rescue ''
            route = route.gsub("%#{m[1]}%", value)
          end
          sample, variables = hit_page(agent, route, variables, page)
        end
      end
      
    end
  end
  
  def hit_page(agent, route, variables = {}, page = nil)
        
    sample = Sample.create(:exercise => @options[:exercise], :page => page, :page_uri => route)
    sample.passed = false

    begin
      start_time = Time.now
      uri = page_url(route)
      logger.debug "#{self.class}#hit_page:: attempting to GET: #{uri}" unless logger.nil?
      get_page = agent.get(uri)
      elapsed = (Time.now - start_time)  # get amount of time taken

      if page && page.variables
        var, pattern = page.variables.split(':')
        values = get_page.body.scan(Regexp.new(pattern))
        variables[var] = values
      end

      # [MM: 37824.0 CH:3876.0 TM:1.380838]
      if m = /\[MM:(.*?) CH:(.*?) TM:(.*)\]/.match(get_page.body)
        puts 'mem: ' + m[1]
        puts 'chg: ' + m[2]
        puts 'tim: ' + m[3]
        sample.memory = m[2].to_i
      end
      puts 'siz: ' + get_page.body.size.to_s
      
      sample.page_size = get_page.body.size
      sample.response = get_page.code.to_i rescue nil
      logger.debug "#{self.class}#hit_page:: GET response code: #{sample.response}" unless logger.nil?

      if page && page.assertions
        # look for assertions  
      else
        sample.passed = true if sample.response == 200
      end

    rescue WWW::Mechanize::ResponseCodeError => e
      puts e.inspect
      sample.response = get_page.code.to_i rescue 404
      elapsed = (Time.now - start_time)  # get amount of time taken
    rescue Timeout::Error          
      elapsed = (Time.now - start_time)  # get amount of time taken
    ensure
      sample.time = elapsed
      sample.save
    end
    
    return [sample, variables]
  end
  
end