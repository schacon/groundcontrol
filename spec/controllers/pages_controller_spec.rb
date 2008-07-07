require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PagesController do
  describe "handling GET /pages" do

    before(:each) do
      @page = mock_model(Page)
      Page.stub!(:find).and_return([@page])
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
  
    it "should find all pages" do
      Page.should_receive(:find).with(:all).and_return([@page])
      do_get
    end
  
    it "should assign the found pages for the view" do
      do_get
      assigns[:pages].should == [@page]
    end
  end

  describe "handling GET /pages.xml" do

    before(:each) do
      @pages = mock("Array of Pages", :to_xml => "XML")
      Page.stub!(:find).and_return(@pages)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all pages" do
      Page.should_receive(:find).with(:all).and_return(@pages)
      do_get
    end
  
    it "should render the found pages as xml" do
      @pages.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /pages/1" do

    before(:each) do
      @page = mock_model(Page)
      Page.stub!(:find).and_return(@page)
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
  
    it "should find the page requested" do
      Page.should_receive(:find).with("1").and_return(@page)
      do_get
    end
  
    it "should assign the found page for the view" do
      do_get
      assigns[:page].should equal(@page)
    end
  end

  describe "handling GET /pages/1.xml" do

    before(:each) do
      @page = mock_model(Page, :to_xml => "XML")
      Page.stub!(:find).and_return(@page)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the page requested" do
      Page.should_receive(:find).with("1").and_return(@page)
      do_get
    end
  
    it "should render the found page as xml" do
      @page.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /pages/new" do

    before(:each) do
      @page = mock_model(Page)
      Page.stub!(:new).and_return(@page)
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
  
    it "should create an new page" do
      Page.should_receive(:new).and_return(@page)
      do_get
    end
  
    it "should not save the new page" do
      @page.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new page for the view" do
      do_get
      assigns[:page].should equal(@page)
    end
  end

  describe "handling GET /pages/1/edit" do

    before(:each) do
      @page = mock_model(Page)
      Page.stub!(:find).and_return(@page)
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
  
    it "should find the page requested" do
      Page.should_receive(:find).and_return(@page)
      do_get
    end
  
    it "should assign the found Page for the view" do
      do_get
      assigns[:page].should equal(@page)
    end
  end

  describe "handling POST /pages" do

    before(:each) do
      @page = mock_model(Page, :to_param => "1")
      Page.stub!(:new).and_return(@page)
    end
    
    describe "with successful save" do
  
      def do_post
        @page.should_receive(:save).and_return(true)
        post :create, :page => {}
      end
  
      it "should create a new page" do
        Page.should_receive(:new).with({}).and_return(@page)
        do_post
      end

      it "should redirect to the new page" do
        do_post
        response.should redirect_to(page_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @page.should_receive(:save).and_return(false)
        post :create, :page => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /pages/1" do

    before(:each) do
      @page = mock_model(Page, :to_param => "1")
      Page.stub!(:find).and_return(@page)
    end
    
    describe "with successful update" do

      def do_put
        @page.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the page requested" do
        Page.should_receive(:find).with("1").and_return(@page)
        do_put
      end

      it "should update the found page" do
        do_put
        assigns(:page).should equal(@page)
      end

      it "should assign the found page for the view" do
        do_put
        assigns(:page).should equal(@page)
      end

      it "should redirect to the page" do
        do_put
        response.should redirect_to(page_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @page.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /pages/1" do

    before(:each) do
      @page = mock_model(Page, :destroy => true)
      Page.stub!(:find).and_return(@page)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the page requested" do
      Page.should_receive(:find).with("1").and_return(@page)
      do_delete
    end
  
    it "should call destroy on the found page" do
      @page.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the pages list" do
      do_delete
      response.should redirect_to(pages_url)
    end
  end
end
