require 'active_support/core_ext/hash/slice'
require 'active_support/core_ext/class/attribute_accessors'

module SequentialID
  module HasSequentialID
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      # Public: Defines ActiveRecord callbacks to set a sequential ID scoped 
      # on a specific class.
      #
      # options - The Hash of options for configuration:
      #           :scope    - The Symbol representing the columm on which the
      #                       sequential ID should be scoped (default: nil)
      #           :column   - The Symbol representing the column that stores the
      #                       sequential ID (default: :sequential_id)
      #           :start_at - The Integer value at which the sequence should
      #                       start (default: 1)
      #           :skip     - Skips the sequential ID generation when the lambda
      #                       expression evaluates to nil. Gets passed the
      #                       model object
      #
      # Examples
      #   
      #   class Answer < ActiveRecord::Base
      #     belongs_to :question
      #     has_sequential_id scope: :question_id
      #   end
      #
      # Returns nothing.
      def has_sequential_id(options = {})
        cattr_accessor :sequence_options
        self.sequence_options = options
        
        before_save :set_sequential_id
        include SequentialID::HasSequentialID::InstanceMethods
      end
    end
    
    module InstanceMethods
      def set_sequential_id
        SequentialID::Generator.new(self, self.class.sequence_options).set
      end
    end
  end
end
