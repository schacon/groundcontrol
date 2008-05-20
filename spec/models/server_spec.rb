require File.dirname(__FILE__) + '/../spec_helper'

describe Server do
  before(:each) do
    @server = Server.new
  end

  it "should be valid" do
    @server.should be_valid
  end
end
