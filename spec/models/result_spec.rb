require File.dirname(__FILE__) + '/../spec_helper'

describe Result do
  before(:each) do
    @result = Result.new
  end

  it "should be valid" do
    @result.should be_valid
  end
end
