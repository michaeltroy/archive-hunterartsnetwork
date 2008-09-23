class Image < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :event
  
  has_attachment  :content_type => :image, 
                  :storage => :s3, 
                  :max_size => 1000.kilobytes,
                  :resize_to => '524x524>',
                  :thumbnails => { :crop => "96x96!",
                                   :thumb => "164x164>",
                                   :small => "36x36!" }
                                   
  #validates_as_attachment
                                   
end
