require File.dirname(__FILE__) + '/../../spec_helper'

describe "/projects/index.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    project_98 = mock_model(Project)
    project_98.should_receive(:name).and_return("MyString")
    project_99 = mock_model(Project)
    project_99.should_receive(:name).and_return("MyString")

    assigns[:projects] = [project_98, project_99]
  end

  it "should render list of projects" do
    render "/projects/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

