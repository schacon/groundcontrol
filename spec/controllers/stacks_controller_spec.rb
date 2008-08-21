require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StacksController do
  describe "handling GET /stacks" do

    before(:each) do
      @stack = mock_model(Stack)
      Stack.stub!(:find).and_return([@stack])
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
  
    it "should find all stacks" do
      Stack.should_receive(:find).with(:all).and_return([@stack])
      do_get
    end
  
    it "should assign the found stacks for the view" do
      do_get
      assigns[:stacks].should == [@stack]
    end
  end

  describe "handling GET /stacks.xml" do

    before(:each) do
      @stacks = mock("Array of Stacks", :to_xml => "XML")
      Stack.stub!(:find).and_return(@stacks)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all stacks" do
      Stack.should_receive(:find).with(:all).and_return(@stacks)
      do_get
    end
  
    it "should render the found stacks as xml" do
      @stacks.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /stacks/1" do

    before(:each) do
      @stack = mock_model(Stack)
      Stack.stub!(:find).and_return(@stack)
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
  
    it "should find the stack requested" do
      Stack.should_receive(:find).with("1").and_return(@stack)
      do_get
    end
  
    it "should assign the found stack for the view" do
      do_get
      assigns[:stack].should equal(@stack)
    end
  end

  describe "handling GET /stacks/1.xml" do

    before(:each) do
      @stack = mock_model(Stack, :to_xml => "XML")
      Stack.stub!(:find).and_return(@stack)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the stack requested" do
      Stack.should_receive(:find).with("1").and_return(@stack)
      do_get
    end
  
    it "should render the found stack as xml" do
      @stack.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /stacks/new" do

    before(:each) do
      @stack = mock_model(Stack)
      Stack.stub!(:new).and_return(@stack)
    end
  
    def do_get
      get :new
      @hosts = assigns[:hosts]
    end

    it "should be successful" do
      do_get
      response.should be_success
      @hosts.should_not be_nil
      @hosts.size.should equal(Host.count(true))
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new stack" do
      Stack.should_receive(:new).and_return(@stack)
      do_get
    end
  
    it "should not save the new stack" do
      @stack.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new stack for the view" do
      do_get
      assigns[:stack].should equal(@stack)
    end
  end

  describe "handling GET /stacks/1/edit" do

    before(:each) do
      @stack = mock_model(Stack)
      Stack.stub!(:find).and_return(@stack)
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
  
    it "should find the stack requested" do
      Stack.should_receive(:find).and_return(@stack)
      do_get
    end
  
    it "should assign the found Stack for the view" do
      do_get
      assigns[:stack].should equal(@stack)
    end
  end

  describe "handling POST /stacks" do

    describe "with successful save" do
  
      def do_post
        @hosts = [hosts(:rmc01_virtual).id.to_s, hosts(:rmc02_virtual).id.to_s]
        post :create, :stack => {
          :name     => 'a stack',
          :host_ids => @hosts
        }
        @stack = assigns[:stack]
      end
  
      it "should create a new stack" do
        stack_count = Stack.count(true)
        do_post
        Stack.count(true) .should equal(stack_count+1)
        @stack.new_record?.should == false
        @stack.hosts.size .should == @hosts.size
      end

      it "should redirect to the new stack" do
        do_post
        response.should redirect_to(stack_url(@stack.id))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        post :create, :stack => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /stacks/1" do

    before(:each) do
      @stack = mock_model(Stack, :to_param => "1")
      Stack.stub!(:find).and_return(@stack)
    end
    
    describe "with successful update" do

      def do_put
        @stack.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the stack requested" do
        Stack.should_receive(:find).with("1").and_return(@stack)
        do_put
      end

      it "should update the found stack" do
        do_put
        assigns(:stack).should equal(@stack)
      end

      it "should assign the found stack for the view" do
        do_put
        assigns(:stack).should equal(@stack)
      end

      it "should redirect to the stack" do
        do_put
        response.should redirect_to(stack_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @stack.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /stacks/1" do

    before(:each) do
      @stack = mock_model(Stack, :destroy => true)
      Stack.stub!(:find).and_return(@stack)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the stack requested" do
      Stack.should_receive(:find).with("1").and_return(@stack)
      do_delete
    end
  
    it "should call destroy on the found stack" do
      @stack.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the stacks list" do
      do_delete
      response.should redirect_to(stacks_url)
    end
  end
end
