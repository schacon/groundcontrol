require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tester_runs/index.html.erb" do
  include TesterRunsHelper
  
  before(:each) do
    tester_run_98 = mock_model(TesterRun)
    tester_run_98.should_receive(:results_data).and_return("MyText")
    tester_run_98.should_receive(:tester_id).and_return("1")
    tester_run_98.should_receive(:results_id).and_return("1")
    tester_run_99 = mock_model(TesterRun)
    tester_run_99.should_receive(:results_data).and_return("MyText")
    tester_run_99.should_receive(:tester_id).and_return("1")
    tester_run_99.should_receive(:results_id).and_return("1")

    assigns[:tester_runs] = [tester_run_98, tester_run_99]
  end

  it "should render list of tester_runs" do
    render "/tester_runs/index.html.erb"
    response.should have_tag("tr>td", "MyText", 2)
  end
end

