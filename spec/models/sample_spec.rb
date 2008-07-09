require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Sample create" do
  before(:each) do
    @sample = Sample.new
  end

  it "should be valid" do
    @sample.should be_valid
  end
  
  it "should be savable" do
    @sample.save       .should equal(true)
    @sample.new_record?.should equal(false)
  end
end
