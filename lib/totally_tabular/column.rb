module TotallyTabular
  class Column
    attr_accessor :name, :template, :header_attributes, :row_attributes

    def initialize(name)
      @name = name
      @header_attributes = {}
      @row_attributes = {}
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

  end
end
