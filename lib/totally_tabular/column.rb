module TotallyTabular
  class Column
    attr_accessor :name, :template, :header_attributes

    def initialize(name)
      @name = name
    end

    def template!(&block)
      @template = block
    end

  end
end
