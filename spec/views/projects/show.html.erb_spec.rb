require File.dirname(__FILE__) + '/../../spec_helper'

describe "/projects/show.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    @project = mock_model(Project)
    @project.stub!(:name).and_return("MyString")

    assigns[:project] = @project
  end

  it "should render attributes in <p>" do
    render "/projects/show.html.erb"
    response.should have_text(/MyString/)
  end
end

