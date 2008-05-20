require File.dirname(__FILE__) + '/../spec_helper'

describe ResultsController do
  describe "route generation" do

    it "should map { :controller => 'results', :action => 'index' } to /results" do
      route_for(:controller => "results", :action => "index").should == "/results"
    end
  
    it "should map { :controller => 'results', :action => 'new' } to /results/new" do
      route_for(:controller => "results", :action => "new").should == "/results/new"
    end
  
    it "should map { :controller => 'results', :action => 'show', :id => 1 } to /results/1" do
      route_for(:controller => "results", :action => "show", :id => 1).should == "/results/1"
    end
  
    it "should map { :controller => 'results', :action => 'edit', :id => 1 } to /results/1/edit" do
      route_for(:controller => "results", :action => "edit", :id => 1).should == "/results/1/edit"
    end
  
    it "should map { :controller => 'results', :action => 'update', :id => 1} to /results/1" do
      route_for(:controller => "results", :action => "update", :id => 1).should == "/results/1"
    end
  
    it "should map { :controller => 'results', :action => 'destroy', :id => 1} to /results/1" do
      route_for(:controller => "results", :action => "destroy", :id => 1).should == "/results/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'results', action => 'index' } from GET /results" do
      params_from(:get, "/results").should == {:controller => "results", :action => "index"}
    end
  
    it "should generate params { :controller => 'results', action => 'new' } from GET /results/new" do
      params_from(:get, "/results/new").should == {:controller => "results", :action => "new"}
    end
  
    it "should generate params { :controller => 'results', action => 'create' } from POST /results" do
      params_from(:post, "/results").should == {:controller => "results", :action => "create"}
    end
  
    it "should generate params { :controller => 'results', action => 'show', id => '1' } from GET /results/1" do
      params_from(:get, "/results/1").should == {:controller => "results", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'results', action => 'edit', id => '1' } from GET /results/1;edit" do
      params_from(:get, "/results/1/edit").should == {:controller => "results", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'results', action => 'update', id => '1' } from PUT /results/1" do
      params_from(:put, "/results/1").should == {:controller => "results", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'results', action => 'destroy', id => '1' } from DELETE /results/1" do
      params_from(:delete, "/results/1").should == {:controller => "results", :action => "destroy", :id => "1"}
    end
  end
end