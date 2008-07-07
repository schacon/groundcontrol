require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/pages/edit.html.erb" do
  include PagesHelper
  
  before do
    @page = mock_model(Page)
    assigns[:page] = @page
  end

  it "should render edit form" do
    render "/pages/edit.html.erb"
    
    response.should have_tag("form[action=#{page_path(@page)}][method=post]") do
    end
  end
end


