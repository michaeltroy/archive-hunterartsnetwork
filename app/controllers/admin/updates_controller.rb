class Admin::UpdatesController < Admin::DashboardController
  
  def index
    redirect_to :action => :list
  end
  
  def list
    @updates = Update.paginate :page => params[:page], 
                               :per_page => 12, :order => "created_at DESC"  
  end
  
  def new
    @update = Update.new(params[:update])
  end
  
  def create
    @update = Update.new(params[:update])
    @update = @active.updates.build(params[:update])
    if @update.update_attributes(params[:update])
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "A new update has been created"
    else
      render :action => "new"
    end
  end
  
  def show
    @update = Update.find(params[:id])
  end
  
  def update
    @update = Update.find(params[:id])
    if @update.update_attributes(params[:update])
      flash[:notice] = "Update has been updated"
      redirect_to :action => :show, :id => @update
    else
      render :action => :show
    end
  end
  
  def destroy
    @update = Update.find(params[:id])
    if @update.destroy
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "article has been removed"
    else
      render :template => "admin/dashboard"
      flash[:notice] = "Something went wrong. article WAS NOT removed"
    end
  end
  
  ## Extra methods
  def send_update_now
    @update = Update.find(params[:id])
    @member = Member.find(:all)
    @email = "hello@engineactive.com"
    # deliver email for new member
      UpdateMailer.deliver_new_update(@update)
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "Update <b>#{@update.title}</b> has been sent"
  end
  
end
