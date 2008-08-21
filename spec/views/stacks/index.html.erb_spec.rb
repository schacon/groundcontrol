require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/index.html.erb" do
  include StacksHelper
  
  before(:each) do
    assigns[:stacks] = Stack.find(:all)
  end

  it "should render list of stacks" do
    render "/stacks/index.html.erb"
  end
end
