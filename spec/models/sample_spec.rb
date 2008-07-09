require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sample do
  before(:each) do
    @sample = Sample.new
  end

  it "should be valid" do
    @sample.should be_valid
  end
end
