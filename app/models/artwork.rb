class Artwork < ActiveRecord::Base
    
  ## Relationships
  belongs_to :member
  
  has_attachment  :content_type => :image, 
                  :storage => :s3, 
                  :max_size => 500.kilobytes,
                  :resize_to => '500x500>',
                  :thumbnails => { :thumb => [96, 96], 
                                   :geometry => 'x50' }

  validates_attachment :size => "Image file size is too big. It must be 500kb or less"
    
  def self.random_thumbnail
    Artwork.find(:all, :include => :member, :limit => 11,
                 :conditions => ['role = ? and public = ?', 'member', 1],
                 :order => 'rand()')
  end

end
