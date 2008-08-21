class PagesController < ApplicationController
  
  layout 'page'
  
  def article
    @article = Article.find(params[:id])
  end
  
  def articles
    @articles = Article.find(:all, :order => "created_at")
  end
  
  def profile
    @profile = Member.find(params[:id])
    @artworks = Artwork.find(:all, 
                             :conditions => {:member_id => "#{@profile.id}"})
    @views = Member.find(params[:id])
    @views.increment_views
  end
  
  def event
    @event = Event.find(params[:id])
  end
  
  def events
    @future = Event.future
    @current = Event.current
    @past = Event.past
  end
  
  def member_directory
    @ceramics = Member.ceramics
    @jewellery = Member.jewellery
    @mixed_media = Member.mixed_media
    @painting = Member.painting
    @textiles = Member.textiles
    @works_on_paper = Member.works_on_paper
    @other = Member.other
    @other_member = Member.other_member
  end
  
end
