class HomeController < ApplicationController
  
  layout 'home'
  
  def index
    @starts_today = Event.starts_today
    @ends_today = Event.ends_today
    @members = Member.find(:all, :conditions => ['role = ? and public = ?', 'member', 1])
    @random_thumb = Artwork.random_thumbnail  
  end
  
  def upcoming
    @future = Event.future
    render :partial => 'upcoming_events'
  end
  
  def news_articles
    @articles = Article.find(:all, :limit => 4, :order => "created_at DESC")
    render :partial => 'news_articles'
  end
  
  def todays_events
    @starts_today = Event.starts_today
    @ends_today = Event.ends_today
    render :partial => 'todays_events'
  end
  
  def current_events
    @current = Event.current                                      
    render :partial => 'current_events'
  end
  
end
