require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/show.html.erb" do
  include RolesHelper
  
  before(:each) do
    @role = mock_model(Role)
    @role.stub!(:name).and_return("MyString")
    @role.stub!(:description).and_return("MyText")
    @role.stub!(:klass).and_return("MyString")
    @role.stub!(:code).and_return("MyText")

    assigns[:role] = @role
  end

  it "should render attributes in <p>" do
    render "/roles/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

