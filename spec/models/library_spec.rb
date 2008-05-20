require File.dirname(__FILE__) + '/../spec_helper'

describe Library do
  before(:each) do
    @library = Library.new
  end

  it "should be valid" do
    @library.should be_valid
  end
end
