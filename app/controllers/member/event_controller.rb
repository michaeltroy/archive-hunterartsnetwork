class Member::EventController < Member::ProfileController
  
  def index
  end
  
  def list
    @events = Event.find(:all, :order => 'created_at DESC', 
    :conditions => ["member_id = ?", active])
  end
  
  def new
    @event = Event.new(params[:event])
  end
  
  def create
    @event = Event.new(params[:event])
    @image = Image.new(:uploaded_data => params[:image_file])
    @blend = EventBlend.new(@event, @image)
    # respond to format
    respond_to do |format|
      if @blend.save
        flash[:notice] = "Event was saved"
        format.html {redirect_to @event}
        format.xml  {render :xml => @event,
                            :status => :created,
                            :location => @event}
      else
        flash[:notice] = "Event was NOT"
        format.html {render :action => :new}
        format.xml  {render :xml => @event.errors,
                            :status => :unprocessable_entity}
      end
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
   @image = @event.image
   @blend = EventBlend.new(@event, @image)
   # responf to format
   respond_to do |format|
     if @blend.update_attributes(params[:album], params[:image_file])
       flash[:notice] = "Event was updated"
       format.html {redirect_to @event}
       format.xml  {head :ok}
     else
       @event = @blend.image
       format.html {render :action => :show}
       format.xml  {render :xml => @event.errors,
                           :status => :unprocessable_entity}
     end
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