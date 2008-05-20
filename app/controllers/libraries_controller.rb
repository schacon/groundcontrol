class LibrariesController < ApplicationController
  # GET /libraries
  # GET /libraries.xml
  def index
    @libraries = Library.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @libraries }
    end
  end

  # GET /libraries/1
  # GET /libraries/1.xml
  def show
    @library = Library.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @library }
    end
  end

  # GET /libraries/new
  # GET /libraries/new.xml
  def new
    @library = Library.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @library }
    end
  end

  # GET /libraries/1/edit
  def edit
    @library = Library.find(params[:id])
  end

  # POST /libraries
  # POST /libraries.xml
  def create
    @library = Library.new(params[:library])

    respond_to do |format|
      if @library.save
        flash[:notice] = 'Library was successfully created.'
        format.html { redirect_to(@library) }
        format.xml  { render :xml => @library, :status => :created, :location => @library }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /libraries/1
  # PUT /libraries/1.xml
  def update
    @library = Library.find(params[:id])

    respond_to do |format|
      if @library.update_attributes(params[:library])
        flash[:notice] = 'Library was successfully updated.'
        format.html { redirect_to(@library) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @library.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.xml
  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    respond_to do |format|
      format.html { redirect_to(libraries_url) }
      format.xml  { head :ok }
    end
  end
end
