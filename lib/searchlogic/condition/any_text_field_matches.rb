module Searchlogic
  module Condition
    class AnyTextFieldMatches < Base # :nodoc:
      self.join_arrays_with_or = true
      
      class << self
        def condition_names_for_column
          []
        end
        
        def condition_names_for_model
          [condition_type_name]
        end
      end
      
      def to_conditions(value)
        textual_columns = klass.columns.select {|c| [:text, :string].include?(c.type)}
        conditions = textual_columns.map do |column|
          Keywords.new(klass, options.merge(:column => klass.columns_hash[column.name])).to_conditions(value)
        end
        merge_conditions(*(conditions << {:any => true}))
      end
      
      private
        def type_cast_value(v)
          return v
        end
      
    end
  end
end