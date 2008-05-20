require File.dirname(__FILE__) + '/../spec_helper'

describe TesterRun do
  before(:each) do
    @tester_run = TesterRun.new
  end

  it "should be valid" do
    @tester_run.should be_valid
  end
end
