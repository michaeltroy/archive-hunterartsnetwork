class EventBlend
  
  attr_reader :event, :image
  
  def initialize(event, image) 
    @event = event 
    @image = image 
  end 
  
  def save 
    return false unless valid? 
    begin 
      Event.transaction do 
        if @image.new_record? 
          @event.image.destroy if @event.image 
          @event.image = @event 
          @event.save! 
        end 
        @event.save! 
        true 
      end 
    rescue 
      false 
    end 
    end 
  
  def valid? 
    @event.valid? && @image.valid? 
  end
  
  def update_attributes(event_attributes, image_file) 
    @event.attributes = event_attributes 
    unless image_file.blank? 
      @image = Image.new(:uploaded_data => image_file) 
    end 
    save 
  end 
   
end
