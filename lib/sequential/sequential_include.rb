require 'active_support/core_ext/hash/slice'
require 'active_support/core_ext/class/attribute_accessors'

module Sequential
  module SequentialInclude
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      # Public: Defines ActiveRecord callbacks to set a sequential ID scoped
      # on a specific class.
      #
      # options - The Hash of options for configuration:
      #           :scope    - The Symbol representing the columm on which the
      #                       sequence should be scoped (default: nil)
      #           :column   - The Symbol representing the column that stores the
      #                       sequence (default: :sequential_id)
      #           :start_at - The Integer value at which the sequence should
      #                       start (default: 1)
      #           :skip     - Skips the sequence generation when the lambda
      #                       expression evaluates to nil. Gets passed the
      #                       model object
      #
      # Examples
      #
      #   class Answer < ActiveRecord::Base
      #     belongs_to :question
      #     sequential scope: :question_id
      #   end
      #
      # Returns nothing.
      def sequential(options = {})
        cattr_accessor :sequence_options

        (self.sequence_options ||= []) << options

        before_create :set_sequential_values

        include Sequential::SequentialInclude::InstanceMethods
      end
    end

    module InstanceMethods
      def set_sequential_values
        self.sequence_options.each do |seq_opts|
          Sequential::Generator.new(self, seq_opts).set
        end
      end
    end
  end
end
