require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exercise do
  before(:each) do
    @exercise = Exercise.new
  end

  it "should be valid" do
    @exercise.should be_valid
  end
  
  it "should be savable" do
    @exercise.save       .should equal(true)
    @exercise.new_record?.should equal(false)
  end
  
  it "should respond to expected methods" do
    @exercise.should respond_to(:exercise_type)
  end
end
