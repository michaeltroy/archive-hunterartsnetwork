class Article < ActiveRecord::Base
    
  ## Relationships
  belongs_to :member
  
  # Validates
  validates_presence_of :category, :title, :subtitle, :copy
  validates_uniqueness_of :title, :subtitle
  
end
