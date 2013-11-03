module SequentialId
  class Generator
    attr_reader :record, :scope, :column, :start_at, :skip

    def initialize(record, options = {})
      @record = record
      @scope = options[:scope]
      @column = (options[:column] || :sequential_id).to_sym
      @start_at = options[:start_at] || 1
      @skip = options[:skip]
    end

    def set
      sequence = SequentialId::Sequence.where(
        model: record.class.name, 
        scope: scope.to_s, 
        scope_id: record.send(scope.to_sym)
      ).first_or_create(value: start_at - 1)
      
      unless id_set? || skip?
        sequence.with_lock do
          sequence.value += 1
          record.send(:"#{column}=", sequence.value)
          sequence.save
        end
      end
    end

    def id_set?
      !record.send(column).nil?
    end

    def skip?
      skip && skip.call(record)
    end
        
  private

    def max(*values)
      values.to_a.max
    end

  end
end
