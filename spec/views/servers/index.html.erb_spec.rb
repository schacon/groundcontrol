require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servers/index.html.erb" do
  include ServersHelper
  
  before(:each) do
    server_98 = mock_model(Server)
    server_98.should_receive(:name).and_return("MyString")
    server_98.should_receive(:hostname).and_return("MyString")
    server_98.should_receive(:credentials).and_return("MyText")
    server_98.should_receive(:role_id).and_return("1")
    server_99 = mock_model(Server)
    server_99.should_receive(:name).and_return("MyString")
    server_99.should_receive(:hostname).and_return("MyString")
    server_99.should_receive(:credentials).and_return("MyText")
    server_99.should_receive(:role_id).and_return("1")

    assigns[:servers] = [server_98, server_99]
  end

  it "should render list of servers" do
    render "/servers/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

