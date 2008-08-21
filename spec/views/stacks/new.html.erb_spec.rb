require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/new.html.erb" do
  include StacksHelper
  
  before(:each) do
    @stack = mock_model(Stack)
    @stack.stub!(:new_record?).and_return(true)
    assigns[:stack] = @stack
  end

  it "should render new form" do
    render "/stacks/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", stacks_path) do
    end
  end
end


