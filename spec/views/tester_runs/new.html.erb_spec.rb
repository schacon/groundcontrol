require File.dirname(__FILE__) + '/../../spec_helper'

describe "/tester_runs/new.html.erb" do
  include TesterRunsHelper
  
  before(:each) do
    @tester_run = mock_model(TesterRun)
    @tester_run.stub!(:new_record?).and_return(true)
    @tester_run.stub!(:results_data).and_return("MyText")
    @tester_run.stub!(:tester_id).and_return("1")
    @tester_run.stub!(:results_id).and_return("1")
    assigns[:tester_run] = @tester_run
  end

  it "should render new form" do
    render "/tester_runs/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", tester_runs_path) do
      with_tag("textarea#tester_run_results_data[name=?]", "tester_run[results_data]")
    end
  end
end


