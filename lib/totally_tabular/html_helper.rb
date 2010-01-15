module TotallyTabular
  class HtmlHelper

    def tag(tag, content="")
      if tag.to_s.empty?
        ""
      else
        case tag
        when :br
          "<br>"
        when :input
          "<input>"
        else
          "<%s>%s</%s>" % [tag, content, tag]
        end
      end
    end
  end
end
