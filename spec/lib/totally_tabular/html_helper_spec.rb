require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

include TotallyTabular

describe HtmlHelper do

  before do
    @helper = HtmlHelper.new
  end

  it "is instantiated" do
    @helper.should_not be_nil
  end

  it "returns an empty table tag" do
    @helper.content_tag(:table).should == "<table></table>"
  end

  it "returns an empty br tag" do
    @helper.content_tag(:br).should == "<br>"
  end

  it "returns an empty input tag" do
    @helper.content_tag(:input).should == "<input>"
  end

  it "returns an empty img tag" do
    @helper.content_tag(:img).should == "<img>"
  end

  it "returns a tag with content" do
    @helper.content_tag(:strong, "blah").should == "<strong>blah</strong>"
  end

  it "renders with a class specified" do
    @helper.content_tag(:strong, "blah", :class => "diddy").should =~ /class=\"diddy\"/
  end

  it "renders with a href attribute specified" do
    url = "http://www.google.com"
    @helper.content_tag(:a, "blah", :href => url).should =~ /href=\"#{url}\"/
  end

  it "renders empty tags with attributes" do
    src = "http://www.asite.com/images/my_image.jpg"
    @helper.content_tag(:img, "", :src => src).should =~ /src=\"#{src}\"/
  end
end
