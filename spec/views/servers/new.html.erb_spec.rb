require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servers/new.html.erb" do
  include ServersHelper
  
  before(:each) do
    @server = mock_model(Server)
    @server.stub!(:new_record?).and_return(true)
    @server.stub!(:name).and_return("MyString")
    @server.stub!(:hostname).and_return("MyString")
    @server.stub!(:credentials).and_return("MyText")
    @server.stub!(:role_id).and_return("1")
    assigns[:server] = @server
  end

  it "should render new form" do
    render "/servers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", servers_path) do
      with_tag("input#server_name[name=?]", "server[name]")
      with_tag("input#server_hostname[name=?]", "server[hostname]")
      with_tag("textarea#server_credentials[name=?]", "server[credentials]")
    end
  end
end


