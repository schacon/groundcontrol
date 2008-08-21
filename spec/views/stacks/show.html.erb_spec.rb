require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/show.html.erb" do
  include StacksHelper
  
  before(:each) do
    @stack = mock_model(Stack)

    assigns[:stack] = @stack
  end

  it "should render attributes in <p>" do
    render "/stacks/show.html.erb"
  end
end

