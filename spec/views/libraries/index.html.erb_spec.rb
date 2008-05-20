require File.dirname(__FILE__) + '/../../spec_helper'

describe "/libraries/index.html.erb" do
  include LibrariesHelper
  
  before(:each) do
    library_98 = mock_model(Library)
    library_98.should_receive(:name).and_return("MyString")
    library_98.should_receive(:code).and_return("MyText")
    library_98.should_receive(:project_id).and_return("1")
    library_99 = mock_model(Library)
    library_99.should_receive(:name).and_return("MyString")
    library_99.should_receive(:code).and_return("MyText")
    library_99.should_receive(:project_id).and_return("1")

    assigns[:libraries] = [library_98, library_99]
  end

  it "should render list of libraries" do
    render "/libraries/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

