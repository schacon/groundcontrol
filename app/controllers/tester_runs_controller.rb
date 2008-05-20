class TesterRunsController < ApplicationController
  # GET /tester_runs
  # GET /tester_runs.xml
  def index
    @tester_runs = TesterRun.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tester_runs }
    end
  end

  # GET /tester_runs/1
  # GET /tester_runs/1.xml
  def show
    @tester_run = TesterRun.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tester_run }
    end
  end

  # GET /tester_runs/new
  # GET /tester_runs/new.xml
  def new
    @tester_run = TesterRun.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tester_run }
    end
  end

  # GET /tester_runs/1/edit
  def edit
    @tester_run = TesterRun.find(params[:id])
  end

  # POST /tester_runs
  # POST /tester_runs.xml
  def create
    @tester_run = TesterRun.new(params[:tester_run])

    respond_to do |format|
      if @tester_run.save
        flash[:notice] = 'TesterRun was successfully created.'
        format.html { redirect_to(@tester_run) }
        format.xml  { render :xml => @tester_run, :status => :created, :location => @tester_run }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tester_run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tester_runs/1
  # PUT /tester_runs/1.xml
  def update
    @tester_run = TesterRun.find(params[:id])

    respond_to do |format|
      if @tester_run.update_attributes(params[:tester_run])
        flash[:notice] = 'TesterRun was successfully updated.'
        format.html { redirect_to(@tester_run) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tester_run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tester_runs/1
  # DELETE /tester_runs/1.xml
  def destroy
    @tester_run = TesterRun.find(params[:id])
    @tester_run.destroy

    respond_to do |format|
      format.html { redirect_to(tester_runs_url) }
      format.xml  { head :ok }
    end
  end
end
