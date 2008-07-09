require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Host do
  before(:each) do
    @host = Host.new
  end

  it "should be valid" do
    @host.should be_valid
  end
end
