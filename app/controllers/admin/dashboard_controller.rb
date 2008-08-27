class Admin::DashboardController < Admin::SessionsController
  
  layout 'page'
  
  # filters
  before_filter :access_admin_only
  
  def access_admin_only
    if active && active.role == "admin"
    elsif active && active.role == "member"  
      redirect_to :controller => "member/profile", :action => :show, :id => active
      flash[:error] = "Sorry, admin only!"
    else
      redirect_to :controller => "sessions/login" 
      flash[:error] = "You must login!"
    end
  end
  
  def index
    @members = Member.find(:all, :limit => 5, :order => 'created_at DESC')
    @artworks = Artwork.find(:all)
    @articles = Article.find(:all, :limit => 5, :order => 'created_at DESC')
    @events = Event.find(:all, :order => :opendate, 
                               :limit => 5, :order => 'created_at DESC')
    @updates = Update.find(:all, :limit => 5, :order => 'created_at DESC')
  end
  
end
