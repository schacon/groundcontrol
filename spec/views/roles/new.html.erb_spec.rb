require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/new.html.erb" do
  include RolesHelper
  
  before(:each) do
    @role = mock_model(Role)
    @role.stub!(:new_record?).and_return(true)
    @role.stub!(:name).and_return("MyString")
    @role.stub!(:description).and_return("MyText")
    @role.stub!(:klass).and_return("MyString")
    @role.stub!(:code).and_return("MyText")
    assigns[:role] = @role
  end

  it "should render new form" do
    render "/roles/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", roles_path) do
      with_tag("input#role_name[name=?]", "role[name]")
      with_tag("textarea#role_description[name=?]", "role[description]")
      with_tag("input#role_klass[name=?]", "role[klass]")
      with_tag("textarea#role_code[name=?]", "role[code]")
    end
  end
end

