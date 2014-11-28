module Sequential
  class Generator
    attr_reader :record, :scope, :column, :start_at, :skip, :use_sti_base_class

    def initialize(record, options = {})
      @record             = record
      @scope              = options[:scope]
      @column             = (options[:column] || :sequential_id).to_sym
      @start_at           = options[:start_at] || 1
      @skip               = options[:skip]
      @use_sti_base_class = options[:use_sti_base_class] || false
    end

    def set
      unless id_set? || skip?
        where_opts = {
          model:  use_sti_base_class ? record.class.base_class.name : record.class.name,
          column: column
        }

        where_opts.merge!(  scope: scope.to_s,
                            scope_value: record.send(scope.to_sym).to_s,
                         ) if scope

        sequence = Sequential::Sequence.where(where_opts).
                                          first_or_create(value: start_at - 1)

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
  end
end
