require File.dirname(__FILE__) + '/../../spec_helper'

describe "/servers/show.html.erb" do
  include ServersHelper
  
  before(:each) do
    @server = mock_model(Server)
    @server.stub!(:name).and_return("MyString")
    @server.stub!(:hostname).and_return("MyString")
    @server.stub!(:credentials).and_return("MyText")
    @server.stub!(:role_id).and_return("1")

    assigns[:server] = @server
  end

  it "should render attributes in <p>" do
    render "/servers/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

