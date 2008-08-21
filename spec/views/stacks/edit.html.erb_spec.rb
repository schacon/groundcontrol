require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/edit.html.erb" do
  include StacksHelper
  
  before do
    @stack = mock_model(Stack)
    assigns[:stack] = @stack
  end

  it "should render edit form" do
    render "/stacks/edit.html.erb"
    
    response.should have_tag("form[action=#{stack_path(@stack)}][method=post]") do
    end
  end
end


