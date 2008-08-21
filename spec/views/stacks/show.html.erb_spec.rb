require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stacks/show.html.erb" do
  include StacksHelper
  
  before(:each) do
    @stack          = stacks(:qa)
    assigns[:stack] = @stack
  end

  it "should render the show template and include relevant object attributes" do
    render "/stacks/show.html.erb"
    response.should have_tag("div", @stack.name)
    response.should have_tag("div", @stack.hosts.collect{|h| h.hostname}.join(","))
  end
end
