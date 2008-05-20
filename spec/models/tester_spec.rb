require File.dirname(__FILE__) + '/../spec_helper'

describe Tester do
  before(:each) do
    @tester = Tester.new
  end

  it "should be valid" do
    @tester.should be_valid
  end
end
