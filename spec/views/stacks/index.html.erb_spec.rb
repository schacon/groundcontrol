require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/index.html.erb" do
  include StacksHelper
  
  before(:each) do
    @stacks          = Stack.find(:all)
    assigns[:stacks] = @stacks
  end

  it "should render list of stacks" do
    render "/stacks/index.html.erb"
    response.should include_text(display_hosts(@stacks[0]))
  end
end
