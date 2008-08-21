# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '799d55a690d47382b5dc8ea2a865b724'

  before_filter :active
  
  def active
    if session[:member_id]
      @active = Member.find(session[:member_id])
      else session = nil 
    end
  end

end
