require File.dirname(__FILE__) + '/../spec_helper'

describe LibrariesController do
  describe "handling GET /libraries" do

    before(:each) do
      @library = mock_model(Library)
      Library.stub!(:find).and_return([@library])
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
  
    it "should find all libraries" do
      Library.should_receive(:find).with(:all).and_return([@library])
      do_get
    end
  
    it "should assign the found libraries for the view" do
      do_get
      assigns[:libraries].should == [@library]
    end
  end

  describe "handling GET /libraries.xml" do

    before(:each) do
      @library = mock_model(Library, :to_xml => "XML")
      Library.stub!(:find).and_return(@library)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all libraries" do
      Library.should_receive(:find).with(:all).and_return([@library])
      do_get
    end
  
    it "should render the found libraries as xml" do
      @library.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /libraries/1" do

    before(:each) do
      @library = mock_model(Library)
      Library.stub!(:find).and_return(@library)
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
  
    it "should find the library requested" do
      Library.should_receive(:find).with("1").and_return(@library)
      do_get
    end
  
    it "should assign the found library for the view" do
      do_get
      assigns[:library].should equal(@library)
    end
  end

  describe "handling GET /libraries/1.xml" do

    before(:each) do
      @library = mock_model(Library, :to_xml => "XML")
      Library.stub!(:find).and_return(@library)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the library requested" do
      Library.should_receive(:find).with("1").and_return(@library)
      do_get
    end
  
    it "should render the found library as xml" do
      @library.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /libraries/new" do

    before(:each) do
      @library = mock_model(Library)
      Library.stub!(:new).and_return(@library)
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
  
    it "should create an new library" do
      Library.should_receive(:new).and_return(@library)
      do_get
    end
  
    it "should not save the new library" do
      @library.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new library for the view" do
      do_get
      assigns[:library].should equal(@library)
    end
  end

  describe "handling GET /libraries/1/edit" do

    before(:each) do
      @library = mock_model(Library)
      Library.stub!(:find).and_return(@library)
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
  
    it "should find the library requested" do
      Library.should_receive(:find).and_return(@library)
      do_get
    end
  
    it "should assign the found Library for the view" do
      do_get
      assigns[:library].should equal(@library)
    end
  end

  describe "handling POST /libraries" do

    before(:each) do
      @library = mock_model(Library, :to_param => "1")
      Library.stub!(:new).and_return(@library)
    end
    
    describe "with successful save" do
  
      def do_post
        @library.should_receive(:save).and_return(true)
        post :create, :library => {}
      end
  
      it "should create a new library" do
        Library.should_receive(:new).with({}).and_return(@library)
        do_post
      end

      it "should redirect to the new library" do
        do_post
        response.should redirect_to(library_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @library.should_receive(:save).and_return(false)
        post :create, :library => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /libraries/1" do

    before(:each) do
      @library = mock_model(Library, :to_param => "1")
      Library.stub!(:find).and_return(@library)
    end
    
    describe "with successful update" do

      def do_put
        @library.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the library requested" do
        Library.should_receive(:find).with("1").and_return(@library)
        do_put
      end

      it "should update the found library" do
        do_put
        assigns(:library).should equal(@library)
      end

      it "should assign the found library for the view" do
        do_put
        assigns(:library).should equal(@library)
      end

      it "should redirect to the library" do
        do_put
        response.should redirect_to(library_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @library.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /libraries/1" do

    before(:each) do
      @library = mock_model(Library, :destroy => true)
      Library.stub!(:find).and_return(@library)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the library requested" do
      Library.should_receive(:find).with("1").and_return(@library)
      do_delete
    end
  
    it "should call destroy on the found library" do
      @library.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the libraries list" do
      do_delete
      response.should redirect_to(libraries_url)
    end
  end
end