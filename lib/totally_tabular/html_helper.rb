module TotallyTabular
  class HtmlHelper

    def tag(tag, content="")
      case tag.to_s
      when "br"
        "<br>"
      when "input"
        "<input>"
      when /^\w+$/
        "<%s>%s</%s>" % [tag, content, tag]
      else
        ""
      end
    end
  end
end
