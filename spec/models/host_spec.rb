require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Empty Host" do
  before(:each) do
    @host = Host.new
  end

  it "should be invalid while empty" do
    @host.should_not be_valid
  end
  
  it "should not be savable" do
    @host.save       .should equal(false)
    @host.new_record?.should equal(true)
  end
end

describe "Create a Host" do
  before(:each) do
    @host = Host.new
  end

  it "should be valid and savable with the minimum required" do
    @host.role = roles(:webapp)
    @host            .should be_valid
    @host.save       .should equal(true)
    @host.new_record?.should equal(false)
  end
end
