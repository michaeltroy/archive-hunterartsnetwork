class PagesController < ApplicationController
  
  layout 'page'
  
  def article
    @article = Article.find(params[:id])
  end
  
  def articles
    @articles = Article.paginate :page => params[:page], 
                                 :per_page => 4, :order => "created_at DESC"
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
    @current = Event.current.paginate :page => params[:page], 
                             :per_page => 8, :order => "created_at DESC"
    @future = Event.future.paginate :page => params[:page], 
                             :per_page => 8, :order => "created_at DESC"
    @past = Event.past.paginate :page => params[:page], 
                             :per_page => 8, :order => "created_at DESC"
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
