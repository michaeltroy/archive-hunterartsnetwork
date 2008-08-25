class Admin::MembersController < Admin::DashboardController
  
  before_filter :access_admin_only

  def index
    active
  end
  
  def list
    @members = Member.paginate :page => params[:page], 
                             :per_page => 12, :order => "created_at DESC"
  end
  
  def new
    @member = Member.new(params[:member])
  end
  
  def create
    random =  Member.generate_random_password(8)
    @member = Member.new(params[:member])
    @member.password = random
      if @member.save
      # deliver email for new member
        MemberMailer.deliver_new_member(@member)
        redirect_to :controller => "admin/dashboard"
        flash[:notice] = "Member <b>#{@member.firstname.capitalize}</b> has been created"
      else
        render :action => "new"
      end
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "member #{@member.firstname.capitalize} has been updated"
    else
      render :action => :show
    end
  end
  
  def destroy
    @member = Member.find(params[:id])
    if @member.destroy
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "Member #{@member.firstname.capitalize} has been removed"
    else
      render :template => "admin/dashboard"
      flash[:notice] = "Something went wrong. member WAS NOT removed"
    end
  end
  
end