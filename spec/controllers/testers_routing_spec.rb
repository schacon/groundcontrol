require File.dirname(__FILE__) + '/../spec_helper'

describe TestersController do
  describe "route generation" do

    it "should map { :controller => 'testers', :action => 'index' } to /testers" do
      route_for(:controller => "testers", :action => "index").should == "/testers"
    end
  
    it "should map { :controller => 'testers', :action => 'new' } to /testers/new" do
      route_for(:controller => "testers", :action => "new").should == "/testers/new"
    end
  
    it "should map { :controller => 'testers', :action => 'show', :id => 1 } to /testers/1" do
      route_for(:controller => "testers", :action => "show", :id => 1).should == "/testers/1"
    end
  
    it "should map { :controller => 'testers', :action => 'edit', :id => 1 } to /testers/1/edit" do
      route_for(:controller => "testers", :action => "edit", :id => 1).should == "/testers/1/edit"
    end
  
    it "should map { :controller => 'testers', :action => 'update', :id => 1} to /testers/1" do
      route_for(:controller => "testers", :action => "update", :id => 1).should == "/testers/1"
    end
  
    it "should map { :controller => 'testers', :action => 'destroy', :id => 1} to /testers/1" do
      route_for(:controller => "testers", :action => "destroy", :id => 1).should == "/testers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'testers', action => 'index' } from GET /testers" do
      params_from(:get, "/testers").should == {:controller => "testers", :action => "index"}
    end
  
    it "should generate params { :controller => 'testers', action => 'new' } from GET /testers/new" do
      params_from(:get, "/testers/new").should == {:controller => "testers", :action => "new"}
    end
  
    it "should generate params { :controller => 'testers', action => 'create' } from POST /testers" do
      params_from(:post, "/testers").should == {:controller => "testers", :action => "create"}
    end
  
    it "should generate params { :controller => 'testers', action => 'show', id => '1' } from GET /testers/1" do
      params_from(:get, "/testers/1").should == {:controller => "testers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'testers', action => 'edit', id => '1' } from GET /testers/1;edit" do
      params_from(:get, "/testers/1/edit").should == {:controller => "testers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'testers', action => 'update', id => '1' } from PUT /testers/1" do
      params_from(:put, "/testers/1").should == {:controller => "testers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'testers', action => 'destroy', id => '1' } from DELETE /testers/1" do
      params_from(:delete, "/testers/1").should == {:controller => "testers", :action => "destroy", :id => "1"}
    end
  end
end