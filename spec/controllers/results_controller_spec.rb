require File.dirname(__FILE__) + '/../spec_helper'

describe ResultsController do
  describe "handling GET /results" do

    before(:each) do
      @result = mock_model(Result)
      Result.stub!(:find).and_return([@result])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all results" do
      Result.should_receive(:find).with(:all).and_return([@result])
      do_get
    end
  
    it "should assign the found results for the view" do
      do_get
      assigns[:results].should == [@result]
    end
  end

  describe "handling GET /results.xml" do

    before(:each) do
      @result = mock_model(Result, :to_xml => "XML")
      Result.stub!(:find).and_return(@result)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all results" do
      Result.should_receive(:find).with(:all).and_return([@result])
      do_get
    end
  
    it "should render the found results as xml" do
      @result.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /results/1" do

    before(:each) do
      @result = mock_model(Result)
      Result.stub!(:find).and_return(@result)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the result requested" do
      Result.should_receive(:find).with("1").and_return(@result)
      do_get
    end
  
    it "should assign the found result for the view" do
      do_get
      assigns[:result].should equal(@result)
    end
  end

  describe "handling GET /results/1.xml" do

    before(:each) do
      @result = mock_model(Result, :to_xml => "XML")
      Result.stub!(:find).and_return(@result)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the result requested" do
      Result.should_receive(:find).with("1").and_return(@result)
      do_get
    end
  
    it "should render the found result as xml" do
      @result.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /results/new" do

    before(:each) do
      @result = mock_model(Result)
      Result.stub!(:new).and_return(@result)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new result" do
      Result.should_receive(:new).and_return(@result)
      do_get
    end
  
    it "should not save the new result" do
      @result.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new result for the view" do
      do_get
      assigns[:result].should equal(@result)
    end
  end

  describe "handling GET /results/1/edit" do

    before(:each) do
      @result = mock_model(Result)
      Result.stub!(:find).and_return(@result)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the result requested" do
      Result.should_receive(:find).and_return(@result)
      do_get
    end
  
    it "should assign the found Result for the view" do
      do_get
      assigns[:result].should equal(@result)
    end
  end

  describe "handling POST /results" do

    before(:each) do
      @result = mock_model(Result, :to_param => "1")
      Result.stub!(:new).and_return(@result)
    end
    
    describe "with successful save" do
  
      def do_post
        @result.should_receive(:save).and_return(true)
        post :create, :result => {}
      end
  
      it "should create a new result" do
        Result.should_receive(:new).with({}).and_return(@result)
        do_post
      end

      it "should redirect to the new result" do
        do_post
        response.should redirect_to(result_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @result.should_receive(:save).and_return(false)
        post :create, :result => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /results/1" do

    before(:each) do
      @result = mock_model(Result, :to_param => "1")
      Result.stub!(:find).and_return(@result)
    end
    
    describe "with successful update" do

      def do_put
        @result.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the result requested" do
        Result.should_receive(:find).with("1").and_return(@result)
        do_put
      end

      it "should update the found result" do
        do_put
        assigns(:result).should equal(@result)
      end

      it "should assign the found result for the view" do
        do_put
        assigns(:result).should equal(@result)
      end

      it "should redirect to the result" do
        do_put
        response.should redirect_to(result_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @result.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /results/1" do

    before(:each) do
      @result = mock_model(Result, :destroy => true)
      Result.stub!(:find).and_return(@result)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the result requested" do
      Result.should_receive(:find).with("1").and_return(@result)
      do_delete
    end
  
    it "should call destroy on the found result" do
      @result.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the results list" do
      do_delete
      response.should redirect_to(results_url)
    end
  end
end