require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Page create" do
  before(:each) do
    @page = Page.new
  end

  it "should be valid" do
    @page.should be_valid
  end
  
  it "should be savable" do
    @page.save.should == true
  end
  
  it "should respond to its attribute methods" do
    @page.should respond_to(:role_id)
    @page.should respond_to(:role)
    @page.should respond_to(:order)
    @page.should respond_to(:assertions)
    @page.should respond_to(:variables)
    @page.should respond_to(:section)
    @page.should respond_to(:uri_pattern)
    @page.should respond_to(:uri_actual)
  end
end
  
describe "Page update" do
  it "should have its update_uri method called and its uri_actual updated" do
    new_path = "/a/test/for/the/update_real_path/method"
    @page = pages(:web_page1)
    @page.uri_actual.should_not       == new_path
    @page.update_uri(new_path).should == true
    @page.uri_actual.should           == new_path
  end
end
