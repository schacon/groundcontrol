require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/hosts/show_exercise.html.erb" do
  include HostsHelper
  
  before(:each) do
    @exercise          = exercises(:localhost)
    assigns[:exercise] = @exercise
    assigns[:host]     = @exercise.host
  end

  it "should render and contain the expected content" do
    render "/hosts/show.html.erb"
    response.should have_tag("input[type='text'][name='exercise[num_concurrent_connections]']")
    response.should have_tag("input[type='text'][name='exercise[num_hits_per_page]']")
    response.should have_tag("input[type='text'][name='exercise[aut_version]']")
    response.should have_tag("input[type='text'][name='exercise[aut_note]']")
  end
end
