class Update < ActiveRecord::Base
  
  belongs_to :member 
  
  validates_presence_of :title, :copy
  
end
