module TotallyTabular
  class Table
    attr_reader :columns

    def initialize
      @columns = []
    end

    def column(name, header_attributes={}, &block)
      column = Column.new(name)
      block.call(column)
      column.header_attributes = header_attributes
      @columns << column
    end

    def columns_count
      @columns.length
    end
  end
end
