class SessionsController < ApplicationController
  
  # Create session with member id
  # TODO refactor session by role
  def begin_session
    member = Member.authenticate(params[:username], params[:password])
    if member && member.role == "admin"
       session[:member_id] = member.id 
       session.model.member_id = member.id
       redirect_to :controller => "admin/dashboard", :action => "index"
    elsif member && member.role == "member"
       session[:member_id] = member.id
       session.model.member_id = member.id
       redirect_to :controller => "member/profile", :action => "show", :id => member
    else
    end
    rescue
    flash[:error] = "Oops, your username or password were incorrect!"
    render :template => "sessions/login"
  end
  
  # Destroy session and log out member
  def destroy
    reset_session
    flash[:notice] = "You have logged out"
    redirect_to :controller => "/"
  end
  
  def send_forgotten_password
    if request.post?
    member = Member.check_member(params[:email])
    random =  Member.generate_random_password(8)
      if member && member.email == params[:email] && member.password = random
        if member.save!
         MemberMailer.deliver_send_forgotten_password(member)
         redirect_to :controller => :sessions, :action => :login
         flash[:notice] = "Your password has been reset and was sent to
                           <b>#{member.email}</b>"
        end
      else member && member.email != params[:email]
         redirect_to :controller => :sessions, :action => :login
         flash[:error] = "Sorry we cannot find your email address!"
      end
    end
  end

end
