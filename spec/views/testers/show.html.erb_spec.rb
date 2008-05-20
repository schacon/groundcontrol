require File.dirname(__FILE__) + '/../../spec_helper'

describe "/testers/show.html.erb" do
  include TestersHelper
  
  before(:each) do
    @tester = mock_model(Tester)
    @tester.stub!(:name).and_return("MyString")
    @tester.stub!(:description).and_return("MyText")
    @tester.stub!(:code).and_return("MyText")
    @tester.stub!(:project_id).and_return("1")
    @tester.stub!(:active_flag).and_return("1")

    assigns[:tester] = @tester
  end

  it "should render attributes in <p>" do
    render "/testers/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
    response.should have_text(/MyText/)
    response.should have_text(/1/)
  end
end

