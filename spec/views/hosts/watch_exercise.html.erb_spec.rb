require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/hosts/watch_exercise.html.erb" do
  include HostsHelper
  
  before(:each) do
    @exercise    = mock_model(Exercise)
    sample_array = [mock_sample_model()]
    sample_array.stub!(:rev) .and_return(sample_array)
    @exercise.stub!(:samples).and_return(sample_array)
    assigns[:exercise] = @exercise
  end

  it "should render" do
    render "/hosts/watch_exercise.html.erb"
  end
end

