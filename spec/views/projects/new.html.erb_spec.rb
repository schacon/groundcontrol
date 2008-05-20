require File.dirname(__FILE__) + '/../../spec_helper'

describe "/projects/new.html.erb" do
  include ProjectsHelper
  
  before(:each) do
    @project = mock_model(Project)
    @project.stub!(:new_record?).and_return(true)
    @project.stub!(:name).and_return("MyString")
    assigns[:project] = @project
  end

  it "should render new form" do
    render "/projects/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", projects_path) do
      with_tag("input#project_name[name=?]", "project[name]")
    end
  end
end


