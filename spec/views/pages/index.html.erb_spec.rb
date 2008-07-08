require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/index.html.erb" do
  include PagesHelper
  
  before(:each) do
    page_98         = mock_page_model()
    page_99         = mock_page_model()
    assigns[:pages] = [page_98, page_99]
  end

  it "should render list of pages" do
    render "/pages/index.html.erb"
  end
end

