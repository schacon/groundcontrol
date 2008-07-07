require File.dirname(__FILE__) + '/../../spec_helper'

describe "/roles/index.html.erb" do
  include RolesHelper
  
  before(:each) do
    host_98 = mock_model(Host)
    host_98.should_receive(:count).and_return("0")
    
    page_98 = mock_model(Page)
    page_98.should_receive(:count).and_return("0")
    
    role_98 = mock_model(Role)
    role_98.should_receive(:role).and_return("Test Role A")
    role_98.stub!(:hosts).and_return(host_98)
    role_98.stub!(:pages).and_return(page_98)
    
    # 2nd test obj
    host_99 = mock_model(Host)
    host_99.should_receive(:count).and_return("0")
    
    page_99 = mock_model(Page)
    page_99.should_receive(:count).and_return("0")
    
    role_99 = mock_model(Role)
    role_99.should_receive(:role).and_return("Test Role B")
    role_99.stub!(:hosts).and_return(host_99)
    role_99.stub!(:pages).and_return(page_99)

    assigns[:roles] = [role_98, role_99]
  end

  it "should render list of roles" do
    render "/roles/index.html.erb"
    response.should have_tag("tr>td", "Test Role A", 2)
    response.should have_tag("tr>td", "Test Role B", 2)
  end
end

