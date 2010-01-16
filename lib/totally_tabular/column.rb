module TotallyTabular
  class Column
    attr_accessor :name, :template, :header_attributes, :row_attributes, :definition, :cell_attributes

    def initialize(name, &block)
      @name = name
      @header_attributes = {}
      @row_attributes = {}
      @cell_attributes = {}
      @definition = block
    end

    def template!(&block)
      @template = block
    end

    def header_attributes!(attributes={})
      @header_attributes = attributes
    end

    def row_attributes!(attributes={})
      @row_attributes = attributes
    end

    def cell_attributes!(attributes={})
      @cell_attributes = attributes
    end

  end
end
