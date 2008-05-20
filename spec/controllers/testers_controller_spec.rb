require File.dirname(__FILE__) + '/../spec_helper'

describe TestersController do
  describe "handling GET /testers" do

    before(:each) do
      @tester = mock_model(Tester)
      Tester.stub!(:find).and_return([@tester])
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
  
    it "should find all testers" do
      Tester.should_receive(:find).with(:all).and_return([@tester])
      do_get
    end
  
    it "should assign the found testers for the view" do
      do_get
      assigns[:testers].should == [@tester]
    end
  end

  describe "handling GET /testers.xml" do

    before(:each) do
      @tester = mock_model(Tester, :to_xml => "XML")
      Tester.stub!(:find).and_return(@tester)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all testers" do
      Tester.should_receive(:find).with(:all).and_return([@tester])
      do_get
    end
  
    it "should render the found testers as xml" do
      @tester.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /testers/1" do

    before(:each) do
      @tester = mock_model(Tester)
      Tester.stub!(:find).and_return(@tester)
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
  
    it "should find the tester requested" do
      Tester.should_receive(:find).with("1").and_return(@tester)
      do_get
    end
  
    it "should assign the found tester for the view" do
      do_get
      assigns[:tester].should equal(@tester)
    end
  end

  describe "handling GET /testers/1.xml" do

    before(:each) do
      @tester = mock_model(Tester, :to_xml => "XML")
      Tester.stub!(:find).and_return(@tester)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the tester requested" do
      Tester.should_receive(:find).with("1").and_return(@tester)
      do_get
    end
  
    it "should render the found tester as xml" do
      @tester.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /testers/new" do

    before(:each) do
      @tester = mock_model(Tester)
      Tester.stub!(:new).and_return(@tester)
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
  
    it "should create an new tester" do
      Tester.should_receive(:new).and_return(@tester)
      do_get
    end
  
    it "should not save the new tester" do
      @tester.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new tester for the view" do
      do_get
      assigns[:tester].should equal(@tester)
    end
  end

  describe "handling GET /testers/1/edit" do

    before(:each) do
      @tester = mock_model(Tester)
      Tester.stub!(:find).and_return(@tester)
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
  
    it "should find the tester requested" do
      Tester.should_receive(:find).and_return(@tester)
      do_get
    end
  
    it "should assign the found Tester for the view" do
      do_get
      assigns[:tester].should equal(@tester)
    end
  end

  describe "handling POST /testers" do

    before(:each) do
      @tester = mock_model(Tester, :to_param => "1")
      Tester.stub!(:new).and_return(@tester)
    end
    
    describe "with successful save" do
  
      def do_post
        @tester.should_receive(:save).and_return(true)
        post :create, :tester => {}
      end
  
      it "should create a new tester" do
        Tester.should_receive(:new).with({}).and_return(@tester)
        do_post
      end

      it "should redirect to the new tester" do
        do_post
        response.should redirect_to(tester_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @tester.should_receive(:save).and_return(false)
        post :create, :tester => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /testers/1" do

    before(:each) do
      @tester = mock_model(Tester, :to_param => "1")
      Tester.stub!(:find).and_return(@tester)
    end
    
    describe "with successful update" do

      def do_put
        @tester.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the tester requested" do
        Tester.should_receive(:find).with("1").and_return(@tester)
        do_put
      end

      it "should update the found tester" do
        do_put
        assigns(:tester).should equal(@tester)
      end

      it "should assign the found tester for the view" do
        do_put
        assigns(:tester).should equal(@tester)
      end

      it "should redirect to the tester" do
        do_put
        response.should redirect_to(tester_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @tester.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /testers/1" do

    before(:each) do
      @tester = mock_model(Tester, :destroy => true)
      Tester.stub!(:find).and_return(@tester)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the tester requested" do
      Tester.should_receive(:find).with("1").and_return(@tester)
      do_delete
    end
  
    it "should call destroy on the found tester" do
      @tester.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the testers list" do
      do_delete
      response.should redirect_to(testers_url)
    end
  end
end