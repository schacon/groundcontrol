require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/new.html.erb" do
  include RolesHelper
  
  before(:each) do
    @role = mock_model(Role)
    @role.stub!(:new_record?).and_return(true)
    @role.stub!(:role).and_return("Test Role")
    @role.stub!(:hosts).and_return([])
    @role.stub!(:pages).and_return([])
    
    assigns[:role] = @role
  end

  it "should render new form" do
    render "/roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", roles_path) do
      with_tag("input#role_role[name=?]", "role[role]")
    end
  end
end


