require File.dirname(__FILE__) + '/../spec_helper'

describe ProjectsController do
  describe "handling GET /projects" do

    before(:each) do
      @project = mock_model(Project)
      Project.stub!(:find).and_return([@project])
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
  
    it "should find all projects" do
      Project.should_receive(:find).with(:all).and_return([@project])
      do_get
    end
  
    it "should assign the found projects for the view" do
      do_get
      assigns[:projects].should == [@project]
    end
  end

  describe "handling GET /projects.xml" do

    before(:each) do
      @project = mock_model(Project, :to_xml => "XML")
      Project.stub!(:find).and_return(@project)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all projects" do
      Project.should_receive(:find).with(:all).and_return([@project])
      do_get
    end
  
    it "should render the found projects as xml" do
      @project.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /projects/1" do

    before(:each) do
      @project = mock_model(Project)
      Project.stub!(:find).and_return(@project)
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
  
    it "should find the project requested" do
      Project.should_receive(:find).with("1").and_return(@project)
      do_get
    end
  
    it "should assign the found project for the view" do
      do_get
      assigns[:project].should equal(@project)
    end
  end

  describe "handling GET /projects/1.xml" do

    before(:each) do
      @project = mock_model(Project, :to_xml => "XML")
      Project.stub!(:find).and_return(@project)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the project requested" do
      Project.should_receive(:find).with("1").and_return(@project)
      do_get
    end
  
    it "should render the found project as xml" do
      @project.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /projects/new" do

    before(:each) do
      @project = mock_model(Project)
      Project.stub!(:new).and_return(@project)
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
  
    it "should create an new project" do
      Project.should_receive(:new).and_return(@project)
      do_get
    end
  
    it "should not save the new project" do
      @project.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new project for the view" do
      do_get
      assigns[:project].should equal(@project)
    end
  end

  describe "handling GET /projects/1/edit" do

    before(:each) do
      @project = mock_model(Project)
      Project.stub!(:find).and_return(@project)
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
  
    it "should find the project requested" do
      Project.should_receive(:find).and_return(@project)
      do_get
    end
  
    it "should assign the found Project for the view" do
      do_get
      assigns[:project].should equal(@project)
    end
  end

  describe "handling POST /projects" do

    before(:each) do
      @project = mock_model(Project, :to_param => "1")
      Project.stub!(:new).and_return(@project)
    end
    
    describe "with successful save" do
  
      def do_post
        @project.should_receive(:save).and_return(true)
        post :create, :project => {}
      end
  
      it "should create a new project" do
        Project.should_receive(:new).with({}).and_return(@project)
        do_post
      end

      it "should redirect to the new project" do
        do_post
        response.should redirect_to(project_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @project.should_receive(:save).and_return(false)
        post :create, :project => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /projects/1" do

    before(:each) do
      @project = mock_model(Project, :to_param => "1")
      Project.stub!(:find).and_return(@project)
    end
    
    describe "with successful update" do

      def do_put
        @project.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the project requested" do
        Project.should_receive(:find).with("1").and_return(@project)
        do_put
      end

      it "should update the found project" do
        do_put
        assigns(:project).should equal(@project)
      end

      it "should assign the found project for the view" do
        do_put
        assigns(:project).should equal(@project)
      end

      it "should redirect to the project" do
        do_put
        response.should redirect_to(project_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @project.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /projects/1" do

    before(:each) do
      @project = mock_model(Project, :destroy => true)
      Project.stub!(:find).and_return(@project)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the project requested" do
      Project.should_receive(:find).with("1").and_return(@project)
      do_delete
    end
  
    it "should call destroy on the found project" do
      @project.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the projects list" do
      do_delete
      response.should redirect_to(projects_url)
    end
  end
end