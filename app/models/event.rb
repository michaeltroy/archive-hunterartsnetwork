class Event < ActiveRecord::Base
  
    ## Relationships
    belongs_to :member
    
    validates_presence_of :category, :title, :location, :copy
    validates_uniqueness_of :title
    
    # Event listing
 # def self.today
  #  today = Event.find(:all, :order => :starttime, 
   # :conditions => ["closedate = ? or opendate = ?", Date.today, Date.today])
#  end
  
  def self.starts_today
    starts_today = Event.find(:all, :order => :starttime, 
    :conditions => ["opendate = ?", Date.today])
  end
  
  def self.ends_today
    ends_today = Event.find(:all, :order => :starttime, 
    :conditions => ["closedate = ?", Date.today])
  end
    
  def self.current
    current = Event.find(:all, :limit => 12, :order => :closedate,
    :conditions => ["opendate <= ? and '#{Date.today}' < closedate 
                    and opendate!= ? and closedate != ?", Date.today, Date.today, Date.today])
  end
  
  def self.future
    future = Event.find(:all, :limit => 12,
    :order => :opendate, :conditions => ["opendate > ?", Date.today])
  end
  
  def self.past
    past = Event.find(:all, 
    :order => 'closedate DESC', 
    :conditions => ["closedate < ? and opendate < ? || closedate = ? and opendate < ?", 
                     Date.today, Date.today, '', Date.today])
  end
    
end