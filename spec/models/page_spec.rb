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
  end
end
