require File.join(File.dirname(__FILE__), '..', '..', 'test', 'test_helper')
require File.join(File.dirname(__FILE__), '..', '..', 'lib', 'selenium_importer', 'selenium_importer')

class SeleniumImporterTest < Test::Unit::TestCase
  def test_new
    assert_not_nil @s = SeleniumImporter.new
    assert_equal   "SeleniumImporter", "#{@s.class}"
  end
  
  def test_import_invalid_input
    test_new
    assert_equal   false, @s.import(nil)
    assert_equal   false, @s.import("")
    assert_equal   false, @s.import("no/such/file")
  end
  
  # TODO:GVT: continue implementing this test and its class so that the commented out line would pass
  def test_import
    test_new
    # page_count =  Page.count(true)
    assert_equal  true,  @s.import(File.join(File.dirname(__FILE__), 'rmc.html')), "this file does exist and is expected to be readable"
    # assert_equal  page_count+1, Page.count(true)
  end
end
