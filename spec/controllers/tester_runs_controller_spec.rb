require File.dirname(__FILE__) + '/../spec_helper'

describe TesterRunsController do
  describe "handling GET /tester_runs" do

    before(:each) do
      @tester_run = mock_model(TesterRun)
      TesterRun.stub!(:find).and_return([@tester_run])
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
  
    it "should find all tester_runs" do
      TesterRun.should_receive(:find).with(:all).and_return([@tester_run])
      do_get
    end
  
    it "should assign the found tester_runs for the view" do
      do_get
      assigns[:tester_runs].should == [@tester_run]
    end
  end

  describe "handling GET /tester_runs.xml" do

    before(:each) do
      @tester_run = mock_model(TesterRun, :to_xml => "XML")
      TesterRun.stub!(:find).and_return(@tester_run)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all tester_runs" do
      TesterRun.should_receive(:find).with(:all).and_return([@tester_run])
      do_get
    end
  
    it "should render the found tester_runs as xml" do
      @tester_run.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tester_runs/1" do

    before(:each) do
      @tester_run = mock_model(TesterRun)
      TesterRun.stub!(:find).and_return(@tester_run)
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
  
    it "should find the tester_run requested" do
      TesterRun.should_receive(:find).with("1").and_return(@tester_run)
      do_get
    end
  
    it "should assign the found tester_run for the view" do
      do_get
      assigns[:tester_run].should equal(@tester_run)
    end
  end

  describe "handling GET /tester_runs/1.xml" do

    before(:each) do
      @tester_run = mock_model(TesterRun, :to_xml => "XML")
      TesterRun.stub!(:find).and_return(@tester_run)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tester_run requested" do
      TesterRun.should_receive(:find).with("1").and_return(@tester_run)
      do_get
    end
  
    it "should render the found tester_run as xml" do
      @tester_run.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /tester_runs/new" do

    before(:each) do
      @tester_run = mock_model(TesterRun)
      TesterRun.stub!(:new).and_return(@tester_run)
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
  
    it "should create an new tester_run" do
      TesterRun.should_receive(:new).and_return(@tester_run)
      do_get
    end
  
    it "should not save the new tester_run" do
      @tester_run.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tester_run for the view" do
      do_get
      assigns[:tester_run].should equal(@tester_run)
    end
  end

  describe "handling GET /tester_runs/1/edit" do

    before(:each) do
      @tester_run = mock_model(TesterRun)
      TesterRun.stub!(:find).and_return(@tester_run)
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
  
    it "should find the tester_run requested" do
      TesterRun.should_receive(:find).and_return(@tester_run)
      do_get
    end
  
    it "should assign the found TesterRun for the view" do
      do_get
      assigns[:tester_run].should equal(@tester_run)
    end
  end

  describe "handling POST /tester_runs" do

    before(:each) do
      @tester_run = mock_model(TesterRun, :to_param => "1")
      TesterRun.stub!(:new).and_return(@tester_run)
    end
    
    describe "with successful save" do
  
      def do_post
        @tester_run.should_receive(:save).and_return(true)
        post :create, :tester_run => {}
      end
  
      it "should create a new tester_run" do
        TesterRun.should_receive(:new).with({}).and_return(@tester_run)
        do_post
      end

      it "should redirect to the new tester_run" do
        do_post
        response.should redirect_to(tester_run_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tester_run.should_receive(:save).and_return(false)
        post :create, :tester_run => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /tester_runs/1" do

    before(:each) do
      @tester_run = mock_model(TesterRun, :to_param => "1")
      TesterRun.stub!(:find).and_return(@tester_run)
    end
    
    describe "with successful update" do

      def do_put
        @tester_run.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tester_run requested" do
        TesterRun.should_receive(:find).with("1").and_return(@tester_run)
        do_put
      end

      it "should update the found tester_run" do
        do_put
        assigns(:tester_run).should equal(@tester_run)
      end

      it "should assign the found tester_run for the view" do
        do_put
        assigns(:tester_run).should equal(@tester_run)
      end

      it "should redirect to the tester_run" do
        do_put
        response.should redirect_to(tester_run_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tester_run.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /tester_runs/1" do

    before(:each) do
      @tester_run = mock_model(TesterRun, :destroy => true)
      TesterRun.stub!(:find).and_return(@tester_run)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tester_run requested" do
      TesterRun.should_receive(:find).with("1").and_return(@tester_run)
      do_delete
    end
  
    it "should call destroy on the found tester_run" do
      @tester_run.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the tester_runs list" do
      do_delete
      response.should redirect_to(tester_runs_url)
    end
  end
end