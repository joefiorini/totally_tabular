module TotallyTabular
  class HtmlHelper

    def tag(tag)
      if tag.to_s.empty?
        ""
      else
        "<table></table>"
      end
    end
  end
end
