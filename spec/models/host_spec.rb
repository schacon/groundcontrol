require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Host do
  before(:each) do
    @host = Host.new
  end

  it "should be valid" do
    @host.should be_valid
  end
  
  it "should be savable" do
    @host.save       .should equal(true)
    @host.new_record?.should equal(false)
  end
end
