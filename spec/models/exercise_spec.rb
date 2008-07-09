require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exercise do
  before(:each) do
    @exercise = Exercise.new
  end

  it "should be valid" do
    @exercise.should be_valid
  end
end
