require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Stack do
  before(:each) do
    @stack = Stack.new
  end

  it "should be valid" do
    @stack.should be_valid
  end
end
