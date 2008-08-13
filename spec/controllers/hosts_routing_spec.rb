require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe HostsController do
  describe "route generation" do

    it "should map { :controller => 'hosts', :action => 'index' } to /hosts" do
      route_for(:controller => "hosts", :action => "index").should == "/hosts"
    end
  
    it "should map { :controller => 'hosts', :action => 'new' } to /hosts/new" do
      route_for(:controller => "hosts", :action => "new").should == "/hosts/new"
    end
  
    it "should map { :controller => 'hosts', :action => 'show', :id => 1 } to /hosts/1" do
      route_for(:controller => "hosts", :action => "show", :id => 1).should == "/hosts/1"
    end
  
    it "should map { :controller => 'hosts', :action => 'edit', :id => 1 } to /hosts/1/edit" do
      route_for(:controller => "hosts", :action => "edit", :id => 1).should == "/hosts/1/edit"
    end
  
    it "should map { :controller => 'hosts', :action => 'update', :id => 1} to /hosts/1" do
      route_for(:controller => "hosts", :action => "update", :id => 1).should == "/hosts/1"
    end
  
    it "should map { :controller => 'hosts', :action => 'destroy', :id => 1} to /hosts/1" do
      route_for(:controller => "hosts", :action => "destroy", :id => 1).should == "/hosts/1"
    end
  
    it "should map { :controller => 'hosts', :action => 'exercise_performance', :id => 1 } to /hosts/1/exercise_performance" do
      route_for(:controller => "hosts", :action => "exercise_performance", :id => 1).should == "/hosts/1/exercise_performance"
    end
  
    it "should map { :controller => 'hosts', :action => 'run_memory_exercise', :id => 1 } to /hosts/1/run_memory_exercise" do
      route_for(:controller => "hosts", :action => "run_memory_exercise", :id => 1).should == "/hosts/1/run_memory_exercise"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'hosts', action => 'index' } from GET /hosts" do
      params_from(:get, "/hosts").should == {:controller => "hosts", :action => "index"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'new' } from GET /hosts/new" do
      params_from(:get, "/hosts/new").should == {:controller => "hosts", :action => "new"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'create' } from POST /hosts" do
      params_from(:post, "/hosts").should == {:controller => "hosts", :action => "create"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'show', id => '1' } from GET /hosts/1" do
      params_from(:get, "/hosts/1").should == {:controller => "hosts", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'edit', id => '1' } from GET /hosts/1;edit" do
      params_from(:get, "/hosts/1/edit").should == {:controller => "hosts", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'update', id => '1' } from PUT /hosts/1" do
      params_from(:put, "/hosts/1").should == {:controller => "hosts", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'destroy', id => '1' } from DELETE /hosts/1" do
      params_from(:delete, "/hosts/1").should == {:controller => "hosts", :action => "destroy", :id => "1"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'exercise_performance', id => '1' } from POST /hosts/1/exercise_performance" do
      params_from(:get, "/hosts/1/exercise_performance").should == {:controller => "hosts", :action => "exercise_performance", :id => "1"}
    end
  
    it "should generate params { :controller => 'hosts', action => 'run_memory_exercise', id => '1' } from POST /hosts/1/run_memory_exercise" do
      params_from(:get, "/hosts/1/run_memory_exercise").should == {:controller => "hosts", :action => "run_memory_exercise", :id => "1"}
    end
  end
end
