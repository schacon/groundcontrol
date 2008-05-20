require File.dirname(__FILE__) + '/../../spec_helper'

describe "/results/new.html.erb" do
  include ResultsHelper
  
  before(:each) do
    @result = mock_model(Result)
    @result.stub!(:new_record?).and_return(true)
    @result.stub!(:project_id).and_return("1")
    @result.stub!(:integration_code).and_return("MyString")
    @result.stub!(:speed_code).and_return("MyString")
    @result.stub!(:results).and_return("MyText")
    assigns[:result] = @result
  end

  it "should render new form" do
    render "/results/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", results_path) do
      with_tag("input#result_integration_code[name=?]", "result[integration_code]")
      with_tag("input#result_speed_code[name=?]", "result[speed_code]")
      with_tag("textarea#result_results[name=?]", "result[results]")
    end
  end
end


