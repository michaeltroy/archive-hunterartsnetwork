class Member::ProfileController < SessionsController
  
  layout 'page'
  
  before_filter :access_member_only
  
  def access_member_only
    unless active && active.role == ("member" || "admin")
       redirect_to :controller => "/sessions/login" 
       flash[:error] = "You must login!"
    end
  end
  
  def index
    redirect_to :action => 'show'
  end
  
  def show
    @profile = Member.find(active)
    @events = Event.find(:all, :limit => 3, :order => 'created_at DESC', 
    :conditions => ["member_id = ?", active]) 
  end
  
  def update_userinfo
    @profile = Member.find(active)
  end
  
  def update
    @profile = Member.find(active)
    if @profile.update_attributes(params[:profile])
      redirect_to :controller => 'member/profile', :action => :show, :id => active
      flash[:notice] = 'Your profile has been updated'
    else
    render :action => 'show', :id => active
    end
  end
  
  def update_password
    @profile = Member.find(active)
    if @profile.update_attributes(params[:profile])
      MemberMailer.deliver_updated_user_details(@profile)
      redirect_to :controller => 'member/profile', :action => :show, :id => active
      flash[:notice] = 'Your new password has been emailed to you'
    else
    render :action => 'show', :id => active
    end  end
  
end
