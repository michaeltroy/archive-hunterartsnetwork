class Member::EventController < Member::ProfileController
  
  def index
  end
  
  def list
    @events = Event.find(:all, :order => 'created_at DESC', 
    :conditions => ["member_id = ?", active])
  end
  
  def new
    # @event = Event.new(params[:event])
  end
  
  def create
    @event = Event.new(params[:event])
    @event = @active.events.build(params[:event])
    if @event.update_attributes(params[:event])
      redirect_to :controller => 'member/profile', :action => :show, :id => active
      flash[:notice] = "A new event has been created"
    else
      render :action => "new"
    end
  end
  
  def show
    @event = Event.find(params[:id])
    if @event.member_id != active.id
      redirect_to :controller => 'member/event', :action => :list
      flash[:notice] = "Sorry you can't edit that event" 
    else
    end
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to :controller => "member/profile", :action => :show, :id => active
      flash[:notice] = "Event has been updated"
    else
      render :action => :show
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to :controller => "member/event", :action => :list
      flash[:notice] = "Event has been removed"
    else
      redirect_to :controller => "member/event", :action => :list
      flash[:notice] = "Something went wrong. Event WAS NOT removed"
    end
  end
  
end