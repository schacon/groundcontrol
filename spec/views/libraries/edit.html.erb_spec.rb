require File.dirname(__FILE__) + '/../../spec_helper'

describe "/libraries/edit.html.erb" do
  include LibrariesHelper
  
  before do
    @library = mock_model(Library)
    @library.stub!(:name).and_return("MyString")
    @library.stub!(:code).and_return("MyText")
    @library.stub!(:project_id).and_return("1")
    assigns[:library] = @library
  end

  it "should render edit form" do
    render "/libraries/edit.html.erb"
    
    response.should have_tag("form[action=#{library_path(@library)}][method=post]") do
      with_tag('input#library_name[name=?]', "library[name]")
      with_tag('textarea#library_code[name=?]', "library[code]")
    end
  end
end


