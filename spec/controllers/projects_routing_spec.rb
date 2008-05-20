require File.dirname(__FILE__) + '/../spec_helper'

describe ProjectsController do
  describe "route generation" do

    it "should map { :controller => 'projects', :action => 'index' } to /projects" do
      route_for(:controller => "projects", :action => "index").should == "/projects"
    end
  
    it "should map { :controller => 'projects', :action => 'new' } to /projects/new" do
      route_for(:controller => "projects", :action => "new").should == "/projects/new"
    end
  
    it "should map { :controller => 'projects', :action => 'show', :id => 1 } to /projects/1" do
      route_for(:controller => "projects", :action => "show", :id => 1).should == "/projects/1"
    end
  
    it "should map { :controller => 'projects', :action => 'edit', :id => 1 } to /projects/1/edit" do
      route_for(:controller => "projects", :action => "edit", :id => 1).should == "/projects/1/edit"
    end
  
    it "should map { :controller => 'projects', :action => 'update', :id => 1} to /projects/1" do
      route_for(:controller => "projects", :action => "update", :id => 1).should == "/projects/1"
    end
  
    it "should map { :controller => 'projects', :action => 'destroy', :id => 1} to /projects/1" do
      route_for(:controller => "projects", :action => "destroy", :id => 1).should == "/projects/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'projects', action => 'index' } from GET /projects" do
      params_from(:get, "/projects").should == {:controller => "projects", :action => "index"}
    end
  
    it "should generate params { :controller => 'projects', action => 'new' } from GET /projects/new" do
      params_from(:get, "/projects/new").should == {:controller => "projects", :action => "new"}
    end
  
    it "should generate params { :controller => 'projects', action => 'create' } from POST /projects" do
      params_from(:post, "/projects").should == {:controller => "projects", :action => "create"}
    end
  
    it "should generate params { :controller => 'projects', action => 'show', id => '1' } from GET /projects/1" do
      params_from(:get, "/projects/1").should == {:controller => "projects", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'projects', action => 'edit', id => '1' } from GET /projects/1;edit" do
      params_from(:get, "/projects/1/edit").should == {:controller => "projects", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'projects', action => 'update', id => '1' } from PUT /projects/1" do
      params_from(:put, "/projects/1").should == {:controller => "projects", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'projects', action => 'destroy', id => '1' } from DELETE /projects/1" do
      params_from(:delete, "/projects/1").should == {:controller => "projects", :action => "destroy", :id => "1"}
    end
  end
end