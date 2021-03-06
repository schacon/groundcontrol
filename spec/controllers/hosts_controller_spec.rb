require File.dirname(__FILE__) + '/../spec_helper'

describe HostsController do
  describe "handling GET /hosts" do

    before(:each) do
      @host = mock_model(Host)
      Host.stub!(:find).and_return([@host])
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
  
    it "should find all hosts" do
      Host.should_receive(:find).with(:all).and_return([@host])
      do_get
    end
  
    it "should assign the found hosts for the view" do
      do_get
      assigns[:hosts].should == [@host]
    end
  end

  describe "handling GET /hosts.xml" do

    before(:each) do
      @host = mock_model(Host, :to_xml => "XML")
      Host.stub!(:find).and_return(@host)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all hosts" do
      Host.should_receive(:find).with(:all).and_return([@host])
      do_get
    end
  
    it "should render the found hosts as xml" do
      @host.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /hosts/1" do

    before(:each) do
      @host = mock_model(Host)
      Host.stub!(:find).and_return(@host)
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
  
    it "should find the host requested" do
      Host.should_receive(:find).with("1").and_return(@host)
      do_get
    end
  
    it "should assign the found host for the view" do
      do_get
      assigns[:host].should equal(@host)
    end
  end

  describe "handling GET /hosts/1.xml" do

    before(:each) do
      @host = mock_model(Host, :to_xml => "XML")
      Host.stub!(:find).and_return(@host)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the host requested" do
      Host.should_receive(:find).with("1").and_return(@host)
      do_get
    end
  
    it "should render the found host as xml" do
      @host.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /hosts/new" do

    before(:each) do
      @host = mock_model(Host)
      Host.stub!(:new).and_return(@host)
    end
  
    def do_get
      get :new
      @roles = assigns[:roles]
    end

    it "should be successful" do
      do_get
      response.should be_success
      @roles.should_not be_nil
      @roles.size.should equal(Role.count)
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new host" do
      Host.should_receive(:new).and_return(@host)
      do_get
    end
  
    it "should not save the new host" do
      @host.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new host for the view" do
      do_get
      assigns[:host].should equal(@host)
    end
  end

  describe "handling GET /hosts/1/edit" do

    before(:each) do
      @host = mock_model(Host)
      Host.stub!(:find).and_return(@host)
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
  
    it "should find the host requested" do
      Host.should_receive(:find).and_return(@host)
      do_get
    end
  
    it "should assign the found Host for the view" do
      do_get
      assigns[:host].should equal(@host)
    end
  end

  describe "handling POST /hosts" do

    describe "with successful save" do
  
      def do_post
        post :create, :host => {
          :hostname     => '',
          :url          => '',
          :url_username => '',
          :url_password => '',
          :ssh_username => '',
          :ssh_password => '',
          :role_id      => roles(:webapp).id
        }
        @host = assigns[:host]
      end
  
      it "should create a new host" do
        host_count = Host.count
        do_post
        @host.new_record?.should == false
        Host.count(true).should == (host_count+1)
      end

      it "should redirect to the new host" do
        do_post
        response.should redirect_to(host_url(@host.id))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        post :create, :host => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /hosts/1" do

    before(:each) do
      @host = mock_model(Host, :to_param => "1")
      Host.stub!(:find).and_return(@host)
    end
    
    describe "with successful update" do

      def do_put
        @host.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the host requested" do
        Host.should_receive(:find).with("1").and_return(@host)
        do_put
      end

      it "should update the found host" do
        do_put
        assigns(:host).should equal(@host)
      end

      it "should assign the found host for the view" do
        do_put
        assigns(:host).should equal(@host)
      end

      it "should redirect to the host" do
        do_put
        response.should redirect_to(host_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @host.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /hosts/1" do

    before(:each) do
      @host = mock_model(Host, :destroy => true)
      Host.stub!(:find).and_return(@host)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the host requested" do
      Host.should_receive(:find).with("1").and_return(@host)
      do_delete
    end
  
    it "should call destroy on the found host" do
      @host.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the hosts list" do
      do_delete
      response.should redirect_to(hosts_url)
    end
  end

  describe "handling GET /hosts/watch_exercise/:exercise_id" do

    before(:each) do
      @exercise = mock_model(Exercise)
      Exercise.stub!(:find).and_return([@exercise])
    end
  
    def do_get
      get :watch_exercise, :id => @exercise.id
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('hosts/watch_exercise')
    end
  
    it "should find all hosts" do
      Exercise.should_receive(:find).with(@exercise.id.to_s).and_return([@exercise])
      do_get
    end
  
    it "should assign the found hosts for the view" do
      do_get
      assigns[:exercise].should == [@exercise]
    end
  end
  
  describe "handling POST /hosts/:host_id/exercise_performance" do

    before(:each) do
      @host = hosts(:localhost)
    end
    
    def do_request(id = nil)
      post :exercise_performance, 
        :id       => (id || @host.id), 
        :exercise => {
          :aut_version                => @aut_version = '918273',
          :aut_note                   => @aut_note    = 'performance aut_note',
          :num_concurrent_connections => @num_concurrent_connections = '53',
          :num_hits_per_page          => @num_hits_per_page          = '12'
        }
      @exercise = assigns[:exercise]
    end
    
    it "should not be able to proceed with missing or invalid input" do
      do_request 0
      response.should be_redirect
      response.should redirect_to(:action => 'show')
    end
    
    it "should be successful" do
      do_request
      response.should be_redirect
      response.should redirect_to(:action => 'watch_exercise', :id => @exercise.id)
    end
    
    it "should redirect to watch_exercise action" do
      do_request
      response.should redirect_to(:controller => 'hosts', :action => 'watch_exercise', :id => @exercise.id)
    end
    
    it "should assign the host and exercise" do
      do_request
      assigns[:host]                               .should == @host
      assigns[:exercise]                           .should == @exercise
      assigns[:exercise].aut_version               .should == @aut_version
      assigns[:exercise].aut_note                  .should == @aut_note
      assigns[:exercise].num_concurrent_connections.should == @num_concurrent_connections.to_i
      assigns[:exercise].num_hits_per_page         .should == @num_hits_per_page.to_i
    end
  end
  
  describe "handling POST /hosts/:host_id/exercise_memory" do

    before(:each) do
      @host = hosts(:localhost)
    end
    
    def do_request(host_id = nil, uri = nil)
      post :exercise_memory, 
        :id       => (host_id || @host.id), 
        :uri      => uri,
        :exercise => {
          :aut_version                => @aut_version                = '192837',
          :aut_note                   => @aut_note                   = 'memory aut_note',
          :num_concurrent_connections => @num_concurrent_connections = '73',
          :num_hits_per_page          => @num_hits_per_page          = '20'
        }
      @exercise = assigns[:exercise]
    end
    
    it "should not be able to proceed with missing or invalid input" do
      do_request 0
      response.should be_redirect
      response.should redirect_to(:action => 'index')
      do_request @host.id, ' '
      response.should be_redirect
      response.should redirect_to(:action => 'show')
    end
    
    it "should be successful" do
      do_request @host.id, "/"
      response.should be_redirect
      response.should redirect_to(:action => 'watch_exercise', :id => @exercise.id)
    end
    
    it "should redirect to watch_exercise action" do
      do_request @host.id, "/"
      response.should redirect_to(:controller => 'hosts', :action => 'watch_exercise', :id => @exercise.id)
    end
    
    it "should assign the host and exercise" do
      do_request @host.id, "/"
      assigns[:host]                               .should == @host
      assigns[:exercise]                           .should == @exercise
      assigns[:exercise].aut_version               .should == @aut_version
      assigns[:exercise].aut_note                  .should == @aut_note
      assigns[:exercise].num_concurrent_connections.should == @num_concurrent_connections.to_i
      assigns[:exercise].num_hits_per_page         .should == @num_hits_per_page.to_i
      assigns[:uri]                                .should == '/'
    end
  end
end
