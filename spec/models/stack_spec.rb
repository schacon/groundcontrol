require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Empty Stack" do
  before(:each) do
    @stack = Stack.new
  end

  it "should be valid while empty" do
    @stack.should be_valid
  end
  
  it "should be savable" do
    @stack.save.should == true
  end
  
  it "should have the expected associations" do
    @stack.roles.should be_empty
  end
end

describe "Create Stack" do
  before(:each) do
    @stack = Stack.new
  end
  
  it "should be able to be populated with data and saved" do
    new_name = "Stack rspec test"
    @stack.name == new_name
    @stack.roles << roles(:rmc_internal)
    @stack.roles << roles(:web_app1)
    
    @stack.should be_valid
    @stack.save.should == true
    @stack.roles.should_not be_empty
    @stack.roles.size.should == 2
  end
end
