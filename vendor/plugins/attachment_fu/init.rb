require 'tempfile'

Tempfile.class_eval do
  # overwrite so tempfiles use the extension of the basename.  important for rmagick and image science
  def make_tmpname(basename, n)
    ext = nil
    sprintf("%s%d-%d%s", basename.to_s.gsub(/\.\w+$/) { |s| ext = s; '' }, $$, n, ext)
  end
end

require 'geometry'
ActiveRecord::Base.send(:extend, Technoweenie::AttachmentFu::ActMethods)
Technoweenie::AttachmentFu.tempfile_path = ATTACHMENT_FU_TEMPFILE_PATH if Object.const_defined?(:ATTACHMENT_FU_TEMPFILE_PATH)
FileUtils.mkdir_p Technoweenie::AttachmentFu.tempfile_path

$:.unshift(File.dirname(__FILE__) + '/vendor')

#--- added code

Technoweenie::AttachmentFu::InstanceMethods.module_eval do
  protected
    def attachment_valid?
      if self.filename.nil?
        errors.add_to_base attachment_validation_options[:empty]
        return
      end
      [:content_type, :size].each do |option|
        if attachment_validation_options[option] && attachment_options[option] && !attachment_options[option].include?(self.send(option))
          errors.add_to_base attachment_validation_options[option]
        end
      end
    end
end

Technoweenie::AttachmentFu::ClassMethods.module_eval do
  # Options: 
  # *  <tt>:empty</tt> - Base error message when no file is uploaded. Default is "No file uploaded" 
  # *  <tt>:content_type</tt> - Base error message when the uploaded file is not a valid content type.
  # *  <tt>:size</tt> - Base error message when the uploaded file is not a valid size.
  #
  # Example:
  #   validates_attachment :content_type => "The file you uploaded was not a JPEG, PNG or GIF",
  #                        :size         => "The image you uploaded was larger than the maximum size of 10MB" 
  def validates_attachment(options={})
    options[:empty] ||= "No file uploaded" 
    class_inheritable_accessor :attachment_validation_options
    self.attachment_validation_options = options
    validate :attachment_valid?
  end
end
