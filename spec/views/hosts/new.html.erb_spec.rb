require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/hosts/show_exercise.html.erb" do
  include HostsHelper
  
  before(:each) do
    @exercise          = exercises(:localhost)
    @roles             = Role.find(:all)
    assigns[:exercise] = @exercise
    assigns[:host]     = @exercise.host
    assigns[:roles]    = @roles
  end

  it "should render and contain the expected content" do
    render "/hosts/new.html.erb"
    response.should have_tag("input[name='host[hostname]']")
    response.should have_tag("input[name='host[url]']")
    response.should have_tag("input[name='host[url_username]']")
    response.should have_tag("input[name='host[url_password]']")
    response.should have_tag("input[name='host[ssh_username]']")
    response.should have_tag("input[name='host[ssh_password]']")
    response.should have_tag("select[name='host[role_id]']")
  end
end
