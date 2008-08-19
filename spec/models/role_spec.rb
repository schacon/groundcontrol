require File.dirname(__FILE__) + '/../spec_helper'

describe Role do
  before(:each) do
    @role = Role.new
  end

  it "should be valid" do
    @role.should be_valid
  end
  
  it "should be savable" do
    @role.save       .should equal(true)
    @role.new_record?.should equal(false)
  end
  
  it "should have the expected associations" do
    @role.stacks.should be_empty
  end
end
