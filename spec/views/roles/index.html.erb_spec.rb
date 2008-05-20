require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/index.html.erb" do
  include RolesHelper
  
  before(:each) do
    role_98 = mock_model(Role)
    role_98.should_receive(:name).and_return("MyString")
    role_98.should_receive(:description).and_return("MyText")
    role_98.should_receive(:klass).and_return("MyString")
    role_98.should_receive(:code).and_return("MyText")
    role_99 = mock_model(Role)
    role_99.should_receive(:name).and_return("MyString")
    role_99.should_receive(:description).and_return("MyText")
    role_99.should_receive(:klass).and_return("MyString")
    role_99.should_receive(:code).and_return("MyText")

    assigns[:roles] = [role_98, role_99]
  end

  it "should render list of roles" do
    render "/roles/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

