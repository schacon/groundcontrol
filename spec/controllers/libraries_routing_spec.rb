require File.dirname(__FILE__) + '/../spec_helper'

describe LibrariesController do
  describe "route generation" do

    it "should map { :controller => 'libraries', :action => 'index' } to /libraries" do
      route_for(:controller => "libraries", :action => "index").should == "/libraries"
    end
  
    it "should map { :controller => 'libraries', :action => 'new' } to /libraries/new" do
      route_for(:controller => "libraries", :action => "new").should == "/libraries/new"
    end
  
    it "should map { :controller => 'libraries', :action => 'show', :id => 1 } to /libraries/1" do
      route_for(:controller => "libraries", :action => "show", :id => 1).should == "/libraries/1"
    end
  
    it "should map { :controller => 'libraries', :action => 'edit', :id => 1 } to /libraries/1/edit" do
      route_for(:controller => "libraries", :action => "edit", :id => 1).should == "/libraries/1/edit"
    end
  
    it "should map { :controller => 'libraries', :action => 'update', :id => 1} to /libraries/1" do
      route_for(:controller => "libraries", :action => "update", :id => 1).should == "/libraries/1"
    end
  
    it "should map { :controller => 'libraries', :action => 'destroy', :id => 1} to /libraries/1" do
      route_for(:controller => "libraries", :action => "destroy", :id => 1).should == "/libraries/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'libraries', action => 'index' } from GET /libraries" do
      params_from(:get, "/libraries").should == {:controller => "libraries", :action => "index"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'new' } from GET /libraries/new" do
      params_from(:get, "/libraries/new").should == {:controller => "libraries", :action => "new"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'create' } from POST /libraries" do
      params_from(:post, "/libraries").should == {:controller => "libraries", :action => "create"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'show', id => '1' } from GET /libraries/1" do
      params_from(:get, "/libraries/1").should == {:controller => "libraries", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'edit', id => '1' } from GET /libraries/1;edit" do
      params_from(:get, "/libraries/1/edit").should == {:controller => "libraries", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'update', id => '1' } from PUT /libraries/1" do
      params_from(:put, "/libraries/1").should == {:controller => "libraries", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'libraries', action => 'destroy', id => '1' } from DELETE /libraries/1" do
      params_from(:delete, "/libraries/1").should == {:controller => "libraries", :action => "destroy", :id => "1"}
    end
  end
end