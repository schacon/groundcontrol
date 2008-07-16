# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # Make these gems local to the app by running "rake gems:unpack"
  config.gem "mechanize" # the latest version of mechanize
  config.gem "hpricot", :source => "http://code.whytheluckystiff.net"# the latest version of hpricot from a non-standard repo

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_ground_control_session',
    :secret      => 'cc39b2afebc13989b344e8b41578795f813b35b67fab51448346ae49c7a54e0998d1c8160bcd100ec8a6ba3016c608b367d8768087a5f76ac8daf2696d7b3bef'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector
  config.active_record.colorize_logging = false

end

##
# customize the application-wide javasacript libraries here -- just the bare minimum shared by every page.
# other pages that need more can use the content_for(:header, javascript_include_tag("jquery")) method.
# it is important to do it this way because some JavaScript libs give each other errors.
# (jquery.js and Prototype's dragdrop.js cannot be loaded together)
ActionView::Helpers::AssetTagHelper::register_javascript_expansion(
    :ground_control_js_base => ['application']
)

##
# customize the application-wide CSS here -- just the bare minimum shared by every page.
# other pages that need more can use the content_for(:header, stylesheet_link_tag("the_style")) method.
ActionView::Helpers::AssetTagHelper::register_stylesheet_expansion(
    :ground_control_css_base => ['reset-fonts-grids', 'style']
)
