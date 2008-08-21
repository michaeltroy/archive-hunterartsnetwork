# ActsAsViewable
module ActiveRecord
  module Acts #:nodoc:
    module Viewable #:nodoc:

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def acts_as_viewable(options = {})
           write_inheritable_attribute(:acts_as_viewable_options, {
             :viewable_type => ActiveRecord::Base.send(:class_name_of_active_record_descendant, self).to_s
           })

           class_inheritable_reader :acts_as_viewable_options

           has_one :viewing, :as => :viewable, :dependent => :destroy

           include ActiveRecord::Acts::Viewable::InstanceMethods
           #extend ActiveRecord::Acts::Viewable::SingletonMethods
         end
      end

      module InstanceMethods
        def increment_views
          self.viewing = Viewing.create!(:viewable_type => acts_as_viewable_options[:viewable_type], :viewable_id => self.id) if !viewing
          self.viewing.increment!(:views)
        end

        def views
          self.viewing.nil? ? 0 : self.viewing.views
        end
      end

    end
  end
end
