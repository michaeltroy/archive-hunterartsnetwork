class Artwork < ActiveRecord::Base
    
  ## Relationships
  belongs_to :member
  
  has_attachment  :content_type => :image, 
                  :storage => :s3, 
                  :max_size => 1000.kilobytes,
                  :resize_to => '524x524>',
                  :thumbnails => { :crop => "96x96!",
                                   :thumb => "164x164>",
                                   :small => "36x36!" }

  validates_attachment :size => "Image file size is too big. It must be 1MB or less"
    
  def self.random_thumbnail
    Artwork.find(:all,  :limit => 22,
                 :include => :member,
                 :conditions => ['role = ? and public = ?', 'member', 1], 
                 :order => 'rand()')
  end

end
