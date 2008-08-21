class StaticController < ApplicationController
  
  layout 'page'
  
  def about
    render :template => "static/about"
  end
  
  def membership
    render :template => "static/membership"
  end
  
  def insurance
    render :template => "static/insurance"
  end
  
end
