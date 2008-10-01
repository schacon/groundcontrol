require File.join(File.dirname(__FILE__), '..', '..', 'test', 'test_helper')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'selenium_importer', 'selenium_importer')

class SeleniumImporterTest < Test::Unit::TestCase
  def test_new
    assert_not_nil @s = SeleniumImporter.new(:log => RAILS_DEFAULT_LOGGER)
    assert_equal   "SeleniumImporter", "#{@s.class}"
  end
  
  def test_import_invalid_input
    test_new
    assert_equal   false, @s.import(nil)
    assert_equal   false, @s.import("")
    assert_equal   false, @s.import("no/such/file")
  end
  
  def test_exercise
    test_new
    assert_equal nil, @s.exercise, "should be nil when the import method has not been called"
    assert_import
    exercise = @s.exercise
    assert_not_nil exercise, "should be an instance of Exercise"
    assert_equal "Exercise", "#{exercise.class}", "should be an instance of Exercise"
  end
  
  # TODO: continue implementing this test and its class so that the commented out lines would pass
  def test_import
    test_new
    exercise_count = Exercise.count(true)
    assert_import
    assert_equal exercise_count+1, Exercise.count(true)
    exercise =   @s.exercise
    assert_equal "https://reactrix.rmc1.xen.reactrix.com", exercise.host.url
    assert_equal Exercise::EXERCISE_TYPES[0], exercise.exercise_type
    assert_equal "web application server", exercise.host.role.role
    # assert_equal "https://reactrix.rmc1.xen.reactrix.com/displays/list", exercise.host.url,  "expected the Host to have a URL"
    # page =       exercise.host.role.pages.find(:all, :order => 'id DESC').first
    # assert_equal "assert_title", page.assertions
  end

private
  def assert_import
    assert_equal true,  @s.import(File.expand_path(File.join(File.dirname(__FILE__), 'rmc.html'))), @s.errors.to_s
  end
end
