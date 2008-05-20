require File.dirname(__FILE__) + '/../spec_helper'

describe ServersController do
  describe "route generation" do

    it "should map { :controller => 'servers', :action => 'index' } to /servers" do
      route_for(:controller => "servers", :action => "index").should == "/servers"
    end
  
    it "should map { :controller => 'servers', :action => 'new' } to /servers/new" do
      route_for(:controller => "servers", :action => "new").should == "/servers/new"
    end
  
    it "should map { :controller => 'servers', :action => 'show', :id => 1 } to /servers/1" do
      route_for(:controller => "servers", :action => "show", :id => 1).should == "/servers/1"
    end
  
    it "should map { :controller => 'servers', :action => 'edit', :id => 1 } to /servers/1/edit" do
      route_for(:controller => "servers", :action => "edit", :id => 1).should == "/servers/1/edit"
    end
  
    it "should map { :controller => 'servers', :action => 'update', :id => 1} to /servers/1" do
      route_for(:controller => "servers", :action => "update", :id => 1).should == "/servers/1"
    end
  
    it "should map { :controller => 'servers', :action => 'destroy', :id => 1} to /servers/1" do
      route_for(:controller => "servers", :action => "destroy", :id => 1).should == "/servers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'servers', action => 'index' } from GET /servers" do
      params_from(:get, "/servers").should == {:controller => "servers", :action => "index"}
    end
  
    it "should generate params { :controller => 'servers', action => 'new' } from GET /servers/new" do
      params_from(:get, "/servers/new").should == {:controller => "servers", :action => "new"}
    end
  
    it "should generate params { :controller => 'servers', action => 'create' } from POST /servers" do
      params_from(:post, "/servers").should == {:controller => "servers", :action => "create"}
    end
  
    it "should generate params { :controller => 'servers', action => 'show', id => '1' } from GET /servers/1" do
      params_from(:get, "/servers/1").should == {:controller => "servers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'servers', action => 'edit', id => '1' } from GET /servers/1;edit" do
      params_from(:get, "/servers/1/edit").should == {:controller => "servers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'servers', action => 'update', id => '1' } from PUT /servers/1" do
      params_from(:put, "/servers/1").should == {:controller => "servers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'servers', action => 'destroy', id => '1' } from DELETE /servers/1" do
      params_from(:delete, "/servers/1").should == {:controller => "servers", :action => "destroy", :id => "1"}
    end
  end
end