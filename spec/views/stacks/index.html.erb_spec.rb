require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/index.html.erb" do
  include StacksHelper
  
  before(:each) do
    stack_98 = mock_model(Stack)
    stack_99 = mock_model(Stack)

    assigns[:stacks] = [stack_98, stack_99]
  end

  it "should render list of stacks" do
    render "/stacks/index.html.erb"
  end
end
