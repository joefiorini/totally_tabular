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
          attr_string = 
          attr_string = ' %s' % attributes.map { |attr| '%s="%s"' % attr }.join(" ")
        end
        "<%s%s>%s</%s>" % [tag, attr_string, content, tag]
      else
        ""
      end
    end
  end
end
