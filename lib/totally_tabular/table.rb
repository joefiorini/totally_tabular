module TotallyTabular
  class Table
    attr_reader :columns

    def initialize
      @columns = []
    end

    def define_column(name, header_attributes={}, &block)
      column = Column.new(name)
      column.instance_eval(&block)
      @columns << column
    end

    def columns_count
      @columns.length
    end
  end
end
