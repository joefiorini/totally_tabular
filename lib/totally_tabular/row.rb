module TotallyTabular
  class Row

    def initialize
      @helper = HtmlHelper.new
      @attributes = {}
    end

    def attributes!(attributes={})
      @attributes = attributes
    end

    def render(content)
      if !content.empty?
        @helper.content_tag(:tr, content, @attributes)
      end.to_s
    end
  end
end
