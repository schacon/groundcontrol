require File.dirname(__FILE__) + '/../../spec_helper'

describe "/libraries/show.html.erb" do
  include LibrariesHelper
  
  before(:each) do
    @library = mock_model(Library)
    @library.stub!(:name).and_return("MyString")
    @library.stub!(:code).and_return("MyText")
    @library.stub!(:project_id).and_return("1")

    assigns[:library] = @library
  end

  it "should render attributes in <p>" do
    render "/libraries/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

