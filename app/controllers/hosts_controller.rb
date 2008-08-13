class HostsController < ApplicationController
  
  verify :only => :exercise_performance, :params => :id, :method => :post,
    :add_flash => {:error => 'some information was missing from the request'}, :redirect_to => {:controller => 'hosts', :action => 'index'}
  def exercise_performance
    @host     = find_host_or_redirect(params[:id]) or return
    @exercise = create_exercise_or_redirect(
      :host          => @host, 
      :exercise_type => 'performance', 
      :aut_version   => params[:aut_version], 
      :aut_note      => params[:aut_note]
    ) or return
    Bj.submit "./jobs/performance_test.rb #{@exercise.id}"
    redirect_to :action => 'watch_exercise', :id => @exercise.id
  end
  
  verify :only => :run_memory_exercise, :params => [:id, :uri], :method => :post,
    :add_flash => {:error => 'some information was missing from the request'}, :redirect_to => {:controller => 'hosts', :action => 'index'}
  def run_memory_exercise
    @uri = params[:uri].to_s.strip
    if @uri.blank?
      flash[:error] = "the input parameter \"uri\" was absent"
      redirect_to :action => 'show' and return
    end
    @host     = find_host_or_redirect(params[:id]) or return
    @exercise = create_exercise_or_redirect(
      :host          => @host, 
      :exercise_type => 'memory', 
      :aut_version   => params[:aut_version],
      :aut_note      => params[:aut_note]
    ) or return
    Bj.submit "./jobs/memory_test.rb #{@exercise.id} #{@uri}"
    redirect_to :action => 'watch_exercise', :id => @exercise.id
  end
    
  def watch_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  def show_exercise
    @exercise = Exercise.find(params[:id])
  end
  
  #<Sample id: 3280, exercise_id: 45, page_id: 1, passed: true, 
  # user: nil, response: 200, time: 3.4905, created_at: "2008-07-07 23:04:35", 
  # updated_at: "2008-07-07 23:04:39", page_data: nil, 
  # page_size: 18712, memory: 5868.0>
  
  def show_stats
    @exercise = Exercise.find(params[:id])
    @data = {}
    
    @exercise.samples.each do |sample|
      pid = sample.page_id
      @data[pid] ||= {:count => 0, :memory => 0, :time => 0, 
                      :memory_avg => 0, :time_avg => 0, :page => sample.page_uri }
      @data[pid][:count] += 1
      @data[pid][:memory] += sample.changed_memory.to_i
      @data[pid][:time] += sample.time.to_f
      @data[pid][:memory_avg] = (@data[pid][:memory] / @data[pid][:count])
      @data[pid][:time_avg] = (@data[pid][:time] / @data[pid][:count])
    end
  end

  def exercise
    @exercise = Exercise.find(params[:id])
    render :partial => 'exercise'
  end
  
  # GET /hosts
  # GET /hosts.xml
  def index
    @hosts = Host.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hosts }
    end
  end

  # GET /hosts/1
  # GET /hosts/1.xml
  def show
    @host = Host.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
    end
  end

  # GET /hosts/new
  # GET /hosts/new.xml
  def new
    @host = Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @host }
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Host.find(params[:id])
  end

  # POST /hosts
  # POST /hosts.xml
  def create
    @host = Host.new(params[:host])

    respond_to do |format|
      if @host.save
        flash[:notice] = 'Host was successfully created.'
        format.html { redirect_to(@host) }
        format.xml  { render :xml => @host, :status => :created, :location => @host }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.xml
  def update
    @host = Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        flash[:notice] = 'Host was successfully updated.'
        format.html { redirect_to(@host) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.xml
  def destroy
    @host = Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to(hosts_url) }
      format.xml  { head :ok }
    end
  end



private
  
  def find_host_or_redirect(host_id)
    unless host = Host.find_by_id(host_id) rescue nil
      flash[:error] = "unable to find Host #{host_id}"
      redirect_to :action => 'show'
      return
    end
    host
  end
  
  def create_exercise_or_redirect(params)
    exercise = Exercise.new(params)
    unless exercise.valid? && exercise.save
      flash[:error] = "unable to create Exercise: #{exercise.errors.full_messages.join(", ").to_s}"
      redirect_to :action => 'show'
      return
    end
    exercise
  end
end
