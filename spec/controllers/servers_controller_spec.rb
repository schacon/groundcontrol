require File.dirname(__FILE__) + '/../spec_helper'

describe ServersController do
  describe "handling GET /servers" do

    before(:each) do
      @server = mock_model(Server)
      Server.stub!(:find).and_return([@server])
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
  
    it "should find all servers" do
      Server.should_receive(:find).with(:all).and_return([@server])
      do_get
    end
  
    it "should assign the found servers for the view" do
      do_get
      assigns[:servers].should == [@server]
    end
  end

  describe "handling GET /servers.xml" do

    before(:each) do
      @server = mock_model(Server, :to_xml => "XML")
      Server.stub!(:find).and_return(@server)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all servers" do
      Server.should_receive(:find).with(:all).and_return([@server])
      do_get
    end
  
    it "should render the found servers as xml" do
      @server.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /servers/1" do

    before(:each) do
      @server = mock_model(Server)
      Server.stub!(:find).and_return(@server)
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
  
    it "should find the server requested" do
      Server.should_receive(:find).with("1").and_return(@server)
      do_get
    end
  
    it "should assign the found server for the view" do
      do_get
      assigns[:server].should equal(@server)
    end
  end

  describe "handling GET /servers/1.xml" do

    before(:each) do
      @server = mock_model(Server, :to_xml => "XML")
      Server.stub!(:find).and_return(@server)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the server requested" do
      Server.should_receive(:find).with("1").and_return(@server)
      do_get
    end
  
    it "should render the found server as xml" do
      @server.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /servers/new" do

    before(:each) do
      @server = mock_model(Server)
      Server.stub!(:new).and_return(@server)
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
  
    it "should create an new server" do
      Server.should_receive(:new).and_return(@server)
      do_get
    end
  
    it "should not save the new server" do
      @server.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new server for the view" do
      do_get
      assigns[:server].should equal(@server)
    end
  end

  describe "handling GET /servers/1/edit" do

    before(:each) do
      @server = mock_model(Server)
      Server.stub!(:find).and_return(@server)
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
  
    it "should find the server requested" do
      Server.should_receive(:find).and_return(@server)
      do_get
    end
  
    it "should assign the found Server for the view" do
      do_get
      assigns[:server].should equal(@server)
    end
  end

  describe "handling POST /servers" do

    before(:each) do
      @server = mock_model(Server, :to_param => "1")
      Server.stub!(:new).and_return(@server)
    end
    
    describe "with successful save" do
  
      def do_post
        @server.should_receive(:save).and_return(true)
        post :create, :server => {}
      end
  
      it "should create a new server" do
        Server.should_receive(:new).with({}).and_return(@server)
        do_post
      end

      it "should redirect to the new server" do
        do_post
        response.should redirect_to(server_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @server.should_receive(:save).and_return(false)
        post :create, :server => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /servers/1" do

    before(:each) do
      @server = mock_model(Server, :to_param => "1")
      Server.stub!(:find).and_return(@server)
    end
    
    describe "with successful update" do

      def do_put
        @server.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the server requested" do
        Server.should_receive(:find).with("1").and_return(@server)
        do_put
      end

      it "should update the found server" do
        do_put
        assigns(:server).should equal(@server)
      end

      it "should assign the found server for the view" do
        do_put
        assigns(:server).should equal(@server)
      end

      it "should redirect to the server" do
        do_put
        response.should redirect_to(server_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @server.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /servers/1" do

    before(:each) do
      @server = mock_model(Server, :destroy => true)
      Server.stub!(:find).and_return(@server)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the server requested" do
      Server.should_receive(:find).with("1").and_return(@server)
      do_delete
    end
  
    it "should call destroy on the found server" do
      @server.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the servers list" do
      do_delete
      response.should redirect_to(servers_url)
    end
  end
end