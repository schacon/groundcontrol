require File.dirname(__FILE__) + '/../spec_helper'

describe TesterRunsController do
  describe "route generation" do

    it "should map { :controller => 'tester_runs', :action => 'index' } to /tester_runs" do
      route_for(:controller => "tester_runs", :action => "index").should == "/tester_runs"
    end
  
    it "should map { :controller => 'tester_runs', :action => 'new' } to /tester_runs/new" do
      route_for(:controller => "tester_runs", :action => "new").should == "/tester_runs/new"
    end
  
    it "should map { :controller => 'tester_runs', :action => 'show', :id => 1 } to /tester_runs/1" do
      route_for(:controller => "tester_runs", :action => "show", :id => 1).should == "/tester_runs/1"
    end
  
    it "should map { :controller => 'tester_runs', :action => 'edit', :id => 1 } to /tester_runs/1/edit" do
      route_for(:controller => "tester_runs", :action => "edit", :id => 1).should == "/tester_runs/1/edit"
    end
  
    it "should map { :controller => 'tester_runs', :action => 'update', :id => 1} to /tester_runs/1" do
      route_for(:controller => "tester_runs", :action => "update", :id => 1).should == "/tester_runs/1"
    end
  
    it "should map { :controller => 'tester_runs', :action => 'destroy', :id => 1} to /tester_runs/1" do
      route_for(:controller => "tester_runs", :action => "destroy", :id => 1).should == "/tester_runs/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'tester_runs', action => 'index' } from GET /tester_runs" do
      params_from(:get, "/tester_runs").should == {:controller => "tester_runs", :action => "index"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'new' } from GET /tester_runs/new" do
      params_from(:get, "/tester_runs/new").should == {:controller => "tester_runs", :action => "new"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'create' } from POST /tester_runs" do
      params_from(:post, "/tester_runs").should == {:controller => "tester_runs", :action => "create"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'show', id => '1' } from GET /tester_runs/1" do
      params_from(:get, "/tester_runs/1").should == {:controller => "tester_runs", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'edit', id => '1' } from GET /tester_runs/1;edit" do
      params_from(:get, "/tester_runs/1/edit").should == {:controller => "tester_runs", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'update', id => '1' } from PUT /tester_runs/1" do
      params_from(:put, "/tester_runs/1").should == {:controller => "tester_runs", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'tester_runs', action => 'destroy', id => '1' } from DELETE /tester_runs/1" do
      params_from(:delete, "/tester_runs/1").should == {:controller => "tester_runs", :action => "destroy", :id => "1"}
    end
  end
end