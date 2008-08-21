require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/edit.html.erb" do
  include StacksHelper
  
  before do
    @stack          = stacks(:qa)
    @hosts          = Host.find(:all)
    assigns[:stack] = @stack
    assigns[:hosts] = @hosts
  end

  it "should render edit form" do
    render "/stacks/edit.html.erb"
    
    response.should have_tag("form[action=#{stack_path(@stack)}][method=post]") do
      with_tag("input[name='stack[name]']")
    end
  end
end


