require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servers/edit.html.erb" do
  include ServersHelper
  
  before do
    @server = mock_model(Server)
    @server.stub!(:name).and_return("MyString")
    @server.stub!(:hostname).and_return("MyString")
    @server.stub!(:credentials).and_return("MyText")
    @server.stub!(:role_id).and_return("1")
    assigns[:server] = @server
  end

  it "should render edit form" do
    render "/servers/edit.html.erb"
    
    response.should have_tag("form[action=#{server_path(@server)}][method=post]") do
      with_tag('input#server_name[name=?]', "server[name]")
      with_tag('input#server_hostname[name=?]', "server[hostname]")
      with_tag('textarea#server_credentials[name=?]', "server[credentials]")
    end
  end
end


