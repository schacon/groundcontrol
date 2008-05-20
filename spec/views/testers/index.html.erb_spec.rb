require File.dirname(__FILE__) + '/../../spec_helper'

describe "/testers/index.html.erb" do
  include TestersHelper
  
  before(:each) do
    tester_98 = mock_model(Tester)
    tester_98.should_receive(:name).and_return("MyString")
    tester_98.should_receive(:description).and_return("MyText")
    tester_98.should_receive(:code).and_return("MyText")
    tester_98.should_receive(:project_id).and_return("1")
    tester_98.should_receive(:active_flag).and_return("1")
    tester_99 = mock_model(Tester)
    tester_99.should_receive(:name).and_return("MyString")
    tester_99.should_receive(:description).and_return("MyText")
    tester_99.should_receive(:code).and_return("MyText")
    tester_99.should_receive(:project_id).and_return("1")
    tester_99.should_receive(:active_flag).and_return("1")

    assigns[:testers] = [tester_98, tester_99]
  end

  it "should render list of testers" do
    render "/testers/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "MyText", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

