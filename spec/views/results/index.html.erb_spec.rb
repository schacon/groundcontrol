require File.dirname(__FILE__) + '/../../spec_helper'

describe "/results/index.html.erb" do
  include ResultsHelper
  
  before(:each) do
    result_98 = mock_model(Result)
    result_98.should_receive(:project_id).and_return("1")
    result_98.should_receive(:integration_code).and_return("MyString")
    result_98.should_receive(:speed_code).and_return("MyString")
    result_98.should_receive(:results).and_return("MyText")
    result_99 = mock_model(Result)
    result_99.should_receive(:project_id).and_return("1")
    result_99.should_receive(:integration_code).and_return("MyString")
    result_99.should_receive(:speed_code).and_return("MyString")
    result_99.should_receive(:results).and_return("MyText")

    assigns[:results] = [result_98, result_99]
  end

  it "should render list of results" do
    render "/results/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

