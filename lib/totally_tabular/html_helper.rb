module TotallyTabular
  class HtmlHelper

    EMPTY_TAG = /br|input|img/
    def tag(tag, content="", attributes={})
      case tag.to_s
      when EMPTY_TAG
        "<%s>" % tag
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
