require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exercise do
  before(:each) do
    @exercise = Exercise.new
  end
  
  def make_it_valid
    @exercise.exercise_type = Exercise::EXERCISE_TYPES.first
  end
  
  it "should respond to expected methods" do
    @exercise.should respond_to(:exercise_type)
    @exercise.should respond_to(:aut_version)
    @exercise.should respond_to(:aut_note)
  end
  
  it "should constrict the excercise_type field to the expected types only" do
    @exercise.should_not be_valid
    @exercise.exercise_type = nil
    @exercise.should_not be_valid
    @exercise.exercise_type = 'asd'
    @exercise.should_not be_valid
    @exercise.exercise_type = 'perf'
    @exercise.should_not be_valid
    make_it_valid
    @exercise.should be_valid
  end

  it "should be valid" do
    make_it_valid
    @exercise.should be_valid
  end
  
  it "should be savable" do
    make_it_valid
    @exercise.save       .should equal(true)
    @exercise.new_record?.should equal(false)
  end
end
