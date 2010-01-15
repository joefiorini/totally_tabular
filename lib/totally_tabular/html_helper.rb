module TotallyTabular
  class HtmlHelper

    EMPTY_TAG = /br|input|img/
    def content_tag(tag, content="", attributes={})
      if tag.to_s =~ EMPTY_TAG
        "<%s%s>" % [tag, attrs(attributes)]
      else
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
