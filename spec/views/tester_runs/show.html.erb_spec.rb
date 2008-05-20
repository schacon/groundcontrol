require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tester_runs/show.html.erb" do
  include TesterRunsHelper
  
  before(:each) do
    @tester_run = mock_model(TesterRun)
    @tester_run.stub!(:results_data).and_return("MyText")
    @tester_run.stub!(:tester_id).and_return("1")
    @tester_run.stub!(:results_id).and_return("1")

    assigns[:tester_run] = @tester_run
  end

  it "should render attributes in <p>" do
    render "/tester_runs/show.html.erb"
    response.should have_text(/MyText/)
  end
end

