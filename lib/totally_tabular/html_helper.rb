module TotallyTabular
  class HtmlHelper

    def tag(tag, content="", attributes={})
      case tag.to_s
      when "br"
        "<br>"
      when "input"
        "<input>"
      when /^\w+$/
        if attributes.any?
          css_class = attributes[:class]
          attr_string = ' class="%s"' % css_class
        end
        "<%s%s>%s</%s>" % [tag, attr_string, content, tag]
      else
        ""
      end
    end
  end
end
