class Viewing < ActiveRecord::Base
  belongs_to :viewable, :polymorphic => true
  
  def self.viewed_class(viewable)
    ActiveRecord::Base.send(:class_name_of_active_record_descendant, viewable.class).to_s
  end
  
  def self.find_viewable(viewed_class, viewed_id)
    viewed_class.constantize.find(viewed_id)
  end  
end