require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Sample create" do
  before(:each) do
    @sample = Sample.new
  end

  it "should be valid" do
    @sample.should be_valid
  end
  
  it "should respond to its attribute methods" do
    @sample.should respond_to(:exercise)
    @sample.should respond_to(:page)
    @sample.should respond_to(:passed)
    @sample.should respond_to(:user)
    @sample.should respond_to(:response)
    @sample.should respond_to(:time)
    @sample.should respond_to(:page_data)
    @sample.should respond_to(:page_size)
    @sample.should respond_to(:memory)
    @sample.should respond_to(:page_uri)
    @sample.should respond_to(:created_at)
    @sample.should respond_to(:updated_at)
  end
  
  it "should be savable" do
    @sample.save       .should equal(true)
    @sample.new_record?.should equal(false)
  end
  
  it "should save the data given to it" do
    sample_count    = Sample.count
    sample_page_uri = "/uri/for/test/1/page"
    @sample         = Sample.create(:page_uri => sample_page_uri)
    @sample.reload.page_uri.should == sample_page_uri
  end
end
