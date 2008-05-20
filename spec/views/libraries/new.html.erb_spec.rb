require File.dirname(__FILE__) + '/../../spec_helper'

describe "/libraries/new.html.erb" do
  include LibrariesHelper
  
  before(:each) do
    @library = mock_model(Library)
    @library.stub!(:new_record?).and_return(true)
    @library.stub!(:name).and_return("MyString")
    @library.stub!(:code).and_return("MyText")
    @library.stub!(:project_id).and_return("1")
    assigns[:library] = @library
  end

  it "should render new form" do
    render "/libraries/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", libraries_path) do
      with_tag("input#library_name[name=?]", "library[name]")
      with_tag("textarea#library_code[name=?]", "library[code]")
    end
  end
end


