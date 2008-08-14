require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Exercise do
  before(:each) do
    @exercise = Exercise.new
  end
  
  def make_it_valid
    @exercise.exercise_type = Exercise::EXERCISE_TYPES.first
  end
  
  it "should have the expected constants and their values" do
    Exercise::DEFAULT_NUM_CONCURRENT_CONNECTIONS.should == 1
    Exercise::DEFAULT_NUM_HITS_PER_PAGE         .should == 10
  end
  
  it "should have the expected defaults " do
    @exercise.num_concurrent_connections.should == Exercise::DEFAULT_NUM_CONCURRENT_CONNECTIONS
    @exercise.num_hits_per_page         .should == Exercise::DEFAULT_NUM_HITS_PER_PAGE
    
    new_conns = 135
    new_hits  = 124
    @exercise.num_concurrent_connections = new_conns
    @exercise.num_hits_per_page          = new_hits
    
    @exercise.num_concurrent_connections.should_not == Exercise::DEFAULT_NUM_CONCURRENT_CONNECTIONS
    @exercise.num_hits_per_page         .should_not == Exercise::DEFAULT_NUM_HITS_PER_PAGE
    
    @exercise.num_concurrent_connections.should == new_conns
    @exercise.num_hits_per_page         .should == new_hits
  end
  
  it "should be able to calculate how many samples it is expected to generate" do
    new_conns = 135
    new_hits  = 124
    @exercise.num_concurrent_connections = new_conns
    @exercise.num_hits_per_page          = new_hits
    @exercise.host = hosts(:localhost)
    @exercise.host.role.pages.should_not == nil
    @exercise.expected_samples.should    == new_conns*new_hits*@exercise.host.role.pages.size
  end
  
  it "should respond to expected methods" do
    @exercise.should respond_to(:exercise_type)
    @exercise.should respond_to(:aut_version)
    @exercise.should respond_to(:aut_note)
    @exercise.should respond_to(:num_concurrent_connections)
    @exercise.should respond_to(:num_hits_per_page)
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
