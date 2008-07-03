Rails::Initializer.run do |config| 
  # Require the latest version of mechanize
  config.gem "mechanize"

  # Require a gem from a non-standard repo
  config.gem "hpricot", :source => "http://code.whytheluckystiff.net"
end