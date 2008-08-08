# This file is copied to ~/spec when you run 'ruby script/generate rspec'
# from the project root directory.
ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec'
require 'spec/rails'

Spec::Runner.configure do |config|
  # If you're not using ActiveRecord you should remove these
  # lines, delete config/database.yml and disable :active_record
  # in your config/boot.rb
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'

  # == Fixtures
  #
  # You can declare fixtures for each example_group like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so right here. Just uncomment the next line and replace the fixture
  # names with your fixtures.
  #
  # config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
  #
  # You can also declare which fixtures to use (for example fixtures for test/fixtures):
  #
  config.fixture_path = RAILS_ROOT + '/test/fixtures/'
  #
  config.global_fixtures = :all
  
  # == Mock Framework
  #
  # RSpec uses it's own mocking framework by default. If you prefer to
  # use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  #
  # == Notes
  # 
  # For more information take a look at Spec::Example::Configuration and Spec::Runner
  
  
  # creates a general use Page model with its basic methods stubbed out
  def mock_page_model()
    page = mock_model(Page)
    page.stub!(:uri_pattern).and_return("/test/path/%display_id%/edit")
    page.stub!(:assertions).and_return("test assertion")
    page.stub!(:variables).and_return("display_id")
    page.stub!(:section).and_return("display")
    page.stub!(:post_data).and_return("")
    page
  end
  
  # asserts that the basic form fields are present for a Page form.
  # intended to be called from within a "response.should have_tag("form[action=?][method=post]", pages_path) do" block
  def verify_form_for_page
    with_tag('input#page_uri_pattern[name=?]',"page[uri_pattern]")
    with_tag('input#page_assertions[name=?]', "page[assertions]")
    with_tag('input#page_variables[name=?]',  "page[variables]")
    with_tag('input#page_section[name=?]',    "page[section]")
  end
  
  # creates a general use Sample model with its basic methods stubbed out
  def mock_sample_model()
    sample = mock_model(Sample)
    sample.stub!(:passed).and_return(nil)
    sample.stub!(:response).and_return(nil)
    sample.stub!(:user).and_return(nil)
    sample.stub!(:time).and_return(nil)
    sample.stub!(:page_size).and_return(nil)
    sample.stub!(:page_uri).and_return(nil)
    sample.stub!(:changed_memory).and_return(nil)
    sample.stub!(:total_memory).and_return(nil)
    sample
  end
end
