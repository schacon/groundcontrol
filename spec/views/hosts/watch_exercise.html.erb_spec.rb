require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/hosts/watch_exercise.html.erb" do
  include HostsHelper
  
  before(:each) do
    @exercise          = exercises(:localhost)
    assigns[:exercise] = @exercise
  end

  it "should render" do
    render "/hosts/watch_exercise.html.erb"
  end
end

