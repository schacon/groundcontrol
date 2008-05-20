class TestersController < ApplicationController
  # GET /testers
  # GET /testers.xml
  def index
    @testers = Tester.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testers }
    end
  end

  # GET /testers/1
  # GET /testers/1.xml
  def show
    @tester = Tester.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tester }
    end
  end

  # GET /testers/new
  # GET /testers/new.xml
  def new
    @tester = Tester.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tester }
    end
  end

  # GET /testers/1/edit
  def edit
    @tester = Tester.find(params[:id])
  end

  # POST /testers
  # POST /testers.xml
  def create
    @tester = Tester.new(params[:tester])

    respond_to do |format|
      if @tester.save
        flash[:notice] = 'Tester was successfully created.'
        format.html { redirect_to(@tester) }
        format.xml  { render :xml => @tester, :status => :created, :location => @tester }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testers/1
  # PUT /testers/1.xml
  def update
    @tester = Tester.find(params[:id])

    respond_to do |format|
      if @tester.update_attributes(params[:tester])
        flash[:notice] = 'Tester was successfully updated.'
        format.html { redirect_to(@tester) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tester.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testers/1
  # DELETE /testers/1.xml
  def destroy
    @tester = Tester.find(params[:id])
    @tester.destroy

    respond_to do |format|
      format.html { redirect_to(testers_url) }
      format.xml  { head :ok }
    end
  end
end
