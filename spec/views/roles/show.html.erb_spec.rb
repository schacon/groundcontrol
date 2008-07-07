require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/show.html.erb" do
  include RolesHelper
  
  before(:each) do
    @role = mock_model(Role)
    @role.stub!(:role).and_return("Test Role")
    @role.stub!(:hosts).and_return([])
    @role.stub!(:pages).and_return([])

    assigns[:role] = @role
  end

  it "should render attributes in <p>" do
    render "/roles/show.html.erb"
    response.should have_text(/Test Role/)
  end
end

