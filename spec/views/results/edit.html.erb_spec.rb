require File.dirname(__FILE__) + '/../../spec_helper'

describe "/results/edit.html.erb" do
  include ResultsHelper
  
  before do
    @result = mock_model(Result)
    @result.stub!(:project_id).and_return("1")
    @result.stub!(:integration_code).and_return("MyString")
    @result.stub!(:speed_code).and_return("MyString")
    @result.stub!(:results).and_return("MyText")
    assigns[:result] = @result
  end

  it "should render edit form" do
    render "/results/edit.html.erb"
    
    response.should have_tag("form[action=#{result_path(@result)}][method=post]") do
      with_tag('input#result_integration_code[name=?]', "result[integration_code]")
      with_tag('input#result_speed_code[name=?]', "result[speed_code]")
      with_tag('textarea#result_results[name=?]', "result[results]")
    end
  end
end


