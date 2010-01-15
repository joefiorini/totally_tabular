module TotallyTabular
  class HtmlHelper

    EMPTY_TAG = /br|input|img/
    def tag(tag, content="", attributes={})
      case tag.to_s
      when EMPTY_TAG
        "<%s%s>" % [tag, attrs(attributes)]
      when /^\w+$/
        "<%s%s>%s</%s>" % [tag, attrs(attributes), content, tag]
      end
    end

    private

    def attrs(attributes)
      return "" if attributes.empty?
      attr_string = ' %s' % attributes.map { |attr| '%s="%s"' % attr }.join(" ")
    end
  end
end
