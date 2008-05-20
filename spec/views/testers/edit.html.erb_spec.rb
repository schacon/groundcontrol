require File.dirname(__FILE__) + '/../../spec_helper'

describe "/testers/edit.html.erb" do
  include TestersHelper
  
  before do
    @tester = mock_model(Tester)
    @tester.stub!(:name).and_return("MyString")
    @tester.stub!(:description).and_return("MyText")
    @tester.stub!(:code).and_return("MyText")
    @tester.stub!(:project_id).and_return("1")
    @tester.stub!(:active_flag).and_return("1")
    assigns[:tester] = @tester
  end

  it "should render edit form" do
    render "/testers/edit.html.erb"
    
    response.should have_tag("form[action=#{tester_path(@tester)}][method=post]") do
      with_tag('input#tester_name[name=?]', "tester[name]")
      with_tag('textarea#tester_description[name=?]', "tester[description]")
      with_tag('textarea#tester_code[name=?]', "tester[code]")
      with_tag('input#tester_active_flag[name=?]', "tester[active_flag]")
    end
  end
end


