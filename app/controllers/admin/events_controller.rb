class Admin::EventsController < Admin::DashboardController
  
  before_filter :access_admin_only

  def index
    redirect_to :action => :list
  end
  
  def list
    @events = Event.paginate :page => params[:page], 
                             :per_page => 12, :order => "created_at DESC"
  end
  
  def new
    @event = Event.new(params[:event])
  end
  
  def create
    @event = Event.new(params[:event])
    @event = @active.events.build(params[:event])
    if @event.update_attributes(params[:event])
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "A new event has been created"
    else
      render :action => "new"
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to :controller => "admin/dashboard", :action => :index
      flash[:notice] = "Event has been updated"
    else
      render :action => :show
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "Event has been removed"
    else
      render :template => "admin/dashboard"
      flash[:notice] = "Something went wrong. Event WAS NOT removed"
    end
  end
  
end