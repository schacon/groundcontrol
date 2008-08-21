class StacksController < ApplicationController
  # GET /stacks
  # GET /stacks.xml
  def index
    @stacks = Stack.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stacks }
    end
  end

  # GET /stacks/1
  # GET /stacks/1.xml
  def show
    @stack = Stack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stack }
    end
  end

  # GET /stacks/new
  # GET /stacks/new.xml
  def new
    @stack = Stack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stack }
    end
  end

  # GET /stacks/1/edit
  def edit
    @stack = Stack.find(params[:id])
  end

  # POST /stacks
  # POST /stacks.xml
  def create
    @stack = Stack.new(params[:stack])

    respond_to do |format|
      if @stack.save
        flash[:notice] = 'Stack was successfully created.'
        format.html { redirect_to(@stack) }
        format.xml  { render :xml => @stack, :status => :created, :location => @stack }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stacks/1
  # PUT /stacks/1.xml
  def update
    @stack = Stack.find(params[:id])

    respond_to do |format|
      if @stack.update_attributes(params[:stack])
        flash[:notice] = 'Stack was successfully updated.'
        format.html { redirect_to(@stack) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.xml
  def destroy
    @stack = Stack.find(params[:id])
    @stack.destroy

    respond_to do |format|
      format.html { redirect_to(stacks_url) }
      format.xml  { head :ok }
    end
  end
end
