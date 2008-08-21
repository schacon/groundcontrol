require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/new.html.erb" do
  include StacksHelper
  
  before(:each) do
    @stack          = Stack.new
    assigns[:stack] = @stack
  end

  it "should render new form" do
    render "/stacks/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", stacks_path) do
      with_tag "input[name='stack[name]']"
    end
  end
end
