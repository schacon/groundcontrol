class HostsController < ApplicationController
  
  verify :only => :exercise_performance, :params => :id, :method => :post,
    :add_flash => {:error => 'some information was missing from the request'}, :redirect_to => {:controller => 'hosts', :action => 'index'}
  def exercise_performance
    @exercise = get_exercise_for_test_or_redirect('performance', params[:id]) or return
    @host     = @exercise.host
    Bj.submit "./jobs/performance_test.rb #{@exercise.id} #{@exercise.num_concurrent_connections} #{@exercise.num_hits_per_page}"
    redirect_to :action => 'watch_exercise', :id => @exercise.id
  end
  
  verify :only => :exercise_memory, :params => [:id, :uri], :method => :post,
    :add_flash => {:error => 'some information was missing from the request'}, :redirect_to => {:controller => 'hosts', :action => 'index'}
  def exercise_memory
    @uri = params[:uri].to_s.strip
    if @uri.blank?
      flash[:error] = "the input parameter \"uri\" was absent"
      redirect_to_show_host and return
    end
    @exercise = get_exercise_for_test_or_redirect('memory', params[:id]) or return
    @host     = @exercise.host
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
    @host  = Host.new
    @roles = Role.find(:all, :order => 'role')

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
      if @host.valid? && @host.save
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
  
  def redirect_to_show_host
    redirect_to :action => 'show'
  end
  
  # returns a newly created instance of Exercise or nil upon failure
  def get_exercise_for_test_or_redirect(test_type, host_id)
    host = Host.find_by_id(host_id) rescue nil
    redirect_to_show_host and return if host.nil?
    exercise = Exercise.new(
      :host                       => host, 
      :exercise_type              => test_type, 
      :aut_version                => params[:exercise][:aut_version], 
      :aut_note                   => params[:exercise][:aut_note],
      :num_concurrent_connections => (params[:exercise][:num_concurrent_connections].strip || Exercise::DEFAULT_NUM_CONCURRENT_CONNECTIONS),
      :num_hits_per_page          => (params[:exercise][:num_hits_per_page]         .strip || Exercise::DEFAULT_NUM_HITS_PER_PAGE)
    )
    unless exercise && exercise.valid? && exercise.save
      flash[:error] = "unable to create Exercise: #{exercise.errors.full_messages.join(", ").to_s}"
      redirect_to_show_host
      return
    end
    exercise
  end
end
