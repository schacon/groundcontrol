require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StacksController do
  describe "route generation" do

    it "should map { :controller => 'stacks', :action => 'index' } to /stacks" do
      route_for(:controller => "stacks", :action => "index").should == "/stacks"
    end
  
    it "should map { :controller => 'stacks', :action => 'new' } to /stacks/new" do
      route_for(:controller => "stacks", :action => "new").should == "/stacks/new"
    end
  
    it "should map { :controller => 'stacks', :action => 'show', :id => 1 } to /stacks/1" do
      route_for(:controller => "stacks", :action => "show", :id => 1).should == "/stacks/1"
    end
  
    it "should map { :controller => 'stacks', :action => 'edit', :id => 1 } to /stacks/1/edit" do
      route_for(:controller => "stacks", :action => "edit", :id => 1).should == "/stacks/1/edit"
    end
  
    it "should map { :controller => 'stacks', :action => 'update', :id => 1} to /stacks/1" do
      route_for(:controller => "stacks", :action => "update", :id => 1).should == "/stacks/1"
    end
  
    it "should map { :controller => 'stacks', :action => 'destroy', :id => 1} to /stacks/1" do
      route_for(:controller => "stacks", :action => "destroy", :id => 1).should == "/stacks/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'stacks', action => 'index' } from GET /stacks" do
      params_from(:get, "/stacks").should == {:controller => "stacks", :action => "index"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'new' } from GET /stacks/new" do
      params_from(:get, "/stacks/new").should == {:controller => "stacks", :action => "new"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'create' } from POST /stacks" do
      params_from(:post, "/stacks").should == {:controller => "stacks", :action => "create"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'show', id => '1' } from GET /stacks/1" do
      params_from(:get, "/stacks/1").should == {:controller => "stacks", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'edit', id => '1' } from GET /stacks/1;edit" do
      params_from(:get, "/stacks/1/edit").should == {:controller => "stacks", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'update', id => '1' } from PUT /stacks/1" do
      params_from(:put, "/stacks/1").should == {:controller => "stacks", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'stacks', action => 'destroy', id => '1' } from DELETE /stacks/1" do
      params_from(:delete, "/stacks/1").should == {:controller => "stacks", :action => "destroy", :id => "1"}
    end
  end
end
