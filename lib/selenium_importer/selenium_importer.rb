class SeleniumImporter
  attr_reader :errors, :exercise
  
  # could pass the argument with a :log key that contains an instance of a Logger object.
  def initialize(args={})
    @log      = args[:log] # will contain an instance of some type of Logger object (Ruby, Log4R, etc.)
    log.debug "#{self.class} initialize called.."
    @errors   = []  # an array of error messages
    @exercise = nil # will contain the exercise created upon import
  end
  
  def log
    @log
  end
  private :log
  
  # arg should be a file path to the file to be imported
  def import(f)
    unless f
      @errors << "Please indicate a file to import"
      return false
    end
    unless File.exists?(f) && File.readable?(f)
      @errors << "The file to import must exist at the given path and must be readable"
      return false
    end
    
    doc  = REXML::Document.new(File.read(f))
    rows = REXML::XPath.match(doc, '//tbody/tr')
    if rows && rows.empty?
      @errors << "No table rows found -- nothing to import"
      return false
    elsif rows && !rows.empty?
      # begin processing the selenium test cases' contents
      # create a new Exercise object
      exercise = Exercise.new(:exercise_type => Exercise::EXERCISE_TYPES[0])
      # get the web app role ready to use later
      role     = Role.find_by_role("web application server")
      # check to see if the Host already exists by getting it from the URL and searching for it
      url_to_open = nil
      rows.each_with_index do |row,i|
        cells   = REXML::XPath.match(row, 'td')
        command = cells[0].text
        value   = cells[1].text
        unless self.respond_to?(command)
          @errors << "Unknown command: #{command}. Aborted"
          return false
        end
        if i == 0 # open should be the first command, so capture the url to be opened when i == 0
          url_to_open = value
          url_parts = URI.split url_to_open
          host = Host.new(
            :url  => "#{url_parts[0]}://#{url_parts[2]}", 
            :role => role
          )
          host.save
          exercise.host = host
        elsif self.respond_to?(command)
          if command =~ /assert/
            m = (command.match(/[A-Z]/))
            # command_with_underscore = 
            page = Page.new(:assertions => '', :role => role)
          end
        end
        map_selenium_to_groundcontrol(command, value)
      end
    end
    @exercise = exercise
    @exercise.save
  end
  
  def map_selenium_to_groundcontrol(command, value)
    self.send(command, value)
  end
  def open(url)
  end
  def click(what)
  end
  def assertTitle(title)
  end
end
