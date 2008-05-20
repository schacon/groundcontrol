require File.dirname(__FILE__) + '/../../spec_helper'

describe "/results/show.html.erb" do
  include ResultsHelper
  
  before(:each) do
    @result = mock_model(Result)
    @result.stub!(:project_id).and_return("1")
    @result.stub!(:integration_code).and_return("MyString")
    @result.stub!(:speed_code).and_return("MyString")
    @result.stub!(:results).and_return("MyText")

    assigns[:result] = @result
  end

  it "should render attributes in <p>" do
    render "/results/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

